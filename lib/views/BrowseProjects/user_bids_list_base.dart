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



class UserBidsListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  UserBidsListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  UserBidsListBaseState createState() => UserBidsListBaseState();
}

class  UserBidsListBaseState extends State<UserBidsListBase>{
  String title = 'User Bids'; 
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
  UserBidsListing? listing;

  UserBidsListBaseState() {
   
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
     String bid_id = 'bid_id';
	 bid_id = bid_id.replaceAll('_id','');
     getPath = widget.url! + bid_id + 'page=%s';
	 
	listing =      UserBidsListing(AppProvider.getApplication(context), getPath, false, UserBidsListingUninitialized());
    listing!.add(UserBidsList());
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
	
	 return BlocBuilder<UserBidsListing, UserBidsState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is UserBidsListingUninitialized) {
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
        if (state is UserBidsListingError) {
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
								  'User Bids',
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
        if (state is UserBidsListingLoaded) {
          if (state.user_bids!.items.items.isEmpty) {
		  if (state.user_bids!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.user_bids!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.user_bids!.listButton(context, widget.id!).length == 0){ 
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
								  'User Bids',
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
																		text: "User Bids ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																	


																//Text('User Bids by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.user_bids!.items.items.length? 
													state.user_bids!.tools.paging.total_pages == state.user_bids!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserUserBidsListBottomLoader()
															  : index == 0 ?
											   state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.user_bids!.items.items.length, index)
											  :state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.user_bids!.items.items.length-1, index);											

												// : state.user_bids!.viewItem (state.user_bids!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.user_bids!.items.items.length
										: state.user_bids!.items.items.length + 1,
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
							  child: Text('User Bids', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.user_bids!.items.items.length? 
																		state.user_bids!.tools.paging.total_pages == state.user_bids!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserUserBidsListBottomLoader()
																				  : index == 0 ?
																  state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.user_bids!.items.items.length, index)
																  :state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.user_bids!.items.items.length-1, index);
																	 // : state.user_bids!.viewItem (state.user_bids!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.user_bids!.items.items.length
																	: state.user_bids!.items.items.length + 1,
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
					//  floatingActionButton:  state.user_bids!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'User Bids',
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
																		text: "User Bids ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																//Text('User Bids by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.user_bids!.items.items.length? 
													state.user_bids!.tools.paging.total_pages == state.user_bids!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserUserBidsListBottomLoader()
															  : index == 0 ?
											   state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.user_bids!.items.items.length, index)
											  :state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.user_bids!.items.items.length-1, index);											
											  // : state.user_bids!.viewItem (state.user_bids!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.user_bids!.items.items.length
										: state.user_bids!.items.items.length + 1,
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
							  child: Text('User Bids', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.user_bids!.items.items.length? 
																		state.user_bids!.tools.paging.total_pages == state.user_bids!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserUserBidsListBottomLoader()
																				  : index == 0 ?
																  state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.user_bids!.items.items.length, index)
																  :state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.user_bids!.items.items.length-1, index);
																	 // : state.user_bids!.viewItem (state.user_bids!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.user_bids!.items.items.length
																	: state.user_bids!.items.items.length + 1,
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
					  floatingActionButton:  state.user_bids!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'User Bids',
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
																		text: "User Bids ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
															//	Text('User Bids by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.user_bids!.items.items.length? 
													state.user_bids!.tools.paging.total_pages == state.user_bids!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserUserBidsListBottomLoader()
															  : index == 0 ?
											   state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.user_bids!.items.items.length, index)
											  :state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.user_bids!.items.items.length-1, index);											
											  // : state.user_bids!.viewItem (state.user_bids!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.user_bids!.items.items.length
										: state.user_bids!.items.items.length + 1,
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
							  child: Text('User Bids', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.user_bids!.items.items.length? 
																		state.user_bids!.tools.paging.total_pages == state.user_bids!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserUserBidsListBottomLoader()
																				  : index == 0 ?
																  state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.user_bids!.items.items.length, index)
																  :state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.user_bids!.items.items.length-1, index);
																	 // : state.user_bids!.viewItem (state.user_bids!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.user_bids!.items.items.length
																	: state.user_bids!.items.items.length + 1,
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

								  return index >= state.user_bids!.items.items.length? 
										state.user_bids!.tools.paging.total_pages == state.user_bids!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserUserBidsListBottomLoader()
									 			  : index == 0 ?
								  state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.user_bids!.items.items.length, index)
								  :state.user_bids!.viewItem1 (state.user_bids!.items.items[index] , state.user_bids!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.user_bids!.items.items.length-1, index);
									 // : state.user_bids!.viewItem (state.user_bids!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.user_bids!.items.items.length
									: state.user_bids!.items.items.length + 1,
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
    listing!.add(UserBidsListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(UserBidsList());
    }

  }
}




abstract class UserBidsEvent extends Equatable {
   const UserBidsEvent();
   @override
    List<Object> get props => [];
}

class UserBidsList extends UserBidsEvent {
  @override
  String toString() => 'UserBidsList';
}

class UserBidsListingRefresh extends UserBidsEvent {
  @override
  String toString() => 'UserBidsListingRefresh';
}

class UserBidsListingChangeSearch extends UserBidsEvent {
  @override
  String toString() => 'UserBidsChangeSearch';
}


abstract class UserBidsState extends Equatable {
   const UserBidsState();
   @override
    List<Object> get props => [];
}

class UserBidsListingUninitialized extends UserBidsState {
  @override
  String toString() => 'UserBidsListingUninitialized';
}

class UserBidsListingError extends UserBidsState {
  @override
  String toString() => 'UserBidsListingError';
}

class UserBidsListingLoaded extends UserBidsState {
  final UserBidsListingModel? user_bids;
  final bool? hasReachedMax;
  final int?  page;

  UserBidsListingLoaded({
    this.user_bids,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [user_bids!, hasReachedMax!, page!];
	
  UserBidsListingLoaded copyWith({
    UserBidsListingModel? user_bids,
    bool? hasReachedMax,
    int? page,
  }) {
    return UserBidsListingLoaded(
      user_bids: user_bids ?? this.user_bids,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'UserBidsListingLoaded  UserBidsListing: ${ user_bids!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class UserBidsListing extends Bloc<UserBidsEvent, UserBidsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  UserBidsListing(this.application, this.url, this.isSearch, UserBidsState initialState):
  super(initialState){
   on<UserBidsList>(_UserBidsListEvent);
	 on<UserBidsListingRefresh>(_UserBidsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<UserBidsEvent, UserBidsState>> transformEvents(
      Stream<UserBidsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<UserBidsEvent> transform<UserBidsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<UserBidsEvent, UserBidsState> transition) {
    print(transition);
  }


  void _UserBidsListEvent(UserBidsList event, Emitter<UserBidsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is UserBidsListingUninitialized){
			  if(isSearch){
			     UserBidsListingModel? user_bids = await listingSearchUserBids(1);
				  int deltaPage = user_bids!.items.items.length ~/(user_bids!.tools.paging.total_rows/user_bids!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( user_bids!.items.items.isEmpty ? (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :UserBidsListingLoaded(user_bids: user_bids,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				   UserBidsListingModel? user_bids = await listingUserBids(1);
				   int deltaPage;
				   if(user_bids!.tools.paging.total_pages != 0){
				      deltaPage = user_bids!.items.items.length ~/(user_bids!.tools.paging.total_rows/user_bids!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   return emit ( user_bids!.items.items.isEmpty ? (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :UserBidsListingLoaded(user_bids: user_bids,
					  hasReachedMax: false,
					  page: deltaPage));
					  
					  }else{
					    deltaPage = 0;
						 return emit ( UserBidsListingLoaded(user_bids: user_bids,
					  hasReachedMax: false,
					  page: deltaPage));
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is UserBidsListingLoaded) {
          //page++;
		  final oldpage = (currentState as UserBidsListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as UserBidsListingLoaded).page! + 1;
				  UserBidsListingModel? user_bids = await listingSearchUserBids(page);
				 if ((currentState as UserBidsListingLoaded).user_bids!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!user_bids!.items.items.isEmpty){
						 (currentState as UserBidsListingLoaded).user_bids!.items.items.addAll(user_bids!.items.items);
					  }
					  return emit ( user_bids!.items.items.isEmpty
						  ? (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : UserBidsListingLoaded(  user_bids:  (currentState as UserBidsListingLoaded).user_bids ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
				  final page = (currentState as UserBidsListingLoaded).page! + 1;
				   if ((currentState as UserBidsListingLoaded).user_bids!.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  UserBidsListingModel? user_bids = await listingUserBids(page);
					 return emit (user_bids!.items.items.isEmpty
						  ? (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : UserBidsListingLoaded(  user_bids:  user_bids ,
												  hasReachedMax: false,
												  page: page,));
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        return emit ( UserBidsListingError());
      }
    }
  }

  void _UserBidsListingRefreshEvent(UserBidsListingRefresh event, Emitter<UserBidsState> emit)async{
  final currentState = state;
   try {
        if (currentState is UserBidsListingUninitialized) {
		   if(isSearch){
		      UserBidsListingModel? user_bids = await listingSearchUserBids(1);
              return emit ( UserBidsListingLoaded( user_bids: user_bids,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
		     UserBidsListingModel? user_bids = await listingUserBids(1);
             return emit ( UserBidsListingLoaded( user_bids: user_bids,
                   hasReachedMax: false,
                   page: 1 ));
				   
		   }

        }

        if (currentState is UserBidsListingLoaded) {
		  if(isSearch){
		     UserBidsListingModel? user_bids = await listingSearchRefreshUserBids();
              return emit ( user_bids!.items.items.isEmpty
              ? (currentState as UserBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserBidsListingLoaded(  user_bids: user_bids ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
		      UserBidsListingModel? user_bids = await listingRefreshUserBids();
			   int deltaPage = user_bids!.items.items.length ~/ (user_bids!.tools.paging.total_rows/user_bids!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              return emit (user_bids!.items.items.isEmpty
              ? (currentState as UserBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserBidsListingLoaded(  user_bids: user_bids ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (UserBidsListingError());
      }
  }



  @override
  get initialState => UserBidsListingUninitialized();

  @override

  Stream<UserBidsState> mapEventToState(UserBidsEvent event) async* {
    final currentState = state;
    if (event is UserBidsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is UserBidsListingUninitialized){
			  if(isSearch){
			     UserBidsListingModel? user_bids = await listingSearchUserBids(1);
				  int deltaPage = user_bids!.items.items.length ~/(user_bids!.tools.paging.total_rows/user_bids!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield user_bids!.items.items.isEmpty ? (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :UserBidsListingLoaded(user_bids: user_bids,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   UserBidsListingModel? user_bids = await listingUserBids(1);
				   int deltaPage;
				   if(user_bids!.tools.paging.total_pages != 0){
				      deltaPage = user_bids!.items.items.length ~/(user_bids!.tools.paging.total_rows/user_bids!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield user_bids!.items.items.isEmpty ? (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :UserBidsListingLoaded(user_bids: user_bids,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield UserBidsListingLoaded(user_bids: user_bids,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is UserBidsListingLoaded) {
          //page++;
		  final oldpage = (currentState as UserBidsListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as UserBidsListingLoaded).page! + 1;
				  UserBidsListingModel? user_bids = await listingSearchUserBids(page);
				 if ((currentState as UserBidsListingLoaded).user_bids!.tools.paging.total_pages == oldpage) {
					yield (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!user_bids!.items.items.isEmpty){
						 (currentState as UserBidsListingLoaded).user_bids!.items.items.addAll(user_bids!.items.items);
					  }
					  yield user_bids!.items.items.isEmpty
						  ? (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : UserBidsListingLoaded(  user_bids:  (currentState as UserBidsListingLoaded).user_bids ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as UserBidsListingLoaded).page! + 1;
				   if ((currentState as UserBidsListingLoaded).user_bids!.tools.paging.total_pages == oldpage) {
					yield (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  UserBidsListingModel? user_bids = await listingUserBids(page);
					  yield user_bids!.items.items.isEmpty
						  ? (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : UserBidsListingLoaded(  user_bids:  user_bids ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield UserBidsListingError();
      }
    } else if (event is UserBidsListingRefresh){
      try {
        if (currentState is UserBidsListingUninitialized) {
		   if(isSearch){
		      UserBidsListingModel? user_bids = await listingSearchUserBids(1);
              yield UserBidsListingLoaded( user_bids: user_bids,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     UserBidsListingModel? user_bids = await listingUserBids(1);
             yield UserBidsListingLoaded( user_bids: user_bids,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is UserBidsListingLoaded) {
		  if(isSearch){
		     UserBidsListingModel? user_bids = await listingSearchRefreshUserBids();
              yield user_bids!.items.items.isEmpty
              ? (currentState as UserBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserBidsListingLoaded(  user_bids: user_bids ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      UserBidsListingModel? user_bids = await listingRefreshUserBids();
			   int deltaPage = user_bids!.items.items.length ~/ (user_bids!.tools.paging.total_rows/user_bids!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield user_bids!.items.items.isEmpty
              ? (currentState as UserBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserBidsListingLoaded(  user_bids: user_bids ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield UserBidsListingError();
      }

    }
  }



  bool hasReachedMax(UserBidsState state) =>
      state is UserBidsListingLoaded && state.hasReachedMax!;


  Future<UserBidsListingModel?> listingUserBids(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getUserBidsListAPI(url, page);
	/*
	var dt  = UserBidsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserBidsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<UserBidsListingModel?> listingRefreshUserBids() async {
  
  
   UserBidsListingModel? user_bids = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllUserBidsList1();
    user_bids  = await apiRepProvider!.getUserBidsListAPI(url, 1);
    return user_bids;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = UserBidsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserBidsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<UserBidsListingModel?> listingSearchUserBids(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getUserBidsListSearchAPI(url, page);
	
	/*
	var dt  = UserBidsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserBidsListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<UserBidsListingModel?> listingSearchRefreshUserBids() async {
   UserBidsListingModel? user_bids = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllUserBidsList1();
    user_bids  = await apiRepProvider!.getUserBidsListSearchAPI(url, 1);
    return user_bids;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = UserBidsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserBidsListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<UserBidsListingModel> _loadAndSaveUserBidsListSearch(UserBidsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.pht = list.items.items[i].item.worker_photo_url;
	  list.items.items[i].item.ttl = list.items.items[i].item.worker_user_name;
    }
    return list;
 }


class  UserUserBidsListBottomLoader extends StatelessWidget {
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







  

