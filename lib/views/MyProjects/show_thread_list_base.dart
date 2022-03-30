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
import 'show_thread_new_reply.dart';
import 'show_thread_reply.dart';
import 'show_thread_broadcast_message.dart';
import 'show_thread_accept_or_reject_work.dart';
import 'show_thread_rate_worker.dart';
import 'show_thread_report_progress.dart';
import 'show_thread_weekly_report.dart';
import 'show_thread_report_done.dart';
import 'show_thread_rate_owner.dart';
import 'show_thread_file_arbitration.dart';
import 'show_thread_new_offer.dart';
import 'show_thread_accept_offer.dart';
import 'show_thread_respond_arbitration.dart';
import 'show_thread_cancel_arbitration.dart';



class ShowThreadListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ShowThreadListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ShowThreadListBaseState createState() => ShowThreadListBaseState();
}

class  ShowThreadListBaseState extends State<ShowThreadListBase>{
  String title = 'Show Thread'; 
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
  ShowThreadListing? listing;

  ShowThreadListBaseState() {
   
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
	 
	listing =      ShowThreadListing(AppProvider.getApplication(context), getPath, false, ShowThreadListingUninitialized());
    listing!.add(ShowThreadList());
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
	
	 return BlocBuilder<ShowThreadListing, ShowThreadState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is ShowThreadListingUninitialized) {
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
        if (state is ShowThreadListingError) {
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
								  'Show Thread',
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
        if (state is ShowThreadListingLoaded) {
          if (state.show_thread!.items.items.isEmpty) {
		  if (state.show_thread!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.show_thread!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.show_thread!.listButton(context, widget.id!).length == 0){ 
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
								  'Show Thread',
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
																		text: "Show Thread ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																	


																//Text('Show Thread by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.show_thread!.items.items.length? 
													state.show_thread!.tools.paging.total_pages == state.show_thread!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserShowThreadListBottomLoader()
															  : index == 0 ?
											   state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.show_thread!.items.items.length, index)
											  :state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.show_thread!.items.items.length-1, index);											

												// : state.show_thread!.viewItem (state.show_thread!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.show_thread!.items.items.length
										: state.show_thread!.items.items.length + 1,
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
							  child: Text('Show Thread', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.show_thread!.items.items.length? 
																		state.show_thread!.tools.paging.total_pages == state.show_thread!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserShowThreadListBottomLoader()
																				  : index == 0 ?
																  state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.show_thread!.items.items.length, index)
																  :state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.show_thread!.items.items.length-1, index);
																	 // : state.show_thread!.viewItem (state.show_thread!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.show_thread!.items.items.length
																	: state.show_thread!.items.items.length + 1,
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
					//  floatingActionButton:  state.show_thread!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Show Thread',
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
																		text: "Show Thread ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																//Text('Show Thread by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.show_thread!.items.items.length? 
													state.show_thread!.tools.paging.total_pages == state.show_thread!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserShowThreadListBottomLoader()
															  : index == 0 ?
											   state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.show_thread!.items.items.length, index)
											  :state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.show_thread!.items.items.length-1, index);											
											  // : state.show_thread!.viewItem (state.show_thread!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.show_thread!.items.items.length
										: state.show_thread!.items.items.length + 1,
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
							  child: Text('Show Thread', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.show_thread!.items.items.length? 
																		state.show_thread!.tools.paging.total_pages == state.show_thread!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserShowThreadListBottomLoader()
																				  : index == 0 ?
																  state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.show_thread!.items.items.length, index)
																  :state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.show_thread!.items.items.length-1, index);
																	 // : state.show_thread!.viewItem (state.show_thread!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.show_thread!.items.items.length
																	: state.show_thread!.items.items.length + 1,
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
					  floatingActionButton:  state.show_thread!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Show Thread',
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
																		text: "Show Thread ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
															//	Text('Show Thread by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.show_thread!.items.items.length? 
													state.show_thread!.tools.paging.total_pages == state.show_thread!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserShowThreadListBottomLoader()
															  : index == 0 ?
											   state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.show_thread!.items.items.length, index)
											  :state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.show_thread!.items.items.length-1, index);											
											  // : state.show_thread!.viewItem (state.show_thread!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.show_thread!.items.items.length
										: state.show_thread!.items.items.length + 1,
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
							  child: Text('Show Thread', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.show_thread!.items.items.length? 
																		state.show_thread!.tools.paging.total_pages == state.show_thread!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserShowThreadListBottomLoader()
																				  : index == 0 ?
																  state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.show_thread!.items.items.length, index)
																  :state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.show_thread!.items.items.length-1, index);
																	 // : state.show_thread!.viewItem (state.show_thread!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.show_thread!.items.items.length
																	: state.show_thread!.items.items.length + 1,
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

								  return index >= state.show_thread!.items.items.length? 
										state.show_thread!.tools.paging.total_pages == state.show_thread!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserShowThreadListBottomLoader()
									 			  : index == 0 ?
								  state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.show_thread!.items.items.length, index)
								  :state.show_thread!.viewItem1 (state.show_thread!.items.items[index] , state.show_thread!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.show_thread!.items.items.length-1, index);
									 // : state.show_thread!.viewItem (state.show_thread!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.show_thread!.items.items.length
									: state.show_thread!.items.items.length + 1,
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
    listing!.add(ShowThreadListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ShowThreadList());
    }

  }
}




abstract class ShowThreadEvent extends Equatable {
   const ShowThreadEvent();
   @override
    List<Object> get props => [];
}

class ShowThreadList extends ShowThreadEvent {
  @override
  String toString() => 'ShowThreadList';
}

class ShowThreadListingRefresh extends ShowThreadEvent {
  @override
  String toString() => 'ShowThreadListingRefresh';
}

class ShowThreadListingChangeSearch extends ShowThreadEvent {
  @override
  String toString() => 'ShowThreadChangeSearch';
}


abstract class ShowThreadState extends Equatable {
   const ShowThreadState();
   @override
    List<Object> get props => [];
}

class ShowThreadListingUninitialized extends ShowThreadState {
  @override
  String toString() => 'ShowThreadListingUninitialized';
}

class ShowThreadListingError extends ShowThreadState {
  @override
  String toString() => 'ShowThreadListingError';
}

class ShowThreadListingLoaded extends ShowThreadState {
  final ShowThreadListingModel? show_thread;
  final bool? hasReachedMax;
  final int?  page;

  ShowThreadListingLoaded({
    this.show_thread,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [show_thread!, hasReachedMax!, page!];
	
  ShowThreadListingLoaded copyWith({
    ShowThreadListingModel? show_thread,
    bool? hasReachedMax,
    int? page,
  }) {
    return ShowThreadListingLoaded(
      show_thread: show_thread ?? this.show_thread,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ShowThreadListingLoaded  ShowThreadListing: ${ show_thread!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ShowThreadListing extends Bloc<ShowThreadEvent, ShowThreadState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ShowThreadListing(this.application, this.url, this.isSearch, ShowThreadState initialState):
  super(initialState){
   on<ShowThreadList>(_ShowThreadListEvent);
	 on<ShowThreadListingRefresh>(_ShowThreadListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ShowThreadEvent, ShowThreadState>> transformEvents(
      Stream<ShowThreadEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<ShowThreadEvent> transform<ShowThreadEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ShowThreadEvent, ShowThreadState> transition) {
    print(transition);
  }


  void _ShowThreadListEvent(ShowThreadList event, Emitter<ShowThreadState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is ShowThreadListingUninitialized){
			  if(isSearch){
			     ShowThreadListingModel? show_thread = await listingSearchShowThread(1);
				  int deltaPage = show_thread!.items.items.length ~/(show_thread!.tools.paging.total_rows/show_thread!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( show_thread!.items.items.isEmpty ? (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ShowThreadListingLoaded(show_thread: show_thread,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				   ShowThreadListingModel? show_thread = await listingShowThread(1);
				   int deltaPage;
				   if(show_thread!.tools.paging.total_pages != 0){
				      deltaPage = show_thread!.items.items.length ~/(show_thread!.tools.paging.total_rows/show_thread!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   return emit ( show_thread!.items.items.isEmpty ? (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ShowThreadListingLoaded(show_thread: show_thread,
					  hasReachedMax: false,
					  page: deltaPage));
					  
					  }else{
					    deltaPage = 0;
						 return emit ( ShowThreadListingLoaded(show_thread: show_thread,
					  hasReachedMax: false,
					  page: deltaPage));
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is ShowThreadListingLoaded) {
          //page++;
		  final oldpage = (currentState as ShowThreadListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as ShowThreadListingLoaded).page! + 1;
				  ShowThreadListingModel? show_thread = await listingSearchShowThread(page);
				 if ((currentState as ShowThreadListingLoaded).show_thread!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!show_thread!.items.items.isEmpty){
						 (currentState as ShowThreadListingLoaded).show_thread!.items.items.addAll(show_thread!.items.items);
					  }
					  return emit ( show_thread!.items.items.isEmpty
						  ? (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : ShowThreadListingLoaded(  show_thread:  (currentState as ShowThreadListingLoaded).show_thread ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
				  final page = (currentState as ShowThreadListingLoaded).page! + 1;
				   if ((currentState as ShowThreadListingLoaded).show_thread!.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  ShowThreadListingModel? show_thread = await listingShowThread(page);
					 return emit (show_thread!.items.items.isEmpty
						  ? (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : ShowThreadListingLoaded(  show_thread:  show_thread ,
												  hasReachedMax: false,
												  page: page,));
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        return emit ( ShowThreadListingError());
      }
    }
  }

  void _ShowThreadListingRefreshEvent(ShowThreadListingRefresh event, Emitter<ShowThreadState> emit)async{
  final currentState = state;
   try {
        if (currentState is ShowThreadListingUninitialized) {
		   if(isSearch){
		      ShowThreadListingModel? show_thread = await listingSearchShowThread(1);
              return emit ( ShowThreadListingLoaded( show_thread: show_thread,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
		     ShowThreadListingModel? show_thread = await listingShowThread(1);
             return emit ( ShowThreadListingLoaded( show_thread: show_thread,
                   hasReachedMax: false,
                   page: 1 ));
				   
		   }

        }

        if (currentState is ShowThreadListingLoaded) {
		  if(isSearch){
		     ShowThreadListingModel? show_thread = await listingSearchRefreshShowThread();
              return emit ( show_thread!.items.items.isEmpty
              ? (currentState as ShowThreadListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowThreadListingLoaded(  show_thread: show_thread ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
		      ShowThreadListingModel? show_thread = await listingRefreshShowThread();
			   int deltaPage = show_thread!.items.items.length ~/ (show_thread!.tools.paging.total_rows/show_thread!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              return emit (show_thread!.items.items.isEmpty
              ? (currentState as ShowThreadListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowThreadListingLoaded(  show_thread: show_thread ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ShowThreadListingError());
      }
  }



  @override
  get initialState => ShowThreadListingUninitialized();

  @override

  Stream<ShowThreadState> mapEventToState(ShowThreadEvent event) async* {
    final currentState = state;
    if (event is ShowThreadList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ShowThreadListingUninitialized){
			  if(isSearch){
			     ShowThreadListingModel? show_thread = await listingSearchShowThread(1);
				  int deltaPage = show_thread!.items.items.length ~/(show_thread!.tools.paging.total_rows/show_thread!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield show_thread!.items.items.isEmpty ? (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ShowThreadListingLoaded(show_thread: show_thread,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   ShowThreadListingModel? show_thread = await listingShowThread(1);
				   int deltaPage;
				   if(show_thread!.tools.paging.total_pages != 0){
				      deltaPage = show_thread!.items.items.length ~/(show_thread!.tools.paging.total_rows/show_thread!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield show_thread!.items.items.isEmpty ? (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ShowThreadListingLoaded(show_thread: show_thread,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield ShowThreadListingLoaded(show_thread: show_thread,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is ShowThreadListingLoaded) {
          //page++;
		  final oldpage = (currentState as ShowThreadListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as ShowThreadListingLoaded).page! + 1;
				  ShowThreadListingModel? show_thread = await listingSearchShowThread(page);
				 if ((currentState as ShowThreadListingLoaded).show_thread!.tools.paging.total_pages == oldpage) {
					yield (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!show_thread!.items.items.isEmpty){
						 (currentState as ShowThreadListingLoaded).show_thread!.items.items.addAll(show_thread!.items.items);
					  }
					  yield show_thread!.items.items.isEmpty
						  ? (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : ShowThreadListingLoaded(  show_thread:  (currentState as ShowThreadListingLoaded).show_thread ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as ShowThreadListingLoaded).page! + 1;
				   if ((currentState as ShowThreadListingLoaded).show_thread!.tools.paging.total_pages == oldpage) {
					yield (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  ShowThreadListingModel? show_thread = await listingShowThread(page);
					  yield show_thread!.items.items.isEmpty
						  ? (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : ShowThreadListingLoaded(  show_thread:  show_thread ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield ShowThreadListingError();
      }
    } else if (event is ShowThreadListingRefresh){
      try {
        if (currentState is ShowThreadListingUninitialized) {
		   if(isSearch){
		      ShowThreadListingModel? show_thread = await listingSearchShowThread(1);
              yield ShowThreadListingLoaded( show_thread: show_thread,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     ShowThreadListingModel? show_thread = await listingShowThread(1);
             yield ShowThreadListingLoaded( show_thread: show_thread,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is ShowThreadListingLoaded) {
		  if(isSearch){
		     ShowThreadListingModel? show_thread = await listingSearchRefreshShowThread();
              yield show_thread!.items.items.isEmpty
              ? (currentState as ShowThreadListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowThreadListingLoaded(  show_thread: show_thread ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      ShowThreadListingModel? show_thread = await listingRefreshShowThread();
			   int deltaPage = show_thread!.items.items.length ~/ (show_thread!.tools.paging.total_rows/show_thread!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield show_thread!.items.items.isEmpty
              ? (currentState as ShowThreadListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowThreadListingLoaded(  show_thread: show_thread ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ShowThreadListingError();
      }

    }
  }



  bool hasReachedMax(ShowThreadState state) =>
      state is ShowThreadListingLoaded && state.hasReachedMax!;


  Future<ShowThreadListingModel?> listingShowThread(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getShowThreadListAPI(url, page);
	/*
	var dt  = ShowThreadListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowThreadListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<ShowThreadListingModel?> listingRefreshShowThread() async {
  
  
   ShowThreadListingModel? show_thread = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllShowThreadList1();
    show_thread  = await apiRepProvider!.getShowThreadListAPI(url, 1);
    return show_thread;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ShowThreadListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowThreadListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<ShowThreadListingModel?> listingSearchShowThread(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getShowThreadListSearchAPI(url, page);
	
	/*
	var dt  = ShowThreadListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowThreadListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<ShowThreadListingModel?> listingSearchRefreshShowThread() async {
   ShowThreadListingModel? show_thread = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllShowThreadList1();
    show_thread  = await apiRepProvider!.getShowThreadListSearchAPI(url, 1);
    return show_thread;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ShowThreadListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowThreadListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<ShowThreadListingModel> _loadAndSaveShowThreadListSearch(ShowThreadListingModel list, String searchKey, int page) async{

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


class  UserShowThreadListBottomLoader extends StatelessWidget {
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







  

