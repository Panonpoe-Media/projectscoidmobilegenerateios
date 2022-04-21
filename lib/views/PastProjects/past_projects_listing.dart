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
 /** AUTOGENERATE OFF **/
class  PublicPastProjectsListing extends StatefulWidget {
  static const String PATH = '/public/past_projects/listing/:id';
    final String? id ;
   PublicPastProjectsListing({Key? key, this.id}) : super(key: key);
  @override
   PublicPastProjectsListingState createState() =>  PublicPastProjectsListingState();
}

class  PublicPastProjectsListingState extends State< PublicPastProjectsListing> with RestorationMixin{
  String title = 'Past Projects'; 
  bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/public/past_projects/listing?page=%d';
  ScrollController?  scrollController;
  PastProjectsController? past_projects;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  AccountController? accountController;
  bool account = true;
  String searchText = '';
   double initscroll = 0.0;
   PublicPastProjectsListingState() {
   // scrollController!.addListener(_onScroll);
  }

final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'PastProjects';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'PastProjects');
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
      getPath = Env.value!.baseUrl! + '/public/past_projects/listing?page=%d' + ids;
    }
	
	if(widget.id!.contains('search')){
      var ids = widget.id!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/public/past_projects/listing?page=%d&' + ids;
    }
	accountController =AccountController(AppProvider.getApplication(context),
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
	
    past_projects =  PastProjectsController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    past_projects!.listing!.add(PastProjectsList());
    return WillPopScope(
         onWillPop:()async{
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
          //Navigator.pop(context);
		    
          return false;
        },
        child:

        Scaffold(
            appBar: AppBar(
              leading:IconButton(
                  icon:Icon(Icons.arrow_back, color: Colors.white,),
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
                        MaterialPageRoute(builder: (context) => SearchPastProjectsListing(id : '', title : '')),
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
            style:TextStyle(
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

           // hasFloatingPlaceholder: false,
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
   // @override
  Widget buildListingBar(){
    return BlocBuilder<PastProjectsListing, PastProjectsState>(
      bloc: past_projects!.listing,

      builder: (BuildContext context, PastProjectsState state) {
	    final mediaQueryData = MediaQuery.of(context);
        if (state is PastProjectsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return Center( 
           child:CircularProgressIndicator(
           valueColor:AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is PastProjectsListingError) {
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
        if (state is PastProjectsListingLoaded) {
          if (state.past_projects!.items.items.isEmpty) {
		  if (state.past_projects!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.past_projects!.Buttons(context, _dialVisible, account)
				//floatingActionButton: isLoading? null :  state.past_projects!.Buttons(context, _dialVisible, controller,past_projects,  this, Env.value!.baseUrl!, '', title)
              );
			  }
          }
			if (state.past_projects!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							child:ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								 	  return index >= state.past_projects!.items.items.length ? 
									  state.past_projects!.tools.paging.total_pages == state.past_projects!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicPastProjectsBottomLoader()
									   : state.past_projects!.viewItemIndex (state.past_projects!.items.items[index] , searchText, index,  account );
								},
								itemCount: state.hasReachedMax!
									? state.past_projects!.items.items.length
									: state.past_projects!.items.items.length + 1,
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
							child:ListView.builder(
								itemBuilder: (BuildContext context, int index) {
								 	  return index >= state.past_projects!.items.items.length ? 
									  state.past_projects!.tools.paging.total_pages == state.past_projects!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicPastProjectsBottomLoader()
									 // viewItemIndex(ItemBlogModel item,String search, int index, bool account) 
									   : state.past_projects!.viewItemIndex (state.past_projects!.items.items[index] , searchText, index, account );
									
								},
								itemCount: state.hasReachedMax!
									? state.past_projects!.items.items.length
									: state.past_projects!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.past_projects!.Buttons(context, _dialVisible, account)
					//floatingActionButton: isLoading? null :  state.past_projects!.Buttons(context, _dialVisible, controller,past_projects,  this, Env.value!.baseUrl!, '', title, account)		
                   
			 );
        }
		
		return Center( 
           child:CircularProgressIndicator(
           valueColor:AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
      },
    );
  }

  @override
  void dispose() {
    past_projects!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =Completer<Null>();
    past_projects!.listing!.add(PastProjectsListingRefresh());

    Timer timer =Timer(new Duration(seconds: 3), () {
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
      past_projects!.listing!.add(PastProjectsList());
    }

  }

}
////////////////////////////


class  SearchPastProjectsListing extends StatefulWidget {
  static const String PATH = '/public/past_projects/listing/:id';
    final String? id ;
	final String? title;
   SearchPastProjectsListing({Key? key, this.id, this.title}) : super(key: key);
  @override
   SearchPastProjectsListingState createState() =>  SearchPastProjectsListingState();
}

class  SearchPastProjectsListingState extends State< SearchPastProjectsListing>  with RestorationMixin{
  String title = 'Past Projects'; 
  bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/public/past_projects/listing?page=%d';
  ScrollController?  scrollController;
  PastProjectsController? past_projects;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  AccountController? accountController;
  bool account = true;
  String userid = '' ;
  String searchText = '';
   double initscroll = 0.0;
   SearchPastProjectsListingState() {
   // scrollController!.addListener(_onScroll);
  }

final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'PastProjects';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'PastProjects');
  }

  @override
  Widget build(BuildContext context) {
    search = true;
    if(widget.id == ''){
      getPath = Env.value!.baseUrl! + '/public/past_projects/listing?page=%d&' + 'search=' + searchText;
    } else{
      getPath = Env.value!.baseUrl! + '/public/past_projects/listing/' + widget.id!  + '?page=%d';
    }
	accountController =AccountController(AppProvider.getApplication(context),
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
	
    past_projects =  PastProjectsController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    past_projects!.listing!.add(PastProjectsList());
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
             leading:IconButton(
                    icon:Icon(Icons.arrow_back, color: Colors.white,),
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
                    }
                ),
              //iconTheme: IconThemeData(
              //  color: Colors.white, //change your color here
              // ),
            title: widget.id == ''? TextField(
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
            style:TextStyle(
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

           // hasFloatingPlaceholder: false,
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
   // @override
  Widget buildListingBar(){
    return BlocBuilder<PastProjectsListing,  PastProjectsState>(
      bloc: past_projects!.listing,

      builder: (BuildContext context, PastProjectsState state) {
	    final mediaQueryData = MediaQuery.of(context);
        if (state is PastProjectsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return Center( 
           child:CircularProgressIndicator(
           valueColor:AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is PastProjectsListingError) {
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
        if (state is PastProjectsListingLoaded) {
          if (state.past_projects!.items.items.isEmpty) {
		  if (state.past_projects!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.past_projects!.Buttons(context, _dialVisible, account)
				//floatingActionButton: isLoading? null :  state.past_projects!.Buttons(context, _dialVisible, controller,past_projects,  this, Env.value!.baseUrl!, '', title)
              );
			  }
          }
			if (state.past_projects!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							child:ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								 	  return index >= state.past_projects!.items.items.length ? 
									  state.past_projects!.tools.paging.total_pages == state.past_projects!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicPastProjectsBottomLoader()
									   : state.past_projects!.viewItemIndex (state.past_projects!.items.items[index] , searchText, index, account );
								},
								itemCount: state.hasReachedMax!
									? state.past_projects!.items.items.length
									: state.past_projects!.items.items.length + 1,
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
							child:ListView.builder(
								itemBuilder: (BuildContext context, int index) {
								 	  return index >= state.past_projects!.items.items.length ? 
									  state.past_projects!.tools.paging.total_pages == state.past_projects!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicPastProjectsBottomLoader()
									 // viewItemIndex(ItemBlogModel item,String search, int index, bool account) 
									   : state.past_projects!.viewItemIndex (state.past_projects!.items.items[index] , searchText, index,  account );
									
								},
								itemCount: state.hasReachedMax!
									? state.past_projects!.items.items.length
									: state.past_projects!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.past_projects!.Buttons(context, _dialVisible, account)
					//floatingActionButton: isLoading? null :  state.past_projects!.Buttons(context, _dialVisible, controller,past_projects,  this, Env.value!.baseUrl!, '', title, account)		
                   
			 );
        }
		
		return Center( 
           child:CircularProgressIndicator(
           valueColor:AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
      },
    );
  }

  @override
  void dispose() {
    past_projects!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =Completer<Null>();
    past_projects!.listing!.add(PastProjectsListingRefresh());

    Timer timer =Timer(new Duration(seconds: 3), () {
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
      past_projects!.listing!.add(PastProjectsList());
    }

  }

}


////////////////////////////////
class  PublicPastProjectsBottomLoader extends StatelessWidget {
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


