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
import 'comments_new_reply.dart';



class CommentsListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  CommentsListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  CommentsListBaseState createState() => CommentsListBaseState();
}

class  CommentsListBaseState extends State<CommentsListBase>{
  String title = 'Comments'; 
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
  CommentsListing? listing;

  CommentsListBaseState() {
   
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
     String product_post_id = 'product_post_id';
	 product_post_id = product_post_id.replaceAll('_id','');
     getPath = widget.url! + product_post_id + 'page=%s';
	 
	listing =      CommentsListing(AppProvider.getApplication(context), getPath, false, CommentsListingUninitialized());
    listing!.add(CommentsList());
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
	
	 return BlocBuilder<CommentsListing, CommentsState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is CommentsListingUninitialized) {
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
        if (state is CommentsListingError) {
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
								  'Comments',
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
        if (state is CommentsListingLoaded) {
          if (state.comments!.items.items.isEmpty) {
		  if (state.comments!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.comments!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.comments!.listButton(context, widget.id!).length == 0){ 
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
								  'Comments',
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
																		text: "Comments ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																	


																//Text('Comments by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.comments!.items.items.length? 
													state.comments!.tools.paging.total_pages == state.comments!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserCommentsListBottomLoader()
															  : index == 0 ?
											   state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.comments!.items.items.length, index)
											  :state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.comments!.items.items.length-1, index);											

												// : state.comments!.viewItem (state.comments!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.comments!.items.items.length
										: state.comments!.items.items.length + 1,
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
							  child: Text('Comments', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.comments!.items.items.length? 
																		state.comments!.tools.paging.total_pages == state.comments!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserCommentsListBottomLoader()
																				  : index == 0 ?
																  state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.comments!.items.items.length, index)
																  :state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.comments!.items.items.length-1, index);
																	 // : state.comments!.viewItem (state.comments!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.comments!.items.items.length
																	: state.comments!.items.items.length + 1,
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
					//  floatingActionButton:  state.comments!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Comments',
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
																		text: "Comments ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																//Text('Comments by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.comments!.items.items.length? 
													state.comments!.tools.paging.total_pages == state.comments!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserCommentsListBottomLoader()
															  : index == 0 ?
											   state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.comments!.items.items.length, index)
											  :state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.comments!.items.items.length-1, index);											
											  // : state.comments!.viewItem (state.comments!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.comments!.items.items.length
										: state.comments!.items.items.length + 1,
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
							  child: Text('Comments', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.comments!.items.items.length? 
																		state.comments!.tools.paging.total_pages == state.comments!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserCommentsListBottomLoader()
																				  : index == 0 ?
																  state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.comments!.items.items.length, index)
																  :state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.comments!.items.items.length-1, index);
																	 // : state.comments!.viewItem (state.comments!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.comments!.items.items.length
																	: state.comments!.items.items.length + 1,
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
					  floatingActionButton:  state.comments!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Comments',
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
																		text: "Comments ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
															//	Text('Comments by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.comments!.items.items.length? 
													state.comments!.tools.paging.total_pages == state.comments!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserCommentsListBottomLoader()
															  : index == 0 ?
											   state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.comments!.items.items.length, index)
											  :state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.comments!.items.items.length-1, index);											
											  // : state.comments!.viewItem (state.comments!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.comments!.items.items.length
										: state.comments!.items.items.length + 1,
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
							  child: Text('Comments', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.comments!.items.items.length? 
																		state.comments!.tools.paging.total_pages == state.comments!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserCommentsListBottomLoader()
																				  : index == 0 ?
																  state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.comments!.items.items.length, index)
																  :state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.comments!.items.items.length-1, index);
																	 // : state.comments!.viewItem (state.comments!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.comments!.items.items.length
																	: state.comments!.items.items.length + 1,
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

								  return index >= state.comments!.items.items.length? 
										state.comments!.tools.paging.total_pages == state.comments!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserCommentsListBottomLoader()
									 			  : index == 0 ?
								  state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.comments!.items.items.length, index)
								  :state.comments!.viewItem1 (state.comments!.items.items[index] , state.comments!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.comments!.items.items.length-1, index);
									 // : state.comments!.viewItem (state.comments!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.comments!.items.items.length
									: state.comments!.items.items.length + 1,
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
    listing!.add(CommentsListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(CommentsList());
    }

  }
}




abstract class CommentsEvent extends Equatable {
   const CommentsEvent();
   @override
    List<Object> get props => [];
}

class CommentsList extends CommentsEvent {
  @override
  String toString() => 'CommentsList';
}

class CommentsListingRefresh extends CommentsEvent {
  @override
  String toString() => 'CommentsListingRefresh';
}

class CommentsListingChangeSearch extends CommentsEvent {
  @override
  String toString() => 'CommentsChangeSearch';
}


abstract class CommentsState extends Equatable {
   const CommentsState();
   @override
    List<Object> get props => [];
}

class CommentsListingUninitialized extends CommentsState {
  @override
  String toString() => 'CommentsListingUninitialized';
}

class CommentsListingError extends CommentsState {
  @override
  String toString() => 'CommentsListingError';
}

class CommentsListingLoaded extends CommentsState {
  final CommentsListingModel? comments;
  final bool? hasReachedMax;
  final int?  page;

  CommentsListingLoaded({
    this.comments,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [comments!, hasReachedMax!, page!];
	
  CommentsListingLoaded copyWith({
    CommentsListingModel? comments,
    bool? hasReachedMax,
    int? page,
  }) {
    return CommentsListingLoaded(
      comments: comments ?? this.comments,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'CommentsListingLoaded  CommentsListing: ${ comments!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class CommentsListing extends Bloc<CommentsEvent, CommentsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  CommentsListing(this.application, this.url, this.isSearch, CommentsState initialState):
  super(initialState){
   on<CommentsList>(_CommentsListEvent);
	 on<CommentsListingRefresh>(_CommentsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<CommentsEvent, CommentsState>> transformEvents(
      Stream<CommentsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<CommentsEvent> transform<CommentsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<CommentsEvent, CommentsState> transition) {
    print(transition);
  }


  void _CommentsListEvent(CommentsList event, Emitter<CommentsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is CommentsListingUninitialized){
			  if(isSearch){
			     CommentsListingModel? comments = await listingSearchComments(1);
				  int deltaPage = comments!.items.items.length ~/(comments!.tools.paging.total_rows/comments!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( comments!.items.items.isEmpty ? (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CommentsListingLoaded(comments: comments,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				   CommentsListingModel? comments = await listingComments(1);
				   int deltaPage;
				   if(comments!.tools.paging.total_pages != 0){
				      deltaPage = comments!.items.items.length ~/(comments!.tools.paging.total_rows/comments!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   return emit ( comments!.items.items.isEmpty ? (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CommentsListingLoaded(comments: comments,
					  hasReachedMax: false,
					  page: deltaPage));
					  
					  }else{
					    deltaPage = 0;
						 return emit ( CommentsListingLoaded(comments: comments,
					  hasReachedMax: false,
					  page: deltaPage));
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is CommentsListingLoaded) {
          //page++;
		  final oldpage = (currentState as CommentsListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as CommentsListingLoaded).page! + 1;
				  CommentsListingModel? comments = await listingSearchComments(page);
				 if ((currentState as CommentsListingLoaded).comments!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!comments!.items.items.isEmpty){
						 (currentState as CommentsListingLoaded).comments!.items.items.addAll(comments!.items.items);
					  }
					  return emit ( comments!.items.items.isEmpty
						  ? (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : CommentsListingLoaded(  comments:  (currentState as CommentsListingLoaded).comments ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
				  final page = (currentState as CommentsListingLoaded).page! + 1;
				   if ((currentState as CommentsListingLoaded).comments!.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  CommentsListingModel? comments = await listingComments(page);
					 return emit (comments!.items.items.isEmpty
						  ? (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : CommentsListingLoaded(  comments:  comments ,
												  hasReachedMax: false,
												  page: page,));
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        return emit ( CommentsListingError());
      }
    }
  }

  void _CommentsListingRefreshEvent(CommentsListingRefresh event, Emitter<CommentsState> emit)async{
  final currentState = state;
   try {
        if (currentState is CommentsListingUninitialized) {
		   if(isSearch){
		      CommentsListingModel? comments = await listingSearchComments(1);
              return emit ( CommentsListingLoaded( comments: comments,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
		     CommentsListingModel? comments = await listingComments(1);
             return emit ( CommentsListingLoaded( comments: comments,
                   hasReachedMax: false,
                   page: 1 ));
				   
		   }

        }

        if (currentState is CommentsListingLoaded) {
		  if(isSearch){
		     CommentsListingModel? comments = await listingSearchRefreshComments();
              return emit ( comments!.items.items.isEmpty
              ? (currentState as CommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CommentsListingLoaded(  comments: comments ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
		      CommentsListingModel? comments = await listingRefreshComments();
			   int deltaPage = comments!.items.items.length ~/ (comments!.tools.paging.total_rows/comments!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              return emit (comments!.items.items.isEmpty
              ? (currentState as CommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CommentsListingLoaded(  comments: comments ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (CommentsListingError());
      }
  }



  @override
  get initialState => CommentsListingUninitialized();

  @override

  Stream<CommentsState> mapEventToState(CommentsEvent event) async* {
    final currentState = state;
    if (event is CommentsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is CommentsListingUninitialized){
			  if(isSearch){
			     CommentsListingModel? comments = await listingSearchComments(1);
				  int deltaPage = comments!.items.items.length ~/(comments!.tools.paging.total_rows/comments!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield comments!.items.items.isEmpty ? (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CommentsListingLoaded(comments: comments,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   CommentsListingModel? comments = await listingComments(1);
				   int deltaPage;
				   if(comments!.tools.paging.total_pages != 0){
				      deltaPage = comments!.items.items.length ~/(comments!.tools.paging.total_rows/comments!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield comments!.items.items.isEmpty ? (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CommentsListingLoaded(comments: comments,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield CommentsListingLoaded(comments: comments,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is CommentsListingLoaded) {
          //page++;
		  final oldpage = (currentState as CommentsListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as CommentsListingLoaded).page! + 1;
				  CommentsListingModel? comments = await listingSearchComments(page);
				 if ((currentState as CommentsListingLoaded).comments!.tools.paging.total_pages == oldpage) {
					yield (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!comments!.items.items.isEmpty){
						 (currentState as CommentsListingLoaded).comments!.items.items.addAll(comments!.items.items);
					  }
					  yield comments!.items.items.isEmpty
						  ? (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : CommentsListingLoaded(  comments:  (currentState as CommentsListingLoaded).comments ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as CommentsListingLoaded).page! + 1;
				   if ((currentState as CommentsListingLoaded).comments!.tools.paging.total_pages == oldpage) {
					yield (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  CommentsListingModel? comments = await listingComments(page);
					  yield comments!.items.items.isEmpty
						  ? (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : CommentsListingLoaded(  comments:  comments ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield CommentsListingError();
      }
    } else if (event is CommentsListingRefresh){
      try {
        if (currentState is CommentsListingUninitialized) {
		   if(isSearch){
		      CommentsListingModel? comments = await listingSearchComments(1);
              yield CommentsListingLoaded( comments: comments,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     CommentsListingModel? comments = await listingComments(1);
             yield CommentsListingLoaded( comments: comments,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is CommentsListingLoaded) {
		  if(isSearch){
		     CommentsListingModel? comments = await listingSearchRefreshComments();
              yield comments!.items.items.isEmpty
              ? (currentState as CommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CommentsListingLoaded(  comments: comments ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      CommentsListingModel? comments = await listingRefreshComments();
			   int deltaPage = comments!.items.items.length ~/ (comments!.tools.paging.total_rows/comments!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield comments!.items.items.isEmpty
              ? (currentState as CommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CommentsListingLoaded(  comments: comments ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield CommentsListingError();
      }

    }
  }



  bool hasReachedMax(CommentsState state) =>
      state is CommentsListingLoaded && state.hasReachedMax!;


  Future<CommentsListingModel?> listingComments(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getCommentsListAPI(url, page);
	/*
	var dt  = CommentsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCommentsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<CommentsListingModel?> listingRefreshComments() async {
  
  
   CommentsListingModel? comments = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllCommentsList1();
    comments  = await apiRepProvider!.getCommentsListAPI(url, 1);
    return comments;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = CommentsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCommentsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<CommentsListingModel?> listingSearchComments(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getCommentsListSearchAPI(url, page);
	
	/*
	var dt  = CommentsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCommentsListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<CommentsListingModel?> listingSearchRefreshComments() async {
   CommentsListingModel? comments = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllCommentsList1();
    comments  = await apiRepProvider!.getCommentsListSearchAPI(url, 1);
    return comments;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = CommentsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCommentsListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<CommentsListingModel> _loadAndSaveCommentsListSearch(CommentsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.pht = list.items.items[i].item.user_photo_url;
	  list.items.items[i].item.ttl = list.items.items[i].item.user_user_name;
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
    }
    return list;
 }


class  UserCommentsListBottomLoader extends StatelessWidget {
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







  

