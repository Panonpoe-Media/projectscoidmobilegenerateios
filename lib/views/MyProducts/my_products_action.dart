import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:sprintf/sprintf.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:flutter/rendering.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:intl/intl.dart' as inter;
import 'package:getwidget/getwidget.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:projectscoid/app/projectscoid.dart';
import 'package:photo_view/photo_view.dart';
import 'package:intl/intl.dart'as intl1;
import 'package:filesize/filesize.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectscoid/views/components/uploadprovider.dart';
import 'package:projectscoid/views/Chat/widgets/emoji_picker.dart';
import 'package:projectscoid/core/components/utility/tool/reply-input.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:ui' as ui;
import 'package:projectscoid/models/file_fields.dart';
import 'package:path/path.dart' as p;
import 'package:projectscoid/models/photo.dart';
import 'package:dio/dio.dart';
import 'package:camera/camera.dart' ;
import 'package:flutter/services.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:projectscoid/views/Chat/blocs/blocs.dart';
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';
import 'package:html/parser.dart' show parse;
import 'package:projectscoid/models/MyProjects/show_conversation_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_conversation_list_item_base.dart';
import 'package:projectscoid/models/MyProjects/show_thread_list_item.dart';
import 'package:projectscoid/models/MyProjects/show_thread_list_item_base.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectscoid/core/components/helpers/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


//////////////////

class SalesMyProducts extends StatefulWidget {
  final String? id ;
  final String? title;
  final ChatBloc? cb;
  static const String PATH = '/user/my_products/sales/:id/:title';
  SalesMyProducts({Key? key, this.id, this.title, this.cb}) : super(key: key);
  @override
  SalesMyProductsState1 createState() => SalesMyProductsState1();
}

class  SalesMyProductsState1 extends State<SalesMyProducts> with TickerProviderStateMixin<SalesMyProducts>, RestorationMixin{
  String? title = 'Sales'; 
  bool _dialVisible = true;
  bool search = true;
  String? getPath = Env.value!.baseUrl! + '/user/my_products/sales/';
  
   ScrollController?  scrollController;
  
  MyProductsController? sales;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String? searchText = '';
  bool account = true;
  int titleindex = 0;
  String? tempheader = '';
   double initscroll = 0.0;
  AccountController? accountController;
	final ValueNotifier<int> firstSelectIndex = ValueNotifier<int>(0);
	   List<Map> listAccount = [];
	   
   
	
	int firstIndex = 0;
	var _keys = {};
   List<int> _selectedItemsIndex = [];
   List<String> _selectedItems = [];
   bool isMultiSelected = false;

  SalesMyProductsState1() {
   // scrollController!.addListener(_onScroll);
  }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'Sales';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'Sales');
  }

  

  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
     getPath = Env.value!.baseUrl! + '/user/my_products/sales/'+widget.id! +'/'+ widget.title! +'*?page=%d';
      if(widget.title!.contains('&filter')|| widget.title!.contains('search')|| widget.title!.contains('&order'))
	  {
	      search = true;
	  }
      if(widget.title!.contains('&filter')){
      var ids = widget.title!;
      int ind = ids.indexOf('&');
          ids = ids.substring(ind, ids.length);
      getPath = Env.value!.baseUrl! + '/user/my_products/sales/'+widget.id! +'/'+ widget.title!+'?page=%d' + ids ;
    }
	if(widget.title!.contains('search')){
      var ids = widget.title!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/user/my_products/sales/'+widget.id! +'/'+ widget.title!+'?page=%d&' + ids ;
    }
	 if(widget.title!.contains('&order')){
     var ids = widget.title!;
     int ind = ids.indexOf('&');
     ids = ids.substring(ind, ids.length);
     int ind1 = widget.title!.indexOf('%28page');
     String? ttl = widget.title!.substring(0, ind1);
     getPath = Env.value!.baseUrl! + '/user/my_products/sales/'+widget.id! +'/'+ ttl+'?page=%d' + ids ;
	}
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
	
	
    sales =  MyProductsController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
	sales!.listMyProductsSales();
    sales!.listingSales!.add(SalesMyProductsList());
	accountController =    AccountController(AppProvider.getApplication(context),
	AppAction.view   );
	
	
	    final future = accountController!.getAccount();
		future.then((val){
		 //List<Map> listAccount = [];
		  listAccount.addAll(val);
		  if(listAccount.length == 0){
			account = false;
		  }else{
			  account = true;
			
		  }
		});
	
	
	///////////
	
    return Scaffold(
	 backgroundColor: darkMode? Colors.black : Colors.white,
        appBar: AppBar(
		  iconTheme: IconThemeData(
					color: Colors.white, //change your color here
				  ),
	  leading:    IconButton(
              icon:    Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: ()async{
                final prefs = await SharedPreferences.getInstance();
                prefs.setDouble("position", 0.0);

                  Navigator.pop(context);

                // Navigator.pop(context);

              }
          ),
          actions: <Widget>[
            IconButton(

                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () async {
                  if (!selected) {
                    setState(() {
                      selected = true;
                    });
                  } else {
                    setState(() {
                      selected = false;
                    });
                  }
                }
            )
          ],
          title: selected? buildSearchBar(title!) : Text(title!, style: TextStyle(color: Colors.white))  ,
        ),
        body: buildListingBar()
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
                fontSize: 14.0,
                height: 0.2,
                color: Colors.black
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
  

    		var listViewKey = RectGetter.createGlobalKey();

   // @override
   Widget buildListingBar2(){  
  
    return BlocBuilder<SalesMyProductsListing, SalesMyProductsState>(
      bloc: sales!.listingSales,

      builder: (BuildContext context, state) {
        if (state is SalesMyProductsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
		 /*
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
		  */
				 return    Center( 
					   child:CircularProgressIndicator(
					   valueColor:    AlwaysStoppedAnimation<Color>(
						Colors.green),
					  ));
        }
        if (state is SalesMyProductsListingError) {
		  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is SalesMyProductsListingLoaded) {
          if (state.sales!.items.items.isEmpty) {
		  if (state.sales!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
					floatingActionButton: state.sales!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }
			if (state.sales!.tools.buttons.length == 0){ 
			var sc = [];
              sc.addAll(state.sales!.items.items.reversed);
			   
				  return
		  Scaffold(
                    body:
					///////////////////
					///////////////////
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.sales!.items.items.length ?
								       state.sales!.tools.paging.total_pages == state.sales!.tools.paging.current_page?
                                        Container(height: 0.0, width: 0.0,):
									    UserSalesMyProductsBottomLoader()
									  : state.sales!.viewItem (state.sales!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.sales!.items.items.length
									: state.sales!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
					
							
                   
			 );				
			}
			var sc = [];
			 sc.addAll(state.sales!.items.items.reversed);
			
          return
		  Scaffold(
                    body:
					///////////////////
					///////////////////
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.sales!.items.items.length ?
								       state.sales!.tools.paging.total_pages == state.sales!.tools.paging.current_page?
                                        Container(height: 0.0, width: 0.0,):
									    UserSalesMyProductsBottomLoader()
									  : state.sales!.viewItem (state.sales!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.sales!.items.items.length
									: state.sales!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
					floatingActionButton: state.sales!.Buttons(context, _dialVisible, widget.id!)
							
                   
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
  
  
  
  
  
   Widget buildListingBar(){  
  
    return BlocBuilder<SalesMyProductsListing, SalesMyProductsState>(
      bloc: sales!.listingSales,

      builder: (BuildContext context, state) {
        if (state is SalesMyProductsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is SalesMyProductsListingError) {
		  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is SalesMyProductsListingLoaded) {
          if (state.sales!.items.items.isEmpty) {
		  if (state.sales!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
				   
					
					floatingActionButton: state.sales!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }
			if (state.sales!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.sales!.items.items.length?  
									  state.sales!.tools.paging.total_pages == state.sales!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  
									  UserSalesMyProductsBottomLoader()
									  : state.sales!.viewItem (state.sales!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.sales!.items.items.length
									: state.sales!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							)
				);					
			}
			var sc = [];
              sc.addAll(state.sales!.items.items.reversed);
          return
		  Scaffold(
                    body:
					///////////////////
					///////////////////
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.sales!.items.items.length ?
								       state.sales!.tools.paging.total_pages == state.sales!.tools.paging.current_page?
                                        Container(height: 0.0, width: 0.0,):
									    UserSalesMyProductsBottomLoader()
									  : state.sales!.viewItem (state.sales!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.sales!.items.items.length
									: state.sales!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
					floatingActionButton: state.sales!.Buttons(context, _dialVisible, widget.id!)
							
                   
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
    sales!.listingSales!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =    Completer<Null>();
    sales!.listingSales!.add(SalesMyProductsListingRefresh());

    Timer timer =    Timer(   Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll()async{
    final maxScroll = scrollController!.position.maxScrollExtent;
    double currentScroll = scrollController!.position.pixels;
	    final prefs = await SharedPreferences.getInstance();
         prefs.setDouble("position", scrollController!.position.pixels);
	
    cs.value = currentScroll;
    if (maxScroll - currentScroll <= scrollThreshold) {
      sales!.listingSales!.add(SalesMyProductsList());
    }

  }

}

class  UserSalesMyProductsBottomLoader extends StatelessWidget {
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


//////////////////

class CommentsMyProducts extends StatefulWidget {
  final String? id ;
  final String? title;
  final ChatBloc? cb;
  static const String PATH = '/user/my_products/comments/:id/:title';
  CommentsMyProducts({Key? key, this.id, this.title, this.cb}) : super(key: key);
  @override
  CommentsMyProductsState1 createState() => CommentsMyProductsState1();
}

class  CommentsMyProductsState1 extends State<CommentsMyProducts> with TickerProviderStateMixin<CommentsMyProducts>, RestorationMixin{
  String? title = 'Comments'; 
  bool _dialVisible = true;
  bool search = true;
  String? getPath = Env.value!.baseUrl! + '/user/my_products/comments/';
  
   ScrollController?  scrollController;
  
  MyProductsController? comments;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String? searchText = '';
  bool account = true;
  int titleindex = 0;
  String? tempheader = '';
   double initscroll = 0.0;
  AccountController? accountController;
	final ValueNotifier<int> firstSelectIndex = ValueNotifier<int>(0);
	   List<Map> listAccount = [];
	   
   
	
	int firstIndex = 0;
	var _keys = {};
   List<int> _selectedItemsIndex = [];
   List<String> _selectedItems = [];
   bool isMultiSelected = false;

  CommentsMyProductsState1() {
   // scrollController!.addListener(_onScroll);
  }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'Comments';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'Comments');
  }

  

  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
     getPath = Env.value!.baseUrl! + '/user/my_products/comments/'+widget.id! +'/'+ widget.title! +'*?page=%d';
      if(widget.title!.contains('&filter')|| widget.title!.contains('search')|| widget.title!.contains('&order'))
	  {
	      search = true;
	  }
      if(widget.title!.contains('&filter')){
      var ids = widget.title!;
      int ind = ids.indexOf('&');
          ids = ids.substring(ind, ids.length);
      getPath = Env.value!.baseUrl! + '/user/my_products/comments/'+widget.id! +'/'+ widget.title!+'?page=%d' + ids ;
    }
	if(widget.title!.contains('search')){
      var ids = widget.title!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/user/my_products/comments/'+widget.id! +'/'+ widget.title!+'?page=%d&' + ids ;
    }
	 if(widget.title!.contains('&order')){
     var ids = widget.title!;
     int ind = ids.indexOf('&');
     ids = ids.substring(ind, ids.length);
     int ind1 = widget.title!.indexOf('%28page');
     String? ttl = widget.title!.substring(0, ind1);
     getPath = Env.value!.baseUrl! + '/user/my_products/comments/'+widget.id! +'/'+ ttl+'?page=%d' + ids ;
	}
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
	
	
    comments =  MyProductsController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
	comments!.listMyProductsComments();
    comments!.listingComments!.add(CommentsMyProductsList());
	accountController =    AccountController(AppProvider.getApplication(context),
	AppAction.view   );
	
	
	    final future = accountController!.getAccount();
		future.then((val){
		 //List<Map> listAccount = [];
		  listAccount.addAll(val);
		  if(listAccount.length == 0){
			account = false;
		  }else{
			  account = true;
			
		  }
		});
	
	
	///////////
	
    return Scaffold(
	 backgroundColor: darkMode? Colors.black : Colors.white,
        appBar: AppBar(
		  iconTheme: IconThemeData(
					color: Colors.white, //change your color here
				  ),
	  leading:    IconButton(
              icon:    Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: ()async{
                final prefs = await SharedPreferences.getInstance();
                prefs.setDouble("position", 0.0);

                  Navigator.pop(context);

                // Navigator.pop(context);

              }
          ),
          actions: <Widget>[
            IconButton(

                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () async {
                  if (!selected) {
                    setState(() {
                      selected = true;
                    });
                  } else {
                    setState(() {
                      selected = false;
                    });
                  }
                }
            )
          ],
          title: selected? buildSearchBar(title!) : Text(title!, style: TextStyle(color: Colors.white))  ,
        ),
        body: buildListingBar()
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
                fontSize: 14.0,
                height: 0.2,
                color: Colors.black
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
  

    		var listViewKey = RectGetter.createGlobalKey();

   // @override
   Widget buildListingBar2(){  
  
    return BlocBuilder<CommentsMyProductsListing, CommentsMyProductsState>(
      bloc: comments!.listingComments,

      builder: (BuildContext context, state) {
        if (state is CommentsMyProductsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
		 /*
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
		  */
				 return    Center( 
					   child:CircularProgressIndicator(
					   valueColor:    AlwaysStoppedAnimation<Color>(
						Colors.green),
					  ));
        }
        if (state is CommentsMyProductsListingError) {
		  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is CommentsMyProductsListingLoaded) {
          if (state.comments!.items.items.isEmpty) {
		  if (state.comments!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
					floatingActionButton: state.comments!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }
			if (state.comments!.tools.buttons.length == 0){ 
			var sc = [];
              sc.addAll(state.comments!.items.items.reversed);
			   
				  return
		  Scaffold(
                    body:
					///////////////////
					///////////////////
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.comments!.items.items.length ?
								       state.comments!.tools.paging.total_pages == state.comments!.tools.paging.current_page?
                                        Container(height: 0.0, width: 0.0,):
									    UserCommentsMyProductsBottomLoader()
									  : state.comments!.viewItem (state.comments!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.comments!.items.items.length
									: state.comments!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
					
							
                   
			 );				
			}
			var sc = [];
			 sc.addAll(state.comments!.items.items.reversed);
			
          return
		  Scaffold(
                    body:
					///////////////////
					///////////////////
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.comments!.items.items.length ?
								       state.comments!.tools.paging.total_pages == state.comments!.tools.paging.current_page?
                                        Container(height: 0.0, width: 0.0,):
									    UserCommentsMyProductsBottomLoader()
									  : state.comments!.viewItem (state.comments!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.comments!.items.items.length
									: state.comments!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
					floatingActionButton: state.comments!.Buttons(context, _dialVisible, widget.id!)
							
                   
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
  
  
  
  
  
   Widget buildListingBar(){  
  
    return BlocBuilder<CommentsMyProductsListing, CommentsMyProductsState>(
      bloc: comments!.listingComments,

      builder: (BuildContext context, state) {
        if (state is CommentsMyProductsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is CommentsMyProductsListingError) {
		  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is CommentsMyProductsListingLoaded) {
          if (state.comments!.items.items.isEmpty) {
		  if (state.comments!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
				   
					
					floatingActionButton: state.comments!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }
			if (state.comments!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.comments!.items.items.length?  
									  state.comments!.tools.paging.total_pages == state.comments!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  
									  UserCommentsMyProductsBottomLoader()
									  : state.comments!.viewItem (state.comments!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.comments!.items.items.length
									: state.comments!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							)
				);					
			}
			var sc = [];
              sc.addAll(state.comments!.items.items.reversed);
          return
		  Scaffold(
                    body:
					///////////////////
					///////////////////
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.comments!.items.items.length ?
								       state.comments!.tools.paging.total_pages == state.comments!.tools.paging.current_page?
                                        Container(height: 0.0, width: 0.0,):
									    UserCommentsMyProductsBottomLoader()
									  : state.comments!.viewItem (state.comments!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.comments!.items.items.length
									: state.comments!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
					floatingActionButton: state.comments!.Buttons(context, _dialVisible, widget.id!)
							
                   
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
    comments!.listingComments!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =    Completer<Null>();
    comments!.listingComments!.add(CommentsMyProductsListingRefresh());

    Timer timer =    Timer(   Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll()async{
    final maxScroll = scrollController!.position.maxScrollExtent;
    double currentScroll = scrollController!.position.pixels;
	    final prefs = await SharedPreferences.getInstance();
         prefs.setDouble("position", scrollController!.position.pixels);
	
    cs.value = currentScroll;
    if (maxScroll - currentScroll <= scrollThreshold) {
      comments!.listingComments!.add(CommentsMyProductsList());
    }

  }

}

class  UserCommentsMyProductsBottomLoader extends StatelessWidget {
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


//////////////////


class AddNewProductMyProducts extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_products/add_new_product/:id/:title';
  AddNewProductMyProducts({Key? key, this.id, this.title}) : super(key: key);

  @override
  AddNewProductMyProductsState createState() => AddNewProductMyProductsState();
}

class AddNewProductMyProductsState extends State<AddNewProductMyProducts> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_products/add_new_product/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_products/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_products/add_new_product/%s/%s';

  MyProductsController? add_new_product;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelAddNewProduct;
  var model;
  var formData;
  var postAddNewProductResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Add New Product';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'AddNewProduct';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }


  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
 fetchData(MyProductsController? add_new_product , BuildContext context)async {
    if (this.model == null) {
       final future = add_new_product!.getAddNewProductMyProducts('');
       future.then((value) {
        setState(() {
          isLoading = false;
        });
          try{
		  this.model = value;
		    try{
            errmsg = value;
			  }catch(e){

			  }
		  }catch(e){
		   errmsg = value;
		   isError = true;
		  }
		  
		 
		  if(this.model.model.meta == null){
            isError = true;
			  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          }
		  isError = false;
        }).catchError((Error){
		   isError = true;
		 
		    if(errmsg.contains('content-page')){
			
			  setState(() {
               isLoading = false;
            });
			 var document = parse(errmsg);
				var data = document.getElementsByClassName('content-page');
				if((data != null) && (data.length > 0)){
				  var msg = data[0].children[0];
				  msg.insertBefore(data[0].children[1], null);
				  errmsg = msg.innerHtml;
				}
			/*
         _onWidgetDidBuild(() {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text('Unauthorized  :'+ sprintf('Add New Product', [widget.id!,widget.title!])),
               backgroundColor: Colors.red,
             ),
           );
         });
		 */
       }else{
		     _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
		  // setState(() {
              // isLoading = false;
           // });
		  }
		});
      }
    }
   Future<bool>  _onWillPop() async{
		return await showDialog(
			context: context,
			builder: (context) =>
					AlertDialog(
						title: Text('Kembali',
							style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
						content: Text('Apakah Anda ingin meninggalkan halaman ini?'),
						actions: <Widget>[
							FlatButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('AddNewProduct')){
										add_new_product!.deleteAllAddNewProductMyProducts(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('AddNewProduct')){
										add_new_product!.deleteAllAddNewProductMyProducts(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('AddNewProduct')){
										add_new_product!.deleteAllAddNewProductMyProducts(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('AddNewProduct')){
										add_new_product!.deleteAllAddNewProductMyProducts(this.model.model.model.user_id);
										}else{
										add_new_product!.deleteAllAddNewProductMyProducts('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							FlatButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 FlatButton(
								onPressed: () {
								if(this.model != null){
								
								  this.model.model.model.logo = null;
								  this.model.model.model.deliverable= null;
								  this.model.model.model.trial_version= null;
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('AddNewProduct')){
													add_new_product!.saveAddNewProductMyProducts(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('AddNewProduct')){
													add_new_product!.saveAddNewProductMyProducts(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('AddNewProduct')){
													add_new_product!.saveAddNewProductMyProducts(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('AddNewProduct')){
													add_new_product!.saveAddNewProductMyProducts(this.model,this.model.model.model.user_id);
													}else{
													add_new_product!.saveAddNewProductMyProducts(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('AddNewProduct')){
													add_new_product!.saveAddNewProductMyProducts(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('AddNewProduct')){
													add_new_product!.saveAddNewProductMyProducts(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('AddNewProduct')){
													add_new_product!.saveAddNewProductMyProducts(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('AddNewProduct')){
													add_new_product!.saveAddNewProductMyProducts(this.model,this.model.model.model.user_id);
													}else{
													add_new_product!.saveAddNewProductMyProducts(this.model,'');
													}
											  }
											  
								  }

									  Navigator.pop(context); Navigator.pop(context);

								},
								child: Text('Ya & Simpan Data'),
							  ),
						],
					),
		) ??
				false;
	}
  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    bool _dialVisible = true;
    add_new_product =    MyProductsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(add_new_product, context);
      return 
     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,
                appBar: 
                  AppBar(
                            automaticallyImplyLeading: false,
                            title:
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: _onWillPop,
                                  child:
                                  Padding(padding: EdgeInsets.only(right: 6.0),
                                    child: Icon(Icons.arrow_back,
                                                  color: Colors.white),

                                  ),
                                ),
                                Text('Add New Product', style: TextStyle(color: Colors.white),),
                              ]
                            ),

                        ),


                      body:isLoading? 
                        // Center(
                        //   child: CircularProgressIndicator(),
                        // )
                          Center( 
                      child:CircularProgressIndicator(
                      valueColor:    AlwaysStoppedAnimation<Color>(
                        Colors.green),
                      )):isError?
				 				  
                  Form(
                          key: formKey,
                          child: SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),                
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[

                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 14.0, 8.0, 2.0),
                                      child:  Html(data: errmsg ),
                                    ),
                                  
                        ]
                              
                              )

                          )
                      )
                        :Form(
                          key: formKey,
                          
                    child:    SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[
                        
                            /* Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.include_before),
                              ),*/
                            /*
                                              1) before_title
                              2) title
                              3) after_title
                              4) warning / error
                              5) before_content
                              6) content
                              7) after_content						
                            */  
                              
                            
                            this.model.model.meta.before_title == null ? Container(width: 0.0, height: 0.0) : Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.before_title,									
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                     if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),

                              ),
                            
                            Padding(padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.title,
                                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                            ),								

                            this.model.model.meta.after_title == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_title,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
									  if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                     
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.warning == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.warning.message, 
                                    //backgroundColor: CurrentTheme.WarningColor,
                                  style: {
                                    "html": Style(
                                      backgroundColor: CurrentTheme.WarningColor,
                                      ),
                                    },
                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.before_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.before_content.replaceAll('<p>\r\n', '<p>'),
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),
                              ),
                              
                                
                              this.model.editLogo(this), 							  
                              this.model.editTitle(this), 							  
                              this.model.editDescription(this), 							  
                              this.model.editDeliverable(this), 							  
                              this.model.editTrialVersion(this), 							  
                              this.model.editPrice(this), 							  
                              this.model.editTags(this), 							  
                              
                            this.model.model.meta.after_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_content,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                              
                            /* Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  8.0, 14.0, 8.0, 2.0),
                                child: Html(data: this.model.model.meta.after_after),
                                ), */
                        	Container(
                              height: 30,
                            ),
							
							   isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,add_new_product, postAddNewProductResult, this, sendPath, widget.id!, widget.title!),
          
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,add_new_product, postAddNewProductResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////


class PublishProductMyProducts extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_products/publish_product/:id/:title';
  PublishProductMyProducts({Key? key, this.id, this.title}) : super(key: key);

  @override
  PublishProductMyProductsState createState() => PublishProductMyProductsState();
}

class PublishProductMyProductsState extends State<PublishProductMyProducts> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_products/publish_product/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_products/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_products/publish_product/%s/%s';

  MyProductsController? publish_product;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelPublishProduct;
  var model;
  var formData;
  var postPublishProductResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Publish Product';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'PublishProduct';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }


  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
 fetchData(MyProductsController? publish_product , BuildContext context)async {
    if (this.model == null) {
       final future = publish_product!.getPublishProductMyProducts('');
       future.then((value) {
        setState(() {
          isLoading = false;
        });
          try{
		  this.model = value;
		    try{
            errmsg = value;
			  }catch(e){

			  }
		  }catch(e){
		   errmsg = value;
		   isError = true;
		  }
		  
		 
		  if(this.model.model.meta == null){
            isError = true;
			  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          }
		  isError = false;
        }).catchError((Error){
		   isError = true;
		 
		    if(errmsg.contains('content-page')){
			
			  setState(() {
               isLoading = false;
            });
			 var document = parse(errmsg);
				var data = document.getElementsByClassName('content-page');
				if((data != null) && (data.length > 0)){
				  var msg = data[0].children[0];
				  msg.insertBefore(data[0].children[1], null);
				  errmsg = msg.innerHtml;
				}
			/*
         _onWidgetDidBuild(() {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text('Unauthorized  :'+ sprintf('Publish Product', [widget.id!,widget.title!])),
               backgroundColor: Colors.red,
             ),
           );
         });
		 */
       }else{
		     _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
		  // setState(() {
              // isLoading = false;
           // });
		  }
		});
      }
    }
   Future<bool>  _onWillPop() async{
		return await showDialog(
			context: context,
			builder: (context) =>
					AlertDialog(
						title: Text('Kembali',
							style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
						content: Text('Apakah Anda ingin meninggalkan halaman ini?'),
						actions: <Widget>[
							FlatButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('PublishProduct')){
										publish_product!.deleteAllPublishProductMyProducts(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('PublishProduct')){
										publish_product!.deleteAllPublishProductMyProducts(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('PublishProduct')){
										publish_product!.deleteAllPublishProductMyProducts(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PublishProduct')){
										publish_product!.deleteAllPublishProductMyProducts(this.model.model.model.user_id);
										}else{
										publish_product!.deleteAllPublishProductMyProducts('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							FlatButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 FlatButton(
								onPressed: () {
								if(this.model != null){
								
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('PublishProduct')){
													publish_product!.savePublishProductMyProducts(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('PublishProduct')){
													publish_product!.savePublishProductMyProducts(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('PublishProduct')){
													publish_product!.savePublishProductMyProducts(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('PublishProduct')){
													publish_product!.savePublishProductMyProducts(this.model,this.model.model.model.user_id);
													}else{
													publish_product!.savePublishProductMyProducts(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('PublishProduct')){
													publish_product!.savePublishProductMyProducts(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('PublishProduct')){
													publish_product!.savePublishProductMyProducts(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('PublishProduct')){
													publish_product!.savePublishProductMyProducts(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('PublishProduct')){
													publish_product!.savePublishProductMyProducts(this.model,this.model.model.model.user_id);
													}else{
													publish_product!.savePublishProductMyProducts(this.model,'');
													}
											  }
											  
								  }

									  Navigator.pop(context); Navigator.pop(context);

								},
								child: Text('Ya & Simpan Data'),
							  ),
						],
					),
		) ??
				false;
	}
  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    bool _dialVisible = true;
    publish_product =    MyProductsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(publish_product, context);
      return 
     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,
                appBar: 
                  AppBar(
                            automaticallyImplyLeading: false,
                            title:
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: _onWillPop,
                                  child:
                                  Padding(padding: EdgeInsets.only(right: 6.0),
                                    child: Icon(Icons.arrow_back,
                                                  color: Colors.white),

                                  ),
                                ),
                                Text('Publish Product', style: TextStyle(color: Colors.white),),
                              ]
                            ),

                        ),


                      body:isLoading? 
                        // Center(
                        //   child: CircularProgressIndicator(),
                        // )
                          Center( 
                      child:CircularProgressIndicator(
                      valueColor:    AlwaysStoppedAnimation<Color>(
                        Colors.green),
                      )):isError?
				 				  
                  Form(
                          key: formKey,
                          child: SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),                
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[

                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 14.0, 8.0, 2.0),
                                      child:  Html(data: errmsg ),
                                    ),
                                  
                        ]
                              
                              )

                          )
                      )
                        :Form(
                          key: formKey,
                          
                    child:    SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[
                        
                            /* Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.include_before),
                              ),*/
                            /*
                                              1) before_title
                              2) title
                              3) after_title
                              4) warning / error
                              5) before_content
                              6) content
                              7) after_content						
                            */  
                              
                            
                            this.model.model.meta.before_title == null ? Container(width: 0.0, height: 0.0) : Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.before_title,									
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                     if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),

                              ),
                            
                            Padding(padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.title,
                                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                            ),								

                            this.model.model.meta.after_title == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_title,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
									  if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                     
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.warning == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.warning.message, 
                                    //backgroundColor: CurrentTheme.WarningColor,
                                  style: {
                                    "html": Style(
                                      backgroundColor: CurrentTheme.WarningColor,
                                      ),
                                    },
                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.before_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.before_content.replaceAll('<p>\r\n', '<p>'),
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),
                              ),
                              
                                
                              this.model.viewLogo(context),
                              this.model.viewTitle(context),
                              this.model.viewDescription(context),
                              this.model.viewDeliverable(context),
                              this.model.viewTrialVersion(context),
                              this.model.viewPrice(context),
                              this.model.viewTags(context),
                              
                            this.model.model.meta.after_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_content,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                              
                            /* Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  8.0, 14.0, 8.0, 2.0),
                                child: Html(data: this.model.model.meta.after_after),
                                ), */
                        	Container(
                              height: 30,
                            ),
							
							   isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,publish_product, postPublishProductResult, this, sendPath, widget.id!, widget.title!),
          
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,publish_product, postPublishProductResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////


class EditProductMyProducts extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_products/edit_product/:id/:title';
  EditProductMyProducts({Key? key, this.id, this.title}) : super(key: key);

  @override
  EditProductMyProductsState createState() => EditProductMyProductsState();
}

class EditProductMyProductsState extends State<EditProductMyProducts> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_products/edit_product/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_products/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_products/edit_product/%s/%s';

  MyProductsController? edit_product;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelEditProduct;
  var model;
  var formData;
  var postEditProductResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Edit Product';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'EditProduct';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }


  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
 fetchData(MyProductsController? edit_product , BuildContext context)async {
    if (this.model == null) {
       final future = edit_product!.getEditProductMyProducts('');
       future.then((value) {
        setState(() {
          isLoading = false;
        });
          try{
		  this.model = value;
		    try{
            errmsg = value;
			  }catch(e){

			  }
		  }catch(e){
		   errmsg = value;
		   isError = true;
		  }
		  
		 
		  if(this.model.model.meta == null){
            isError = true;
			  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          }
		  isError = false;
        }).catchError((Error){
		   isError = true;
		 
		    if(errmsg.contains('content-page')){
			
			  setState(() {
               isLoading = false;
            });
			 var document = parse(errmsg);
				var data = document.getElementsByClassName('content-page');
				if((data != null) && (data.length > 0)){
				  var msg = data[0].children[0];
				  msg.insertBefore(data[0].children[1], null);
				  errmsg = msg.innerHtml;
				}
			/*
         _onWidgetDidBuild(() {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text('Unauthorized  :'+ sprintf('Edit Product', [widget.id!,widget.title!])),
               backgroundColor: Colors.red,
             ),
           );
         });
		 */
       }else{
		     _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
		  // setState(() {
              // isLoading = false;
           // });
		  }
		});
      }
    }
   Future<bool>  _onWillPop() async{
		return await showDialog(
			context: context,
			builder: (context) =>
					AlertDialog(
						title: Text('Kembali',
							style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
						content: Text('Apakah Anda ingin meninggalkan halaman ini?'),
						actions: <Widget>[
							FlatButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('EditProduct')){
										edit_product!.deleteAllEditProductMyProducts(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('EditProduct')){
										edit_product!.deleteAllEditProductMyProducts(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('EditProduct')){
										edit_product!.deleteAllEditProductMyProducts(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('EditProduct')){
										edit_product!.deleteAllEditProductMyProducts(this.model.model.model.user_id);
										}else{
										edit_product!.deleteAllEditProductMyProducts('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							FlatButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 FlatButton(
								onPressed: () {
								if(this.model != null){
								
								  this.model.model.model.logo = null;
								  this.model.model.model.deliverable= null;
								  this.model.model.model.trial_version= null;
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('EditProduct')){
													edit_product!.saveEditProductMyProducts(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('EditProduct')){
													edit_product!.saveEditProductMyProducts(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('EditProduct')){
													edit_product!.saveEditProductMyProducts(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('EditProduct')){
													edit_product!.saveEditProductMyProducts(this.model,this.model.model.model.user_id);
													}else{
													edit_product!.saveEditProductMyProducts(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('EditProduct')){
													edit_product!.saveEditProductMyProducts(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('EditProduct')){
													edit_product!.saveEditProductMyProducts(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('EditProduct')){
													edit_product!.saveEditProductMyProducts(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('EditProduct')){
													edit_product!.saveEditProductMyProducts(this.model,this.model.model.model.user_id);
													}else{
													edit_product!.saveEditProductMyProducts(this.model,'');
													}
											  }
											  
								  }

									  Navigator.pop(context); Navigator.pop(context);

								},
								child: Text('Ya & Simpan Data'),
							  ),
						],
					),
		) ??
				false;
	}
  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    bool _dialVisible = true;
    edit_product =    MyProductsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(edit_product, context);
      return 
     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,
                appBar: 
                  AppBar(
                            automaticallyImplyLeading: false,
                            title:
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: _onWillPop,
                                  child:
                                  Padding(padding: EdgeInsets.only(right: 6.0),
                                    child: Icon(Icons.arrow_back,
                                                  color: Colors.white),

                                  ),
                                ),
                                Text('Edit Product', style: TextStyle(color: Colors.white),),
                              ]
                            ),

                        ),


                      body:isLoading? 
                        // Center(
                        //   child: CircularProgressIndicator(),
                        // )
                          Center( 
                      child:CircularProgressIndicator(
                      valueColor:    AlwaysStoppedAnimation<Color>(
                        Colors.green),
                      )):isError?
				 				  
                  Form(
                          key: formKey,
                          child: SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),                
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[

                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 14.0, 8.0, 2.0),
                                      child:  Html(data: errmsg ),
                                    ),
                                  
                        ]
                              
                              )

                          )
                      )
                        :Form(
                          key: formKey,
                          
                    child:    SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[
                        
                            /* Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.include_before),
                              ),*/
                            /*
                                              1) before_title
                              2) title
                              3) after_title
                              4) warning / error
                              5) before_content
                              6) content
                              7) after_content						
                            */  
                              
                            
                            this.model.model.meta.before_title == null ? Container(width: 0.0, height: 0.0) : Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.before_title,									
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                     if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),

                              ),
                            
                            Padding(padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.title,
                                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                            ),								

                            this.model.model.meta.after_title == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_title,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
									  if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                     
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.warning == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.warning.message, 
                                    //backgroundColor: CurrentTheme.WarningColor,
                                  style: {
                                    "html": Style(
                                      backgroundColor: CurrentTheme.WarningColor,
                                      ),
                                    },
                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.before_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.before_content.replaceAll('<p>\r\n', '<p>'),
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),
                              ),
                              
                                
                              this.model.editLogo(this), 							  
                              this.model.editTitle(this), 							  
                              this.model.editDescription(this), 							  
                              this.model.editDeliverable(this), 							  
                              this.model.editTrialVersion(this), 							  
                              this.model.editPrice(this), 							  
                              this.model.editTags(this), 							  
                              
                            this.model.model.meta.after_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_content,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                              
                            /* Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  8.0, 14.0, 8.0, 2.0),
                                child: Html(data: this.model.model.meta.after_after),
                                ), */
                        	Container(
                              height: 30,
                            ),
							
							   isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,edit_product, postEditProductResult, this, sendPath, widget.id!, widget.title!),
          
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,edit_product, postEditProductResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////


class BumpUpMyProducts extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_products/bump_up/:id/:title';
  BumpUpMyProducts({Key? key, this.id, this.title}) : super(key: key);

  @override
  BumpUpMyProductsState createState() => BumpUpMyProductsState();
}

class BumpUpMyProductsState extends State<BumpUpMyProducts> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_products/bump_up/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_products/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_products/bump_up/%s/%s';

  MyProductsController? bump_up;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelBumpUp;
  var model;
  var formData;
  var postBumpUpResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Bump Up';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'BumpUp';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }


  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
 fetchData(MyProductsController? bump_up , BuildContext context)async {
    if (this.model == null) {
       final future = bump_up!.getBumpUpMyProducts('');
       future.then((value) {
        setState(() {
          isLoading = false;
        });
          try{
		  this.model = value;
		    try{
            errmsg = value;
			  }catch(e){

			  }
		  }catch(e){
		   errmsg = value;
		   isError = true;
		  }
		  
		 
		  if(this.model.model.meta == null){
            isError = true;
			  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          }
		  isError = false;
        }).catchError((Error){
		   isError = true;
		 
		    if(errmsg.contains('content-page')){
			
			  setState(() {
               isLoading = false;
            });
			 var document = parse(errmsg);
				var data = document.getElementsByClassName('content-page');
				if((data != null) && (data.length > 0)){
				  var msg = data[0].children[0];
				  msg.insertBefore(data[0].children[1], null);
				  errmsg = msg.innerHtml;
				}
			/*
         _onWidgetDidBuild(() {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text('Unauthorized  :'+ sprintf('Bump Up', [widget.id!,widget.title!])),
               backgroundColor: Colors.red,
             ),
           );
         });
		 */
       }else{
		     _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
		  // setState(() {
              // isLoading = false;
           // });
		  }
		});
      }
    }
   Future<bool>  _onWillPop() async{
		return await showDialog(
			context: context,
			builder: (context) =>
					AlertDialog(
						title: Text('Kembali',
							style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
						content: Text('Apakah Anda ingin meninggalkan halaman ini?'),
						actions: <Widget>[
							FlatButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('BumpUp')){
										bump_up!.deleteAllBumpUpMyProducts(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('BumpUp')){
										bump_up!.deleteAllBumpUpMyProducts(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('BumpUp')){
										bump_up!.deleteAllBumpUpMyProducts(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('BumpUp')){
										bump_up!.deleteAllBumpUpMyProducts(this.model.model.model.user_id);
										}else{
										bump_up!.deleteAllBumpUpMyProducts('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							FlatButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 FlatButton(
								onPressed: () {
								if(this.model != null){
								
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('BumpUp')){
													bump_up!.saveBumpUpMyProducts(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('BumpUp')){
													bump_up!.saveBumpUpMyProducts(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('BumpUp')){
													bump_up!.saveBumpUpMyProducts(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('BumpUp')){
													bump_up!.saveBumpUpMyProducts(this.model,this.model.model.model.user_id);
													}else{
													bump_up!.saveBumpUpMyProducts(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('BumpUp')){
													bump_up!.saveBumpUpMyProducts(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('BumpUp')){
													bump_up!.saveBumpUpMyProducts(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('BumpUp')){
													bump_up!.saveBumpUpMyProducts(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('BumpUp')){
													bump_up!.saveBumpUpMyProducts(this.model,this.model.model.model.user_id);
													}else{
													bump_up!.saveBumpUpMyProducts(this.model,'');
													}
											  }
											  
								  }

									  Navigator.pop(context); Navigator.pop(context);

								},
								child: Text('Ya & Simpan Data'),
							  ),
						],
					),
		) ??
				false;
	}
  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    bool _dialVisible = true;
    bump_up =    MyProductsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(bump_up, context);
      return 
     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,
                appBar: 
                  AppBar(
                            automaticallyImplyLeading: false,
                            title:
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: _onWillPop,
                                  child:
                                  Padding(padding: EdgeInsets.only(right: 6.0),
                                    child: Icon(Icons.arrow_back,
                                                  color: Colors.white),

                                  ),
                                ),
                                Text('Bump Up', style: TextStyle(color: Colors.white),),
                              ]
                            ),

                        ),


                      body:isLoading? 
                        // Center(
                        //   child: CircularProgressIndicator(),
                        // )
                          Center( 
                      child:CircularProgressIndicator(
                      valueColor:    AlwaysStoppedAnimation<Color>(
                        Colors.green),
                      )):isError?
				 				  
                  Form(
                          key: formKey,
                          child: SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),                
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[

                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 14.0, 8.0, 2.0),
                                      child:  Html(data: errmsg ),
                                    ),
                                  
                        ]
                              
                              )

                          )
                      )
                        :Form(
                          key: formKey,
                          
                    child:    SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[
                        
                            /* Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.include_before),
                              ),*/
                            /*
                                              1) before_title
                              2) title
                              3) after_title
                              4) warning / error
                              5) before_content
                              6) content
                              7) after_content						
                            */  
                              
                            
                            this.model.model.meta.before_title == null ? Container(width: 0.0, height: 0.0) : Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.before_title,									
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                     if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),

                              ),
                            
                            Padding(padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.title,
                                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                            ),								

                            this.model.model.meta.after_title == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_title,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
									  if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                     
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.warning == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.warning.message, 
                                    //backgroundColor: CurrentTheme.WarningColor,
                                  style: {
                                    "html": Style(
                                      backgroundColor: CurrentTheme.WarningColor,
                                      ),
                                    },
                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.before_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.before_content.replaceAll('<p>\r\n', '<p>'),
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),
                              ),
                              
                                
                              this.model.viewLogo(context),
                              this.model.viewTitle(context),
                              this.model.viewDescription(context),
                              this.model.viewDeliverable(context),
                              this.model.viewTrialVersion(context),
                              this.model.viewPrice(context),
                              this.model.viewTags(context),
                              
                            this.model.model.meta.after_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_content,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                              
                            /* Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  8.0, 14.0, 8.0, 2.0),
                                child: Html(data: this.model.model.meta.after_after),
                                ), */
                        	Container(
                              height: 30,
                            ),
							
							   isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,bump_up, postBumpUpResult, this, sendPath, widget.id!, widget.title!),
          
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,bump_up, postBumpUpResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////

class ScreenshotsMyProducts extends StatefulWidget {
  final String? id ;
  final String? title;
  final ChatBloc? cb;
  static const String PATH = '/user/my_products/screenshots/:id/:title';
  ScreenshotsMyProducts({Key? key, this.id, this.title, this.cb}) : super(key: key);
  @override
  ScreenshotsMyProductsState1 createState() => ScreenshotsMyProductsState1();
}

class  ScreenshotsMyProductsState1 extends State<ScreenshotsMyProducts> with TickerProviderStateMixin<ScreenshotsMyProducts>, RestorationMixin{
  String? title = 'Screenshots'; 
  bool _dialVisible = true;
  bool search = true;
  String? getPath = Env.value!.baseUrl! + '/user/my_products/screenshots/';
  
   ScrollController?  scrollController;
  
  MyProductsController? screenshots;
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String? searchText = '';
  bool account = true;
  int titleindex = 0;
  String? tempheader = '';
   double initscroll = 0.0;
  AccountController? accountController;
	final ValueNotifier<int> firstSelectIndex = ValueNotifier<int>(0);
	   List<Map> listAccount = [];
	   
   
	
	int firstIndex = 0;
	var _keys = {};
   List<int> _selectedItemsIndex = [];
   List<String> _selectedItems = [];
   bool isMultiSelected = false;

  ScreenshotsMyProductsState1() {
   // scrollController!.addListener(_onScroll);
  }

  final RestorableDouble cs = RestorableDouble(0);

  @override
  String? get restorationId => 'Screenshots';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(cs, 'Screenshots');
  }

  

  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
     getPath = Env.value!.baseUrl! + '/user/my_products/screenshots/'+widget.id! +'/'+ widget.title! +'*?page=%d';
      if(widget.title!.contains('&filter')|| widget.title!.contains('search')|| widget.title!.contains('&order'))
	  {
	      search = true;
	  }
      if(widget.title!.contains('&filter')){
      var ids = widget.title!;
      int ind = ids.indexOf('&');
          ids = ids.substring(ind, ids.length);
      getPath = Env.value!.baseUrl! + '/user/my_products/screenshots/'+widget.id! +'/'+ widget.title!+'?page=%d' + ids ;
    }
	if(widget.title!.contains('search')){
      var ids = widget.title!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/user/my_products/screenshots/'+widget.id! +'/'+ widget.title!+'?page=%d&' + ids ;
    }
	 if(widget.title!.contains('&order')){
     var ids = widget.title!;
     int ind = ids.indexOf('&');
     ids = ids.substring(ind, ids.length);
     int ind1 = widget.title!.indexOf('%28page');
     String? ttl = widget.title!.substring(0, ind1);
     getPath = Env.value!.baseUrl! + '/user/my_products/screenshots/'+widget.id! +'/'+ ttl+'?page=%d' + ids ;
	}
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
	
	
    screenshots =  MyProductsController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
	screenshots!.listMyProductsScreenshots();
    screenshots!.listingScreenshots!.add(ScreenshotsMyProductsList());
	accountController =    AccountController(AppProvider.getApplication(context),
	AppAction.view   );
	
	
	    final future = accountController!.getAccount();
		future.then((val){
		 //List<Map> listAccount = [];
		  listAccount.addAll(val);
		  if(listAccount.length == 0){
			account = false;
		  }else{
			  account = true;
			
		  }
		});
	
	
	///////////
	
    return Scaffold(
	 backgroundColor: darkMode? Colors.black : Colors.white,
        appBar: AppBar(
		  iconTheme: IconThemeData(
					color: Colors.white, //change your color here
				  ),
	  leading:    IconButton(
              icon:    Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: ()async{
                final prefs = await SharedPreferences.getInstance();
                prefs.setDouble("position", 0.0);

                  Navigator.pop(context);

                // Navigator.pop(context);

              }
          ),
          actions: <Widget>[
            IconButton(

                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () async {
                  if (!selected) {
                    setState(() {
                      selected = true;
                    });
                  } else {
                    setState(() {
                      selected = false;
                    });
                  }
                }
            )
          ],
          title: selected? buildSearchBar(title!) : Text(title!, style: TextStyle(color: Colors.white))  ,
        ),
        body: buildListingBar()
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
                fontSize: 14.0,
                height: 0.2,
                color: Colors.black
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
  

    		var listViewKey = RectGetter.createGlobalKey();

   // @override
   Widget buildListingBar2(){  
  
    return BlocBuilder<ScreenshotsMyProductsListing, ScreenshotsMyProductsState>(
      bloc: screenshots!.listingScreenshots,

      builder: (BuildContext context, state) {
        if (state is ScreenshotsMyProductsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
		 /*
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
		  */
				 return    Center( 
					   child:CircularProgressIndicator(
					   valueColor:    AlwaysStoppedAnimation<Color>(
						Colors.green),
					  ));
        }
        if (state is ScreenshotsMyProductsListingError) {
		  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is ScreenshotsMyProductsListingLoaded) {
          if (state.screenshots!.items.items.isEmpty) {
		  if (state.screenshots!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
					floatingActionButton: state.screenshots!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }
			if (state.screenshots!.tools.buttons.length == 0){ 
			var sc = [];
              sc.addAll(state.screenshots!.items.items.reversed);
			   
				  return
		  Scaffold(
                    body:
					///////////////////
					///////////////////
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.screenshots!.items.items.length ?
								       state.screenshots!.tools.paging.total_pages == state.screenshots!.tools.paging.current_page?
                                        Container(height: 0.0, width: 0.0,):
									    UserScreenshotsMyProductsBottomLoader()
									  : state.screenshots!.viewItem (state.screenshots!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.screenshots!.items.items.length
									: state.screenshots!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
					
							
                   
			 );				
			}
			var sc = [];
			 sc.addAll(state.screenshots!.items.items.reversed);
			
          return
		  Scaffold(
                    body:
					///////////////////
					///////////////////
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.screenshots!.items.items.length ?
								       state.screenshots!.tools.paging.total_pages == state.screenshots!.tools.paging.current_page?
                                        Container(height: 0.0, width: 0.0,):
									    UserScreenshotsMyProductsBottomLoader()
									  : state.screenshots!.viewItem (state.screenshots!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.screenshots!.items.items.length
									: state.screenshots!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
					floatingActionButton: state.screenshots!.Buttons(context, _dialVisible, widget.id!)
							
                   
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
  
  
  
  
  
   Widget buildListingBar(){  
  
    return BlocBuilder<ScreenshotsMyProductsListing, ScreenshotsMyProductsState>(
      bloc: screenshots!.listingScreenshots,

      builder: (BuildContext context, state) {
        if (state is ScreenshotsMyProductsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is ScreenshotsMyProductsListingError) {
		  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          return Center(
            child: Text('failed to ' + title!),
          );
        }
        if (state is ScreenshotsMyProductsListingLoaded) {
          if (state.screenshots!.items.items.isEmpty) {
		  if (state.screenshots!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title!),
                  ),
				   
					
					floatingActionButton: state.screenshots!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }
			if (state.screenshots!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.screenshots!.items.items.length?  
									  state.screenshots!.tools.paging.total_pages == state.screenshots!.tools.paging.current_page?
                                      Container(height: 0.0, width: 0.0,):
									  
									  UserScreenshotsMyProductsBottomLoader()
									  : state.screenshots!.viewItem (state.screenshots!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.screenshots!.items.items.length
									: state.screenshots!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							)
				);					
			}
			var sc = [];
              sc.addAll(state.screenshots!.items.items.reversed);
          return
		  Scaffold(
                    body:
					///////////////////
					///////////////////
							RefreshIndicator(
							  child:    ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.screenshots!.items.items.length ?
								       state.screenshots!.tools.paging.total_pages == state.screenshots!.tools.paging.current_page?
                                        Container(height: 0.0, width: 0.0,):
									    UserScreenshotsMyProductsBottomLoader()
									  : state.screenshots!.viewItem (state.screenshots!.items.items[index] , searchText! , account, widget.id!);
								},
								itemCount: state.hasReachedMax!
									? state.screenshots!.items.items.length
									: state.screenshots!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
					floatingActionButton: state.screenshots!.Buttons(context, _dialVisible, widget.id!)
							
                   
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
    screenshots!.listingScreenshots!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer =    Completer<Null>();
    screenshots!.listingScreenshots!.add(ScreenshotsMyProductsListingRefresh());

    Timer timer =    Timer(   Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll()async{
    final maxScroll = scrollController!.position.maxScrollExtent;
    double currentScroll = scrollController!.position.pixels;
	    final prefs = await SharedPreferences.getInstance();
         prefs.setDouble("position", scrollController!.position.pixels);
	
    cs.value = currentScroll;
    if (maxScroll - currentScroll <= scrollThreshold) {
      screenshots!.listingScreenshots!.add(ScreenshotsMyProductsList());
    }

  }

}

class  UserScreenshotsMyProductsBottomLoader extends StatelessWidget {
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


//////////////////


class UnlistMyProducts extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_products/unlist/:id/:title';
  UnlistMyProducts({Key? key, this.id, this.title}) : super(key: key);

  @override
  UnlistMyProductsState createState() => UnlistMyProductsState();
}

class UnlistMyProductsState extends State<UnlistMyProducts> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_products/unlist/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_products/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_products/unlist/%s/%s';

  MyProductsController? unlist;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelUnlist;
  var model;
  var formData;
  var postUnlistResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Unlist';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'Unlist';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }


  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
 fetchData(MyProductsController? unlist , BuildContext context)async {
    if (this.model == null) {
       final future = unlist!.getUnlistMyProducts('');
       future.then((value) {
        setState(() {
          isLoading = false;
        });
          try{
		  this.model = value;
		    try{
            errmsg = value;
			  }catch(e){

			  }
		  }catch(e){
		   errmsg = value;
		   isError = true;
		  }
		  
		 
		  if(this.model.model.meta == null){
            isError = true;
			  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          }
		  isError = false;
        }).catchError((Error){
		   isError = true;
		 
		    if(errmsg.contains('content-page')){
			
			  setState(() {
               isLoading = false;
            });
			 var document = parse(errmsg);
				var data = document.getElementsByClassName('content-page');
				if((data != null) && (data.length > 0)){
				  var msg = data[0].children[0];
				  msg.insertBefore(data[0].children[1], null);
				  errmsg = msg.innerHtml;
				}
			/*
         _onWidgetDidBuild(() {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text('Unauthorized  :'+ sprintf('Unlist', [widget.id!,widget.title!])),
               backgroundColor: Colors.red,
             ),
           );
         });
		 */
       }else{
		     _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
		  // setState(() {
              // isLoading = false;
           // });
		  }
		});
      }
    }
   Future<bool>  _onWillPop() async{
		return await showDialog(
			context: context,
			builder: (context) =>
					AlertDialog(
						title: Text('Kembali',
							style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
						content: Text('Apakah Anda ingin meninggalkan halaman ini?'),
						actions: <Widget>[
							FlatButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('Unlist')){
										unlist!.deleteAllUnlistMyProducts(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('Unlist')){
										unlist!.deleteAllUnlistMyProducts(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('Unlist')){
										unlist!.deleteAllUnlistMyProducts(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('Unlist')){
										unlist!.deleteAllUnlistMyProducts(this.model.model.model.user_id);
										}else{
										unlist!.deleteAllUnlistMyProducts('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							FlatButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 FlatButton(
								onPressed: () {
								if(this.model != null){
								
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('Unlist')){
													unlist!.saveUnlistMyProducts(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('Unlist')){
													unlist!.saveUnlistMyProducts(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('Unlist')){
													unlist!.saveUnlistMyProducts(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('Unlist')){
													unlist!.saveUnlistMyProducts(this.model,this.model.model.model.user_id);
													}else{
													unlist!.saveUnlistMyProducts(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('Unlist')){
													unlist!.saveUnlistMyProducts(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('Unlist')){
													unlist!.saveUnlistMyProducts(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('Unlist')){
													unlist!.saveUnlistMyProducts(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('Unlist')){
													unlist!.saveUnlistMyProducts(this.model,this.model.model.model.user_id);
													}else{
													unlist!.saveUnlistMyProducts(this.model,'');
													}
											  }
											  
								  }

									  Navigator.pop(context); Navigator.pop(context);

								},
								child: Text('Ya & Simpan Data'),
							  ),
						],
					),
		) ??
				false;
	}
  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    bool _dialVisible = true;
    unlist =    MyProductsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(unlist, context);
      return 
     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,
                appBar: 
                  AppBar(
                            automaticallyImplyLeading: false,
                            title:
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: _onWillPop,
                                  child:
                                  Padding(padding: EdgeInsets.only(right: 6.0),
                                    child: Icon(Icons.arrow_back,
                                                  color: Colors.white),

                                  ),
                                ),
                                Text('Unlist', style: TextStyle(color: Colors.white),),
                              ]
                            ),

                        ),


                      body:isLoading? 
                        // Center(
                        //   child: CircularProgressIndicator(),
                        // )
                          Center( 
                      child:CircularProgressIndicator(
                      valueColor:    AlwaysStoppedAnimation<Color>(
                        Colors.green),
                      )):isError?
				 				  
                  Form(
                          key: formKey,
                          child: SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),                
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[

                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 14.0, 8.0, 2.0),
                                      child:  Html(data: errmsg ),
                                    ),
                                  
                        ]
                              
                              )

                          )
                      )
                        :Form(
                          key: formKey,
                          
                    child:    SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[
                        
                            /* Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.include_before),
                              ),*/
                            /*
                                              1) before_title
                              2) title
                              3) after_title
                              4) warning / error
                              5) before_content
                              6) content
                              7) after_content						
                            */  
                              
                            
                            this.model.model.meta.before_title == null ? Container(width: 0.0, height: 0.0) : Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.before_title,									
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                     if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),

                              ),
                            
                            Padding(padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.title,
                                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                            ),								

                            this.model.model.meta.after_title == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_title,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
									  if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                     
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.warning == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.warning.message, 
                                    //backgroundColor: CurrentTheme.WarningColor,
                                  style: {
                                    "html": Style(
                                      backgroundColor: CurrentTheme.WarningColor,
                                      ),
                                    },
                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.before_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.before_content.replaceAll('<p>\r\n', '<p>'),
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),
                              ),
                              
                                
                              this.model.viewLogo(context),
                              this.model.viewTitle(context),
                              this.model.viewDescription(context),
                              this.model.viewDeliverable(context),
                              this.model.viewTrialVersion(context),
                              this.model.viewPrice(context),
                              this.model.viewTags(context),
                              
                            this.model.model.meta.after_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_content,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                              
                            /* Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  8.0, 14.0, 8.0, 2.0),
                                child: Html(data: this.model.model.meta.after_after),
                                ), */
                        	Container(
                              height: 30,
                            ),
							
							   isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,unlist, postUnlistResult, this, sendPath, widget.id!, widget.title!),
          
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,unlist, postUnlistResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////


class ReactivateProductMyProducts extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_products/reactivate_product/:id/:title';
  ReactivateProductMyProducts({Key? key, this.id, this.title}) : super(key: key);

  @override
  ReactivateProductMyProductsState createState() => ReactivateProductMyProductsState();
}

class ReactivateProductMyProductsState extends State<ReactivateProductMyProducts> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_products/reactivate_product/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_products/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_products/reactivate_product/%s/%s';

  MyProductsController? reactivate_product;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelReactivateProduct;
  var model;
  var formData;
  var postReactivateProductResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Reactivate Product';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'ReactivateProduct';

  @override
  void restoreState(RestorationBucket?  oldBucket, bool initialRestore) {
    registerForRestoration(_counter, 'counter');
  }


  @override
  initState(){
    super.initState();
    controller = ScrollController();
    validation.add(true);
  }
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
    // next = false;
  }
 fetchData(MyProductsController? reactivate_product , BuildContext context)async {
    if (this.model == null) {
       final future = reactivate_product!.getReactivateProductMyProducts('');
       future.then((value) {
        setState(() {
          isLoading = false;
        });
          try{
		  this.model = value;
		    try{
            errmsg = value;
			  }catch(e){

			  }
		  }catch(e){
		   errmsg = value;
		   isError = true;
		  }
		  
		 
		  if(this.model.model.meta == null){
            isError = true;
			  _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
          }
		  isError = false;
        }).catchError((Error){
		   isError = true;
		 
		    if(errmsg.contains('content-page')){
			
			  setState(() {
               isLoading = false;
            });
			 var document = parse(errmsg);
				var data = document.getElementsByClassName('content-page');
				if((data != null) && (data.length > 0)){
				  var msg = data[0].children[0];
				  msg.insertBefore(data[0].children[1], null);
				  errmsg = msg.innerHtml;
				}
			/*
         _onWidgetDidBuild(() {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               content: Text('Unauthorized  :'+ sprintf('Reactivate Product', [widget.id!,widget.title!])),
               backgroundColor: Colors.red,
             ),
           );
         });
		 */
       }else{
		     _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
		  // setState(() {
              // isLoading = false;
           // });
		  }
		});
      }
    }
   Future<bool>  _onWillPop() async{
		return await showDialog(
			context: context,
			builder: (context) =>
					AlertDialog(
						title: Text('Kembali',
							style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
						content: Text('Apakah Anda ingin meninggalkan halaman ini?'),
						actions: <Widget>[
							FlatButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('ReactivateProduct')){
										reactivate_product!.deleteAllReactivateProductMyProducts(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('ReactivateProduct')){
										reactivate_product!.deleteAllReactivateProductMyProducts(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('ReactivateProduct')){
										reactivate_product!.deleteAllReactivateProductMyProducts(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('ReactivateProduct')){
										reactivate_product!.deleteAllReactivateProductMyProducts(this.model.model.model.user_id);
										}else{
										reactivate_product!.deleteAllReactivateProductMyProducts('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							FlatButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 FlatButton(
								onPressed: () {
								if(this.model != null){
								
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('ReactivateProduct')){
													reactivate_product!.saveReactivateProductMyProducts(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('ReactivateProduct')){
													reactivate_product!.saveReactivateProductMyProducts(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('ReactivateProduct')){
													reactivate_product!.saveReactivateProductMyProducts(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('ReactivateProduct')){
													reactivate_product!.saveReactivateProductMyProducts(this.model,this.model.model.model.user_id);
													}else{
													reactivate_product!.saveReactivateProductMyProducts(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('ReactivateProduct')){
													reactivate_product!.saveReactivateProductMyProducts(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('ReactivateProduct')){
													reactivate_product!.saveReactivateProductMyProducts(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('ReactivateProduct')){
													reactivate_product!.saveReactivateProductMyProducts(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('ReactivateProduct')){
													reactivate_product!.saveReactivateProductMyProducts(this.model,this.model.model.model.user_id);
													}else{
													reactivate_product!.saveReactivateProductMyProducts(this.model,'');
													}
											  }
											  
								  }

									  Navigator.pop(context); Navigator.pop(context);

								},
								child: Text('Ya & Simpan Data'),
							  ),
						],
					),
		) ??
				false;
	}
  @override
  Widget build(BuildContext context) {
   bool darkMode = false;
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
    bool _dialVisible = true;
    reactivate_product =    MyProductsController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(reactivate_product, context);
      return 
     	WillPopScope(
			 onWillPop: _onWillPop,
			 child: 
      Scaffold(
                backgroundColor: darkMode? Colors.black : Colors.white,
                appBar: 
                  AppBar(
                            automaticallyImplyLeading: false,
                            title:
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: _onWillPop,
                                  child:
                                  Padding(padding: EdgeInsets.only(right: 6.0),
                                    child: Icon(Icons.arrow_back,
                                                  color: Colors.white),

                                  ),
                                ),
                                Text('Reactivate Product', style: TextStyle(color: Colors.white),),
                              ]
                            ),

                        ),


                      body:isLoading? 
                        // Center(
                        //   child: CircularProgressIndicator(),
                        // )
                          Center( 
                      child:CircularProgressIndicator(
                      valueColor:    AlwaysStoppedAnimation<Color>(
                        Colors.green),
                      )):isError?
				 				  
                  Form(
                          key: formKey,
                          child: SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),                
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[

                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 14.0, 8.0, 2.0),
                                      child:  Html(data: errmsg ),
                                    ),
                                  
                        ]
                              
                              )

                          )
                      )
                        :Form(
                          key: formKey,
                          
                    child:    SingleChildScrollView(
                              controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                              reverse: false,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: isLoading!? [] :[
                        
                            /* Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.include_before),
                              ),*/
                            /*
                                              1) before_title
                              2) title
                              3) after_title
                              4) warning / error
                              5) before_content
                              6) content
                              7) after_content						
                            */  
                              
                            
                            this.model.model.meta.before_title == null ? Container(width: 0.0, height: 0.0) : Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.before_title,									
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                     if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),

                              ),
                            
                            Padding(padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child:  Html(data: this.model.model.meta.title,
                                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                            ),								

                            this.model.model.meta.after_title == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_title,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
									  if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                     
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.warning == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.warning.message, 
                                    //backgroundColor: CurrentTheme.WarningColor,
                                  style: {
                                    "html": Style(
                                      backgroundColor: CurrentTheme.WarningColor,
                                      ),
                                    },
                                  onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                      if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                                
                            this.model.model.meta.before_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.before_content.replaceAll('<p>\r\n', '<p>'),
                                onLinkTap: (url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									  AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }),
                              ),
                              
                                
                              this.model.viewLogo(context),
                              this.model.viewTitle(context),
                              this.model.viewDescription(context),
                              this.model.viewDeliverable(context),
                              this.model.viewTrialVersion(context),
                              this.model.viewPrice(context),
                              this.model.viewTags(context),
                              
                            this.model.model.meta.after_content == null ? Container(width: 0.0, height: 0.0) :
                              Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0, 14.0, 8.0, 2.0),
                              child: Html(data: this.model.model.meta.after_content,
                                                  onLinkTap:(url, _, __, ___) async{
                                  if(url!.contains('projects.co.id')){
                                    if(url!.contains(   RegExp(r'[0-9]'))){
                                      if(url!.contains('show_conversation')){
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/' ));
                                      }else{
                                      AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url )).catchError((onError){

                                        AppProvider.getRouter(context)!.pop(context);
                                      });
                                      }

                                    }else{
                                       if(url!.contains('/listing')){
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url+ '/12'));
									  
									  }else{
									   AppProvider.getRouter(context)!.navigateTo(
                                        context,
                                        urlToRoute(url + '/listing/'));
									  }
                                    }
                                  }else
                                  {
                                    if (await canLaunch(url)) {
                                    await launch(url);
                                    } else {
                                    throw 'Could not launch $url';
                                    }

                                  }
                                  }
                              ),
                              ),
                              
                            /* Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  8.0, 14.0, 8.0, 2.0),
                                child: Html(data: this.model.model.meta.after_after),
                                ), */
                        	Container(
                              height: 30,
                            ),
							
							   isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,reactivate_product, postReactivateProductResult, this, sendPath, widget.id!, widget.title!),
          
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,reactivate_product, postReactivateProductResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////

