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

/** AUTOGENERATE OFF **/

class UserArbitrationsListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  UserArbitrationsListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  UserArbitrationsListBaseState createState() => UserArbitrationsListBaseState();
}

class  UserArbitrationsListBaseState extends State<UserArbitrationsListBase>{
  String title = 'User Arbitrations'; 
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
  UserArbitrationsListing? listing;

  UserArbitrationsListBaseState() {
   
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
     String arbitration_id = 'arbitration_id';
	 arbitration_id = arbitration_id.replaceAll('_id','');
     getPath = widget.url! + arbitration_id + 'page=%s';
	 
	listing = new UserArbitrationsListing(AppProvider.getApplication(context), getPath, false, UserArbitrationsListingUninitialized());
    listing!.add(UserArbitrationsList());
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
	
	 return BlocBuilder<UserArbitrationsListing, UserArbitrationsState>(
    //  cubit: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is UserArbitrationsListingUninitialized) {
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
					 valueColor: new AlwaysStoppedAnimation<Color>(
							 Colors.green),
				))
		  );
        }
        if (state is UserArbitrationsListingError) {
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
								  'User Arbitrations',
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
						child:
						Column(
							children: [
								Text('failed to ' + title),
								GestureDetector(
									onTap: (){
										listing!.add(UserArbitrationsListingRefresh());
									},
									child: Text('Retry.', style: TextStyle(color: Colors.red, fontSize: 35), ),
								)
							],
						)

					  )
		  );
         
        }
        if (state is UserArbitrationsListingLoaded) {
          if (state.user_arbitrations!.items.items.isEmpty) {
		  if (state.user_arbitrations!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.user_arbitrations!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.user_arbitrations!.listButton(context, widget.id!).length == 0){ 
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
								  'User Arbitrations',
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
																		text: "User Arbitrations ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																	


																//Text('User Arbitrations by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.user_arbitrations!.items.items.length? 
													state.user_arbitrations!.tools.paging.total_pages == state.user_arbitrations!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													PublicUserArbitrationsListBottomLoader()
															  : index == 0 ?
											   state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.user_arbitrations!.items.items.length, index)
											  :state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.user_arbitrations!.items.items.length-1, index);											

												// : state.user_arbitrations!.viewItem (state.user_arbitrations!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.user_arbitrations!.items.items.length
										: state.user_arbitrations!.items.items.length + 1,
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
							  child: Text('User Arbitrations', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.user_arbitrations!.items.items.length? 
																		state.user_arbitrations!.tools.paging.total_pages == state.user_arbitrations!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		PublicUserArbitrationsListBottomLoader()
																				  : index == 0 ?
																  state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.user_arbitrations!.items.items.length, index)
																  :state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.user_arbitrations!.items.items.length-1, index);
																	 // : state.user_arbitrations!.viewItem (state.user_arbitrations!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.user_arbitrations!.items.items.length
																	: state.user_arbitrations!.items.items.length + 1,
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
					//  floatingActionButton:  state.user_arbitrations!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'User Arbitrations',
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
																		text: "User Arbitrations ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																//Text('User Arbitrations by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.user_arbitrations!.items.items.length? 
													state.user_arbitrations!.tools.paging.total_pages == state.user_arbitrations!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													PublicUserArbitrationsListBottomLoader()
															  : index == 0 ?
											   state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.user_arbitrations!.items.items.length, index)
											  :state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.user_arbitrations!.items.items.length-1, index);											
											  // : state.user_arbitrations!.viewItem (state.user_arbitrations!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.user_arbitrations!.items.items.length
										: state.user_arbitrations!.items.items.length + 1,
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
							  child: Text('User Arbitrations', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.user_arbitrations!.items.items.length? 
																		state.user_arbitrations!.tools.paging.total_pages == state.user_arbitrations!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		PublicUserArbitrationsListBottomLoader()
																				  : index == 0 ?
																  state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.user_arbitrations!.items.items.length, index)
																  :state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.user_arbitrations!.items.items.length-1, index);
																	 // : state.user_arbitrations!.viewItem (state.user_arbitrations!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.user_arbitrations!.items.items.length
																	: state.user_arbitrations!.items.items.length + 1,
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
					  floatingActionButton:  state.user_arbitrations!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'User Arbitrations',
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
																		text: "User Arbitrations ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
															//	Text('User Arbitrations by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.user_arbitrations!.items.items.length? 
													state.user_arbitrations!.tools.paging.total_pages == state.user_arbitrations!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													PublicUserArbitrationsListBottomLoader()
															  : index == 0 ?
											   state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.user_arbitrations!.items.items.length, index)
											  :state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.user_arbitrations!.items.items.length-1, index);											
											  // : state.user_arbitrations!.viewItem (state.user_arbitrations!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.user_arbitrations!.items.items.length
										: state.user_arbitrations!.items.items.length + 1,
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
							  child: Text('User Arbitrations', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.user_arbitrations!.items.items.length? 
																		state.user_arbitrations!.tools.paging.total_pages == state.user_arbitrations!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		PublicUserArbitrationsListBottomLoader()
																				  : index == 0 ?
																  state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.user_arbitrations!.items.items.length, index)
																  :state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.user_arbitrations!.items.items.length-1, index);
																	 // : state.user_arbitrations!.viewItem (state.user_arbitrations!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.user_arbitrations!.items.items.length
																	: state.user_arbitrations!.items.items.length + 1,
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

								  return index >= state.user_arbitrations!.items.items.length? 
										state.user_arbitrations!.tools.paging.total_pages == state.user_arbitrations!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										PublicUserArbitrationsListBottomLoader()
									 			  : index == 0 ?
								  state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.user_arbitrations!.items.items.length, index)
								  :state.user_arbitrations!.viewItem1 (state.user_arbitrations!.items.items[index] , state.user_arbitrations!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.user_arbitrations!.items.items.length-1, index);
									 // : state.user_arbitrations!.viewItem (state.user_arbitrations!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.user_arbitrations!.items.items.length
									: state.user_arbitrations!.items.items.length + 1,
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
    listing!.add(UserArbitrationsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(UserArbitrationsList());
    }

  }
}




abstract class UserArbitrationsEvent extends Equatable {
   const UserArbitrationsEvent();
   @override
    List<Object> get props => [];
}

class UserArbitrationsList extends UserArbitrationsEvent {
  @override
  String toString() => 'UserArbitrationsList';
}

class UserArbitrationsListingRefresh extends UserArbitrationsEvent {
  @override
  String toString() => 'UserArbitrationsListingRefresh';
}

class UserArbitrationsListingChangeSearch extends UserArbitrationsEvent {
  @override
  String toString() => 'UserArbitrationsChangeSearch';
}


abstract class UserArbitrationsState extends Equatable {
   const UserArbitrationsState();
   @override
    List<Object> get props => [];
}

class UserArbitrationsListingUninitialized extends UserArbitrationsState {
  @override
  String toString() => 'UserArbitrationsListingUninitialized';
}

class UserArbitrationsListingError extends UserArbitrationsState {
  @override
  String toString() => 'UserArbitrationsListingError';
}

class UserArbitrationsListingLoaded extends UserArbitrationsState {
  final UserArbitrationsListingModel? user_arbitrations;
  final bool? hasReachedMax;
  final int?  page;

  UserArbitrationsListingLoaded({
    this.user_arbitrations,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [user_arbitrations!, hasReachedMax!, page!];
	
  UserArbitrationsListingLoaded copyWith({
    UserArbitrationsListingModel? user_arbitrations,
    bool? hasReachedMax,
    int? page,
  }) {
    return UserArbitrationsListingLoaded(
      user_arbitrations: user_arbitrations ?? this.user_arbitrations,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'UserArbitrationsListingLoaded  UserArbitrationsListing: ${ user_arbitrations!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class UserArbitrationsListing extends Bloc<UserArbitrationsEvent, UserArbitrationsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  UserArbitrationsListing(this.application, this.url, this.isSearch, UserArbitrationsState initialState):super(initialState);
  @override
  void dispose() {
   // super.dispose();
  }


  @override
	/*
 Stream<Transition<UserArbitrationsEvent, UserArbitrationsState>> transformEvents(
      Stream<UserArbitrationsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }

	 */

	EventTransformer<UserArbitrationsEvent> transform<UserArbitrationsEvent>(Duration duration) {
		return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
	}


  @override
  void onTransition(Transition<UserArbitrationsEvent, UserArbitrationsState> transition) {
    print(transition);
  }

  @override
  get initialState => UserArbitrationsListingUninitialized();

  @override

  Stream<UserArbitrationsState> mapEventToState(UserArbitrationsEvent event) async* {
    final currentState = state;
    if (event is UserArbitrationsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is UserArbitrationsListingUninitialized){
			  if(isSearch){
			     UserArbitrationsListingModel? user_arbitrations = await listingSearchUserArbitrations(1);
				  int deltaPage = user_arbitrations!.items.items.length ~/(user_arbitrations!.tools.paging.total_rows/user_arbitrations!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield user_arbitrations!.items.items.isEmpty ? (currentState as UserArbitrationsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :UserArbitrationsListingLoaded(user_arbitrations: user_arbitrations,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   UserArbitrationsListingModel? user_arbitrations = await listingUserArbitrations(1);
				   int deltaPage;
				   if(user_arbitrations!.tools.paging.total_pages != 0){
				      deltaPage = user_arbitrations!.items.items.length ~/(user_arbitrations!.tools.paging.total_rows/user_arbitrations!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield user_arbitrations!.items.items.isEmpty ? (currentState as UserArbitrationsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :UserArbitrationsListingLoaded(user_arbitrations: user_arbitrations,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield UserArbitrationsListingLoaded(user_arbitrations: user_arbitrations,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is UserArbitrationsListingLoaded) {
          //page++;
		  final oldpage = (currentState as UserArbitrationsListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as UserArbitrationsListingLoaded).page! + 1;
				  UserArbitrationsListingModel? user_arbitrations = await listingSearchUserArbitrations(page);
				 if ((currentState as UserArbitrationsListingLoaded).user_arbitrations!.tools.paging.total_pages == oldpage) {
					yield (currentState as UserArbitrationsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!user_arbitrations!.items.items.isEmpty){
						 (currentState as UserArbitrationsListingLoaded).user_arbitrations!.items.items.addAll(user_arbitrations!.items.items);
					  }
					  yield user_arbitrations!.items.items.isEmpty
						  ? (currentState as UserArbitrationsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : UserArbitrationsListingLoaded(  user_arbitrations:  (currentState as UserArbitrationsListingLoaded).user_arbitrations ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as UserArbitrationsListingLoaded).page! + 1;
				   if ((currentState as UserArbitrationsListingLoaded).user_arbitrations!.tools.paging.total_pages == oldpage) {
					yield (currentState as UserArbitrationsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  UserArbitrationsListingModel? user_arbitrations = await listingUserArbitrations(page);
					  yield user_arbitrations!.items.items.isEmpty
						  ? (currentState as UserArbitrationsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : UserArbitrationsListingLoaded(  user_arbitrations:  user_arbitrations ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield UserArbitrationsListingError();
      }
    } else if (event is UserArbitrationsListingRefresh){
      try {
        if (currentState is UserArbitrationsListingUninitialized) {
		   if(isSearch){
		      UserArbitrationsListingModel? user_arbitrations = await listingSearchUserArbitrations(1);
              yield UserArbitrationsListingLoaded( user_arbitrations: user_arbitrations,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     UserArbitrationsListingModel? user_arbitrations = await listingUserArbitrations(1);
             yield UserArbitrationsListingLoaded( user_arbitrations: user_arbitrations,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is UserArbitrationsListingLoaded) {
		  if(isSearch){
		     UserArbitrationsListingModel? user_arbitrations = await listingSearchRefreshUserArbitrations();
              yield user_arbitrations!.items.items.isEmpty
              ? (currentState as UserArbitrationsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserArbitrationsListingLoaded(  user_arbitrations: user_arbitrations ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      UserArbitrationsListingModel? user_arbitrations = await listingRefreshUserArbitrations();
			   int deltaPage = user_arbitrations!.items.items.length ~/ (user_arbitrations!.tools.paging.total_rows/user_arbitrations!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield user_arbitrations!.items.items.isEmpty
              ? (currentState as UserArbitrationsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserArbitrationsListingLoaded(  user_arbitrations: user_arbitrations ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield UserArbitrationsListingError();
      }

    }
  }



  bool hasReachedMax(UserArbitrationsState state) =>
      state is UserArbitrationsListingLoaded && state.hasReachedMax!;


  Future<UserArbitrationsListingModel?> listingUserArbitrations(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getUserArbitrationsListAPI(url, page);
	/*
	var dt  = UserArbitrationsListingModel(await apiRepProvider.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserArbitrationsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<UserArbitrationsListingModel?> listingRefreshUserArbitrations() async {
  
  
   UserArbitrationsListingModel? user_arbitrations = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllUserArbitrationsList1();
    user_arbitrations  = await apiRepProvider!.getUserArbitrationsListAPI(url, 1);
    return user_arbitrations;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = UserArbitrationsListingModel(await apiRepProvider.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserArbitrationsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<UserArbitrationsListingModel?> listingSearchUserArbitrations(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getUserArbitrationsListSearchAPI(url, page);
	
	/*
	var dt  = UserArbitrationsListingModel(await apiRepProvider.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserArbitrationsListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<UserArbitrationsListingModel?> listingSearchRefreshUserArbitrations() async {
   UserArbitrationsListingModel? user_arbitrations = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllUserArbitrationsList1();
    user_arbitrations  = await apiRepProvider!.getUserArbitrationsListSearchAPI(url, 1);
    return user_arbitrations;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = UserArbitrationsListingModel(await apiRepProvider.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserArbitrationsListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<UserArbitrationsListingModel> _loadAndSaveUserArbitrationsListSearch(UserArbitrationsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.plaintiff_description;
	  list.items.items[i].item.sbttl = list.items.items[i].item.plaintiff_wishes;
	  list.items.items[i].item.sbttl = list.items.items[i].item.defendant_description;
	  list.items.items[i].item.sbttl = list.items.items[i].item.defendant_wishes;
	  list.items.items[i].item.sbttl = list.items.items[i].item.analysis;
    }
    return list;
 }


class  PublicUserArbitrationsListBottomLoader extends StatelessWidget {
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







  

