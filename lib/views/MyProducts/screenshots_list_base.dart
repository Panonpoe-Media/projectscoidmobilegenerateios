import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:projectscoid/models/model.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sprintf/sprintf.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/string_helpers.dart';
import 'package:projectscoid/app/theme_manager.dart';
import 'package:projectscoid/core/components/utility/tool/expand_space_bar.dart';
import 'package:provider/provider.dart';
import 'screenshots_add_image.dart';
import 'screenshots_edit_image.dart';


/** AUTOGENERATE OFF **/

class ScreenshotsListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ScreenshotsListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ScreenshotsListBaseState createState() => ScreenshotsListBaseState();
}

class  ScreenshotsListBaseState extends State<ScreenshotsListBase>{
  String title = 'Screenshots'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  bool account = true;
  AccountController? accountController;
  String searchText = '';
  ScreenshotsListing? listing;

  ScreenshotsListBaseState() {
   
    scrollController.addListener(_onScroll);
  }


String filterShortcodes(String input,
			{String opening = '(', String closing = ')'}) {
		assert(opening.runes.length == 1);
		assert(closing.runes.length == 1);
		final openingRune = opening.runes.first;
		final closingRune = closing.runes.first;
		bool filter = false;
		final buf = StringBuffer();
		for (final rune in input.runes) {
			if (filter == false && rune == openingRune) {
				filter = true;
			} else if (filter == true && rune == closingRune) {
				filter = false;
			} else if (!filter) {
				buf.write(String.fromCharCode(rune));
			}
		}
		var str = buf.toString();
		return input.replaceAll(str, '').replaceAll('(', '').replaceAll(')', '');
	}



  @override
  Widget build(BuildContext context) {
    bool darkMode = false;
	String userid = '';
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
     String product_images_id = 'product_images_id';
	 product_images_id = product_images_id.replaceAll('_id','');
     getPath = widget.url!     + product_images_id + 'page=%s';
	 
	listing = new ScreenshotsListing(AppProvider.getApplication(context), getPath, false, ScreenshotsListingUninitialized());
    listing!.add(ScreenshotsList());
	accountController = new AccountController(AppProvider.getApplication(context),
	AppAction.view   );
	List listAccount = [];
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
	
	 return BlocBuilder<ScreenshotsListing, ScreenshotsState>(
     // cubit: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is ScreenshotsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
           return Scaffold(
		   appBar:  AppBar(
					 // backgroundColor: CurrentTheme.MainAccentColor,
					  elevation: 0.0,
					   iconTheme: IconThemeData(
						  color: Colors.white, //change your color here
						),
					  title:
						Text(
								  readText(widget.title!    .replaceAll('&amp;','&'), 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
					  /*
						Container(
						  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 2.0 , 0.0),
						  child:
						  Column(
							  crossAxisAlignment:  CrossAxisAlignment.start,
							  children: [
								Text(
								  readText(widget.title!    , 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
								Text(
								  'Screenshots',
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 12.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),

							  ]),
						  ),
						  */


					),
                  body:
					   Center(
					 child:CircularProgressIndicator(
					 valueColor: new AlwaysStoppedAnimation<Color>(
							 Colors.green),
				))
		  );
        }
        if (state is ScreenshotsListingError) {
		 _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Oopps, terjadi kendala, mohon tunggu beberapa saat lagi!'),
              backgroundColor: Colors.red,
            ),
          );
          });
		  return Scaffold(
		  appBar:  AppBar(
					 // backgroundColor: CurrentTheme.MainAccentColor,
					  elevation: 0.0,
					   iconTheme: IconThemeData(
						  color: Colors.white, //change your color here
						),
					  title: 
						Text(
								 readText(widget.title!    .replaceAll('&amp;','&'), 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
					  /*
						Container(
						  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 2.0 , 0.0),
						  child:
						  Column(
							  crossAxisAlignment:  CrossAxisAlignment.start,
							  children: [
								Text(
								  readText(widget.title!    , 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
								Text(
								  'Screenshots',
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 12.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),

							  ]),
						  ),
						  */


					),
                  body:
					   Center(
						child: Text('failed to ' + title),
					  )
		  );
         
        }
        if (state is ScreenshotsListingLoaded) {
          if (state.screenshots!.items.items.isEmpty) {
		  if (state.screenshots!.listButton(context, widget.id!    ).length == 0){ 
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
                 floatingActionButton: state.screenshots!.Buttons(context, _dialVisible, widget.id!    )
              );
			  }
          }else{
		  
		      if (state.screenshots!.listButton(context, widget.id!    ).length == 0){ 
		     	return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				    /*
						appBar:  AppBar(
					 // backgroundColor: CurrentTheme.MainAccentColor,
					  elevation: 0.0,
					   iconTheme: IconThemeData(
						  color: Colors.white, //change your color here
						),
					  title: 
						Text(
								  readText(widget.title!    , 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
					  /*
						Container(
						  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 2.0 , 0.0),
						  child:
						  Column(
							  crossAxisAlignment:  CrossAxisAlignment.start,
							  children: [
								Text(
								  readText(widget.title!    , 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
								Text(
								  'Screenshots',
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 12.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),

							  ]),
						  ),
						  */


					),
					*/
                  
					body:
					CustomScrollView(
					 controller: scrollController,
					  slivers: <Widget>[
						// Add the app bar to the CustomScrollView.
						SliverAppBar(
						  // Provide a standard title.
						  title: Text(readText(widget.title!    .replaceAll('&amp;','&'), 40), style: TextStyle(color: Colors.white, fontSize: 14)),
						  // Allows the user to reveal the app bar if they begin scrolling
						  // back up the list of items.
						  floating: true,
						   leading: new IconButton(
									  icon: new Icon(Icons.close, color: Colors.white,),
									  onPressed: (){
										Navigator.pop(context);
									  },
									),
						  backgroundColor:darkMode ? Colors.black87 : CurrentTheme.MainAccentColor,
						  // Display a placeholder widget to visualize the shrinking size.
						  flexibleSpace:      ExpandSpaceBar(
													  title: InkWell(
														  onTap : (){
															
														  },
														  child : new Column(
															  mainAxisAlignment: MainAxisAlignment.end,
															  children: <Widget>[
                                                                RichText(
																	textAlign: TextAlign.center,
																	text: TextSpan(children: <TextSpan>[
																		TextSpan(
																		text: "Screenshots ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																	


																//Text('Screenshots by ${filterShortcodes(readText(widget.title!    .replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

															  ])
													  ),
													  titlePadding: EdgeInsets.only(left: 25, bottom: 20),
													  collapseMode: CollapseBarMode.parallax,
													  centerTitle: false,background: Container(),
													
													),
						  // Make the initial height of the SliverAppBar larger than normal.
						  expandedHeight: 160,
						  
						),
						// Next, create a SliverList
						
						SliverList(
						  // Use a delegate to build items as they're scrolled on screen.
						  delegate: SliverChildBuilderDelegate(
							// The builder function returns a ListTile with a title that
							// displays the index of the current item.
							(context, index){  return index >= state.screenshots!.items.items.length? 
													state.screenshots!.tools.paging.total_pages == state.screenshots!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserScreenshotsListBottomLoader()
															  : index == 0 ?
											   state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index] , searchText ,context, account, widget.id!    ,  state.hasReachedMax!, state.screenshots!.items.items.length, index)
											  :state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index-1] , searchText ,context,  account, widget.id!    , state.hasReachedMax!, state.screenshots!.items.items.length-1, index);											

												// : state.screenshots!.viewItem (state.screenshots!.items.items[index] , searchText, account, widget.id!    , );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.screenshots!.items.items.length
										: state.screenshots!.items.items.length + 1,
						  ),
						),

						
						
					  ],
					),
					
					
					/*
						 Stack(
					  children: [
						/*


							  */
						Container(
						  color: CurrentTheme.MainAccentColor,

						  width: MediaQuery.of(context).size.width,
						  /*
								 child:
								 Padding(
								   padding: EdgeInsets.only(left: 25, top: 20),
								   child: Text('What People say', style: TextStyle(fontSize: 20, color: Colors.white),),
								 )

								  */


						),

						Positioned.fill(
						  //  bottom: 0.0,
							left: 0.0,
							right: 0.0,
							top: 120.0,

							// In order to have the ink splash appear above the image, you
							// must use Ink.image. This allows the image to be painted as part
							// of the Material and display ink effects above it. Using a
							// standard Image will obscure the ink splash.
							child:
							Container( color: Colors.white,)
						),
						Positioned.fill(

							left: 0.0,
							right: 0.0,
							top: 0.0,

							// In order to have the ink splash appear above the image, you
							// must use Ink.image. This allows the image to be painted as part
							// of the Material and display ink effects above it. Using a
							// standard Image will obscure the ink splash.
							child:
							Padding(
							  padding: EdgeInsets.only(left: 25, top: 20),
							  child: Text('Screenshots', style: TextStyle(fontSize: 20, color: Colors.white),),
							)

						),
						Positioned.fill(
						  //  bottom: 0.0,
							left: 0.0,
							right: 0.0,
							top: 75.0,

							// In order to have the ink splash appear above the image, you
							// must use Ink.image. This allows the image to be painted as part
							// of the Material and display ink effects above it. Using a
							// standard Image will obscure the ink splash.
							child:
							Container( child: RefreshIndicator(
											  child:   
											     new ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.screenshots!.items.items.length? 
																		state.screenshots!.tools.paging.total_pages == state.screenshots!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserScreenshotsListBottomLoader()
																				  : index == 0 ?
																  state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index] , searchText ,context, account, widget.title!    ,  state.hasReachedMax!, state.screenshots!.items.items.length, index)
																  :state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index-1] , searchText ,context,  account, widget.title!    , state.hasReachedMax!, state.screenshots!.items.items.length-1, index);
																	 // : state.screenshots!.viewItem (state.screenshots!.items.items[index] , searchText, account, widget.id!    , );
																},
																itemCount: state.hasReachedMax!
																	? state.screenshots!.items.items.length
																	: state.screenshots!.items.items.length + 1,
																controller: scrollController,
															  ),
															  
															  onRefresh: _onRefresh,
											 ) 
									 )
						),



						// buildListingBar(),

					  ],
					),
					*/
					//  floatingActionButton:  state.screenshots!.Buttons(context, _dialVisible, widget.id!    )
					
					//	buildListingBar()
				);
				}else{
					return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				    /*
						appBar:  AppBar(
					 // backgroundColor: CurrentTheme.MainAccentColor,
					  elevation: 0.0,
					   iconTheme: IconThemeData(
						  color: Colors.white, //change your color here
						),
					  title: 
						Text(
								  readText(widget.title!    , 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
					  /*
						Container(
						  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 2.0 , 0.0),
						  child:
						  Column(
							  crossAxisAlignment:  CrossAxisAlignment.start,
							  children: [
								Text(
								  readText(widget.title!    , 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
								Text(
								  'Screenshots',
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 12.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),

							  ]),
						  ),
						  */


					),
					*/
                  
					body:
					
					
					CustomScrollView(
					 controller: scrollController,
					  slivers: <Widget>[
						// Add the app bar to the CustomScrollView.
						SliverAppBar(
						  // Provide a standard title.
						  title: Text(readText(widget.title!    .replaceAll('&amp;','&'), 40), style: TextStyle(color: Colors.white, fontSize: 14)),
						  // Allows the user to reveal the app bar if they begin scrolling
						  // back up the list of items.
						  floating: true,
						   leading: new IconButton(
									  icon: new Icon(Icons.close, color: Colors.white,),
									  onPressed: (){
										Navigator.pop(context);
									  },
									),
						  backgroundColor:darkMode ? Colors.black87 : CurrentTheme.MainAccentColor,
						  // Display a placeholder widget to visualize the shrinking size.
						  flexibleSpace:      ExpandSpaceBar(
													  title: InkWell(
														  onTap : (){
															
														  },
														  child : new Column(
															  mainAxisAlignment: MainAxisAlignment.end,
															  children: <Widget>[
                                                                  RichText(
																	textAlign: TextAlign.center,
																	text: TextSpan(children: <TextSpan>[
																		TextSpan(
																		text: "Screenshots ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																//Text('Screenshots by ${filterShortcodes(readText(widget.title!    .replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

															  ])
													  ),
													  titlePadding: EdgeInsets.only(left: 25, bottom: 20),
													  collapseMode: CollapseBarMode.parallax,
													  centerTitle: false, background: Container(),
													
													),
						  // Make the initial height of the SliverAppBar larger than normal.
						  expandedHeight: 160,
						  
						),
						// Next, create a SliverList
					
						SliverList(
						  // Use a delegate to build items as they're scrolled on screen.
						  delegate: SliverChildBuilderDelegate(
							// The builder function returns a ListTile with a title that
							// displays the index of the current item.
							(context, index){  return index >= state.screenshots!.items.items.length? 
													state.screenshots!.tools.paging.total_pages == state.screenshots!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserScreenshotsListBottomLoader()
															  : index == 0 ?
											   state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index] , searchText ,context, account, widget.id!    ,  state.hasReachedMax!, state.screenshots!.items.items.length, index)
											  :state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index-1] , searchText ,context,  account, widget.id!    , state.hasReachedMax!, state.screenshots!.items.items.length-1, index);											
											  // : state.screenshots!.viewItem (state.screenshots!.items.items[index] , searchText, account, widget.id!    , );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.screenshots!.items.items.length
										: state.screenshots!.items.items.length + 1,
						  ),
						),
						
					  ],
					),
					
					
					
					
					   /*
						 Stack(
					  children: [
						/*


							  */
						Container(
						  color: CurrentTheme.MainAccentColor,

						  width: MediaQuery.of(context).size.width,
						  /*
								 child:
								 Padding(
								   padding: EdgeInsets.only(left: 25, top: 20),
								   child: Text('What People say', style: TextStyle(fontSize: 20, color: Colors.white),),
								 )

								  */


						),

						Positioned.fill(
						  //  bottom: 0.0,
							left: 0.0,
							right: 0.0,
							top: 120.0,

							// In order to have the ink splash appear above the image, you
							// must use Ink.image. This allows the image to be painted as part
							// of the Material and display ink effects above it. Using a
							// standard Image will obscure the ink splash.
							child:
							Container( color: Colors.white,)
						),
						Positioned.fill(

							left: 0.0,
							right: 0.0,
							top: 0.0,

							// In order to have the ink splash appear above the image, you
							// must use Ink.image. This allows the image to be painted as part
							// of the Material and display ink effects above it. Using a
							// standard Image will obscure the ink splash.
							child:
							Padding(
							  padding: EdgeInsets.only(left: 25, top: 20),
							  child: Text('Screenshots', style: TextStyle(fontSize: 20, color: Colors.white),),
							)

						),
						Positioned.fill(
						  //  bottom: 0.0,
							left: 0.0,
							right: 0.0,
							top: 75.0,

							// In order to have the ink splash appear above the image, you
							// must use Ink.image. This allows the image to be painted as part
							// of the Material and display ink effects above it. Using a
							// standard Image will obscure the ink splash.
							child:
							Container( child: 
							              RefreshIndicator(
											  child: 

											     new ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.screenshots!.items.items.length? 
																		state.screenshots!.tools.paging.total_pages == state.screenshots!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserScreenshotsListBottomLoader()
																				  : index == 0 ?
																  state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index] , searchText ,context, account, widget.title!    ,  state.hasReachedMax!, state.screenshots!.items.items.length, index)
																  :state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index-1] , searchText ,context,  account, widget.title!    , state.hasReachedMax!, state.screenshots!.items.items.length-1, index);
																	 // : state.screenshots!.viewItem (state.screenshots!.items.items[index] , searchText, account, widget.id!    , );
																},
																itemCount: state.hasReachedMax!
																	? state.screenshots!.items.items.length
																	: state.screenshots!.items.items.length + 1,
																controller: scrollController,
															  ),
															  
															  
															  onRefresh: _onRefresh,
											 ) 
											 
									 )
						),



						// buildListingBar(),

					  ],
					),
					*/
					  floatingActionButton:  state.screenshots!.Buttons(context, _dialVisible, widget.id!    )
					
					//	buildListingBar()
				);
				}
		  }  
	
				return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				/*
						appBar:  AppBar(
					 // backgroundColor: CurrentTheme.MainAccentColor,
					  elevation: 0.0,
					   iconTheme: IconThemeData(
						  color: Colors.white, //change your color here
						),
					  title: 
						Text(
								  readText(widget.title!    , 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
					  /*
						Container(
						  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 2.0 , 0.0),
						  child:
						  Column(
							  crossAxisAlignment:  CrossAxisAlignment.start,
							  children: [
								Text(
								  readText(widget.title!    , 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
								Text(
								  'Screenshots',
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 12.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),

							  ]),
						  ),
						  */


					),
					*/
                  
					body:
					  		CustomScrollView(
					 controller: scrollController,
					  slivers: <Widget>[
						// Add the app bar to the CustomScrollView.
						SliverAppBar(
						  // Provide a standard title.
						  title: Text(readText(widget.title!    .replaceAll('&amp;','&'), 40), style: TextStyle(color: Colors.white, fontSize: 14)),
						  // Allows the user to reveal the app bar if they begin scrolling
						  // back up the list of items.
						  floating: true,
						   leading: new IconButton(
									  icon: new Icon(Icons.close, color: Colors.white,),
									  onPressed: (){
										Navigator.pop(context);
									  },
									),
						  backgroundColor:darkMode ? Colors.black87 : CurrentTheme.MainAccentColor,
						  // Display a placeholder widget to visualize the shrinking size.
						  flexibleSpace:      ExpandSpaceBar(
													  title: InkWell(
														  onTap : (){
															
														  },
														  child : new Column(
															  mainAxisAlignment: MainAxisAlignment.end,
															  children: <Widget>[
																  RichText(
																	textAlign: TextAlign.center,
																	text: TextSpan(children: <TextSpan>[
																		TextSpan(
																		text: "Screenshots ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
															//	Text('Screenshots by ${filterShortcodes(readText(widget.title!    .replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

															  ])
													  ),
													  titlePadding: EdgeInsets.only(left: 25, bottom: 20),
													  collapseMode: CollapseBarMode.parallax,
													  centerTitle: false,background: Container(),
													
													),
						  // Make the initial height of the SliverAppBar larger than normal.
						  expandedHeight: 160,
						  
						),
						// Next, create a SliverList
				
						SliverList(
						  // Use a delegate to build items as they're scrolled on screen.
						  delegate: SliverChildBuilderDelegate(
							// The builder function returns a ListTile with a title that
							// displays the index of the current item.
							(context, index){  return index >= state.screenshots!.items.items.length? 
													state.screenshots!.tools.paging.total_pages == state.screenshots!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserScreenshotsListBottomLoader()
															  : index == 0 ?
											   state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index] , searchText ,context, account, widget.id!    ,  state.hasReachedMax!, state.screenshots!.items.items.length, index)
											  :state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index-1] , searchText ,context,  account, widget.id!    , state.hasReachedMax!, state.screenshots!.items.items.length-1, index);											
											  // : state.screenshots!.viewItem (state.screenshots!.items.items[index] , searchText, account, widget.id!    , );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.screenshots!.items.items.length
										: state.screenshots!.items.items.length + 1,
						  ),
						),
						
					  ],
					),
					/*
						 Stack(
					  children: [
						/*


							  */
						Container(
						  color: CurrentTheme.MainAccentColor,

						  width: MediaQuery.of(context).size.width,
						  /*
								 child:
								 Padding(
								   padding: EdgeInsets.only(left: 25, top: 20),
								   child: Text('What People say', style: TextStyle(fontSize: 20, color: Colors.white),),
								 )

								  */


						),

						Positioned.fill(
						  //  bottom: 0.0,
							left: 0.0,
							right: 0.0,
							top: 120.0,

							// In order to have the ink splash appear above the image, you
							// must use Ink.image. This allows the image to be painted as part
							// of the Material and display ink effects above it. Using a
							// standard Image will obscure the ink splash.
							child:
							Container( color: Colors.white,)
						),
						Positioned.fill(

							left: 0.0,
							right: 0.0,
							top: 0.0,

							// In order to have the ink splash appear above the image, you
							// must use Ink.image. This allows the image to be painted as part
							// of the Material and display ink effects above it. Using a
							// standard Image will obscure the ink splash.
							child:
							Padding(
							  padding: EdgeInsets.only(left: 25, top: 20),
							  child: Text('Screenshots', style: TextStyle(fontSize: 20, color: Colors.white),),
							)

						),
						Positioned.fill(
						  //  bottom: 0.0,
							left: 0.0,
							right: 0.0,
							top: 75.0,

							// In order to have the ink splash appear above the image, you
							// must use Ink.image. This allows the image to be painted as part
							// of the Material and display ink effects above it. Using a
							// standard Image will obscure the ink splash.
							child:
							Container( child: RefreshIndicator(
											  child:    

											     new ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.screenshots!.items.items.length? 
																		state.screenshots!.tools.paging.total_pages == state.screenshots!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserScreenshotsListBottomLoader()
																				  : index == 0 ?
																  state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index] , searchText ,context, account, widget.title!    ,  state.hasReachedMax!, state.screenshots!.items.items.length, index)
																  :state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index-1] , searchText ,context,  account, widget.title!    , state.hasReachedMax!, state.screenshots!.items.items.length-1, index);
																	 // : state.screenshots!.viewItem (state.screenshots!.items.items[index] , searchText, account, widget.id!    , );
																},
																itemCount: state.hasReachedMax!
																	? state.screenshots!.items.items.length
																	: state.screenshots!.items.items.length + 1,
																controller: scrollController,
															  ),
															  
														  
															  onRefresh: _onRefresh,
											 ) 
									 )
						),



						// buildListingBar(),

					  ],
					),
					
					
					*/
				
					//	buildListingBar()
				);
				
				
				}
		
		return new Container(width: 0.0, height: 0.0);
      },
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
            style: new TextStyle(
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
   
   
  /* 
  Widget buildListingBar(){

			 
			 return RefreshIndicator(
			  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.screenshots!.items.items.length? 
										state.screenshots!.tools.paging.total_pages == state.screenshots!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserScreenshotsListBottomLoader()
									 			  : index == 0 ?
								  state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index] , searchText ,context, account, widget.title!    ,  state.hasReachedMax!, state.screenshots!.items.items.length, index)
								  :state.screenshots!.viewItem1 (state.screenshots!.items.items[index] , state.screenshots!.items.items[index-1] , searchText ,context,  account, widget.title!    , state.hasReachedMax!, state.screenshots!.items.items.length-1, index);
									 // : state.screenshots!.viewItem (state.screenshots!.items.items[index] , searchText, account, widget.id!    , );
								},
								itemCount: state.hasReachedMax!
									? state.screenshots!.items.items.length
									: state.screenshots!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
			 );
      
  }
*/


  @override
  void dispose() {
    listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();
    listing!.add(ScreenshotsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ScreenshotsList());
    }

  }
}




abstract class ScreenshotsEvent extends Equatable {
   const ScreenshotsEvent();
   @override
    List<Object> get props => [];
}

class ScreenshotsList extends ScreenshotsEvent {
  @override
  String toString() => 'ScreenshotsList';
}

class ScreenshotsListingRefresh extends ScreenshotsEvent {
  @override
  String toString() => 'ScreenshotsListingRefresh';
}

class ScreenshotsListingChangeSearch extends ScreenshotsEvent {
  @override
  String toString() => 'ScreenshotsChangeSearch';
}


abstract class ScreenshotsState extends Equatable {
   const ScreenshotsState();
   @override
    List<Object> get props => [];
}

class ScreenshotsListingUninitialized extends ScreenshotsState {
  @override
  String toString() => 'ScreenshotsListingUninitialized';
}

class ScreenshotsListingError extends ScreenshotsState {
  @override
  String toString() => 'ScreenshotsListingError';
}

class ScreenshotsListingLoaded extends ScreenshotsState {
  final ScreenshotsListingModel? screenshots;
  final bool? hasReachedMax;
  final int?  page;

  ScreenshotsListingLoaded({
    this.screenshots,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [screenshots!, hasReachedMax!, page!];
	
  ScreenshotsListingLoaded copyWith({
    ScreenshotsListingModel? screenshots,
    bool? hasReachedMax,
    int? page,
  }) {
    return ScreenshotsListingLoaded(
      screenshots: screenshots ?? this.screenshots,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ScreenshotsListingLoaded  ScreenshotsListing: ${ screenshots!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ScreenshotsListing extends Bloc<ScreenshotsEvent, ScreenshotsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ScreenshotsListing(this.application, this.url, this.isSearch, ScreenshotsState initialState):super(initialState);
  @override
  void dispose() {
   // super.dispose();
  }


  @override
	EventTransformer<ScreenshotsEvent> transform<ScreenshotsEvent>(Duration duration) {
		return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
	}
	/*
 Stream<Transition<ScreenshotsEvent, ScreenshotsState>> transformEvents(
      Stream<ScreenshotsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }

	 */

  @override
  void onTransition(Transition<ScreenshotsEvent, ScreenshotsState> transition) {
    print(transition);
  }

  @override
  get initialState => ScreenshotsListingUninitialized();

  @override

  Stream<ScreenshotsState> mapEventToState(ScreenshotsEvent event) async* {
    final currentState = state;
    if (event is ScreenshotsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ScreenshotsListingUninitialized){
			  if(isSearch){
			     ScreenshotsListingModel? screenshots = await listingSearchScreenshots(1);
				  int deltaPage = screenshots!.items.items.length ~/(screenshots!.tools.paging.total_rows/screenshots!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield screenshots!.items.items.isEmpty ? (currentState as ScreenshotsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ScreenshotsListingLoaded(screenshots: screenshots,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ScreenshotsListingModel? screenshots = await listingScreenshots(1);
				  int deltaPage = screenshots!.items.items.length ~/(screenshots!.tools.paging.total_rows/screenshots!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				    deltaPage = 1;
				  }
				  yield screenshots!.items.items.isEmpty ? (currentState as ScreenshotsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ScreenshotsListingLoaded(screenshots: screenshots,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ScreenshotsListingLoaded) {
          //page++;
		  final oldpage = (currentState as ScreenshotsListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as ScreenshotsListingLoaded).page! + 1;
				  ScreenshotsListingModel? screenshots = await listingSearchScreenshots(page);
				 if ((currentState as ScreenshotsListingLoaded).screenshots!.tools.paging.total_pages == oldpage) {
					yield (currentState as ScreenshotsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!screenshots!.items.items.isEmpty){
						 (currentState as ScreenshotsListingLoaded).screenshots!.items.items.addAll(screenshots!.items.items);
					  }
					  yield screenshots!.items.items.isEmpty
						  ? (currentState as ScreenshotsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : ScreenshotsListingLoaded(  screenshots:  (currentState as ScreenshotsListingLoaded).screenshots ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
		  
				  final page = (currentState as ScreenshotsListingLoaded).page! + 1;
				   if ((currentState as ScreenshotsListingLoaded).screenshots!.tools.paging.total_pages == oldpage) {
					yield (currentState as ScreenshotsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  ScreenshotsListingModel? screenshots = await listingScreenshots(page);
					  yield screenshots!.items.items.isEmpty
						  ? (currentState as ScreenshotsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : ScreenshotsListingLoaded(  screenshots:  screenshots ,
												  hasReachedMax: false,
												  page: page,);
				 }								  
			}	  
        }
      } catch (_) {
        yield ScreenshotsListingError();
      }
    } else if (event is ScreenshotsListingRefresh){
      try {
        if (currentState is ScreenshotsListingUninitialized) {
		   if(isSearch){
		      ScreenshotsListingModel? screenshots = await listingSearchScreenshots(1);
              yield ScreenshotsListingLoaded( screenshots: screenshots,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ScreenshotsListingModel? screenshots = await listingScreenshots(1);
             yield ScreenshotsListingLoaded( screenshots: screenshots,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ScreenshotsListingLoaded) {
		  if(isSearch){
		     ScreenshotsListingModel? screenshots = await listingSearchRefreshScreenshots();
              yield screenshots!.items.items.isEmpty
              ? (currentState as ScreenshotsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ScreenshotsListingLoaded(  screenshots: screenshots ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ScreenshotsListingModel? screenshots = await listingRefreshScreenshots();
              yield screenshots!.items.items.isEmpty
              ? (currentState as ScreenshotsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ScreenshotsListingLoaded(  screenshots: screenshots ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ScreenshotsListingError();
      }

    }
  }



  bool hasReachedMax(ScreenshotsState state) =>
      state is ScreenshotsListingLoaded && state.hasReachedMax!;


  Future<ScreenshotsListingModel?> listingScreenshots(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getScreenshotsListAPI2(url, page);
	/*
	var dt  = ScreenshotsListingModel(await apiRepProvider.getData(sprintf(url, [page])));
	final data = await _loadAndSaveScreenshotsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<ScreenshotsListingModel?> listingRefreshScreenshots() async {
  
  
   ScreenshotsListingModel? screenshots = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllScreenshotsList3();
    screenshots  = await apiRepProvider!.getScreenshotsListAPI2(url, 1);
    return screenshots;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ScreenshotsListingModel(await apiRepProvider.getData(sprintf(url, [page])));
	final data = await _loadAndSaveScreenshotsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<ScreenshotsListingModel?> listingSearchScreenshots(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getScreenshotsListSearchAPI2(url, page);
	
	/*
	var dt  = ScreenshotsListingModel(await apiRepProvider.getData(sprintf(url, [page])));
	final data = await _loadAndSaveScreenshotsListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<ScreenshotsListingModel?> listingSearchRefreshScreenshots() async {
   ScreenshotsListingModel? screenshots = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllScreenshotsList3();
    screenshots  = await apiRepProvider!.getScreenshotsListSearchAPI2(url, 1);
    return screenshots;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ScreenshotsListingModel(await apiRepProvider.getData(sprintf(url, [page])));
	final data = await _loadAndSaveScreenshotsListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<ScreenshotsListingModel> _loadAndSaveScreenshotsListSearch(ScreenshotsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.description;
	  list.items.items[i].item.pht = list.items.items[i].item.image_url;
    }
    return list;
 }


class  UserScreenshotsListBottomLoader extends StatelessWidget {
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







  

