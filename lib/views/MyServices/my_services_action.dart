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

class SalesMyServices extends StatefulWidget {
  final String? id ;
  final String? title;
  final ChatBloc? cb;
  static const String PATH = '/user/my_services/sales/:id/:title';
  SalesMyServices({Key? key, this.id, this.title, this.cb}) : super(key: key);
  @override
  SalesMyServicesState1 createState() => SalesMyServicesState1();
}

class  SalesMyServicesState1 extends State<SalesMyServices> with TickerProviderStateMixin<SalesMyServices>, RestorationMixin{
  String? title = 'Sales'; 
  bool _dialVisible = true;
  bool search = true;
  String? getPath = Env.value!.baseUrl! + '/user/my_services/sales/';
  
   ScrollController?  scrollController;
  
  MyServicesController? sales;
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

  SalesMyServicesState1() {
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
     getPath = Env.value!.baseUrl! + '/user/my_services/sales/'+widget.id! +'/'+ widget.title! +'*?page=%d';
      if(widget.title!.contains('&filter')|| widget.title!.contains('search')|| widget.title!.contains('&order'))
	  {
	      search = true;
	  }
      if(widget.title!.contains('&filter')){
      var ids = widget.title!;
      int ind = ids.indexOf('&');
          ids = ids.substring(ind, ids.length);
      getPath = Env.value!.baseUrl! + '/user/my_services/sales/'+widget.id! +'/'+ widget.title!+'?page=%d' + ids ;
    }
	if(widget.title!.contains('search')){
      var ids = widget.title!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/user/my_services/sales/'+widget.id! +'/'+ widget.title!+'?page=%d&' + ids ;
    }
	 if(widget.title!.contains('&order')){
     var ids = widget.title!;
     int ind = ids.indexOf('&');
     ids = ids.substring(ind, ids.length);
     int ind1 = widget.title!.indexOf('%28page');
     String? ttl = widget.title!.substring(0, ind1);
     getPath = Env.value!.baseUrl! + '/user/my_services/sales/'+widget.id! +'/'+ ttl+'?page=%d' + ids ;
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
	
	
    sales =  MyServicesController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
	sales!.listMyServicesSales();
    sales!.listingSales!.add(SalesMyServicesList());
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
  
    return BlocBuilder<SalesMyServicesListing, SalesMyServicesState>(
      bloc: sales!.listingSales,

      builder: (BuildContext context, state) {
        if (state is SalesMyServicesListingUninitialized) {
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
        if (state is SalesMyServicesListingError) {
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
        if (state is SalesMyServicesListingLoaded) {
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
									    UserSalesMyServicesBottomLoader()
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
									    UserSalesMyServicesBottomLoader()
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
  
    return BlocBuilder<SalesMyServicesListing, SalesMyServicesState>(
      bloc: sales!.listingSales,

      builder: (BuildContext context, state) {
        if (state is SalesMyServicesListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is SalesMyServicesListingError) {
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
        if (state is SalesMyServicesListingLoaded) {
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
									  
									  UserSalesMyServicesBottomLoader()
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
									    UserSalesMyServicesBottomLoader()
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
    sales!.listingSales!.add(SalesMyServicesListingRefresh());

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
      sales!.listingSales!.add(SalesMyServicesList());
    }

  }

}

class  UserSalesMyServicesBottomLoader extends StatelessWidget {
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

class CommentsMyServices extends StatefulWidget {
  final String? id ;
  final String? title;
  final ChatBloc? cb;
  static const String PATH = '/user/my_services/comments/:id/:title';
  CommentsMyServices({Key? key, this.id, this.title, this.cb}) : super(key: key);
  @override
  CommentsMyServicesState1 createState() => CommentsMyServicesState1();
}

class  CommentsMyServicesState1 extends State<CommentsMyServices> with TickerProviderStateMixin<CommentsMyServices>, RestorationMixin{
  String? title = 'Comments'; 
  bool _dialVisible = true;
  bool search = true;
  String? getPath = Env.value!.baseUrl! + '/user/my_services/comments/';
  
   ScrollController?  scrollController;
  
  MyServicesController? comments;
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

  CommentsMyServicesState1() {
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
     getPath = Env.value!.baseUrl! + '/user/my_services/comments/'+widget.id! +'/'+ widget.title! +'*?page=%d';
      if(widget.title!.contains('&filter')|| widget.title!.contains('search')|| widget.title!.contains('&order'))
	  {
	      search = true;
	  }
      if(widget.title!.contains('&filter')){
      var ids = widget.title!;
      int ind = ids.indexOf('&');
          ids = ids.substring(ind, ids.length);
      getPath = Env.value!.baseUrl! + '/user/my_services/comments/'+widget.id! +'/'+ widget.title!+'?page=%d' + ids ;
    }
	if(widget.title!.contains('search')){
      var ids = widget.title!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/user/my_services/comments/'+widget.id! +'/'+ widget.title!+'?page=%d&' + ids ;
    }
	 if(widget.title!.contains('&order')){
     var ids = widget.title!;
     int ind = ids.indexOf('&');
     ids = ids.substring(ind, ids.length);
     int ind1 = widget.title!.indexOf('%28page');
     String? ttl = widget.title!.substring(0, ind1);
     getPath = Env.value!.baseUrl! + '/user/my_services/comments/'+widget.id! +'/'+ ttl+'?page=%d' + ids ;
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
	
	
    comments =  MyServicesController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
	comments!.listMyServicesComments();
    comments!.listingComments!.add(CommentsMyServicesList());
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
  
    return BlocBuilder<CommentsMyServicesListing, CommentsMyServicesState>(
      bloc: comments!.listingComments,

      builder: (BuildContext context, state) {
        if (state is CommentsMyServicesListingUninitialized) {
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
        if (state is CommentsMyServicesListingError) {
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
        if (state is CommentsMyServicesListingLoaded) {
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
									    UserCommentsMyServicesBottomLoader()
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
									    UserCommentsMyServicesBottomLoader()
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
  
    return BlocBuilder<CommentsMyServicesListing, CommentsMyServicesState>(
      bloc: comments!.listingComments,

      builder: (BuildContext context, state) {
        if (state is CommentsMyServicesListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is CommentsMyServicesListingError) {
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
        if (state is CommentsMyServicesListingLoaded) {
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
									  
									  UserCommentsMyServicesBottomLoader()
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
									    UserCommentsMyServicesBottomLoader()
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
    comments!.listingComments!.add(CommentsMyServicesListingRefresh());

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
      comments!.listingComments!.add(CommentsMyServicesList());
    }

  }

}

class  UserCommentsMyServicesBottomLoader extends StatelessWidget {
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


class AddNewServiceMyServices extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_services/add_new_service/:id/:title';
  AddNewServiceMyServices({Key? key, this.id, this.title}) : super(key: key);

  @override
  AddNewServiceMyServicesState createState() => AddNewServiceMyServicesState();
}

class AddNewServiceMyServicesState extends State<AddNewServiceMyServices> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_services/add_new_service/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_services/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_services/add_new_service/%s/%s';

  MyServicesController? add_new_service;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelAddNewService;
  var model;
  var formData;
  var postAddNewServiceResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Add New Service';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'AddNewService';

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
 fetchData(MyServicesController? add_new_service , BuildContext context)async {
    if (this.model == null) {
       final future = add_new_service!.getAddNewServiceMyServices('');
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
               content: Text('Unauthorized  :'+ sprintf('Add New Service', [widget.id!,widget.title!])),
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
							TextButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('AddNewService')){
										add_new_service!.deleteAllAddNewServiceMyServices(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('AddNewService')){
										add_new_service!.deleteAllAddNewServiceMyServices(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('AddNewService')){
										add_new_service!.deleteAllAddNewServiceMyServices(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('AddNewService')){
										add_new_service!.deleteAllAddNewServiceMyServices(this.model.model.model.user_id);
										}else{
										add_new_service!.deleteAllAddNewServiceMyServices('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							TextButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 TextButton(
								onPressed: () {
								if(this.model != null){
								
								  this.model.model.model.logo = null;
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('AddNewService')){
													add_new_service!.saveAddNewServiceMyServices(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('AddNewService')){
													add_new_service!.saveAddNewServiceMyServices(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('AddNewService')){
													add_new_service!.saveAddNewServiceMyServices(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('AddNewService')){
													add_new_service!.saveAddNewServiceMyServices(this.model,this.model.model.model.user_id);
													}else{
													add_new_service!.saveAddNewServiceMyServices(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('AddNewService')){
													add_new_service!.saveAddNewServiceMyServices(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('AddNewService')){
													add_new_service!.saveAddNewServiceMyServices(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('AddNewService')){
													add_new_service!.saveAddNewServiceMyServices(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('AddNewService')){
													add_new_service!.saveAddNewServiceMyServices(this.model,this.model.model.model.user_id);
													}else{
													add_new_service!.saveAddNewServiceMyServices(this.model,'');
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
    add_new_service =    MyServicesController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(add_new_service, context);
	
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
                                Text('Add New Service', style: TextStyle(color: Colors.white),),
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
                              this.model.editFinishDays(this), 							  
                              this.model.editPrice(this), 							  
                                this.model.editOptions(this),
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
							
							   isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,add_new_service, postAddNewServiceResult, this, sendPath, widget.id!, widget.title!),
          
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,add_new_service, postAddNewServiceResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////


class PublishServiceMyServices extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_services/publish_service/:id/:title';
  PublishServiceMyServices({Key? key, this.id, this.title}) : super(key: key);

  @override
  PublishServiceMyServicesState createState() => PublishServiceMyServicesState();
}

class PublishServiceMyServicesState extends State<PublishServiceMyServices> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_services/publish_service/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_services/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_services/publish_service/%s/%s';

  MyServicesController? publish_service;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelPublishService;
  var model;
  var formData;
  var postPublishServiceResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Publish Service';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'PublishService';

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
 fetchData(MyServicesController? publish_service , BuildContext context)async {
    if (this.model == null) {
       final future = publish_service!.getPublishServiceMyServices('');
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
               content: Text('Unauthorized  :'+ sprintf('Publish Service', [widget.id!,widget.title!])),
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
							TextButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('PublishService')){
										publish_service!.deleteAllPublishServiceMyServices(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('PublishService')){
										publish_service!.deleteAllPublishServiceMyServices(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('PublishService')){
										publish_service!.deleteAllPublishServiceMyServices(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('PublishService')){
										publish_service!.deleteAllPublishServiceMyServices(this.model.model.model.user_id);
										}else{
										publish_service!.deleteAllPublishServiceMyServices('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							TextButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 TextButton(
								onPressed: () {
								if(this.model != null){
								
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('PublishService')){
													publish_service!.savePublishServiceMyServices(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('PublishService')){
													publish_service!.savePublishServiceMyServices(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('PublishService')){
													publish_service!.savePublishServiceMyServices(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('PublishService')){
													publish_service!.savePublishServiceMyServices(this.model,this.model.model.model.user_id);
													}else{
													publish_service!.savePublishServiceMyServices(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('PublishService')){
													publish_service!.savePublishServiceMyServices(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('PublishService')){
													publish_service!.savePublishServiceMyServices(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('PublishService')){
													publish_service!.savePublishServiceMyServices(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('PublishService')){
													publish_service!.savePublishServiceMyServices(this.model,this.model.model.model.user_id);
													}else{
													publish_service!.savePublishServiceMyServices(this.model,'');
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
    publish_service =    MyServicesController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(publish_service, context);
	
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
                                Text('Publish Service', style: TextStyle(color: Colors.white),),
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
                              this.model.viewFinishDays(context),
                              this.model.viewPrice(context),
                              this.model.viewOptions(context),
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
							
							   isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,publish_service, postPublishServiceResult, this, sendPath, widget.id!, widget.title!),
          
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,publish_service, postPublishServiceResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////


class BumpUpMyServices extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_services/bump_up/:id/:title';
  BumpUpMyServices({Key? key, this.id, this.title}) : super(key: key);

  @override
  BumpUpMyServicesState createState() => BumpUpMyServicesState();
}

class BumpUpMyServicesState extends State<BumpUpMyServices> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_services/bump_up/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_services/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_services/bump_up/%s/%s';

  MyServicesController? bump_up;
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
 fetchData(MyServicesController? bump_up , BuildContext context)async {
    if (this.model == null) {
       final future = bump_up!.getBumpUpMyServices('');
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
							TextButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('BumpUp')){
										bump_up!.deleteAllBumpUpMyServices(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('BumpUp')){
										bump_up!.deleteAllBumpUpMyServices(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('BumpUp')){
										bump_up!.deleteAllBumpUpMyServices(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('BumpUp')){
										bump_up!.deleteAllBumpUpMyServices(this.model.model.model.user_id);
										}else{
										bump_up!.deleteAllBumpUpMyServices('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							TextButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 TextButton(
								onPressed: () {
								if(this.model != null){
								
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('BumpUp')){
													bump_up!.saveBumpUpMyServices(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('BumpUp')){
													bump_up!.saveBumpUpMyServices(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('BumpUp')){
													bump_up!.saveBumpUpMyServices(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('BumpUp')){
													bump_up!.saveBumpUpMyServices(this.model,this.model.model.model.user_id);
													}else{
													bump_up!.saveBumpUpMyServices(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('BumpUp')){
													bump_up!.saveBumpUpMyServices(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('BumpUp')){
													bump_up!.saveBumpUpMyServices(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('BumpUp')){
													bump_up!.saveBumpUpMyServices(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('BumpUp')){
													bump_up!.saveBumpUpMyServices(this.model,this.model.model.model.user_id);
													}else{
													bump_up!.saveBumpUpMyServices(this.model,'');
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
    bump_up =    MyServicesController(AppProvider.getApplication(context),
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
                              this.model.viewFinishDays(context),
                              this.model.viewPrice(context),
                              this.model.viewOptions(context),
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


class EditServiceMyServices extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_services/edit_service/:id/:title';
  EditServiceMyServices({Key? key, this.id, this.title}) : super(key: key);

  @override
  EditServiceMyServicesState createState() => EditServiceMyServicesState();
}

class EditServiceMyServicesState extends State<EditServiceMyServices> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_services/edit_service/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_services/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_services/edit_service/%s/%s';

  MyServicesController? edit_service;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelEditService;
  var model;
  var formData;
  var postEditServiceResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Edit Service';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'EditService';

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
 fetchData(MyServicesController? edit_service , BuildContext context)async {
    if (this.model == null) {
       final future = edit_service!.getEditServiceMyServices('');
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
               content: Text('Unauthorized  :'+ sprintf('Edit Service', [widget.id!,widget.title!])),
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
							TextButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('EditService')){
										edit_service!.deleteAllEditServiceMyServices(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('EditService')){
										edit_service!.deleteAllEditServiceMyServices(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('EditService')){
										edit_service!.deleteAllEditServiceMyServices(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('EditService')){
										edit_service!.deleteAllEditServiceMyServices(this.model.model.model.user_id);
										}else{
										edit_service!.deleteAllEditServiceMyServices('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							TextButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 TextButton(
								onPressed: () {
								if(this.model != null){
								
								  this.model.model.model.logo = null;
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('EditService')){
													edit_service!.saveEditServiceMyServices(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('EditService')){
													edit_service!.saveEditServiceMyServices(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('EditService')){
													edit_service!.saveEditServiceMyServices(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('EditService')){
													edit_service!.saveEditServiceMyServices(this.model,this.model.model.model.user_id);
													}else{
													edit_service!.saveEditServiceMyServices(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('EditService')){
													edit_service!.saveEditServiceMyServices(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('EditService')){
													edit_service!.saveEditServiceMyServices(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('EditService')){
													edit_service!.saveEditServiceMyServices(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('EditService')){
													edit_service!.saveEditServiceMyServices(this.model,this.model.model.model.user_id);
													}else{
													edit_service!.saveEditServiceMyServices(this.model,'');
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
    edit_service =    MyServicesController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(edit_service, context);
	
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
                                Text('Edit Service', style: TextStyle(color: Colors.white),),
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
                              this.model.editFinishDays(this), 							  
                              this.model.editPrice(this), 							  
                                this.model.editOptions(this),
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
							
							   isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,edit_service, postEditServiceResult, this, sendPath, widget.id!, widget.title!),
          
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,edit_service, postEditServiceResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////

class ScreenshotsMyServices extends StatefulWidget {
  final String? id ;
  final String? title;
  final ChatBloc? cb;
  static const String PATH = '/user/my_services/screenshots/:id/:title';
  ScreenshotsMyServices({Key? key, this.id, this.title, this.cb}) : super(key: key);
  @override
  ScreenshotsMyServicesState1 createState() => ScreenshotsMyServicesState1();
}

class  ScreenshotsMyServicesState1 extends State<ScreenshotsMyServices> with TickerProviderStateMixin<ScreenshotsMyServices>, RestorationMixin{
  String? title = 'Screenshots'; 
  bool _dialVisible = true;
  bool search = true;
  String? getPath = Env.value!.baseUrl! + '/user/my_services/screenshots/';
  
   ScrollController?  scrollController;
  
  MyServicesController? screenshots;
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

  ScreenshotsMyServicesState1() {
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
     getPath = Env.value!.baseUrl! + '/user/my_services/screenshots/'+widget.id! +'/'+ widget.title! +'*?page=%d';
      if(widget.title!.contains('&filter')|| widget.title!.contains('search')|| widget.title!.contains('&order'))
	  {
	      search = true;
	  }
      if(widget.title!.contains('&filter')){
      var ids = widget.title!;
      int ind = ids.indexOf('&');
          ids = ids.substring(ind, ids.length);
      getPath = Env.value!.baseUrl! + '/user/my_services/screenshots/'+widget.id! +'/'+ widget.title!+'?page=%d' + ids ;
    }
	if(widget.title!.contains('search')){
      var ids = widget.title!;
	      ids = ids.replaceAll('%28','(');
		  ids = ids.replaceAll('%29',')');
      getPath = Env.value!.baseUrl! + '/user/my_services/screenshots/'+widget.id! +'/'+ widget.title!+'?page=%d&' + ids ;
    }
	 if(widget.title!.contains('&order')){
     var ids = widget.title!;
     int ind = ids.indexOf('&');
     ids = ids.substring(ind, ids.length);
     int ind1 = widget.title!.indexOf('%28page');
     String? ttl = widget.title!.substring(0, ind1);
     getPath = Env.value!.baseUrl! + '/user/my_services/screenshots/'+widget.id! +'/'+ ttl+'?page=%d' + ids ;
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
	
	
    screenshots =  MyServicesController(AppProvider.getApplication(context),getPath, AppAction.listing,'','','', search );
	screenshots!.listMyServicesScreenshots();
    screenshots!.listingScreenshots!.add(ScreenshotsMyServicesList());
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
  
    return BlocBuilder<ScreenshotsMyServicesListing, ScreenshotsMyServicesState>(
      bloc: screenshots!.listingScreenshots,

      builder: (BuildContext context, state) {
        if (state is ScreenshotsMyServicesListingUninitialized) {
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
        if (state is ScreenshotsMyServicesListingError) {
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
        if (state is ScreenshotsMyServicesListingLoaded) {
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
									    UserScreenshotsMyServicesBottomLoader()
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
									    UserScreenshotsMyServicesBottomLoader()
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
  
    return BlocBuilder<ScreenshotsMyServicesListing, ScreenshotsMyServicesState>(
      bloc: screenshots!.listingScreenshots,

      builder: (BuildContext context, state) {
        if (state is ScreenshotsMyServicesListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return    Center( 
           child:CircularProgressIndicator(
           valueColor:    AlwaysStoppedAnimation<Color>(
            Colors.green),
          ));
        }
        if (state is ScreenshotsMyServicesListingError) {
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
        if (state is ScreenshotsMyServicesListingLoaded) {
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
									  
									  UserScreenshotsMyServicesBottomLoader()
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
									    UserScreenshotsMyServicesBottomLoader()
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
    screenshots!.listingScreenshots!.add(ScreenshotsMyServicesListingRefresh());

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
      screenshots!.listingScreenshots!.add(ScreenshotsMyServicesList());
    }

  }

}

class  UserScreenshotsMyServicesBottomLoader extends StatelessWidget {
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


class UnlistMyServices extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_services/unlist/:id/:title';
  UnlistMyServices({Key? key, this.id, this.title}) : super(key: key);

  @override
  UnlistMyServicesState createState() => UnlistMyServicesState();
}

class UnlistMyServicesState extends State<UnlistMyServices> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_services/unlist/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_services/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_services/unlist/%s/%s';

  MyServicesController? unlist;
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
 fetchData(MyServicesController? unlist , BuildContext context)async {
    if (this.model == null) {
       final future = unlist!.getUnlistMyServices('');
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
							TextButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('Unlist')){
										unlist!.deleteAllUnlistMyServices(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('Unlist')){
										unlist!.deleteAllUnlistMyServices(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('Unlist')){
										unlist!.deleteAllUnlistMyServices(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('Unlist')){
										unlist!.deleteAllUnlistMyServices(this.model.model.model.user_id);
										}else{
										unlist!.deleteAllUnlistMyServices('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							TextButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 TextButton(
								onPressed: () {
								if(this.model != null){
								
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('Unlist')){
													unlist!.saveUnlistMyServices(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('Unlist')){
													unlist!.saveUnlistMyServices(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('Unlist')){
													unlist!.saveUnlistMyServices(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('Unlist')){
													unlist!.saveUnlistMyServices(this.model,this.model.model.model.user_id);
													}else{
													unlist!.saveUnlistMyServices(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('Unlist')){
													unlist!.saveUnlistMyServices(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('Unlist')){
													unlist!.saveUnlistMyServices(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('Unlist')){
													unlist!.saveUnlistMyServices(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('Unlist')){
													unlist!.saveUnlistMyServices(this.model,this.model.model.model.user_id);
													}else{
													unlist!.saveUnlistMyServices(this.model,'');
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
    unlist =    MyServicesController(AppProvider.getApplication(context),
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
                              this.model.viewFinishDays(context),
                              this.model.viewPrice(context),
                              this.model.viewOptions(context),
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


class ReactivateServiceMyServices extends StatefulWidget {

  final String? id ;
  final String? title;
  static const String PATH = '/user/my_services/reactivate_service/:id/:title';
  ReactivateServiceMyServices({Key? key, this.id, this.title}) : super(key: key);

  @override
  ReactivateServiceMyServicesState createState() => ReactivateServiceMyServicesState();
}

class ReactivateServiceMyServicesState extends State<ReactivateServiceMyServices> with RestorationMixin{
  String? getPath = Env.value!.baseUrl! + '/user/my_services/reactivate_service/%s/%s';
 // String? sendPath = Env.value!.baseUrl! + '/user/my_services/add';
  String? sendPath = Env.value!.baseUrl! + '/user/my_services/reactivate_service/%s/%s';

  MyServicesController? reactivate_service;
  final formKey = GlobalKey<FormState>();
  ScrollController?  controller;
  List<bool> validation = [];
  //var modelReactivateService;
  var model;
  var formData;
  var postReactivateServiceResult;
  var isLoading = true;
  var isError = false;
  var errmsg= 'Unauthorized  :'+'Reactivate Service';
  final List<Widget> actionChildren = <Widget>[
	];

final RestorableInt _counter = RestorableInt(0);

  @override
  String? get restorationId => 'ReactivateService';

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
 fetchData(MyServicesController? reactivate_service , BuildContext context)async {
    if (this.model == null) {
       final future = reactivate_service!.getReactivateServiceMyServices('');
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
               content: Text('Unauthorized  :'+ sprintf('Reactivate Service', [widget.id!,widget.title!])),
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
							TextButton(
								onPressed: () {
								if(this.model != null){
								    if([ 'PlaceNewBid'].contains('ReactivateService')){
										reactivate_service!.deleteAllReactivateServiceMyServices(this.model.model.model.project_title!);
										}else if(['AskOwner'].contains('ReactivateService')){
										reactivate_service!.deleteAllReactivateServiceMyServices(this.model.model.model.project_id.toString());
										}else if(['HireMe'].contains('ReactivateService')){
										reactivate_service!.deleteAllReactivateServiceMyServices(this.model.model.model.private_worker_id.toString());
										
										}else if(['InviteToBid'].contains('ReactivateService')){
										reactivate_service!.deleteAllReactivateServiceMyServices(this.model.model.model.user_id);
										}else{
										reactivate_service!.deleteAllReactivateServiceMyServices('');
										}
								}
								Navigator.pop(context); Navigator.pop(context);},
								/*Navigator.of(context).pop(true)*/
								child: Text('Ya'),
							),
							TextButton(
								onPressed: () => Navigator.of(context).pop(false),
								child: Text('Tidak'),
							),
						
							 TextButton(
								onPressed: () {
								if(this.model != null){
								
								
								
											  if (formKey.currentState!.validate()) {
											  
												if([ 'PlaceNewBid'].contains('ReactivateService')){
													reactivate_service!.saveReactivateServiceMyServices(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('ReactivateService')){
													reactivate_service!.saveReactivateServiceMyServices(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('ReactivateService')){
													reactivate_service!.saveReactivateServiceMyServices(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('ReactivateService')){
													reactivate_service!.saveReactivateServiceMyServices(this.model,this.model.model.model.user_id);
													}else{
													reactivate_service!.saveReactivateServiceMyServices(this.model,'');
													}
											  }else{
													if([ 'PlaceNewBid'].contains('ReactivateService')){
													reactivate_service!.saveReactivateServiceMyServices(this.model,this.model.model.model.project_title!);
													}else if(['AskOwner'].contains('ReactivateService')){
													reactivate_service!.saveReactivateServiceMyServices(this.model,this.model.model.model.project_id.toString());
													}else if(['HireMe'].contains('ReactivateService')){
													reactivate_service!.saveReactivateServiceMyServices(this.model,this.model.model.model.private_worker_id.toString());
													
													}else if(['InviteToBid'].contains('ReactivateService')){
													reactivate_service!.saveReactivateServiceMyServices(this.model,this.model.model.model.user_id);
													}else{
													reactivate_service!.saveReactivateServiceMyServices(this.model,'');
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
    reactivate_service =    MyServicesController(AppProvider.getApplication(context),
        getPath,
        AppAction.edit,
        widget.id!,
        widget.title!,
        null,
		false);
		
	 fetchData(reactivate_service, context);
	
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
                                Text('Reactivate Service', style: TextStyle(color: Colors.white),),
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
                              this.model.viewFinishDays(context),
                              this.model.viewPrice(context),
                              this.model.viewOptions(context),
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
							
							   isLoading!? [] : isError? null: this.model.RButtons(context, _dialVisible, formKey, controller,reactivate_service, postReactivateServiceResult, this, sendPath, widget.id!, widget.title!),
          
                      
                        Container(
                          height: 60,
                        ),
                        
                        ]
                              
                              )

                          )
                      ),
                  //  floatingActionButton: isLoading!? [] : isError? null: this.model.Buttons(context, _dialVisible, formKey, controller,reactivate_service, postReactivateServiceResult, this, sendPath, widget.id!, widget.title!),
                    

              )
      );
   

  }


  @override
  void dispose() {
    super.dispose();
  }
  
   
}




//////////////////

