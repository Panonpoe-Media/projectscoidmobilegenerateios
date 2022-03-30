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



class CheckoutItemsListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  CheckoutItemsListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  CheckoutItemsListBaseState createState() => CheckoutItemsListBaseState();
}

class  CheckoutItemsListBaseState extends State<CheckoutItemsListBase>{
  String title = 'Checkout Items'; 
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
  CheckoutItemsListing? listing;

  CheckoutItemsListBaseState() {
   
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
     String cart_id = 'cart_id';
	 cart_id = cart_id.replaceAll('_id','');
     getPath = widget.url! + cart_id + 'page=%s';
	 
	listing =      CheckoutItemsListing(AppProvider.getApplication(context), getPath, false, CheckoutItemsListingUninitialized());
    listing!.add(CheckoutItemsList());
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
	
	 return BlocBuilder<CheckoutItemsListing, CheckoutItemsState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is CheckoutItemsListingUninitialized) {
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
        if (state is CheckoutItemsListingError) {
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
								  'Checkout Items',
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
        if (state is CheckoutItemsListingLoaded) {
          if (state.checkout_items!.items.items.isEmpty) {
		  if (state.checkout_items!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.checkout_items!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.checkout_items!.listButton(context, widget.id!).length == 0){ 
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
								  'Checkout Items',
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
																		text: "Checkout Items ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																	


																//Text('Checkout Items by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.checkout_items!.items.items.length? 
													state.checkout_items!.tools.paging.total_pages == state.checkout_items!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserCheckoutItemsListBottomLoader()
															  : index == 0 ?
											   state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.checkout_items!.items.items.length, index)
											  :state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.checkout_items!.items.items.length-1, index);											

												// : state.checkout_items!.viewItem (state.checkout_items!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.checkout_items!.items.items.length
										: state.checkout_items!.items.items.length + 1,
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
							  child: Text('Checkout Items', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.checkout_items!.items.items.length? 
																		state.checkout_items!.tools.paging.total_pages == state.checkout_items!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserCheckoutItemsListBottomLoader()
																				  : index == 0 ?
																  state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.checkout_items!.items.items.length, index)
																  :state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.checkout_items!.items.items.length-1, index);
																	 // : state.checkout_items!.viewItem (state.checkout_items!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.checkout_items!.items.items.length
																	: state.checkout_items!.items.items.length + 1,
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
					//  floatingActionButton:  state.checkout_items!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Checkout Items',
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
																		text: "Checkout Items ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																//Text('Checkout Items by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.checkout_items!.items.items.length? 
													state.checkout_items!.tools.paging.total_pages == state.checkout_items!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserCheckoutItemsListBottomLoader()
															  : index == 0 ?
											   state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.checkout_items!.items.items.length, index)
											  :state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.checkout_items!.items.items.length-1, index);											
											  // : state.checkout_items!.viewItem (state.checkout_items!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.checkout_items!.items.items.length
										: state.checkout_items!.items.items.length + 1,
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
							  child: Text('Checkout Items', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.checkout_items!.items.items.length? 
																		state.checkout_items!.tools.paging.total_pages == state.checkout_items!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserCheckoutItemsListBottomLoader()
																				  : index == 0 ?
																  state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.checkout_items!.items.items.length, index)
																  :state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.checkout_items!.items.items.length-1, index);
																	 // : state.checkout_items!.viewItem (state.checkout_items!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.checkout_items!.items.items.length
																	: state.checkout_items!.items.items.length + 1,
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
					  floatingActionButton:  state.checkout_items!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Checkout Items',
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
																		text: "Checkout Items ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
															//	Text('Checkout Items by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.checkout_items!.items.items.length? 
													state.checkout_items!.tools.paging.total_pages == state.checkout_items!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserCheckoutItemsListBottomLoader()
															  : index == 0 ?
											   state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.checkout_items!.items.items.length, index)
											  :state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.checkout_items!.items.items.length-1, index);											
											  // : state.checkout_items!.viewItem (state.checkout_items!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.checkout_items!.items.items.length
										: state.checkout_items!.items.items.length + 1,
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
							  child: Text('Checkout Items', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.checkout_items!.items.items.length? 
																		state.checkout_items!.tools.paging.total_pages == state.checkout_items!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserCheckoutItemsListBottomLoader()
																				  : index == 0 ?
																  state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.checkout_items!.items.items.length, index)
																  :state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.checkout_items!.items.items.length-1, index);
																	 // : state.checkout_items!.viewItem (state.checkout_items!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.checkout_items!.items.items.length
																	: state.checkout_items!.items.items.length + 1,
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

								  return index >= state.checkout_items!.items.items.length? 
										state.checkout_items!.tools.paging.total_pages == state.checkout_items!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserCheckoutItemsListBottomLoader()
									 			  : index == 0 ?
								  state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.checkout_items!.items.items.length, index)
								  :state.checkout_items!.viewItem1 (state.checkout_items!.items.items[index] , state.checkout_items!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.checkout_items!.items.items.length-1, index);
									 // : state.checkout_items!.viewItem (state.checkout_items!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.checkout_items!.items.items.length
									: state.checkout_items!.items.items.length + 1,
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
    listing!.add(CheckoutItemsListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(CheckoutItemsList());
    }

  }
}




abstract class CheckoutItemsEvent extends Equatable {
   const CheckoutItemsEvent();
   @override
    List<Object> get props => [];
}

class CheckoutItemsList extends CheckoutItemsEvent {
  @override
  String toString() => 'CheckoutItemsList';
}

class CheckoutItemsListingRefresh extends CheckoutItemsEvent {
  @override
  String toString() => 'CheckoutItemsListingRefresh';
}

class CheckoutItemsListingChangeSearch extends CheckoutItemsEvent {
  @override
  String toString() => 'CheckoutItemsChangeSearch';
}


abstract class CheckoutItemsState extends Equatable {
   const CheckoutItemsState();
   @override
    List<Object> get props => [];
}

class CheckoutItemsListingUninitialized extends CheckoutItemsState {
  @override
  String toString() => 'CheckoutItemsListingUninitialized';
}

class CheckoutItemsListingError extends CheckoutItemsState {
  @override
  String toString() => 'CheckoutItemsListingError';
}

class CheckoutItemsListingLoaded extends CheckoutItemsState {
  final CheckoutItemsListingModel? checkout_items;
  final bool? hasReachedMax;
  final int?  page;

  CheckoutItemsListingLoaded({
    this.checkout_items,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [checkout_items!, hasReachedMax!, page!];
	
  CheckoutItemsListingLoaded copyWith({
    CheckoutItemsListingModel? checkout_items,
    bool? hasReachedMax,
    int? page,
  }) {
    return CheckoutItemsListingLoaded(
      checkout_items: checkout_items ?? this.checkout_items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'CheckoutItemsListingLoaded  CheckoutItemsListing: ${ checkout_items!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class CheckoutItemsListing extends Bloc<CheckoutItemsEvent, CheckoutItemsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  CheckoutItemsListing(this.application, this.url, this.isSearch, CheckoutItemsState initialState):
  super(initialState){
   on<CheckoutItemsList>(_CheckoutItemsListEvent);
	 on<CheckoutItemsListingRefresh>(_CheckoutItemsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<CheckoutItemsEvent, CheckoutItemsState>> transformEvents(
      Stream<CheckoutItemsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<CheckoutItemsEvent> transform<CheckoutItemsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<CheckoutItemsEvent, CheckoutItemsState> transition) {
    print(transition);
  }


  void _CheckoutItemsListEvent(CheckoutItemsList event, Emitter<CheckoutItemsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is CheckoutItemsListingUninitialized){
			  if(isSearch){
			     CheckoutItemsListingModel? checkout_items = await listingSearchCheckoutItems(1);
				  int deltaPage = checkout_items!.items.items.length ~/(checkout_items!.tools.paging.total_rows/checkout_items!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( checkout_items!.items.items.isEmpty ? (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CheckoutItemsListingLoaded(checkout_items: checkout_items,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				   CheckoutItemsListingModel? checkout_items = await listingCheckoutItems(1);
				   int deltaPage;
				   if(checkout_items!.tools.paging.total_pages != 0){
				      deltaPage = checkout_items!.items.items.length ~/(checkout_items!.tools.paging.total_rows/checkout_items!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   return emit ( checkout_items!.items.items.isEmpty ? (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CheckoutItemsListingLoaded(checkout_items: checkout_items,
					  hasReachedMax: false,
					  page: deltaPage));
					  
					  }else{
					    deltaPage = 0;
						 return emit ( CheckoutItemsListingLoaded(checkout_items: checkout_items,
					  hasReachedMax: false,
					  page: deltaPage));
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is CheckoutItemsListingLoaded) {
          //page++;
		  final oldpage = (currentState as CheckoutItemsListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as CheckoutItemsListingLoaded).page! + 1;
				  CheckoutItemsListingModel? checkout_items = await listingSearchCheckoutItems(page);
				 if ((currentState as CheckoutItemsListingLoaded).checkout_items!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!checkout_items!.items.items.isEmpty){
						 (currentState as CheckoutItemsListingLoaded).checkout_items!.items.items.addAll(checkout_items!.items.items);
					  }
					  return emit ( checkout_items!.items.items.isEmpty
						  ? (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : CheckoutItemsListingLoaded(  checkout_items:  (currentState as CheckoutItemsListingLoaded).checkout_items ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
				  final page = (currentState as CheckoutItemsListingLoaded).page! + 1;
				   if ((currentState as CheckoutItemsListingLoaded).checkout_items!.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  CheckoutItemsListingModel? checkout_items = await listingCheckoutItems(page);
					 return emit (checkout_items!.items.items.isEmpty
						  ? (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : CheckoutItemsListingLoaded(  checkout_items:  checkout_items ,
												  hasReachedMax: false,
												  page: page,));
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        return emit ( CheckoutItemsListingError());
      }
    }
  }

  void _CheckoutItemsListingRefreshEvent(CheckoutItemsListingRefresh event, Emitter<CheckoutItemsState> emit)async{
  final currentState = state;
   try {
        if (currentState is CheckoutItemsListingUninitialized) {
		   if(isSearch){
		      CheckoutItemsListingModel? checkout_items = await listingSearchCheckoutItems(1);
              return emit ( CheckoutItemsListingLoaded( checkout_items: checkout_items,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
		     CheckoutItemsListingModel? checkout_items = await listingCheckoutItems(1);
             return emit ( CheckoutItemsListingLoaded( checkout_items: checkout_items,
                   hasReachedMax: false,
                   page: 1 ));
				   
		   }

        }

        if (currentState is CheckoutItemsListingLoaded) {
		  if(isSearch){
		     CheckoutItemsListingModel? checkout_items = await listingSearchRefreshCheckoutItems();
              return emit ( checkout_items!.items.items.isEmpty
              ? (currentState as CheckoutItemsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CheckoutItemsListingLoaded(  checkout_items: checkout_items ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
		      CheckoutItemsListingModel? checkout_items = await listingRefreshCheckoutItems();
			   int deltaPage = checkout_items!.items.items.length ~/ (checkout_items!.tools.paging.total_rows/checkout_items!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              return emit (checkout_items!.items.items.isEmpty
              ? (currentState as CheckoutItemsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CheckoutItemsListingLoaded(  checkout_items: checkout_items ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (CheckoutItemsListingError());
      }
  }



  @override
  get initialState => CheckoutItemsListingUninitialized();

  @override

  Stream<CheckoutItemsState> mapEventToState(CheckoutItemsEvent event) async* {
    final currentState = state;
    if (event is CheckoutItemsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is CheckoutItemsListingUninitialized){
			  if(isSearch){
			     CheckoutItemsListingModel? checkout_items = await listingSearchCheckoutItems(1);
				  int deltaPage = checkout_items!.items.items.length ~/(checkout_items!.tools.paging.total_rows/checkout_items!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield checkout_items!.items.items.isEmpty ? (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CheckoutItemsListingLoaded(checkout_items: checkout_items,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   CheckoutItemsListingModel? checkout_items = await listingCheckoutItems(1);
				   int deltaPage;
				   if(checkout_items!.tools.paging.total_pages != 0){
				      deltaPage = checkout_items!.items.items.length ~/(checkout_items!.tools.paging.total_rows/checkout_items!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield checkout_items!.items.items.isEmpty ? (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CheckoutItemsListingLoaded(checkout_items: checkout_items,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield CheckoutItemsListingLoaded(checkout_items: checkout_items,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is CheckoutItemsListingLoaded) {
          //page++;
		  final oldpage = (currentState as CheckoutItemsListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as CheckoutItemsListingLoaded).page! + 1;
				  CheckoutItemsListingModel? checkout_items = await listingSearchCheckoutItems(page);
				 if ((currentState as CheckoutItemsListingLoaded).checkout_items!.tools.paging.total_pages == oldpage) {
					yield (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!checkout_items!.items.items.isEmpty){
						 (currentState as CheckoutItemsListingLoaded).checkout_items!.items.items.addAll(checkout_items!.items.items);
					  }
					  yield checkout_items!.items.items.isEmpty
						  ? (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : CheckoutItemsListingLoaded(  checkout_items:  (currentState as CheckoutItemsListingLoaded).checkout_items ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as CheckoutItemsListingLoaded).page! + 1;
				   if ((currentState as CheckoutItemsListingLoaded).checkout_items!.tools.paging.total_pages == oldpage) {
					yield (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  CheckoutItemsListingModel? checkout_items = await listingCheckoutItems(page);
					  yield checkout_items!.items.items.isEmpty
						  ? (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : CheckoutItemsListingLoaded(  checkout_items:  checkout_items ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield CheckoutItemsListingError();
      }
    } else if (event is CheckoutItemsListingRefresh){
      try {
        if (currentState is CheckoutItemsListingUninitialized) {
		   if(isSearch){
		      CheckoutItemsListingModel? checkout_items = await listingSearchCheckoutItems(1);
              yield CheckoutItemsListingLoaded( checkout_items: checkout_items,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     CheckoutItemsListingModel? checkout_items = await listingCheckoutItems(1);
             yield CheckoutItemsListingLoaded( checkout_items: checkout_items,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is CheckoutItemsListingLoaded) {
		  if(isSearch){
		     CheckoutItemsListingModel? checkout_items = await listingSearchRefreshCheckoutItems();
              yield checkout_items!.items.items.isEmpty
              ? (currentState as CheckoutItemsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CheckoutItemsListingLoaded(  checkout_items: checkout_items ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      CheckoutItemsListingModel? checkout_items = await listingRefreshCheckoutItems();
			   int deltaPage = checkout_items!.items.items.length ~/ (checkout_items!.tools.paging.total_rows/checkout_items!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield checkout_items!.items.items.isEmpty
              ? (currentState as CheckoutItemsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CheckoutItemsListingLoaded(  checkout_items: checkout_items ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield CheckoutItemsListingError();
      }

    }
  }



  bool hasReachedMax(CheckoutItemsState state) =>
      state is CheckoutItemsListingLoaded && state.hasReachedMax!;


  Future<CheckoutItemsListingModel?> listingCheckoutItems(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getCheckoutItemsListAPI(url, page);
	/*
	var dt  = CheckoutItemsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCheckoutItemsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<CheckoutItemsListingModel?> listingRefreshCheckoutItems() async {
  
  
   CheckoutItemsListingModel? checkout_items = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllCheckoutItemsList1();
    checkout_items  = await apiRepProvider!.getCheckoutItemsListAPI(url, 1);
    return checkout_items;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = CheckoutItemsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCheckoutItemsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<CheckoutItemsListingModel?> listingSearchCheckoutItems(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getCheckoutItemsListSearchAPI(url, page);
	
	/*
	var dt  = CheckoutItemsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCheckoutItemsListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<CheckoutItemsListingModel?> listingSearchRefreshCheckoutItems() async {
   CheckoutItemsListingModel? checkout_items = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllCheckoutItemsList1();
    checkout_items  = await apiRepProvider!.getCheckoutItemsListSearchAPI(url, 1);
    return checkout_items;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = CheckoutItemsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCheckoutItemsListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<CheckoutItemsListingModel> _loadAndSaveCheckoutItemsListSearch(CheckoutItemsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
    }
    return list;
 }


class  UserCheckoutItemsListBottomLoader extends StatelessWidget {
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







  

