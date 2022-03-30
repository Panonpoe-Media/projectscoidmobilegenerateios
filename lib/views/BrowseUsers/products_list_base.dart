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

import 'package:projectscoid/views/Chat/blocs/chat_bloc.dart';

/** AUTOGENERATE OFF **/


class ProductsListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ChatBloc? cb;
  ProductsListBase({Key? key, this.id, this.title, this.url, this.cb}) : super(key: key);
  @override
  ProductsListBaseState createState() => ProductsListBaseState();
}

class  ProductsListBaseState extends State<ProductsListBase>{
  String title = 'Products'; 
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
  ProductsListing? listing;

  ProductsListBaseState() {
   
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
     String product_id = 'product_id';
	 product_id = product_id.replaceAll('_id','');
     getPath = widget.url! + product_id + 'page=%s';
	 
	listing =      ProductsListing(AppProvider.getApplication(context), getPath, false, ProductsListingUninitialized());
    listing!.add(ProductsList());
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
	
	 return BlocBuilder<ProductsListing, ProductsState>(
      //cubit: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is ProductsListingUninitialized) {
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
								  'Products',
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
					 valueColor:      AlwaysStoppedAnimation<Color>(
							 Colors.green),
				))
		  );
        }
        if (state is ProductsListingError) {
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
								  'Products',
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
        if (state is ProductsListingLoaded) {
          if (state.products!.items.items.isEmpty) {
		  if (state.products!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.products!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.products!.listButton(context, widget.id!).length == 0){ 
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
								  'Products',
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
																		text: "Products ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																		TextSpan(
																		text: "by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}",
																		style: TextStyle(
																			fontSize: 14.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																																			]),
																),
																	


																//Text('Products by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.products!.items.items.length? 
													state.products!.tools.paging.total_pages == state.products!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													PublicProductsListBottomLoader()
															  : index == 0 ?
											 state.products!.viewItem2 (state.products!.items.items[index] , state.products!.items.items[index] , searchText ,context, account, widget.id!, widget.title!, userid, state.hasReachedMax!, state.products!.items.items.length, index,      widget.cb!)
											  :state.products!.viewItem2 (state.products!.items.items[index] , state.products!.items.items[index-1] , searchText ,context,  account, widget.id!, widget.title!, userid, state.hasReachedMax!, state.products!.items.items.length-1, index,      widget.cb!);

												// : state.products!.viewItem (state.products!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.products!.items.items.length
										: state.products!.items.items.length + 1,
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
							  child: Text('Products', style: TextStyle(fontSize: 20, color: Colors.white),),
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
															  GridView.builder(
																		  shrinkWrap: true,
																		  itemCount: state.hasReachedMax!
																			  ? state.products!.items.items.length
																			  : state.products!.items.items.length + 1,
																		  controller: scrollController,
																		  physics: AlwaysScrollableScrollPhysics(),
																		//  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 2.0),
																		  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
																			crossAxisCount: 2,
																			//mainAxisSpacing: 10,
																			//crossAxisSpacing: 10,
																			childAspectRatio: mediaQueryData.size.width/(mediaQueryData.size.height/1.9),
																		  ),
																		  itemBuilder: (context, index) {
																			return index >= state.products!.items.items.length? 
																			state.products!.tools.paging.total_pages == state.products!.tools.paging.current_page?
																			Container(height: 0.0, width: 0.0,):	
																			PublicProductsListBottomLoader()
																				: state.products!.viewItem1 (state.products!.items.items[index] , state.products!.items.items[index] , searchText, context, account, widget.id!, true, 1, 1 );
																		  },
																		),
															  onRefresh: _onRefresh,
											 ) 
									 )
						),



						// buildListingBar(),

					  ],
					),
					*/
					//  floatingActionButton:  state.products!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Products',
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
																		text: "Products ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																		TextSpan(
																		text: "by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}",
																		style: TextStyle(
																			fontSize: 14.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																//Text('Products by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.products!.items.items.length? 
													state.products!.tools.paging.total_pages == state.products!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													PublicProductsListBottomLoader()
															  : index == 0 ?
											 state.products!.viewItem2 (state.products!.items.items[index] , state.products!.items.items[index] , searchText ,context, account, widget.id!, widget.title!, userid, state.hasReachedMax!, state.products!.items.items.length, index,      widget.cb!)
											  :state.products!.viewItem2 (state.products!.items.items[index] , state.products!.items.items[index-1] , searchText ,context,  account, widget.id!, widget.title!, userid, state.hasReachedMax!, state.products!.items.items.length-1, index,      widget.cb!);
											  // : state.products!.viewItem (state.products!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.products!.items.items.length
										: state.products!.items.items.length + 1,
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
							  child: Text('Products', style: TextStyle(fontSize: 20, color: Colors.white),),
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
															  GridView.builder(
																		  shrinkWrap: true,
																		  itemCount: state.hasReachedMax!
																			  ? state.products!.items.items.length
																			  : state.products!.items.items.length + 1,
																		  controller: scrollController,
																		  physics: AlwaysScrollableScrollPhysics(),
																		//  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 2.0),
																		  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
																			crossAxisCount: 2,
																			//mainAxisSpacing: 10,
																			//crossAxisSpacing: 10,
																			childAspectRatio: mediaQueryData.size.width/(mediaQueryData.size.height/1.9),
																		  ),
																		  itemBuilder: (context, index) {
																			return index >= state.products!.items.items.length? 
																			state.products!.tools.paging.total_pages == state.products!.tools.paging.current_page?
																			Container(height: 0.0, width: 0.0,):	
																			PublicProductsListBottomLoader()
																				: state.products!.viewItem1 (state.products!.items.items[index] , state.products!.items.items[index] , searchText, context, account, widget.id!,true, 1, 1 );
																		  },
																		),
															  
															  onRefresh: _onRefresh,
											 ) 
											 
									 )
						),



						// buildListingBar(),

					  ],
					),
					*/
					  floatingActionButton:  state.products!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Products',
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
																		text: "Products ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																		TextSpan(
																		text: "by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}",
																		style: TextStyle(
																			fontSize: 14.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
															//	Text('Products by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

															  ])
													  ),
													  titlePadding: EdgeInsets.only(left: 25, bottom: 20),
													  collapseMode: CollapseBarMode.parallax,
													  centerTitle: false,  background: Container(),
													
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
							(context, index){  return index >= state.products!.items.items.length? 
													state.products!.tools.paging.total_pages == state.products!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													PublicProductsListBottomLoader()
															  : index == 0 ?
											 state.products!.viewItem2 (state.products!.items.items[index] , state.products!.items.items[index] , searchText ,context, account, widget.id!, widget.title!, userid, state.hasReachedMax!, state.products!.items.items.length, index,      widget.cb!)
											  :state.products!.viewItem2 (state.products!.items.items[index] , state.products!.items.items[index-1] , searchText ,context,  account, widget.id!, widget.title!, userid, state.hasReachedMax!, state.products!.items.items.length-1, index,      widget.cb!);
											  // : state.products!.viewItem (state.products!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.products!.items.items.length
										: state.products!.items.items.length + 1,
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
							  child: Text('Products', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.products!.items.items.length? 
																		state.products!.tools.paging.total_pages == state.products!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		PublicProductsListBottomLoader()
																				  : index == 0 ?
																  state.products!.viewItem1 (state.products!.items.items[index] , state.products!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.products!.items.items.length, index)
																  :state.products!.viewItem1 (state.products!.items.items[index] , state.products!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.products!.items.items.length-1, index);
																	 // : state.products!.viewItem (state.products!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.products!.items.items.length
																	: state.products!.items.items.length + 1,
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

								  return index >= state.products!.items.items.length? 
										state.products!.tools.paging.total_pages == state.products!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										PublicProductsListBottomLoader()
									 			  : index == 0 ?
								  state.products!.viewItem1 (state.products!.items.items[index] , state.products!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.products!.items.items.length, index)
								  :state.products!.viewItem1 (state.products!.items.items[index] , state.products!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.products!.items.items.length-1, index);
									 // : state.products!.viewItem (state.products!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.products!.items.items.length
									: state.products!.items.items.length + 1,
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
    listing!.add(ProductsListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ProductsList());
    }

  }
}




abstract class ProductsEvent extends Equatable {
   const ProductsEvent();
   @override
    List<Object> get props => [];
}

class ProductsList extends ProductsEvent {
  @override
  String toString() => 'ProductsList';
}

class ProductsListingRefresh extends ProductsEvent {
  @override
  String toString() => 'ProductsListingRefresh';
}

class ProductsListingChangeSearch extends ProductsEvent {
  @override
  String toString() => 'ProductsChangeSearch';
}


abstract class ProductsState extends Equatable {
   const ProductsState();
   @override
    List<Object> get props => [];
}

class ProductsListingUninitialized extends ProductsState {
  @override
  String toString() => 'ProductsListingUninitialized';
}

class ProductsListingError extends ProductsState {
  @override
  String toString() => 'ProductsListingError';
}

class ProductsListingLoaded extends ProductsState {
  final ProductsListingModel? products;
  final bool? hasReachedMax;
  final int?  page;

  ProductsListingLoaded({
    this.products,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [products!, hasReachedMax!, page!];
	
  ProductsListingLoaded copyWith({
    ProductsListingModel? products,
    bool? hasReachedMax,
    int? page,
  }) {
    return ProductsListingLoaded(
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ProductsListingLoaded  ProductsListing: ${ products!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ProductsListing extends Bloc<ProductsEvent, ProductsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ProductsListing(this.application, this.url, this.isSearch, ProductsState initialState):super(initialState);
  @override
  void dispose() {
   // super.dispose();
  }


  @override
	/*
 Stream<Transition<ProductsEvent, ProductsState>> transformEvents(
      Stream<ProductsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
	 */
	EventTransformer<ProductsEvent> transform<ProductsEvent>(Duration duration) {
		return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
	}

  @override
  void onTransition(Transition<ProductsEvent, ProductsState> transition) {
    print(transition);
  }

  @override
  get initialState => ProductsListingUninitialized();

  @override

  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    final currentState = state;
    if (event is ProductsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ProductsListingUninitialized){
			  if(isSearch){
			     ProductsListingModel? products = await listingSearchProducts(1);
				  int deltaPage = products!.items.items.length ~/(products!.tools.paging.total_rows/products!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield products!.items.items.isEmpty ? (currentState as ProductsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ProductsListingLoaded(products: products,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ProductsListingModel? products = await listingProducts(1);
				  int deltaPage = products!.items.items.length ~/(products!.tools.paging.total_rows/products!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				    deltaPage = 1;
				  }
				  yield products!.items.items.isEmpty ? (currentState as ProductsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ProductsListingLoaded(products: products,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ProductsListingLoaded) {
          //page++;
		  final oldpage = (currentState as ProductsListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as ProductsListingLoaded).page! + 1;
				  ProductsListingModel? products = await listingSearchProducts(page);
				 if ((currentState as ProductsListingLoaded).products!.tools.paging.total_pages == oldpage) {
					yield (currentState as ProductsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!products!.items.items.isEmpty){
						 (currentState as ProductsListingLoaded).products!.items.items.addAll(products!.items.items);
					  }
					  yield products!.items.items.isEmpty
						  ? (currentState as ProductsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : ProductsListingLoaded(  products:  (currentState as ProductsListingLoaded).products ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
		  
				  final page = (currentState as ProductsListingLoaded).page! + 1;
				   if ((currentState as ProductsListingLoaded).products!.tools.paging.total_pages == oldpage) {
					yield (currentState as ProductsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  ProductsListingModel? products = await listingProducts(page);
					  yield products!.items.items.isEmpty
						  ? (currentState as ProductsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : ProductsListingLoaded(  products:  products ,
												  hasReachedMax: false,
												  page: page,);
				 }								  
			}	  
        }
      } catch (_) {
        yield ProductsListingError();
      }
    } else if (event is ProductsListingRefresh){
      try {
        if (currentState is ProductsListingUninitialized) {
		   if(isSearch){
		      ProductsListingModel? products = await listingSearchProducts(1);
              yield ProductsListingLoaded( products: products,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ProductsListingModel? products = await listingProducts(1);
             yield ProductsListingLoaded( products: products,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ProductsListingLoaded) {
		  if(isSearch){
		     ProductsListingModel? products = await listingSearchRefreshProducts();
              yield products!.items.items.isEmpty
              ? (currentState as ProductsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductsListingLoaded(  products: products ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ProductsListingModel? products = await listingRefreshProducts();
              yield products!.items.items.isEmpty
              ? (currentState as ProductsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductsListingLoaded(  products: products ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ProductsListingError();
      }

    }
  }



  bool hasReachedMax(ProductsState state) =>
      state is ProductsListingLoaded && state.hasReachedMax!;


  Future<ProductsListingModel?> listingProducts(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ProductsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ProductsListingModel?> listingRefreshProducts() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ProductsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ProductsListingModel?> listingSearchProducts(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ProductsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductsListSearch(dt ,'',page);	
	return data;
  }

  Future<ProductsListingModel?> listingSearchRefreshProducts() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ProductsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ProductsListingModel> _loadAndSaveProductsListSearch(ProductsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.pht = list.items.items[i].item.logo_url;
	  list.items.items[i].item.ttl = list.items.items[i].item.title;
	  list.items.items[i].item.sbttl = list.items.items[i].item.short_description;
    }
    return list;
 }


class  PublicProductsListBottomLoader extends StatelessWidget {
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







  

