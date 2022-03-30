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



class ProductReviewsListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ProductReviewsListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ProductReviewsListBaseState createState() => ProductReviewsListBaseState();
}

class  ProductReviewsListBaseState extends State<ProductReviewsListBase>{
  String title = 'Product Reviews'; 
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
  ProductReviewsListing? listing;

  ProductReviewsListBaseState() {
   
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
     String order_item_id = 'order_item_id';
	 order_item_id = order_item_id.replaceAll('_id','');
     getPath = widget.url! + order_item_id + 'page=%s';
	 
	listing =      ProductReviewsListing(AppProvider.getApplication(context), getPath, false, ProductReviewsListingUninitialized());
    listing!.add(ProductReviewsList());
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
	
	 return BlocBuilder<ProductReviewsListing, ProductReviewsState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is ProductReviewsListingUninitialized) {
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
        if (state is ProductReviewsListingError) {
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
								  'Product Reviews',
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
        if (state is ProductReviewsListingLoaded) {
          if (state.product_reviews!.items.items.isEmpty) {
		  if (state.product_reviews!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.product_reviews!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.product_reviews!.listButton(context, widget.id!).length == 0){ 
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
								  'Product Reviews',
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
																		text: "Product Reviews ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																	


																//Text('Product Reviews by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.product_reviews!.items.items.length? 
													state.product_reviews!.tools.paging.total_pages == state.product_reviews!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserProductReviewsListBottomLoader()
															  : index == 0 ?
											   state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.product_reviews!.items.items.length, index)
											  :state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.product_reviews!.items.items.length-1, index);											

												// : state.product_reviews!.viewItem (state.product_reviews!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.product_reviews!.items.items.length
										: state.product_reviews!.items.items.length + 1,
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
							  child: Text('Product Reviews', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.product_reviews!.items.items.length? 
																		state.product_reviews!.tools.paging.total_pages == state.product_reviews!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserProductReviewsListBottomLoader()
																				  : index == 0 ?
																  state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.product_reviews!.items.items.length, index)
																  :state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.product_reviews!.items.items.length-1, index);
																	 // : state.product_reviews!.viewItem (state.product_reviews!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.product_reviews!.items.items.length
																	: state.product_reviews!.items.items.length + 1,
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
					//  floatingActionButton:  state.product_reviews!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Product Reviews',
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
																		text: "Product Reviews ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																//Text('Product Reviews by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.product_reviews!.items.items.length? 
													state.product_reviews!.tools.paging.total_pages == state.product_reviews!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserProductReviewsListBottomLoader()
															  : index == 0 ?
											   state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.product_reviews!.items.items.length, index)
											  :state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.product_reviews!.items.items.length-1, index);											
											  // : state.product_reviews!.viewItem (state.product_reviews!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.product_reviews!.items.items.length
										: state.product_reviews!.items.items.length + 1,
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
							  child: Text('Product Reviews', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.product_reviews!.items.items.length? 
																		state.product_reviews!.tools.paging.total_pages == state.product_reviews!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserProductReviewsListBottomLoader()
																				  : index == 0 ?
																  state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.product_reviews!.items.items.length, index)
																  :state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.product_reviews!.items.items.length-1, index);
																	 // : state.product_reviews!.viewItem (state.product_reviews!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.product_reviews!.items.items.length
																	: state.product_reviews!.items.items.length + 1,
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
					  floatingActionButton:  state.product_reviews!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Product Reviews',
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
																		text: "Product Reviews ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
															//	Text('Product Reviews by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.product_reviews!.items.items.length? 
													state.product_reviews!.tools.paging.total_pages == state.product_reviews!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserProductReviewsListBottomLoader()
															  : index == 0 ?
											   state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.product_reviews!.items.items.length, index)
											  :state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.product_reviews!.items.items.length-1, index);											
											  // : state.product_reviews!.viewItem (state.product_reviews!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.product_reviews!.items.items.length
										: state.product_reviews!.items.items.length + 1,
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
							  child: Text('Product Reviews', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.product_reviews!.items.items.length? 
																		state.product_reviews!.tools.paging.total_pages == state.product_reviews!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserProductReviewsListBottomLoader()
																				  : index == 0 ?
																  state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.product_reviews!.items.items.length, index)
																  :state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.product_reviews!.items.items.length-1, index);
																	 // : state.product_reviews!.viewItem (state.product_reviews!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.product_reviews!.items.items.length
																	: state.product_reviews!.items.items.length + 1,
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

								  return index >= state.product_reviews!.items.items.length? 
										state.product_reviews!.tools.paging.total_pages == state.product_reviews!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserProductReviewsListBottomLoader()
									 			  : index == 0 ?
								  state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.product_reviews!.items.items.length, index)
								  :state.product_reviews!.viewItem1 (state.product_reviews!.items.items[index] , state.product_reviews!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.product_reviews!.items.items.length-1, index);
									 // : state.product_reviews!.viewItem (state.product_reviews!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.product_reviews!.items.items.length
									: state.product_reviews!.items.items.length + 1,
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
    listing!.add(ProductReviewsListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ProductReviewsList());
    }

  }
}




abstract class ProductReviewsEvent extends Equatable {
   const ProductReviewsEvent();
   @override
    List<Object> get props => [];
}

class ProductReviewsList extends ProductReviewsEvent {
  @override
  String toString() => 'ProductReviewsList';
}

class ProductReviewsListingRefresh extends ProductReviewsEvent {
  @override
  String toString() => 'ProductReviewsListingRefresh';
}

class ProductReviewsListingChangeSearch extends ProductReviewsEvent {
  @override
  String toString() => 'ProductReviewsChangeSearch';
}


abstract class ProductReviewsState extends Equatable {
   const ProductReviewsState();
   @override
    List<Object> get props => [];
}

class ProductReviewsListingUninitialized extends ProductReviewsState {
  @override
  String toString() => 'ProductReviewsListingUninitialized';
}

class ProductReviewsListingError extends ProductReviewsState {
  @override
  String toString() => 'ProductReviewsListingError';
}

class ProductReviewsListingLoaded extends ProductReviewsState {
  final ProductReviewsListingModel? product_reviews;
  final bool? hasReachedMax;
  final int?  page;

  ProductReviewsListingLoaded({
    this.product_reviews,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [product_reviews!, hasReachedMax!, page!];
	
  ProductReviewsListingLoaded copyWith({
    ProductReviewsListingModel? product_reviews,
    bool? hasReachedMax,
    int? page,
  }) {
    return ProductReviewsListingLoaded(
      product_reviews: product_reviews ?? this.product_reviews,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ProductReviewsListingLoaded  ProductReviewsListing: ${ product_reviews!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ProductReviewsListing extends Bloc<ProductReviewsEvent, ProductReviewsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ProductReviewsListing(this.application, this.url, this.isSearch, ProductReviewsState initialState):
  super(initialState){
   on<ProductReviewsList>(_ProductReviewsListEvent);
	 on<ProductReviewsListingRefresh>(_ProductReviewsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ProductReviewsEvent, ProductReviewsState>> transformEvents(
      Stream<ProductReviewsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<ProductReviewsEvent> transform<ProductReviewsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ProductReviewsEvent, ProductReviewsState> transition) {
    print(transition);
  }


  void _ProductReviewsListEvent(ProductReviewsList event, Emitter<ProductReviewsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is ProductReviewsListingUninitialized){
			  if(isSearch){
			     ProductReviewsListingModel? product_reviews = await listingSearchProductReviews(1);
				  int deltaPage = product_reviews!.items.items.length ~/(product_reviews!.tools.paging.total_rows/product_reviews!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( product_reviews!.items.items.isEmpty ? (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ProductReviewsListingLoaded(product_reviews: product_reviews,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				   ProductReviewsListingModel? product_reviews = await listingProductReviews(1);
				   int deltaPage;
				   if(product_reviews!.tools.paging.total_pages != 0){
				      deltaPage = product_reviews!.items.items.length ~/(product_reviews!.tools.paging.total_rows/product_reviews!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   return emit ( product_reviews!.items.items.isEmpty ? (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ProductReviewsListingLoaded(product_reviews: product_reviews,
					  hasReachedMax: false,
					  page: deltaPage));
					  
					  }else{
					    deltaPage = 0;
						 return emit ( ProductReviewsListingLoaded(product_reviews: product_reviews,
					  hasReachedMax: false,
					  page: deltaPage));
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is ProductReviewsListingLoaded) {
          //page++;
		  final oldpage = (currentState as ProductReviewsListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as ProductReviewsListingLoaded).page! + 1;
				  ProductReviewsListingModel? product_reviews = await listingSearchProductReviews(page);
				 if ((currentState as ProductReviewsListingLoaded).product_reviews!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!product_reviews!.items.items.isEmpty){
						 (currentState as ProductReviewsListingLoaded).product_reviews!.items.items.addAll(product_reviews!.items.items);
					  }
					  return emit ( product_reviews!.items.items.isEmpty
						  ? (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : ProductReviewsListingLoaded(  product_reviews:  (currentState as ProductReviewsListingLoaded).product_reviews ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
				  final page = (currentState as ProductReviewsListingLoaded).page! + 1;
				   if ((currentState as ProductReviewsListingLoaded).product_reviews!.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  ProductReviewsListingModel? product_reviews = await listingProductReviews(page);
					 return emit (product_reviews!.items.items.isEmpty
						  ? (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : ProductReviewsListingLoaded(  product_reviews:  product_reviews ,
												  hasReachedMax: false,
												  page: page,));
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        return emit ( ProductReviewsListingError());
      }
    }
  }

  void _ProductReviewsListingRefreshEvent(ProductReviewsListingRefresh event, Emitter<ProductReviewsState> emit)async{
  final currentState = state;
   try {
        if (currentState is ProductReviewsListingUninitialized) {
		   if(isSearch){
		      ProductReviewsListingModel? product_reviews = await listingSearchProductReviews(1);
              return emit ( ProductReviewsListingLoaded( product_reviews: product_reviews,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
		     ProductReviewsListingModel? product_reviews = await listingProductReviews(1);
             return emit ( ProductReviewsListingLoaded( product_reviews: product_reviews,
                   hasReachedMax: false,
                   page: 1 ));
				   
		   }

        }

        if (currentState is ProductReviewsListingLoaded) {
		  if(isSearch){
		     ProductReviewsListingModel? product_reviews = await listingSearchRefreshProductReviews();
              return emit ( product_reviews!.items.items.isEmpty
              ? (currentState as ProductReviewsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductReviewsListingLoaded(  product_reviews: product_reviews ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
		      ProductReviewsListingModel? product_reviews = await listingRefreshProductReviews();
			   int deltaPage = product_reviews!.items.items.length ~/ (product_reviews!.tools.paging.total_rows/product_reviews!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              return emit (product_reviews!.items.items.isEmpty
              ? (currentState as ProductReviewsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductReviewsListingLoaded(  product_reviews: product_reviews ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ProductReviewsListingError());
      }
  }



  @override
  get initialState => ProductReviewsListingUninitialized();

  @override

  Stream<ProductReviewsState> mapEventToState(ProductReviewsEvent event) async* {
    final currentState = state;
    if (event is ProductReviewsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ProductReviewsListingUninitialized){
			  if(isSearch){
			     ProductReviewsListingModel? product_reviews = await listingSearchProductReviews(1);
				  int deltaPage = product_reviews!.items.items.length ~/(product_reviews!.tools.paging.total_rows/product_reviews!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield product_reviews!.items.items.isEmpty ? (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ProductReviewsListingLoaded(product_reviews: product_reviews,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   ProductReviewsListingModel? product_reviews = await listingProductReviews(1);
				   int deltaPage;
				   if(product_reviews!.tools.paging.total_pages != 0){
				      deltaPage = product_reviews!.items.items.length ~/(product_reviews!.tools.paging.total_rows/product_reviews!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield product_reviews!.items.items.isEmpty ? (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ProductReviewsListingLoaded(product_reviews: product_reviews,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield ProductReviewsListingLoaded(product_reviews: product_reviews,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is ProductReviewsListingLoaded) {
          //page++;
		  final oldpage = (currentState as ProductReviewsListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as ProductReviewsListingLoaded).page! + 1;
				  ProductReviewsListingModel? product_reviews = await listingSearchProductReviews(page);
				 if ((currentState as ProductReviewsListingLoaded).product_reviews!.tools.paging.total_pages == oldpage) {
					yield (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!product_reviews!.items.items.isEmpty){
						 (currentState as ProductReviewsListingLoaded).product_reviews!.items.items.addAll(product_reviews!.items.items);
					  }
					  yield product_reviews!.items.items.isEmpty
						  ? (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : ProductReviewsListingLoaded(  product_reviews:  (currentState as ProductReviewsListingLoaded).product_reviews ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as ProductReviewsListingLoaded).page! + 1;
				   if ((currentState as ProductReviewsListingLoaded).product_reviews!.tools.paging.total_pages == oldpage) {
					yield (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  ProductReviewsListingModel? product_reviews = await listingProductReviews(page);
					  yield product_reviews!.items.items.isEmpty
						  ? (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : ProductReviewsListingLoaded(  product_reviews:  product_reviews ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield ProductReviewsListingError();
      }
    } else if (event is ProductReviewsListingRefresh){
      try {
        if (currentState is ProductReviewsListingUninitialized) {
		   if(isSearch){
		      ProductReviewsListingModel? product_reviews = await listingSearchProductReviews(1);
              yield ProductReviewsListingLoaded( product_reviews: product_reviews,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     ProductReviewsListingModel? product_reviews = await listingProductReviews(1);
             yield ProductReviewsListingLoaded( product_reviews: product_reviews,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is ProductReviewsListingLoaded) {
		  if(isSearch){
		     ProductReviewsListingModel? product_reviews = await listingSearchRefreshProductReviews();
              yield product_reviews!.items.items.isEmpty
              ? (currentState as ProductReviewsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductReviewsListingLoaded(  product_reviews: product_reviews ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      ProductReviewsListingModel? product_reviews = await listingRefreshProductReviews();
			   int deltaPage = product_reviews!.items.items.length ~/ (product_reviews!.tools.paging.total_rows/product_reviews!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield product_reviews!.items.items.isEmpty
              ? (currentState as ProductReviewsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductReviewsListingLoaded(  product_reviews: product_reviews ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ProductReviewsListingError();
      }

    }
  }



  bool hasReachedMax(ProductReviewsState state) =>
      state is ProductReviewsListingLoaded && state.hasReachedMax!;


  Future<ProductReviewsListingModel?> listingProductReviews(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getProductReviewsListAPI(url, page);
	/*
	var dt  = ProductReviewsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductReviewsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<ProductReviewsListingModel?> listingRefreshProductReviews() async {
  
  
   ProductReviewsListingModel? product_reviews = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllProductReviewsList1();
    product_reviews  = await apiRepProvider!.getProductReviewsListAPI(url, 1);
    return product_reviews;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ProductReviewsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductReviewsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<ProductReviewsListingModel?> listingSearchProductReviews(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getProductReviewsListSearchAPI(url, page);
	
	/*
	var dt  = ProductReviewsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductReviewsListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<ProductReviewsListingModel?> listingSearchRefreshProductReviews() async {
   ProductReviewsListingModel? product_reviews = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllProductReviewsList1();
    product_reviews  = await apiRepProvider!.getProductReviewsListSearchAPI(url, 1);
    return product_reviews;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ProductReviewsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductReviewsListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<ProductReviewsListingModel> _loadAndSaveProductReviewsListSearch(ProductReviewsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.testimony;
	  list.items.items[i].item.pht = list.items.items[i].item.buyer_photo_url;
    }
    return list;
 }


class  UserProductReviewsListBottomLoader extends StatelessWidget {
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







  

