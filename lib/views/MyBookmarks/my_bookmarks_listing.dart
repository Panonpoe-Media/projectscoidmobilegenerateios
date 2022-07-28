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

class  UserMyBookmarksListing extends StatefulWidget {
  static const String PATH = '/user/my_bookmarks/listing/:id';
    final String? id ;
   UserMyBookmarksListing({Key? key, this.id}) : super(key: key);
  @override
   UserMyBookmarksListingState createState() =>  UserMyBookmarksListingState();
}

class  UserMyBookmarksListingState extends State< UserMyBookmarksListing> with RestorationMixin{
  String title = 'My Bookmarks'; 
  bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/user/my_bookmarks/listing?page=%d';
  ScrollController?  scrollController;
  MyBookmarksController? my_bookmarks;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  AccountController? accountController;
  bool account = true;
  String searchText = '';
   bool isopen = false;
   double initscroll = 0.0;
   UserMyBookmarksListingState() {
   // scrollController!.addListener(_onScroll);
  }

final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'MyBookmarks';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'MyBookmarks');
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
      getPath = Env.value!.baseUrl! + '/user/my_bookmarks/listing?page=%d' + ids;
    }
	
	if(widget.id!.contains('search')){
      var ids = widget.id!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/user/my_bookmarks/listing?page=%d&' + ids;
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
	
    my_bookmarks =  MyBookmarksController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    my_bookmarks!.listing!.add(MyBookmarksList());
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
								MaterialPageRoute(builder: (context) => Projectscoid(id : account ? listAccount[0]['user_hash'] : '')),
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
                        MaterialPageRoute(builder: (context) => SearchMyBookmarksListing(id : '', title : '')),
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
  
  void open(bool val){
   // setState(() {
      isopen = val;
    //});
  }
   // @override
  Widget buildListingBar(){
    return BlocBuilder<MyBookmarksListing, MyBookmarksState>(
      bloc: my_bookmarks!.listing,

      builder: (BuildContext context, MyBookmarksState state) {
	    final mediaQueryData = MediaQuery.of(context);
        if (state is MyBookmarksListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return Center( 
           child:CircularProgressIndicator(
           valueColor:AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is MyBookmarksListingError) {
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
        if (state is MyBookmarksListingLoaded) {
          if (state.my_bookmarks!.items.items.isEmpty) {
		  if (state.my_bookmarks!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.my_bookmarks!.Buttons(context, _dialVisible, account, open)
				//floatingActionButton: isLoading? null :  state.my_bookmarks!.Buttons(context, _dialVisible, controller,my_bookmarks,  this, Env.value!.baseUrl!, '', title)
              );
			  }
          }
			if (state.my_bookmarks!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							    child:ListView.builder(
								itemBuilder: (BuildContext context, int index) {

                                    return index >= state.my_bookmarks!.items.items.length? 
                                     state.my_bookmarks!.tools.paging.total_pages == state.my_bookmarks!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):								  
								  UserMyBookmarksBottomLoader()
									  : state.my_bookmarks!.viewItemState (state.my_bookmarks!.items.items[index] , searchText, index, context, account, this, rfs );
								},
								itemCount: state.hasReachedMax!
									? state.my_bookmarks!.items.items.length
									: state.my_bookmarks!.items.items.length + 1,
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

								  return index >= state.my_bookmarks!.items.items.length? 
                                    state.my_bookmarks!.tools.paging.total_pages == state.my_bookmarks!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  UserMyBookmarksBottomLoader()
									  : state.my_bookmarks!.viewItemState (state.my_bookmarks!.items.items[index] , searchText, index, context, account, this, rfs );
								},
								itemCount: state.hasReachedMax!
									? state.my_bookmarks!.items.items.length
									: state.my_bookmarks!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.my_bookmarks!.Buttons(context, _dialVisible, account, open)
					//floatingActionButton: isLoading? null :  state.my_bookmarks!.Buttons(context, _dialVisible, controller,my_bookmarks,  this, Env.value!.baseUrl!, '', title, account)		
                   
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
    my_bookmarks!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =Completer<Null>();
    my_bookmarks!.listing!.add(MyBookmarksListingRefresh());

    Timer timer =Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }
 void rfs() {
    my_bookmarks!.listing!.add(MyBookmarksListingRefresh()); 
  }
  void _onScroll()async {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
    cs.value = currentScroll;
	final prefs = await SharedPreferences.getInstance();
    prefs.setDouble("position", scrollController!.position.pixels);
    if (maxScroll - currentScroll <= scrollThreshold) {
      my_bookmarks!.listing!.add(MyBookmarksList());
    }

  }

}
////////////////////////////


class  SearchMyBookmarksListing extends StatefulWidget {
  static const String PATH = '/user/my_bookmarks/listing/:id';
    final String? id ;
	final String? title;
   SearchMyBookmarksListing({Key? key, this.id, this.title}) : super(key: key);
  @override
   SearchMyBookmarksListingState createState() =>  SearchMyBookmarksListingState();
}

class  SearchMyBookmarksListingState extends State< SearchMyBookmarksListing>  with RestorationMixin{
  String title = 'My Bookmarks'; 
  bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/user/my_bookmarks/listing?page=%d';
  ScrollController?  scrollController;
  MyBookmarksController? my_bookmarks;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  AccountController? accountController;
  bool account = true;
  String userid = '' ;
  String searchText = '';
   bool isopen = false;
   double initscroll = 0.0;
   SearchMyBookmarksListingState() {
   // scrollController!.addListener(_onScroll);
  }

final RestorableDouble cs = RestorableDouble(0);

  @override
  String get restorationId => 'MyBookmarks';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'MyBookmarks');
  }

  @override
  Widget build(BuildContext context) {
    search = true;
    if(widget.id == ''){
      getPath = Env.value!.baseUrl! + '/user/my_bookmarks/listing?page=%d&' + 'search=' + searchText;
    } else{
      getPath = Env.value!.baseUrl! + '/user/my_bookmarks/listing/' + widget.id!  + '?page=%d';
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
	
    my_bookmarks =  MyBookmarksController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    my_bookmarks!.listing!.add(MyBookmarksList());
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
  void open(bool val){
   // setState(() {
      isopen = val;
    //});
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
    return BlocBuilder<MyBookmarksListing,  MyBookmarksState>(
      bloc: my_bookmarks!.listing,

      builder: (BuildContext context, MyBookmarksState state) {
	    final mediaQueryData = MediaQuery.of(context);
        if (state is MyBookmarksListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return Center( 
           child:CircularProgressIndicator(
           valueColor:AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is MyBookmarksListingError) {
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
        if (state is MyBookmarksListingLoaded) {
          if (state.my_bookmarks!.items.items.isEmpty) {
		  if (state.my_bookmarks!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.my_bookmarks!.Buttons(context, _dialVisible, account, open)
				//floatingActionButton: isLoading? null :  state.my_bookmarks!.Buttons(context, _dialVisible, controller,my_bookmarks,  this, Env.value!.baseUrl!, '', title)
              );
			  }
          }
			if (state.my_bookmarks!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							    child:ListView.builder(
								itemBuilder: (BuildContext context, int index) {

                                    return index >= state.my_bookmarks!.items.items.length? 
                                     state.my_bookmarks!.tools.paging.total_pages == state.my_bookmarks!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):								  
								  UserMyBookmarksBottomLoader()
									  : state.my_bookmarks!.viewItemState (state.my_bookmarks!.items.items[index] , searchText, index, context, account, this, rfs );
								},
								itemCount: state.hasReachedMax!
									? state.my_bookmarks!.items.items.length
									: state.my_bookmarks!.items.items.length + 1,
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

								  return index >= state.my_bookmarks!.items.items.length? 
                                    state.my_bookmarks!.tools.paging.total_pages == state.my_bookmarks!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  UserMyBookmarksBottomLoader()
									  : state.my_bookmarks!.viewItemState (state.my_bookmarks!.items.items[index] , searchText, index, context, account, this, rfs );
								},
								itemCount: state.hasReachedMax!
									? state.my_bookmarks!.items.items.length
									: state.my_bookmarks!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.my_bookmarks!.Buttons(context, _dialVisible, account, open)
					//floatingActionButton: isLoading? null :  state.my_bookmarks!.Buttons(context, _dialVisible, controller,my_bookmarks,  this, Env.value!.baseUrl!, '', title, account)		
                   
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
    my_bookmarks!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =Completer<Null>();
    my_bookmarks!.listing!.add(MyBookmarksListingRefresh());

    Timer timer =Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }
 void rfs() {
    my_bookmarks!.listing!.add(MyBookmarksListingRefresh()); 
  }
  void _onScroll()async {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
    cs.value = currentScroll;
	final prefs = await SharedPreferences.getInstance();
    prefs.setDouble("position", scrollController!.position.pixels);
    if (maxScroll - currentScroll <= scrollThreshold) {
      my_bookmarks!.listing!.add(MyBookmarksList());
    }

  }

}


////////////////////////////////
class  UserMyBookmarksBottomLoader extends StatelessWidget {
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


