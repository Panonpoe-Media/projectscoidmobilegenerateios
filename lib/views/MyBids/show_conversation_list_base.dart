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
import 'show_conversation_new_reply.dart';
import 'show_conversation_reply.dart';
import 'show_conversation_place_new_bid.dart';



class ShowConversationListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ShowConversationListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ShowConversationListBaseState createState() => ShowConversationListBaseState();
}

class  ShowConversationListBaseState extends State<ShowConversationListBase>{
  String title = 'Show Conversation'; 
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
  ShowConversationListing? listing;

  ShowConversationListBaseState() {
   
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
     String post_id = 'post_id';
	 post_id = post_id.replaceAll('_id','');
     getPath = widget.url! + post_id + 'page=%s';
	 
	listing =      ShowConversationListing(AppProvider.getApplication(context), getPath, false, ShowConversationListingUninitialized());
    listing!.add(ShowConversationList());
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
		userid = val.asMap()[0]['user_hash'];
      }

    });
	
	 return BlocBuilder<ShowConversationListing, ShowConversationState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is ShowConversationListingUninitialized) {
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
								  readText(widget.title!.replaceAll('&amp;','&'), 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
				
					),
                  body:
					   Center(
					 child:CircularProgressIndicator(
					 valueColor:      AlwaysStoppedAnimation<Color>(
							 Colors.green),
				))
		  );
        }
        if (state is ShowConversationListingError) {
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
								 readText(widget.title!.replaceAll('&amp;','&'), 40),
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
								  readText(widget.title!, 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
								Text(
								  'Show Conversation',
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
        if (state is ShowConversationListingLoaded) {
          if (state.show_conversation!.items.items.isEmpty) {
		  if (state.show_conversation!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.show_conversation!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.show_conversation!.listButton(context, widget.id!).length == 0){ 
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
								  readText(widget.title!, 40),
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
								  readText(widget.title!, 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
								Text(
								  'Show Conversation',
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
						  title: Text(readText(widget.title!.replaceAll('&amp;','&'), 40), style: TextStyle(color: Colors.white, fontSize: 14)),
						  // Allows the user to reveal the app bar if they begin scrolling
						  // back up the list of items.
						  floating: true,
						   leading:      IconButton(
									  icon:      Icon(Icons.close, color: Colors.white,),
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
														  child :      Column(
															  mainAxisAlignment: MainAxisAlignment.end,
															  children: <Widget>[
                                                                RichText(
																	textAlign: TextAlign.center,
																	text: TextSpan(children: <TextSpan>[
																		TextSpan(
																		text: "Show Conversation ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																	


																//Text('Show Conversation by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.show_conversation!.items.items.length? 
													state.show_conversation!.tools.paging.total_pages == state.show_conversation!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserShowConversationListBottomLoader()
															  : index == 0 ?
											   state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.show_conversation!.items.items.length, index)
											  :state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.show_conversation!.items.items.length-1, index);											

												// : state.show_conversation!.viewItem (state.show_conversation!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.show_conversation!.items.items.length
										: state.show_conversation!.items.items.length + 1,
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
							  child: Text('Show Conversation', style: TextStyle(fontSize: 20, color: Colors.white),),
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
											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.show_conversation!.items.items.length? 
																		state.show_conversation!.tools.paging.total_pages == state.show_conversation!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserShowConversationListBottomLoader()
																				  : index == 0 ?
																  state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.show_conversation!.items.items.length, index)
																  :state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.show_conversation!.items.items.length-1, index);
																	 // : state.show_conversation!.viewItem (state.show_conversation!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.show_conversation!.items.items.length
																	: state.show_conversation!.items.items.length + 1,
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
					//  floatingActionButton:  state.show_conversation!.Buttons(context, _dialVisible, widget.id!)
					
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
								  readText(widget.title!, 40),
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
								  readText(widget.title!, 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
								Text(
								  'Show Conversation',
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
						  title: Text(readText(widget.title!.replaceAll('&amp;','&'), 40), style: TextStyle(color: Colors.white, fontSize: 14)),
						  // Allows the user to reveal the app bar if they begin scrolling
						  // back up the list of items.
						  floating: true,
						   leading:      IconButton(
									  icon:      Icon(Icons.close, color: Colors.white,),
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
														  child :      Column(
															  mainAxisAlignment: MainAxisAlignment.end,
															  children: <Widget>[
                                                                  RichText(
																	textAlign: TextAlign.center,
																	text: TextSpan(children: <TextSpan>[
																		TextSpan(
																		text: "Show Conversation ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																//Text('Show Conversation by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.show_conversation!.items.items.length? 
													state.show_conversation!.tools.paging.total_pages == state.show_conversation!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserShowConversationListBottomLoader()
															  : index == 0 ?
											   state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.show_conversation!.items.items.length, index)
											  :state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.show_conversation!.items.items.length-1, index);											
											  // : state.show_conversation!.viewItem (state.show_conversation!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.show_conversation!.items.items.length
										: state.show_conversation!.items.items.length + 1,
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
							  child: Text('Show Conversation', style: TextStyle(fontSize: 20, color: Colors.white),),
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

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.show_conversation!.items.items.length? 
																		state.show_conversation!.tools.paging.total_pages == state.show_conversation!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserShowConversationListBottomLoader()
																				  : index == 0 ?
																  state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.show_conversation!.items.items.length, index)
																  :state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.show_conversation!.items.items.length-1, index);
																	 // : state.show_conversation!.viewItem (state.show_conversation!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.show_conversation!.items.items.length
																	: state.show_conversation!.items.items.length + 1,
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
					  floatingActionButton:  state.show_conversation!.Buttons(context, _dialVisible, widget.id!)
					
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
								  readText(widget.title!, 40),
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
								  readText(widget.title!, 40),
								  style: TextStyle(
									  fontFamily: "Gotik",
									  fontSize: 13.0,
									  color: Colors.white,
									  fontWeight: FontWeight.w700),
								),
								Text(
								  'Show Conversation',
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
						  title: Text(readText(widget.title!.replaceAll('&amp;','&'), 40), style: TextStyle(color: Colors.white, fontSize: 14)),
						  // Allows the user to reveal the app bar if they begin scrolling
						  // back up the list of items.
						  floating: true,
						   leading:      IconButton(
									  icon:      Icon(Icons.close, color: Colors.white,),
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
														  child :      Column(
															  mainAxisAlignment: MainAxisAlignment.end,
															  children: <Widget>[
																  RichText(
																	textAlign: TextAlign.center,
																	text: TextSpan(children: <TextSpan>[
																		TextSpan(
																		text: "Show Conversation ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
															//	Text('Show Conversation by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.show_conversation!.items.items.length? 
													state.show_conversation!.tools.paging.total_pages == state.show_conversation!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserShowConversationListBottomLoader()
															  : index == 0 ?
											   state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.show_conversation!.items.items.length, index)
											  :state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.show_conversation!.items.items.length-1, index);											
											  // : state.show_conversation!.viewItem (state.show_conversation!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.show_conversation!.items.items.length
										: state.show_conversation!.items.items.length + 1,
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
							  child: Text('Show Conversation', style: TextStyle(fontSize: 20, color: Colors.white),),
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

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.show_conversation!.items.items.length? 
																		state.show_conversation!.tools.paging.total_pages == state.show_conversation!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserShowConversationListBottomLoader()
																				  : index == 0 ?
																  state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.show_conversation!.items.items.length, index)
																  :state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.show_conversation!.items.items.length-1, index);
																	 // : state.show_conversation!.viewItem (state.show_conversation!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.show_conversation!.items.items.length
																	: state.show_conversation!.items.items.length + 1,
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
		
		return      Container(width: 0.0, height: 0.0);
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
            style:      TextStyle(
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
			  child:      ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.show_conversation!.items.items.length? 
										state.show_conversation!.tools.paging.total_pages == state.show_conversation!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserShowConversationListBottomLoader()
									 			  : index == 0 ?
								  state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.show_conversation!.items.items.length, index)
								  :state.show_conversation!.viewItem1 (state.show_conversation!.items.items[index] , state.show_conversation!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.show_conversation!.items.items.length-1, index);
									 // : state.show_conversation!.viewItem (state.show_conversation!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.show_conversation!.items.items.length
									: state.show_conversation!.items.items.length + 1,
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
    Completer<Null> completer =      Completer<Null>();
    listing!.add(ShowConversationListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ShowConversationList());
    }

  }
}




abstract class ShowConversationEvent extends Equatable {
   const ShowConversationEvent();
   @override
    List<Object> get props => [];
}

class ShowConversationList extends ShowConversationEvent {
  @override
  String toString() => 'ShowConversationList';
}

class ShowConversationListingRefresh extends ShowConversationEvent {
  @override
  String toString() => 'ShowConversationListingRefresh';
}

class ShowConversationListingChangeSearch extends ShowConversationEvent {
  @override
  String toString() => 'ShowConversationChangeSearch';
}


abstract class ShowConversationState extends Equatable {
   const ShowConversationState();
   @override
    List<Object> get props => [];
}

class ShowConversationListingUninitialized extends ShowConversationState {
  @override
  String toString() => 'ShowConversationListingUninitialized';
}

class ShowConversationListingError extends ShowConversationState {
  @override
  String toString() => 'ShowConversationListingError';
}

class ShowConversationListingLoaded extends ShowConversationState {
  final ShowConversationListingModel? show_conversation;
  final bool? hasReachedMax;
  final int?  page;

  ShowConversationListingLoaded({
    this.show_conversation,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [show_conversation!, hasReachedMax!, page!];
	
  ShowConversationListingLoaded copyWith({
    ShowConversationListingModel? show_conversation,
    bool? hasReachedMax,
    int? page,
  }) {
    return ShowConversationListingLoaded(
      show_conversation: show_conversation ?? this.show_conversation,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ShowConversationListingLoaded  ShowConversationListing: ${ show_conversation!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ShowConversationListing extends Bloc<ShowConversationEvent, ShowConversationState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ShowConversationListing(this.application, this.url, this.isSearch, ShowConversationState initialState):
  super(initialState){
   on<ShowConversationList>(_ShowConversationListEvent);
	 on<ShowConversationListingRefresh>(_ShowConversationListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ShowConversationEvent, ShowConversationState>> transformEvents(
      Stream<ShowConversationEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<ShowConversationEvent> transform<ShowConversationEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ShowConversationEvent, ShowConversationState> transition) {
    print(transition);
  }


  void _ShowConversationListEvent(ShowConversationList event, Emitter<ShowConversationState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is ShowConversationListingUninitialized){
			  if(isSearch){
			     ShowConversationListingModel? show_conversation = await listingSearchShowConversation(1);
				  int deltaPage = show_conversation!.items.items.length ~/(show_conversation!.tools.paging.total_rows/show_conversation!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( show_conversation!.items.items.isEmpty ? (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ShowConversationListingLoaded(show_conversation: show_conversation,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				   ShowConversationListingModel? show_conversation = await listingShowConversation(1);
				   int deltaPage;
				   if(show_conversation!.tools.paging.total_pages != 0){
				      deltaPage = show_conversation!.items.items.length ~/(show_conversation!.tools.paging.total_rows/show_conversation!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   return emit ( show_conversation!.items.items.isEmpty ? (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ShowConversationListingLoaded(show_conversation: show_conversation,
					  hasReachedMax: false,
					  page: deltaPage));
					  
					  }else{
					    deltaPage = 0;
						 return emit ( ShowConversationListingLoaded(show_conversation: show_conversation,
					  hasReachedMax: false,
					  page: deltaPage));
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is ShowConversationListingLoaded) {
          //page++;
		  final oldpage = (currentState as ShowConversationListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as ShowConversationListingLoaded).page! + 1;
				  ShowConversationListingModel? show_conversation = await listingSearchShowConversation(page);
				 if ((currentState as ShowConversationListingLoaded).show_conversation!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!show_conversation!.items.items.isEmpty){
						 (currentState as ShowConversationListingLoaded).show_conversation!.items.items.addAll(show_conversation!.items.items);
					  }
					  return emit ( show_conversation!.items.items.isEmpty
						  ? (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : ShowConversationListingLoaded(  show_conversation:  (currentState as ShowConversationListingLoaded).show_conversation ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
				  final page = (currentState as ShowConversationListingLoaded).page! + 1;
				   if ((currentState as ShowConversationListingLoaded).show_conversation!.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  ShowConversationListingModel? show_conversation = await listingShowConversation(page);
					 return emit (show_conversation!.items.items.isEmpty
						  ? (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : ShowConversationListingLoaded(  show_conversation:  show_conversation ,
												  hasReachedMax: false,
												  page: page,));
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        return emit ( ShowConversationListingError());
      }
    }
  }

  void _ShowConversationListingRefreshEvent(ShowConversationListingRefresh event, Emitter<ShowConversationState> emit)async{
  final currentState = state;
   try {
        if (currentState is ShowConversationListingUninitialized) {
		   if(isSearch){
		      ShowConversationListingModel? show_conversation = await listingSearchShowConversation(1);
              return emit ( ShowConversationListingLoaded( show_conversation: show_conversation,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
		     ShowConversationListingModel? show_conversation = await listingShowConversation(1);
             return emit ( ShowConversationListingLoaded( show_conversation: show_conversation,
                   hasReachedMax: false,
                   page: 1 ));
				   
		   }

        }

        if (currentState is ShowConversationListingLoaded) {
		  if(isSearch){
		     ShowConversationListingModel? show_conversation = await listingSearchRefreshShowConversation();
              return emit ( show_conversation!.items.items.isEmpty
              ? (currentState as ShowConversationListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowConversationListingLoaded(  show_conversation: show_conversation ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
		      ShowConversationListingModel? show_conversation = await listingRefreshShowConversation();
			   int deltaPage = show_conversation!.items.items.length ~/ (show_conversation!.tools.paging.total_rows/show_conversation!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              return emit (show_conversation!.items.items.isEmpty
              ? (currentState as ShowConversationListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowConversationListingLoaded(  show_conversation: show_conversation ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ShowConversationListingError());
      }
  }



  @override
  get initialState => ShowConversationListingUninitialized();

  @override

  Stream<ShowConversationState> mapEventToState(ShowConversationEvent event) async* {
    final currentState = state;
    if (event is ShowConversationList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ShowConversationListingUninitialized){
			  if(isSearch){
			     ShowConversationListingModel? show_conversation = await listingSearchShowConversation(1);
				  int deltaPage = show_conversation!.items.items.length ~/(show_conversation!.tools.paging.total_rows/show_conversation!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield show_conversation!.items.items.isEmpty ? (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ShowConversationListingLoaded(show_conversation: show_conversation,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   ShowConversationListingModel? show_conversation = await listingShowConversation(1);
				   int deltaPage;
				   if(show_conversation!.tools.paging.total_pages != 0){
				      deltaPage = show_conversation!.items.items.length ~/(show_conversation!.tools.paging.total_rows/show_conversation!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield show_conversation!.items.items.isEmpty ? (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ShowConversationListingLoaded(show_conversation: show_conversation,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield ShowConversationListingLoaded(show_conversation: show_conversation,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is ShowConversationListingLoaded) {
          //page++;
		  final oldpage = (currentState as ShowConversationListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as ShowConversationListingLoaded).page! + 1;
				  ShowConversationListingModel? show_conversation = await listingSearchShowConversation(page);
				 if ((currentState as ShowConversationListingLoaded).show_conversation!.tools.paging.total_pages == oldpage) {
					yield (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!show_conversation!.items.items.isEmpty){
						 (currentState as ShowConversationListingLoaded).show_conversation!.items.items.addAll(show_conversation!.items.items);
					  }
					  yield show_conversation!.items.items.isEmpty
						  ? (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : ShowConversationListingLoaded(  show_conversation:  (currentState as ShowConversationListingLoaded).show_conversation ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as ShowConversationListingLoaded).page! + 1;
				   if ((currentState as ShowConversationListingLoaded).show_conversation!.tools.paging.total_pages == oldpage) {
					yield (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  ShowConversationListingModel? show_conversation = await listingShowConversation(page);
					  yield show_conversation!.items.items.isEmpty
						  ? (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : ShowConversationListingLoaded(  show_conversation:  show_conversation ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield ShowConversationListingError();
      }
    } else if (event is ShowConversationListingRefresh){
      try {
        if (currentState is ShowConversationListingUninitialized) {
		   if(isSearch){
		      ShowConversationListingModel? show_conversation = await listingSearchShowConversation(1);
              yield ShowConversationListingLoaded( show_conversation: show_conversation,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     ShowConversationListingModel? show_conversation = await listingShowConversation(1);
             yield ShowConversationListingLoaded( show_conversation: show_conversation,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is ShowConversationListingLoaded) {
		  if(isSearch){
		     ShowConversationListingModel? show_conversation = await listingSearchRefreshShowConversation();
              yield show_conversation!.items.items.isEmpty
              ? (currentState as ShowConversationListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowConversationListingLoaded(  show_conversation: show_conversation ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      ShowConversationListingModel? show_conversation = await listingRefreshShowConversation();
			   int deltaPage = show_conversation!.items.items.length ~/ (show_conversation!.tools.paging.total_rows/show_conversation!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield show_conversation!.items.items.isEmpty
              ? (currentState as ShowConversationListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowConversationListingLoaded(  show_conversation: show_conversation ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ShowConversationListingError();
      }

    }
  }



  bool hasReachedMax(ShowConversationState state) =>
      state is ShowConversationListingLoaded && state.hasReachedMax!;


  Future<ShowConversationListingModel?> listingShowConversation(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getShowConversationListAPI(url, page);
	/*
	var dt  = ShowConversationListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowConversationListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<ShowConversationListingModel?> listingRefreshShowConversation() async {
  
  
   ShowConversationListingModel? show_conversation = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllShowConversationList1();
    show_conversation  = await apiRepProvider!.getShowConversationListAPI(url, 1);
    return show_conversation;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ShowConversationListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowConversationListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<ShowConversationListingModel?> listingSearchShowConversation(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getShowConversationListSearchAPI(url, page);
	
	/*
	var dt  = ShowConversationListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowConversationListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<ShowConversationListingModel?> listingSearchRefreshShowConversation() async {
   ShowConversationListingModel? show_conversation = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllShowConversationList1();
    show_conversation  = await apiRepProvider!.getShowConversationListSearchAPI(url, 1);
    return show_conversation;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ShowConversationListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowConversationListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<ShowConversationListingModel> _loadAndSaveShowConversationListSearch(ShowConversationListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
	  list.items.items[i].item.pht = list.items.items[i].item.user_photo_url;
	  list.items.items[i].item.ttl = list.items.items[i].item.user_user_name;
    }
    return list;
 }


class  UserShowConversationListBottomLoader extends StatelessWidget {
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







  

