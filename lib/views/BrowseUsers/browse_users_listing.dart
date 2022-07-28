 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/models/model.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/app/Env.dart';
 import 'package:shared_preferences/shared_preferences.dart';
 import 'package:projectscoid/app/projectscoid.dart';
import 'dart:convert';
import 'dart:async';
 import 'package:projectscoid/views/Chat/blocs/blocs.dart';
 /** AUTOGENERATE OFF **/
class  PublicBrowseUsersListing extends StatefulWidget {
  static const String PATH = '/public/browse_users/listing/:id';
    final String? id ;
    final ChatBloc? cb;
    PublicBrowseUsersListing({Key? key, this.id, this.cb}) : super(key: key);
  @override
   PublicBrowseUsersListingState createState() =>  PublicBrowseUsersListingState();
}

class  PublicBrowseUsersListingState extends State< PublicBrowseUsersListing> with RestorationMixin{
  String title = 'Browse Users'; 
  bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/public/browse_users/listing?page=%d';
  ScrollController?  scrollController;
  BrowseUsersController? browse_users;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  AccountController? accountController;
  bool account = true;
  bool isopen = false;
  String searchText = '';
   double initscroll = 0.0;
   PublicBrowseUsersListingState() {
   // scrollController!.addListener(_onScroll);
  }

final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'BrowseUsers';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'BrowseUsers');
  }

  @override
  Widget build(BuildContext context) {
      if(widget.id!.contains('filter')|| widget.id!.contains('search'))
	  {
	      search = true;
	  }
      if(widget.id!.contains('filter')){
      var ids = widget.id!;
      int ind = ids.indexOf('&');
          ids = ids.substring(ind, ids.length);
      getPath = Env.value!.baseUrl! + '/public/browse_users/listing?page=%d' + ids;
    }
	
	if(widget.id!.contains('search')){
      var ids = widget.id!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/public/browse_users/listing?page=%d&' + ids;
    }
	accountController =    AccountController(AppProvider.getApplication(context),
	AppAction.view   );
    List<Map> listAccount = [];
    final future = accountController!.getAccount();
    future.then((val){

      listAccount.addAll(val);
	   if(listAccount.length == 0){
			  account = false;
			}else{
			  account = true;
			}

    });
	
	   final prefs = SharedPreferences.getInstance();
      prefs.then((val){
        initscroll = val.getDouble("position")!;
        if(initscroll != 0.0 || initscroll != null ){
          scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
          scrollController!.addListener(_onScroll);
        } else {
          scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
          scrollController!.addListener(_onScroll);
        }
      });
	
    browse_users =  BrowseUsersController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    browse_users!.listing!.add(BrowseUsersList());
    return WillPopScope(
         onWillPop:()async{
		  final prefs = await SharedPreferences.getInstance();
                    prefs.setDouble("position", 0.0);
		 if(search){
		 Navigator.pop(context);
		 }else{
       if(!isopen) {
         Navigator.pushAndRemoveUntil(
           context,
           MaterialPageRoute(builder: (context) =>
               Projectscoid(id: account ? listAccount[0]['user_hash'] : '')),
               (Route<dynamic> route) => false,
         );
       }
		 }
          //Navigator.pop(context);
		    
          return false;
        },
        child:

        Scaffold(
            appBar: AppBar(
              leading:    IconButton(
                  icon:    Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: ()async{
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setDouble("position", 0.0);
						 if(search){
							 Navigator.pop(context);
							 }else{
							  Navigator.pushAndRemoveUntil(
													context,
													MaterialPageRoute(builder: (context) => Projectscoid(id : account ? listAccount[0]['user_hash'] : '')),
														(Route<dynamic> route) => false,
												  );
							 }
                   // Navigator.pop(context);
				 
                  }
              ),
              //iconTheme: IconThemeData(
              //  color: Colors.white, //change your color here
              // ),
              actions: <Widget>[
                IconButton(
                    tooltip: 'Search',
                    icon: const Icon(Icons.search, color: Colors.white,),
                    onPressed: () async {
					
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchBrowseUsersListing1(id : '', title : '', cb: widget.cb)),
                      );
					/*
                      if (!selected) {
                        setState(() {
                          selected = true;
                        });
                      } else {
                        setState(() {
                          selected = false;
                        });
                      }
					  */
                    }
                )
              ],
			  title: Text(title , style : TextStyle( color: Colors.white, ))  ,
             // title: selected? buildSearchBar(title) : Text(title , style : TextStyle( color: Colors.white, ))  ,
            ),
            body: buildListingBar()
        )
    );
  }

  void _onChanged(String value) {
    setState(() {
      searchText = value;
    });
  }


  Widget buildSearchBar(String tiltle){
    return Container(
      // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
            style:    TextStyle(
                fontSize: 18.0,
                height: 0.2,
                color: Colors.black54
            ),
          onChanged: (String value) {
            _onChanged(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,

            //hasFloatingPlaceholder: false,
            suffixIcon:
            IconButton(
              icon:Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ) ,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)) , gapPadding: 20.0),
          ),
        )
    );
  }

 void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
  void open(bool val){
    // setState(() {
    isopen = val;
    //});
  }
   // @override
  Widget buildListingBar(){
    return BlocBuilder<BrowseUsersListing, BrowseUsersState>(
      bloc:browse_users!.listing,

      builder: (BuildContext context, BrowseUsersState state) {
	    final mediaQueryData = MediaQuery.of(context);
        if (state is BrowseUsersListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is BrowseUsersListingError) {
		 _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is BrowseUsersListingLoaded) {
          if (state.browse_users!.items.items.isEmpty) {
		  if (state.browse_users!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title),
                  ),
                 floatingActionButton: state.browse_users!.Buttons(context, _dialVisible, account, open)
				//floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller,browse_users,  this, Env.value!.baseUrl!, '', title)
              );
			  }
          }
			if (state.browse_users!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

                                      return index >= state.browse_users!.items.items.length ? 
									  search ?
									  state.browse_users!.tools.paging.total_pages == state.browse_users!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicBrowseUsersBottomLoader()
									  : 1 == state.browse_users!.tools.paging.current_page?
									   Container(height: 0.0, width: 0.0,):
									  PublicBrowseUsersBottomLoader()
									  : state.browse_users!.viewItemcb (state.browse_users!.items.items[index] , searchText, index,  account , widget.cb);
								},
								itemCount: state.hasReachedMax!
									? state.browse_users!.items.items.length
									: state.browse_users!.items.items.length + 1,
								controller: scrollController,
							  ),

							  onRefresh: _onRefresh,
							)
				);					
			}
          return
		  Scaffold(
                    body:    
							RefreshIndicator(
							child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {
                                      return index >= state.browse_users!.items.items.length ? 
									  search ?
									  state.browse_users!.tools.paging.total_pages == state.browse_users!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicBrowseUsersBottomLoader()
									  : 1 == state.browse_users!.tools.paging.current_page?
									   Container(height: 0.0, width: 0.0,):
									  PublicBrowseUsersBottomLoader()
									  : state.browse_users!.viewItemcb (state.browse_users!.items.items[index] , searchText, index, account, widget.cb );
								},
								itemCount: state.hasReachedMax!
									? state.browse_users!.items.items.length
									: state.browse_users!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.browse_users!.Buttons(context, _dialVisible, account, open)
					//floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller,browse_users,  this, Env.value!.baseUrl!, '', title, account)		
                   
			 );
        }
		
		return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
      },
    );
  }

  @override
  void dispose() {
    browse_users!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =    Completer<Null>();
    browse_users!.listing!.add(BrowseUsersListingRefresh());

    Timer timer =    Timer(   Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }
  void _onScroll()async {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
    cs.value = currentScroll;
	final prefs = await SharedPreferences.getInstance();
    prefs.setDouble("position", scrollController!.position.pixels);
    if (maxScroll - currentScroll <= scrollThreshold) {
      browse_users!.listing!.add(BrowseUsersList());
    }

  }

}
////////////////////////////


class  SearchBrowseUsersListing extends StatefulWidget {
  static const String PATH = '/public/browse_users/listing/:id';
    final String? id ;
	final String? title;
   SearchBrowseUsersListing({Key? key, this.id, this.title}) : super(key: key);
  @override
   SearchBrowseUsersListingState createState() =>  SearchBrowseUsersListingState();
}

class  SearchBrowseUsersListingState extends State< SearchBrowseUsersListing>  with RestorationMixin{
  String title = 'Browse Users'; 
  bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/public/browse_users/listing?page=%d';
  ScrollController?  scrollController;
  BrowseUsersController? browse_users;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  AccountController? accountController;
  bool account = true;
  String userid = '' ;
  bool isopen = false;
  String searchText = '';
   double initscroll = 0.0;
   SearchBrowseUsersListingState() {
   // scrollController!.addListener(_onScroll);
  }

final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'BrowseUsers';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'BrowseUsers');
  }

  @override
  Widget build(BuildContext context) {
    search = true;
    if(widget.id! == ''){
      getPath = Env.value!.baseUrl! + '/public/browse_users/listing?page=%d&' + 'search=' + searchText;
    } else{
      getPath = Env.value!.baseUrl! + '/public/browse_users/listing/' + widget.id!  + '?page=%d';
    }
	accountController =    AccountController(AppProvider.getApplication(context),
	AppAction.view   );
    List<Map> listAccount = [];
    final future = accountController!.getAccount();
    future.then((val){

      listAccount.addAll(val);
	   if(listAccount.length == 0){
			  account = false;
			}else{
			  account = true;
			  userid = val.asMap()[0]['user_hash'];
			}

    });
	
	   final prefs = SharedPreferences.getInstance();
      prefs.then((val){
        initscroll = val.getDouble("position")!;
        if(initscroll != 0.0 || initscroll != null ){
          scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
          scrollController!.addListener(_onScroll);
        } else {
          scrollController = ScrollController(initialScrollOffset: initscroll ?? 0.0, keepScrollOffset: false );
          scrollController!.addListener(_onScroll);
        }
      });
	
    browse_users =  BrowseUsersController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    browse_users!.listing!.add(BrowseUsersList());
    return WillPopScope(
         onWillPop:()async{
          //Navigator.pop(context);
		     Navigator.pushAndRemoveUntil(
								context,
								MaterialPageRoute(builder: (context) => Projectscoid(id : account ? listAccount[0]['user_hash'] : '')),
									(Route<dynamic> route) => false,
							  );
          return false;
        },
        child:

        Scaffold(
            appBar: AppBar(
             leading:    IconButton(
                    icon:    Icon(Icons.arrow_back, color: Colors.white,),
                    onPressed: ()async{
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setDouble("position", 0.0);
                      Navigator.pop(context);
                    }
                ),
              //iconTheme: IconThemeData(
              //  color: Colors.white, //change your color here
              // ),
            title: widget.id! == ''? TextField(
                  textInputAction: TextInputAction.search,
                  // textInputAction: TextInputAction.search ,
                  onTap: (){

                  },
                  autofocus: true,
                  onSubmitted: (String value) {
                    _onSubmited(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search ',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(right: 10.0, left: 0.0, top: 10.0, bottom:  10.0),
                  ),
                ): Text(widget.title!, style: TextStyle(color: Colors.white),),
             // title: selected? buildSearchBar(title) : Text(title , style : TextStyle( color: Colors.white, ))  ,
            ),
            body: buildListingBar()
        )
    );
  }

  void _onChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  void _onSubmited(String value) {
    setState(() {
      searchText = value;
    });
  }


  Widget buildSearchBar(String tiltle){
    return Container(
      // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
            style:    TextStyle(
                fontSize: 18.0,
                height: 0.2,
                color: Colors.black54
            ),
          onChanged: (String value) {
            _onChanged(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,

            //hasFloatingPlaceholder: false,
            suffixIcon:
            IconButton(
              icon:Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ) ,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)) , gapPadding: 20.0),
          ),
        )
    );
  }

 void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
  void open(bool val){
    // setState(() {
    isopen = val;
    //});
  }
   // @override
  Widget buildListingBar(){
    return BlocBuilder<BrowseUsersListing, BrowseUsersState>(
      bloc: browse_users!.listing,

      builder: (BuildContext context, BrowseUsersState state) {
	    final mediaQueryData = MediaQuery.of(context);
        if (state is BrowseUsersListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is BrowseUsersListingError) {
		 _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is BrowseUsersListingLoaded) {
          if (state.browse_users!.items.items.isEmpty) {
		  if (state.browse_users!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title),
                  ),
                 floatingActionButton: state.browse_users!.Buttons(context, _dialVisible, account, open)
				//floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller,browse_users,  this, Env.value!.baseUrl!, '', title)
              );
			  }
          }
			if (state.browse_users!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

                                      return index >= state.browse_users!.items.items.length ? 
									  search ?
									  state.browse_users!.tools.paging.total_pages == state.browse_users!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicBrowseUsersBottomLoader()
									  : 1 == state.browse_users!.tools.paging.current_page?
									   Container(height: 0.0, width: 0.0,):
									  PublicBrowseUsersBottomLoader()
									  : state.browse_users!.viewItem (state.browse_users!.items.items[index] , searchText, account );								 
								},
								itemCount: state.hasReachedMax!
									? state.browse_users!.items.items.length
									: state.browse_users!.items.items.length + 1,
								controller: scrollController,
							  ),

							  onRefresh: _onRefresh,
							)
				);					
			}
          return
		  Scaffold(
                    body:    
							RefreshIndicator(
							child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {
                                      return index >= state.browse_users!.items.items.length ? 
									  search ?
									  state.browse_users!.tools.paging.total_pages == state.browse_users!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicBrowseUsersBottomLoader()
									  : 1 == state.browse_users!.tools.paging.current_page?
									   Container(height: 0.0, width: 0.0,):
									  PublicBrowseUsersBottomLoader()
									  : state.browse_users!.viewItem (state.browse_users!.items.items[index] , searchText, account );								 
								},
								itemCount: state.hasReachedMax!
									? state.browse_users!.items.items.length
									: state.browse_users!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.browse_users!.Buttons(context, _dialVisible, account, open)
					//floatingActionButton: isLoading? null :  state.browse_users!.Buttons(context, _dialVisible, controller,browse_users,  this, Env.value!.baseUrl!, '', title, account)		
                   
			 );
        }
		
		return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
      },
    );
  }

  @override
  void dispose() {
    browse_users!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =    Completer<Null>();
    browse_users!.listing!.add(BrowseUsersListingRefresh());

    Timer timer =    Timer(   Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }
  void _onScroll()async {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
    cs.value = currentScroll;
	final prefs = await SharedPreferences.getInstance();
    prefs.setDouble("position", scrollController!.position.pixels);
    if (maxScroll - currentScroll <= scrollThreshold) {
      browse_users!.listing!.add(BrowseUsersList());
    }

  }

}


////////////////////////////////
class  PublicBrowseUsersBottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}


