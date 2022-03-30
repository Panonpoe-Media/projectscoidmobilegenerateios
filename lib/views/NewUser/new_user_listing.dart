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
 import 'package:projectscoid/app/signin.dart';

 /** AUTOGENERATE OFF **/

class  PublicNewUserListing extends StatefulWidget {
  static const String PATH = '/public/_user/listing/:id';
    final String? id ;
   PublicNewUserListing({Key? key, this.id}) : super(key: key);
  @override
   PublicNewUserListingState createState() =>  PublicNewUserListingState();
}

class  PublicNewUserListingState extends State< PublicNewUserListing>{
  String title = 'New User';
  bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/public/_user/listing?page=%d';
  ScrollController? scrollController;
  NewUserController? new_user;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  AccountController? accountController;
  bool account = true;
  String searchText = '';
   double initscroll = 0.0;
   PublicNewUserListingState() {
   // scrollController!.addListener(_onScroll);
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
      getPath = Env.value!.baseUrl! + '/public/_user/listing?page=%d' + ids;
    }

	if(widget.id!.contains('search')){
      var ids = widget.id!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/public/_user/listing?page=%d&' + ids;
    }
	accountController =  AccountController(AppProvider.getApplication(context),
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

      new_user =  NewUserController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    new_user!.listing!.add(NewUserList());
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
              leading:  IconButton(
                  icon:  Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: ()async{
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setDouble("position", 0.0);
                   // Navigator.pop(context);
				     Navigator.pushAndRemoveUntil(
								context,
								MaterialPageRoute(builder: (context) => Projectscoid(id : account ? listAccount[0]['user_hash'] : '')),
									(Route<dynamic> route) => false,
							  );
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
                        MaterialPageRoute(builder: (context) => SearchNewUserListing(id : '', title : '')),
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
            style:  TextStyle(
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
   // @override
  Widget buildListingBar(){
    return BlocBuilder<NewUserListing, NewUserState>(
     // cubit: new_user!.listing,

      builder: (BuildContext context, NewUserState state) {
	    final mediaQueryData = MediaQuery.of(context);
        if (state is NewUserListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return  Center(
           child:CircularProgressIndicator(
           valueColor:  AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is NewUserListingError) {
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
        if (state is NewUserListingLoaded) {
          if (state.new_user!.items.items.isEmpty) {
		  if (state.new_user!.tools.buttons.length == 0){
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
                 floatingActionButton: state.new_user!.Buttons(context, _dialVisible, account)
				//floatingActionButton: isLoading? null :  state.new_user!.Buttons(context, _dialVisible, controller,_user,  this, Env.value!.baseUrl!, '', title)
              );
			  }
          }
			if (state.new_user!.tools.buttons.length == 0){
				return
				Scaffold(
					body:
							RefreshIndicator(
							child:  ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								 	  return index >= state.new_user!.items.items.length ?
									  state.new_user!.tools.paging.total_pages == state.new_user!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicNewUserBottomLoader()
									   : state.new_user!.viewItem (state.new_user!.items.items[index] , searchText, account );
								},
								itemCount: state.hasReachedMax!
									? state.new_user!.items.items.length
									: state.new_user!.items.items.length + 1,
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
							child:  ListView.builder(
								itemBuilder: (BuildContext context, int index) {
								 	  return index >= state.new_user!.items.items.length ?
									  state.new_user!.tools.paging.total_pages == state.new_user!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicNewUserBottomLoader()
									 // viewItemIndex(ItemBlogModel item,String search, int index, bool account)
									   : state.new_user!.viewItem (state.new_user!.items.items[index] , searchText, account );

								},
								itemCount: state.hasReachedMax!
									? state.new_user!.items.items.length
									: state.new_user!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),

					floatingActionButton: state.new_user!.Buttons(context, _dialVisible, account)
					//floatingActionButton: isLoading? null :  state.new_user!.Buttons(context, _dialVisible, controller,_user,  this, Env.value!.baseUrl!, '', title, account)

			 );
        }

		return  Center(
           child:CircularProgressIndicator(
           valueColor:  AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
      },
    );
  }

  @override
  void dispose() {
    new_user!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =  Completer<Null>();
    new_user!.listing!.add(NewUserListingRefresh());

    Timer timer =  Timer( Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }
  void _onScroll()async {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
	final prefs = await SharedPreferences.getInstance();
    prefs.setDouble("position", scrollController!.position.pixels);
    if (maxScroll - currentScroll <= scrollThreshold) {
      new_user!.listing!.add(NewUserList());
    }

  }

}
////////////////////////////


class  SearchNewUserListing extends StatefulWidget {
  static const String PATH = '/public/_user/listing/:id';
    final String? id ;
	final String? title;
   SearchNewUserListing({Key? key, this.id, this.title}) : super(key: key);
  @override
   SearchNewUserListingState createState() =>  SearchNewUserListingState();
}

class  SearchNewUserListingState extends State< SearchNewUserListing>{
  String title = 'New User';
  bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/public/_user/listing?page=%d';
  ScrollController?  scrollController;
  NewUserController? new_user;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  AccountController? accountController;
  bool account = true;
  String userid = '' ;
  String searchText = '';
   double initscroll = 0.0;
   SearchNewUserListingState() {
   // scrollController!.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    search = true;
    if(widget.id! == ''){
      getPath = Env.value!.baseUrl! + '/public/_user/listing?page=%d&' + 'search=' + searchText;
    } else{
      getPath = Env.value!.baseUrl! + '/public/_user/listing/' + widget.id!  + '?page=%d';
    }
	accountController =  AccountController(AppProvider.getApplication(context),
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

    new_user =  NewUserController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    new_user!.listing!.add(NewUserList());
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
             leading:  IconButton(
                    icon:  Icon(Icons.arrow_back, color: Colors.white,),
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
            style:  TextStyle(
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
   // @override
  Widget buildListingBar(){
    return BlocBuilder<NewUserListing, NewUserState>(
     // cubit: new_user!.listing,

      builder: (BuildContext context, NewUserState state) {
	    final mediaQueryData = MediaQuery.of(context);
        if (state is NewUserListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return  Center(
           child:CircularProgressIndicator(
           valueColor:  AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is NewUserListingError) {
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
        if (state is NewUserListingLoaded) {
          if (state.new_user!.items.items.isEmpty) {
		  if (state.new_user!.tools.buttons.length == 0){
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
                 floatingActionButton: state.new_user!.Buttons(context, _dialVisible, account)
				//floatingActionButton: isLoading? null :  state.new_user!.Buttons(context, _dialVisible, controller,_user,  this, Env.value!.baseUrl!, '', title)
              );
			  }
          }
			if (state.new_user!.tools.buttons.length == 0){
				return
				Scaffold(
					body:
							RefreshIndicator(
							child:  ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								 	  return index >= state.new_user!.items.items.length ?
									  state.new_user!.tools.paging.total_pages == state.new_user!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicNewUserBottomLoader()
									   : state.new_user!.viewItem (state.new_user!.items.items[index] , searchText, account );
								},
								itemCount: state.hasReachedMax!
									? state.new_user!.items.items.length
									: state.new_user!.items.items.length + 1,
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
							child:  ListView.builder(
								itemBuilder: (BuildContext context, int index) {
								 	  return index >= state.new_user!.items.items.length ?
									  state.new_user!.tools.paging.total_pages == state.new_user!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicNewUserBottomLoader()
									 // viewItemIndex(ItemBlogModel item,String search, int index, bool account)
									   : state.new_user!.viewItem (state.new_user!.items.items[index] , searchText, account );

								},
								itemCount: state.hasReachedMax!
									? state.new_user!.items.items.length
									: state.new_user!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),

					floatingActionButton: state.new_user!.Buttons(context, _dialVisible, account)
					//floatingActionButton: isLoading? null :  state.new_user!.Buttons(context, _dialVisible, controller,_user,  this, Env.value!.baseUrl!, '', title, account)

			 );
        }

		return  Center(
           child:CircularProgressIndicator(
           valueColor:  AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
      },
    );
  }

  @override
  void dispose() {
    new_user!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =  Completer<Null>();
    new_user!.listing!.add(NewUserListingRefresh());

    Timer timer =  Timer( Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }
  void _onScroll()async {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.position.pixels;
	final prefs = await SharedPreferences.getInstance();
    prefs.setDouble("position", scrollController!.position.pixels);
    if (maxScroll - currentScroll <= scrollThreshold) {
      new_user!.listing!.add(NewUserList());
    }

  }

}


////////////////////////////////
class  PublicNewUserBottomLoader extends StatelessWidget {
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


 class  LoginLinkView extends StatefulWidget {
   static const String PATH = '/public/_user/view/:id/:title';
   final String? id ;
   final String? title;
   final String? content;

   LoginLinkView({Key? key, this.id, this.title, this.content}) : super(key: key);
   @override
   LoginLinkViewState createState() =>  LoginLinkViewState();
 }

 class  LoginLinkViewState extends State< LoginLinkView>{
   String getPath = Env.value!.baseUrl! + '/public/_user/view/%s/%s';

   final double _appBarHeight = 230.0;
   AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

   NewUserController? new_user;
   final formKey = GlobalKey<FormState>();
   var controller =  ScrollController() ;
   final _scrollThreshold = 200.0;
   double lastScroll = 0;
   bool scrollUp = false;
   var isLoading = true;
   String idHash = '';
   // var viewNewUser;
   var model;
   AccountController? accountController;
   bool account = true;
   LoginLinkViewState(){
     controller.addListener(_onScroll);
   }

   @override
   initState(){
     super.initState();
     // controller = ScrollController();
   }
   void _onWidgetDidBuild(Function callback) {
     WidgetsBinding.instance!.addPostFrameCallback((_) {
       callback();
     });
     // next = false;
   }
   fetchData(NewUserController? new_user, BuildContext context)async {
     if (this.model == null) {
       final hash = new_user!.getHash();
       hash.then((value) {
         this.idHash = value;
       });
       final future = new_user!.viewNewUser();
       future.then((value) {
         setState(() {
           isLoading = false;
         });
         this.model = value;

       }).catchError((Error){
         _onWidgetDidBuild(() {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
               backgroundColor: Colors.red,
             ),
           );
         });
       });
     }
   }


   @override
   Widget build(BuildContext context) {
     bool _hasSubModel = false;
     int modelCount = 0;
     String getSubPath = '';
     bool _dialVisible = true;
     final size =MediaQuery.of(context).size;
     final width =size.width;
     new_user =   NewUserController(AppProvider.getApplication(context),
         getPath,
         AppAction.view,
         widget.id,
         widget.title!,
         null,
         false);

     if(!widget.title!.contains('Limit')){fetchData(new_user, context);}else{
       setState(() {
         isLoading = false;
       });
     }
     accountController =  AccountController(AppProvider.getApplication(context),
         AppAction.view   );
     List listAccount = [];
     final future = accountController!.getAccount();
     future.then((val){

       listAccount.addAll(val);
       if(listAccount.length == 0){
         account = false;
       }else{
         account = true;
       }

     });



       return Scaffold(
         /* appBar: AppBar(
			//title: Text(widget.title.replaceAll('-', '  ')),
		  ),  */
           appBar: isLoading?  AppBar(title: Text('', style : TextStyle( color: Colors.white, )), iconTheme: IconThemeData(
             color: Colors.white, //change your color here
           ),)
               : scrollUp ? null : AppBar(title: Text(widget.title!, style : TextStyle( color: Colors.white, ))),
           body:isLoading?
           Center(
               child:CircularProgressIndicator(
                 valueColor:  AlwaysStoppedAnimation<Color>(
                     Colors.green),
               ))
               :Form(
               key: formKey,
               child: Column(
                       children: [

                            SizedBox(height: 60,),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child:
                                widget.title!.contains('Limit')? Text('Anda terkena pembatasan limit, coba beberapa saat lagi.'):Text(widget.content!, style: TextStyle(fontSize:15),),
                             ),

                            SizedBox(height: 60,),
                            Center(
                             child:
                             widget.id!.contains('register')?
                             ButtonBar(
                                 alignment: MainAxisAlignment.center,
                                 buttonMinWidth: 0.9 * width,
                                 children: <Widget>[
                                   RaisedButton(
                                       child: Text('Register '),
                                       textColor: Colors.white,
                                       splashColor : CurrentTheme.ShadeColor,
                                       color : Color(0xFF037f51),
                                       onPressed: ()async{
                                         await AppProvider.getRouter(context)!.navigateTo(context, '/public/_user/register/123/Register');

                                       }
                                   )
                                 ]
                             )
                             :ButtonBar(
                                 alignment: MainAxisAlignment.center,
                                 buttonMinWidth: 0.9 * width,
                                 children: <Widget>[
                                   RaisedButton(
                                       child: Text('Login '),
                                       textColor: Colors.white,
                                       splashColor : CurrentTheme.ShadeColor,
                                       color : Color(0xFF037f51),
                                       onPressed: () {
                                         Navigator.pushAndRemoveUntil(
                                         context,
                                         MaterialPageRoute(builder: (context) => Login(application: context,isLogin: true,)),
                                             (Route<dynamic> route) => false,
                                       );

                                       }
                                   )
                                 ]
                             ),
                                 /*
                                     TextButton(
                                     onPressed: () {

                                       Navigator.pushAndRemoveUntil(
                                         context,
                                         MaterialPageRoute(builder: (context) => Login(application: context,isLogin: true,)),
                                             (Route<dynamic> route) => false,
                                       );

                                     },
                                     child: Text(
                                     'Login',
                                     ),
                                     style: ButtonStyle(
                                     side: MaterialStateProperty.all(
                                     BorderSide(width: 2, color: Colors.red)),
                                     foregroundColor: MaterialStateProperty.all(Colors.purple),
                                     padding: MaterialStateProperty.all(
                                     EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                                     textStyle:
                                     MaterialStateProperty.all(TextStyle(fontSize: 30))
                                     )
                                     ),

                                  */
                              ),

                           ],
                     ),
           )
           //floatingActionButton: isLoading? null :  this.model.Buttons(context, _dialVisible)
          // floatingActionButton: isLoading? null : this.model.model.buttons.length == 0? null: this.model.Buttons(context, _dialVisible, formKey, controller,_user,  this, Env.value!.baseUrl!, widget.id, widget.title!, account)

       );


   }

   void _onScroll() {
     final maxScroll = controller.position.maxScrollExtent;
     final currentScroll = controller.position.pixels;
     if(lastScroll > currentScroll){
       setState(() {
         scrollUp = false;
       });
     }else{
       setState(() {
         scrollUp = true;
       });
     }
     lastScroll = currentScroll;



   }

   @override
   void dispose() {
     super.dispose();
   }
 }