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

class ServicesListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ChatBloc? cb;
  ServicesListBase({Key? key, this.id, this.title, this.url, this.cb}) : super(key: key);
  @override
  ServicesListBaseState createState() => ServicesListBaseState();
}

class  ServicesListBaseState extends State<ServicesListBase>{
  String title = 'Services'; 
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
  ServicesListing? listing;

  ServicesListBaseState() {
   
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
     String service_id = 'service_id';
	 service_id = service_id.replaceAll('_id','');
     getPath = widget.url! + service_id + 'page=%s';
	 
	listing = new ServicesListing(AppProvider.getApplication(context), getPath, false, ServicesListingUninitialized());
    listing!.add(ServicesList());
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
	
	 return BlocBuilder<ServicesListing, ServicesState>(
      //cubit: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is ServicesListingUninitialized) {
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
								  'Services',
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
        if (state is ServicesListingError) {
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
								  'Services',
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
        if (state is ServicesListingLoaded) {
          if (state.services!.items.items.isEmpty) {
		  if (state.services!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.services!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.services!.listButton(context, widget.id!).length == 0){ 
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
								  'Services',
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
																		text: "Services ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																		TextSpan(
																		text: "by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}",
																		style: TextStyle(
																			fontSize: 14.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																																			]),
																),
																	


																//Text('Services by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.services!.items.items.length? 
													state.services!.tools.paging.total_pages == state.services!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													PublicServicesListBottomLoader()
															  : index == 0 ?
											 state.services!.viewItem2 (state.services!.items.items[index] , state.services!.items.items[index] , searchText ,context, account, widget.id!, widget.title!, userid, state.hasReachedMax!, state.services!.items.items.length, index, widget.cb!)
											  :state.services!.viewItem2 (state.services!.items.items[index] , state.services!.items.items[index-1] , searchText ,context,  account, widget.id!, widget.title!, userid, state.hasReachedMax!, state.services!.items.items.length-1, index, widget.cb!);

												// : state.services!.viewItem (state.services!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.services!.items.items.length
										: state.services!.items.items.length + 1,
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
							  child: Text('Services', style: TextStyle(fontSize: 20, color: Colors.white),),
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
																			  ? state.services!.items.items.length
																			  : state.services!.items.items.length + 1,
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
																			return index >= state.services!.items.items.length? 
																			state.services!.tools.paging.total_pages == state.services!.tools.paging.current_page?
																			Container(height: 0.0, width: 0.0,):	
																			PublicServicesListBottomLoader()
																				: state.services!.viewItem1 (state.services!.items.items[index] , state.services!.items.items[index] , searchText, context, account, widget.id!, true, 1, 1 );
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
					//  floatingActionButton:  state.services!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Services',
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
																		text: "Services ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																		TextSpan(
																		text: "by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}",
																		style: TextStyle(
																			fontSize: 14.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																//Text('Services by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.services!.items.items.length? 
													state.services!.tools.paging.total_pages == state.services!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													PublicServicesListBottomLoader()
															  : index == 0 ?
											 state.services!.viewItem2 (state.services!.items.items[index] , state.services!.items.items[index] , searchText ,context, account, widget.id!, widget.title!, userid, state.hasReachedMax!, state.services!.items.items.length, index, widget.cb!)
											  :state.services!.viewItem2 (state.services!.items.items[index] , state.services!.items.items[index-1] , searchText ,context,  account, widget.id!, widget.title!, userid, state.hasReachedMax!, state.services!.items.items.length-1, index, widget.cb!);
											  // : state.services!.viewItem (state.services!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.services!.items.items.length
										: state.services!.items.items.length + 1,
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
							  child: Text('Services', style: TextStyle(fontSize: 20, color: Colors.white),),
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
																			  ? state.services!.items.items.length
																			  : state.services!.items.items.length + 1,
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
																			return index >= state.services!.items.items.length? 
																			state.services!.tools.paging.total_pages == state.services!.tools.paging.current_page?
																			Container(height: 0.0, width: 0.0,):	
																			PublicServicesListBottomLoader()
																				: state.services!.viewItem1 (state.services!.items.items[index] , state.services!.items.items[index] , searchText, context, account, widget.id!,true, 1, 1 );
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
					  floatingActionButton:  state.services!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Services',
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
																		text: "Services ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																		TextSpan(
																		text: "by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}",
																		style: TextStyle(
																			fontSize: 14.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
															//	Text('Services by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.services!.items.items.length? 
													state.services!.tools.paging.total_pages == state.services!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													PublicServicesListBottomLoader()
															  : index == 0 ?
											 state.services!.viewItem2 (state.services!.items.items[index] , state.services!.items.items[index] , searchText ,context, account, widget.id!, widget.title!, userid, state.hasReachedMax!, state.services!.items.items.length, index,  widget.cb!)
											  :state.services!.viewItem2 (state.services!.items.items[index] , state.services!.items.items[index-1] , searchText ,context,  account, widget.id!, widget.title!, userid, state.hasReachedMax!, state.services!.items.items.length-1, index, widget.cb!);
											  // : state.services!.viewItem (state.services!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.services!.items.items.length
										: state.services!.items.items.length + 1,
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
							  child: Text('Services', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.services!.items.items.length? 
																		state.services!.tools.paging.total_pages == state.services!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		PublicServicesListBottomLoader()
																				  : index == 0 ?
																  state.services!.viewItem1 (state.services!.items.items[index] , state.services!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.services!.items.items.length, index)
																  :state.services!.viewItem1 (state.services!.items.items[index] , state.services!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.services!.items.items.length-1, index);
																	 // : state.services!.viewItem (state.services!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.services!.items.items.length
																	: state.services!.items.items.length + 1,
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

								  return index >= state.services!.items.items.length? 
										state.services!.tools.paging.total_pages == state.services!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										PublicServicesListBottomLoader()
									 			  : index == 0 ?
								  state.services!.viewItem1 (state.services!.items.items[index] , state.services!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.services!.items.items.length, index)
								  :state.services!.viewItem1 (state.services!.items.items[index] , state.services!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.services!.items.items.length-1, index);
									 // : state.services!.viewItem (state.services!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.services!.items.items.length
									: state.services!.items.items.length + 1,
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
    listing!.add(ServicesListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ServicesList());
    }

  }
}




abstract class ServicesEvent extends Equatable {
   const ServicesEvent();
   @override
    List<Object> get props => [];
}

class ServicesList extends ServicesEvent {
  @override
  String toString() => 'ServicesList';
}

class ServicesListingRefresh extends ServicesEvent {
  @override
  String toString() => 'ServicesListingRefresh';
}

class ServicesListingChangeSearch extends ServicesEvent {
  @override
  String toString() => 'ServicesChangeSearch';
}


abstract class ServicesState extends Equatable {
   const ServicesState();
   @override
    List<Object> get props => [];
}

class ServicesListingUninitialized extends ServicesState {
  @override
  String toString() => 'ServicesListingUninitialized';
}

class ServicesListingError extends ServicesState {
  @override
  String toString() => 'ServicesListingError';
}

class ServicesListingLoaded extends ServicesState {
  final ServicesListingModel? services;
  final bool? hasReachedMax;
  final int?  page;

  ServicesListingLoaded({
    this.services,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [services!, hasReachedMax!, page!];
	
  ServicesListingLoaded copyWith({
    ServicesListingModel? services,
    bool? hasReachedMax,
    int? page,
  }) {
    return ServicesListingLoaded(
      services: services ?? this.services,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ServicesListingLoaded  ServicesListing: ${ services!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ServicesListing extends Bloc<ServicesEvent, ServicesState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ServicesListing(this.application, this.url, this.isSearch, ServicesState initialState):super(initialState);
  @override
  void dispose() {
   // super.dispose();
  }


  @override
	/*
 Stream<Transition<ServicesEvent, ServicesState>> transformEvents(
      Stream<ServicesEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }

	 */
	EventTransformer<ServicesEvent> transform<ServicesEvent>(Duration duration) {
		return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
	}

  @override
  void onTransition(Transition<ServicesEvent, ServicesState> transition) {
    print(transition);
  }

  @override
  get initialState => ServicesListingUninitialized();

  @override

  Stream<ServicesState> mapEventToState(ServicesEvent event) async* {
    final currentState = state;
    if (event is ServicesList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ServicesListingUninitialized){
			  if(isSearch){
			     ServicesListingModel? services = await listingSearchServices(1);
				  int deltaPage = services!.items.items.length ~/(services!.tools.paging.total_rows/services!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield services!.items.items.isEmpty ? (currentState as ServicesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ServicesListingLoaded(services: services,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ServicesListingModel? services = await listingServices(1);
				  int deltaPage = services!.items.items.length ~/(services!.tools.paging.total_rows/services!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				    deltaPage = 1;
				  }
				  yield services!.items.items.isEmpty ? (currentState as ServicesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ServicesListingLoaded(services: services,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ServicesListingLoaded) {
          //page++;
		  final oldpage = (currentState as ServicesListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as ServicesListingLoaded).page! + 1;
				  ServicesListingModel? services = await listingSearchServices(page);
				 if ((currentState as ServicesListingLoaded).services!.tools.paging.total_pages == oldpage) {
					yield (currentState as ServicesListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!services!.items.items.isEmpty){
						 (currentState as ServicesListingLoaded).services!.items.items.addAll(services!.items.items);
					  }
					  yield services!.items.items.isEmpty
						  ? (currentState as ServicesListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : ServicesListingLoaded(  services:  (currentState as ServicesListingLoaded).services ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
		  
				  final page = (currentState as ServicesListingLoaded).page! + 1;
				   if ((currentState as ServicesListingLoaded).services!.tools.paging.total_pages == oldpage) {
					yield (currentState as ServicesListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  ServicesListingModel? services = await listingServices(page);
					  yield services!.items.items.isEmpty
						  ? (currentState as ServicesListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : ServicesListingLoaded(  services:  services ,
												  hasReachedMax: false,
												  page: page,);
				 }								  
			}	  
        }
      } catch (_) {
        yield ServicesListingError();
      }
    } else if (event is ServicesListingRefresh){
      try {
        if (currentState is ServicesListingUninitialized) {
		   if(isSearch){
		      ServicesListingModel? services = await listingSearchServices(1);
              yield ServicesListingLoaded( services: services,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ServicesListingModel? services = await listingServices(1);
             yield ServicesListingLoaded( services: services,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ServicesListingLoaded) {
		  if(isSearch){
		     ServicesListingModel? services = await listingSearchRefreshServices();
              yield services!.items.items.isEmpty
              ? (currentState as ServicesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServicesListingLoaded(  services: services ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ServicesListingModel? services = await listingRefreshServices();
              yield services!.items.items.isEmpty
              ? (currentState as ServicesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServicesListingLoaded(  services: services ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ServicesListingError();
      }

    }
  }



  bool hasReachedMax(ServicesState state) =>
      state is ServicesListingLoaded && state.hasReachedMax!;


  Future<ServicesListingModel?> listingServices(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ServicesListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServicesListSearch(dt ,'',page);
	
	return data;
  }

  Future<ServicesListingModel?> listingRefreshServices() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ServicesListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServicesListSearch(dt ,'',page);
	
	return data;
  }

  Future<ServicesListingModel?> listingSearchServices(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ServicesListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServicesListSearch(dt ,'',page);	
	return data;
  }

  Future<ServicesListingModel?> listingSearchRefreshServices() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ServicesListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServicesListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ServicesListingModel> _loadAndSaveServicesListSearch(ServicesListingModel list, String searchKey, int page) async{

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


class  PublicServicesListBottomLoader extends StatelessWidget {
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







  

