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
class  PublicExistingUserListing extends StatefulWidget {
  static const String PATH = '/public/existing_user/listing/:id';
    final String? id ;
   PublicExistingUserListing({Key? key, this.id}) : super(key: key);
  @override
   PublicExistingUserListingState createState() =>  PublicExistingUserListingState();
}

class  PublicExistingUserListingState extends State< PublicExistingUserListing>{
  String title = 'Existing User'; 
  bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/public/existing_user/listing?page=%d';
  ScrollController?  scrollController;
  ExistingUserController? existing_user;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  AccountController? accountController;
  bool account = true;
  String searchText = '';
   double initscroll = 0.0;
   PublicExistingUserListingState() {
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
      getPath = Env.value!.baseUrl! + '/public/existing_user/listing?page=%d' + ids;
    }
	
	if(widget.id!.contains('search')){
      var ids = widget.id!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/public/existing_user/listing?page=%d&' + ids;
    }
	accountController =      AccountController(AppProvider.getApplication(context),
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
	
    existing_user =  ExistingUserController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    existing_user!.listing!.add(ExistingUserList());
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
              leading:      IconButton(
                  icon:      Icon(Icons.arrow_back, color: Colors.white,),
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
                        MaterialPageRoute(builder: (context) => SearchExistingUserListing(id : '', title : '')),
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
            style:      TextStyle(
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
    return BlocBuilder<ExistingUserListing, ExistingUserState>(
     // cubit: existing_user!.listing,

      builder: (BuildContext context, ExistingUserState state) {
	    final mediaQueryData = MediaQuery.of(context);
        if (state is ExistingUserListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return      Center( 
           child:CircularProgressIndicator(
           valueColor:      AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is ExistingUserListingError) {
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
        if (state is ExistingUserListingLoaded) {
          if (state.existing_user!.items.items.isEmpty) {
		  if (state.existing_user!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.existing_user!.Buttons(context, _dialVisible, account)
				//floatingActionButton: isLoading? null :  state.existing_user!.Buttons(context, _dialVisible, controller,existing_user,  this, Env.value!.baseUrl!, '', title)
              );
			  }
          }
			if (state.existing_user!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							child:      ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								 	  return index >= state.existing_user!.items.items.length ? 
									  state.existing_user!.tools.paging.total_pages == state.existing_user!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicExistingUserBottomLoader()
									   : state.existing_user!.viewItem (state.existing_user!.items.items[index] , searchText, account );
								},
								itemCount: state.hasReachedMax!
									? state.existing_user!.items.items.length
									: state.existing_user!.items.items.length + 1,
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
							child:      ListView.builder(
								itemBuilder: (BuildContext context, int index) {
								 	  return index >= state.existing_user!.items.items.length ? 
									  state.existing_user!.tools.paging.total_pages == state.existing_user!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicExistingUserBottomLoader()
									 // viewItemIndex(ItemBlogModel item,String search, int index, bool account) 
									   : state.existing_user!.viewItem (state.existing_user!.items.items[index] , searchText, account );
									
								},
								itemCount: state.hasReachedMax!
									? state.existing_user!.items.items.length
									: state.existing_user!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.existing_user!.Buttons(context, _dialVisible, account)
					//floatingActionButton: isLoading? null :  state.existing_user!.Buttons(context, _dialVisible, controller,existing_user,  this, Env.value!.baseUrl!, '', title, account)		
                   
			 );
        }
		
		return      Center( 
           child:CircularProgressIndicator(
           valueColor:      AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
      },
    );
  }

  @override
  void dispose() {
    existing_user!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =      Completer<Null>();
    existing_user!.listing!.add(ExistingUserListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
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
      existing_user!.listing!.add(ExistingUserList());
    }

  }

}
////////////////////////////


class  SearchExistingUserListing extends StatefulWidget {
  static const String PATH = '/public/existing_user/listing/:id';
    final String? id ;
	final String? title;
   SearchExistingUserListing({Key? key, this.id, this.title}) : super(key: key);
  @override
   SearchExistingUserListingState createState() =>  SearchExistingUserListingState();
}

class  SearchExistingUserListingState extends State< SearchExistingUserListing>{
  String title = 'Existing User'; 
  bool _dialVisible = true;
  bool search = false;
  String getPath = Env.value!.baseUrl! + '/public/existing_user/listing?page=%d';
  ScrollController?  scrollController;
  ExistingUserController? existing_user;
  TextEditingController? searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  AccountController? accountController;
  bool account = true;
  String userid = '' ;
  String searchText = '';
   double initscroll = 0.0;
   SearchExistingUserListingState() {
   // scrollController!.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    search = true;
    if(widget.id! == ''){
      getPath = Env.value!.baseUrl! + '/public/existing_user/listing?page=%d&' + 'search=' + searchText!;
    } else{
      getPath = Env.value!.baseUrl! + '/public/existing_user/listing/' + widget.id!  + '?page=%d';
    }
	accountController =      AccountController(AppProvider.getApplication(context),
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
	
    existing_user =  ExistingUserController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
    existing_user!.listing!.add(ExistingUserList());
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
             leading:      IconButton(
                    icon:      Icon(Icons.arrow_back, color: Colors.white,),
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
            style:      TextStyle(
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
                searchBoxController!.clear();
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
    return BlocBuilder<ExistingUserListing, ExistingUserState>(
    //  cubit: existing_user!.listing,

      builder: (BuildContext context, ExistingUserState state) {
	    final mediaQueryData = MediaQuery.of(context);
        if (state is ExistingUserListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return      Center( 
           child:CircularProgressIndicator(
           valueColor:      AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is ExistingUserListingError) {
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
        if (state is ExistingUserListingLoaded) {
          if (state.existing_user!.items.items.isEmpty) {
		  if (state.existing_user!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.existing_user!.Buttons(context, _dialVisible, account)
				//floatingActionButton: isLoading? null :  state.existing_user!.Buttons(context, _dialVisible, controller,existing_user,  this, Env.value!.baseUrl!, '', title)
              );
			  }
          }
			if (state.existing_user!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							child:      ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								 	  return index >= state.existing_user!.items.items.length ? 
									  state.existing_user!.tools.paging.total_pages == state.existing_user!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicExistingUserBottomLoader()
									   : state.existing_user!.viewItem (state.existing_user!.items.items[index] , searchText, account );
								},
								itemCount: state.hasReachedMax!
									? state.existing_user!.items.items.length
									: state.existing_user!.items.items.length + 1,
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
							child:      ListView.builder(
								itemBuilder: (BuildContext context, int index) {
								 	  return index >= state.existing_user!.items.items.length ? 
									  state.existing_user!.tools.paging.total_pages == state.existing_user!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  PublicExistingUserBottomLoader()
									 // viewItemIndex(ItemBlogModel item,String search, int index, bool account) 
									   : state.existing_user!.viewItem (state.existing_user!.items.items[index] , searchText, account );
									
								},
								itemCount: state.hasReachedMax!
									? state.existing_user!.items.items.length
									: state.existing_user!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.existing_user!.Buttons(context, _dialVisible, account)
					//floatingActionButton: isLoading? null :  state.existing_user!.Buttons(context, _dialVisible, controller,existing_user,  this, Env.value!.baseUrl!, '', title, account)		
                   
			 );
        }
		
		return      Center( 
           child:CircularProgressIndicator(
           valueColor:      AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
      },
    );
  }

  @override
  void dispose() {
    existing_user!.listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =      Completer<Null>();
    existing_user!.listing!.add(ExistingUserListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
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
      existing_user!.listing!.add(ExistingUserList());
    }

  }

}


////////////////////////////////
class  PublicExistingUserBottomLoader extends StatelessWidget {
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




 class  ForgotLinkView extends StatefulWidget {
   static const String PATH = '/public/    _user/view/:id/:title';
   final String? id ;
   final String? title;
   ForgotLinkView({Key? key, this.id, this.title}) : super(key: key);
   @override
   ForgotLinkViewState createState() =>  ForgotLinkViewState();
 }

 class  ForgotLinkViewState extends State< ForgotLinkView>{
   String getPath = Env.value!.baseUrl! + '/public/    _user/view/%s/%s';

   final double _appBarHeight = 230.0;
   AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

   NewUserController?     _user;
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
   ForgotLinkViewState(){
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
   fetchData(NewUserController?     _user, BuildContext context)async {
     if (this.model == null) {
       final hash =     _user!.getHash();
       hash.then((value) {
         this.idHash = value;
       });
       final future =     _user!.viewNewUser();
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
         _user =       NewUserController(AppProvider.getApplication(context),
         getPath,
         AppAction.view,
         widget.id!,
         widget.title!,
         null,
         false);

     fetchData(    _user, context);
     accountController =      AccountController(AppProvider.getApplication(context),
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
			//title: Text(widget.title!.replaceAll('-', '  ')),
		  ),  */
         appBar: isLoading?  AppBar(title: Text('Password Reminder Sent', style : TextStyle( color: Colors.white, )), iconTheme: IconThemeData(
           color: Colors.white, //change your color here
         ),)
             : scrollUp ? null : AppBar(title: Text(widget.title!, style : TextStyle( color: Colors.white, ))),
         body:isLoading?
         Center(
             child:CircularProgressIndicator(
               valueColor:      AlwaysStoppedAnimation<Color>(
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
                 Text('Sebuah pesan telah kami kirim ke alamat email Anda, di dalamnya berisi petunjuk untuk mengubah password Anda. Silahkan cek email dan ikuti petunjuk yang diberikan.', style: TextStyle(fontSize:15),),
               ),

               SizedBox(height: 60,),
               Center(
                 child:
                 ButtonBar(
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
               ),

             ],
           ),
         )
       //floatingActionButton: isLoading? null :  this.model.Buttons(context, _dialVisible)
       // floatingActionButton: isLoading? null : this.model.model.buttons.length == 0? null: this.model.Buttons(context, _dialVisible, formKey, controller,    _user,  this, Env.value!.baseUrl!, widget.id!, widget.title!, account)

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