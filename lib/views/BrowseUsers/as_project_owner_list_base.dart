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



class AsProjectOwnerListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  AsProjectOwnerListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  AsProjectOwnerListBaseState createState() => AsProjectOwnerListBaseState();
}

class  AsProjectOwnerListBaseState extends State<AsProjectOwnerListBase>{
  String title = 'As Project Owner'; 
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
  AsProjectOwnerListing? listing;

  AsProjectOwnerListBaseState() {
   
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
     String project_id = 'project_id';
	 project_id = project_id.replaceAll('_id','');
     getPath = widget.url! + project_id + 'page=%s';
	 
	listing =      AsProjectOwnerListing(AppProvider.getApplication(context), getPath, false, AsProjectOwnerListingUninitialized());
    listing!.add(AsProjectOwnerList());
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
	
	 return BlocBuilder<AsProjectOwnerListing, AsProjectOwnerState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is AsProjectOwnerListingUninitialized) {
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
        if (state is AsProjectOwnerListingError) {
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
								  'As Project Owner',
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
        if (state is AsProjectOwnerListingLoaded) {
          if (state.as_project_owner!.items.items.isEmpty) {
		  if (state.as_project_owner!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.as_project_owner!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.as_project_owner!.listButton(context, widget.id!).length == 0){ 
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
								  'As Project Owner',
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
																		text: "As Project Owner ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																	


																//Text('As Project Owner by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.as_project_owner!.items.items.length? 
													state.as_project_owner!.tools.paging.total_pages == state.as_project_owner!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													PublicAsProjectOwnerListBottomLoader()
															  : index == 0 ?
											   state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.as_project_owner!.items.items.length, index)
											  :state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.as_project_owner!.items.items.length-1, index);											

												// : state.as_project_owner!.viewItem (state.as_project_owner!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.as_project_owner!.items.items.length
										: state.as_project_owner!.items.items.length + 1,
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
							  child: Text('As Project Owner', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.as_project_owner!.items.items.length? 
																		state.as_project_owner!.tools.paging.total_pages == state.as_project_owner!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		PublicAsProjectOwnerListBottomLoader()
																				  : index == 0 ?
																  state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.as_project_owner!.items.items.length, index)
																  :state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.as_project_owner!.items.items.length-1, index);
																	 // : state.as_project_owner!.viewItem (state.as_project_owner!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.as_project_owner!.items.items.length
																	: state.as_project_owner!.items.items.length + 1,
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
					//  floatingActionButton:  state.as_project_owner!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'As Project Owner',
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
																		text: "As Project Owner ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
																//Text('As Project Owner by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.as_project_owner!.items.items.length? 
													state.as_project_owner!.tools.paging.total_pages == state.as_project_owner!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													PublicAsProjectOwnerListBottomLoader()
															  : index == 0 ?
											   state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.as_project_owner!.items.items.length, index)
											  :state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.as_project_owner!.items.items.length-1, index);											
											  // : state.as_project_owner!.viewItem (state.as_project_owner!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.as_project_owner!.items.items.length
										: state.as_project_owner!.items.items.length + 1,
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
							  child: Text('As Project Owner', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.as_project_owner!.items.items.length? 
																		state.as_project_owner!.tools.paging.total_pages == state.as_project_owner!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		PublicAsProjectOwnerListBottomLoader()
																				  : index == 0 ?
																  state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.as_project_owner!.items.items.length, index)
																  :state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.as_project_owner!.items.items.length-1, index);
																	 // : state.as_project_owner!.viewItem (state.as_project_owner!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.as_project_owner!.items.items.length
																	: state.as_project_owner!.items.items.length + 1,
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
					  floatingActionButton:  state.as_project_owner!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'As Project Owner',
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
																		text: "As Project Owner ",
																		style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
																	]),
																),
															//	Text('As Project Owner by ${filterShortcodes(readText(widget.title!.replaceAll('&amp;','&'), 40))}', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.as_project_owner!.items.items.length? 
													state.as_project_owner!.tools.paging.total_pages == state.as_project_owner!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													PublicAsProjectOwnerListBottomLoader()
															  : index == 0 ?
											   state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.as_project_owner!.items.items.length, index)
											  :state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.as_project_owner!.items.items.length-1, index);											
											  // : state.as_project_owner!.viewItem (state.as_project_owner!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.as_project_owner!.items.items.length
										: state.as_project_owner!.items.items.length + 1,
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
							  child: Text('As Project Owner', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.as_project_owner!.items.items.length? 
																		state.as_project_owner!.tools.paging.total_pages == state.as_project_owner!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		PublicAsProjectOwnerListBottomLoader()
																				  : index == 0 ?
																  state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.as_project_owner!.items.items.length, index)
																  :state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.as_project_owner!.items.items.length-1, index);
																	 // : state.as_project_owner!.viewItem (state.as_project_owner!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.as_project_owner!.items.items.length
																	: state.as_project_owner!.items.items.length + 1,
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

								  return index >= state.as_project_owner!.items.items.length? 
										state.as_project_owner!.tools.paging.total_pages == state.as_project_owner!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										PublicAsProjectOwnerListBottomLoader()
									 			  : index == 0 ?
								  state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.as_project_owner!.items.items.length, index)
								  :state.as_project_owner!.viewItem1 (state.as_project_owner!.items.items[index] , state.as_project_owner!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.as_project_owner!.items.items.length-1, index);
									 // : state.as_project_owner!.viewItem (state.as_project_owner!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.as_project_owner!.items.items.length
									: state.as_project_owner!.items.items.length + 1,
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
    listing!.add(AsProjectOwnerListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(AsProjectOwnerList());
    }

  }
}




abstract class AsProjectOwnerEvent extends Equatable {
   const AsProjectOwnerEvent();
   @override
    List<Object> get props => [];
}

class AsProjectOwnerList extends AsProjectOwnerEvent {
  @override
  String toString() => 'AsProjectOwnerList';
}

class AsProjectOwnerListingRefresh extends AsProjectOwnerEvent {
  @override
  String toString() => 'AsProjectOwnerListingRefresh';
}

class AsProjectOwnerListingChangeSearch extends AsProjectOwnerEvent {
  @override
  String toString() => 'AsProjectOwnerChangeSearch';
}


abstract class AsProjectOwnerState extends Equatable {
   const AsProjectOwnerState();
   @override
    List<Object> get props => [];
}

class AsProjectOwnerListingUninitialized extends AsProjectOwnerState {
  @override
  String toString() => 'AsProjectOwnerListingUninitialized';
}

class AsProjectOwnerListingError extends AsProjectOwnerState {
  @override
  String toString() => 'AsProjectOwnerListingError';
}

class AsProjectOwnerListingLoaded extends AsProjectOwnerState {
  final AsProjectOwnerListingModel? as_project_owner;
  final bool? hasReachedMax;
  final int?  page;

  AsProjectOwnerListingLoaded({
    this.as_project_owner,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [as_project_owner!, hasReachedMax!, page!];
	
  AsProjectOwnerListingLoaded copyWith({
    AsProjectOwnerListingModel? as_project_owner,
    bool? hasReachedMax,
    int? page,
  }) {
    return AsProjectOwnerListingLoaded(
      as_project_owner: as_project_owner ?? this.as_project_owner,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'AsProjectOwnerListingLoaded  AsProjectOwnerListing: ${ as_project_owner!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class AsProjectOwnerListing extends Bloc<AsProjectOwnerEvent, AsProjectOwnerState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  AsProjectOwnerListing(this.application, this.url, this.isSearch, AsProjectOwnerState initialState):
  super(initialState){
   on<AsProjectOwnerList>(_AsProjectOwnerListEvent);
	 on<AsProjectOwnerListingRefresh>(_AsProjectOwnerListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<AsProjectOwnerEvent, AsProjectOwnerState>> transformEvents(
      Stream<AsProjectOwnerEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<AsProjectOwnerEvent> transform<AsProjectOwnerEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<AsProjectOwnerEvent, AsProjectOwnerState> transition) {
    print(transition);
  }


  void _AsProjectOwnerListEvent(AsProjectOwnerList event, Emitter<AsProjectOwnerState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is AsProjectOwnerListingUninitialized){
			  if(isSearch){
			     AsProjectOwnerListingModel? as_project_owner = await listingSearchAsProjectOwner(1);
				  int deltaPage = as_project_owner!.items.items.length ~/(as_project_owner!.tools.paging.total_rows/as_project_owner!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( as_project_owner!.items.items.isEmpty ? (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :AsProjectOwnerListingLoaded(as_project_owner: as_project_owner,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				   AsProjectOwnerListingModel? as_project_owner = await listingAsProjectOwner(1);
				   int deltaPage;
				   if(as_project_owner!.tools.paging.total_pages != 0){
				      deltaPage = as_project_owner!.items.items.length ~/(as_project_owner!.tools.paging.total_rows/as_project_owner!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   return emit ( as_project_owner!.items.items.isEmpty ? (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :AsProjectOwnerListingLoaded(as_project_owner: as_project_owner,
					  hasReachedMax: false,
					  page: deltaPage));
					  
					  }else{
					    deltaPage = 0;
						 return emit ( AsProjectOwnerListingLoaded(as_project_owner: as_project_owner,
					  hasReachedMax: false,
					  page: deltaPage));
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is AsProjectOwnerListingLoaded) {
          //page++;
		  final oldpage = (currentState as AsProjectOwnerListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as AsProjectOwnerListingLoaded).page! + 1;
				  AsProjectOwnerListingModel? as_project_owner = await listingSearchAsProjectOwner(page);
				 if ((currentState as AsProjectOwnerListingLoaded).as_project_owner!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!as_project_owner!.items.items.isEmpty){
						 (currentState as AsProjectOwnerListingLoaded).as_project_owner!.items.items.addAll(as_project_owner!.items.items);
					  }
					  return emit ( as_project_owner!.items.items.isEmpty
						  ? (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : AsProjectOwnerListingLoaded(  as_project_owner:  (currentState as AsProjectOwnerListingLoaded).as_project_owner ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
				  final page = (currentState as AsProjectOwnerListingLoaded).page! + 1;
				   if ((currentState as AsProjectOwnerListingLoaded).as_project_owner!.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  AsProjectOwnerListingModel? as_project_owner = await listingAsProjectOwner(page);
					 return emit (as_project_owner!.items.items.isEmpty
						  ? (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : AsProjectOwnerListingLoaded(  as_project_owner:  as_project_owner ,
												  hasReachedMax: false,
												  page: page,));
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        return emit ( AsProjectOwnerListingError());
      }
    }
  }

  void _AsProjectOwnerListingRefreshEvent(AsProjectOwnerListingRefresh event, Emitter<AsProjectOwnerState> emit)async{
  final currentState = state;
   try {
        if (currentState is AsProjectOwnerListingUninitialized) {
		   if(isSearch){
		      AsProjectOwnerListingModel? as_project_owner = await listingSearchAsProjectOwner(1);
              return emit ( AsProjectOwnerListingLoaded( as_project_owner: as_project_owner,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
		     AsProjectOwnerListingModel? as_project_owner = await listingAsProjectOwner(1);
             return emit ( AsProjectOwnerListingLoaded( as_project_owner: as_project_owner,
                   hasReachedMax: false,
                   page: 1 ));
				   
		   }

        }

        if (currentState is AsProjectOwnerListingLoaded) {
		  if(isSearch){
		     AsProjectOwnerListingModel? as_project_owner = await listingSearchRefreshAsProjectOwner();
              return emit ( as_project_owner!.items.items.isEmpty
              ? (currentState as AsProjectOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : AsProjectOwnerListingLoaded(  as_project_owner: as_project_owner ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
		      AsProjectOwnerListingModel? as_project_owner = await listingRefreshAsProjectOwner();
			   int deltaPage = as_project_owner!.items.items.length ~/ (as_project_owner!.tools.paging.total_rows/as_project_owner!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              return emit (as_project_owner!.items.items.isEmpty
              ? (currentState as AsProjectOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : AsProjectOwnerListingLoaded(  as_project_owner: as_project_owner ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (AsProjectOwnerListingError());
      }
  }



  @override
  get initialState => AsProjectOwnerListingUninitialized();

  @override

  Stream<AsProjectOwnerState> mapEventToState(AsProjectOwnerEvent event) async* {
    final currentState = state;
    if (event is AsProjectOwnerList && !hasReachedMax(currentState)) {
      try {
        if (currentState is AsProjectOwnerListingUninitialized){
			  if(isSearch){
			     AsProjectOwnerListingModel? as_project_owner = await listingSearchAsProjectOwner(1);
				  int deltaPage = as_project_owner!.items.items.length ~/(as_project_owner!.tools.paging.total_rows/as_project_owner!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield as_project_owner!.items.items.isEmpty ? (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :AsProjectOwnerListingLoaded(as_project_owner: as_project_owner,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   AsProjectOwnerListingModel? as_project_owner = await listingAsProjectOwner(1);
				   int deltaPage;
				   if(as_project_owner!.tools.paging.total_pages != 0){
				      deltaPage = as_project_owner!.items.items.length ~/(as_project_owner!.tools.paging.total_rows/as_project_owner!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield as_project_owner!.items.items.isEmpty ? (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :AsProjectOwnerListingLoaded(as_project_owner: as_project_owner,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield AsProjectOwnerListingLoaded(as_project_owner: as_project_owner,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is AsProjectOwnerListingLoaded) {
          //page++;
		  final oldpage = (currentState as AsProjectOwnerListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as AsProjectOwnerListingLoaded).page! + 1;
				  AsProjectOwnerListingModel? as_project_owner = await listingSearchAsProjectOwner(page);
				 if ((currentState as AsProjectOwnerListingLoaded).as_project_owner!.tools.paging.total_pages == oldpage) {
					yield (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!as_project_owner!.items.items.isEmpty){
						 (currentState as AsProjectOwnerListingLoaded).as_project_owner!.items.items.addAll(as_project_owner!.items.items);
					  }
					  yield as_project_owner!.items.items.isEmpty
						  ? (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : AsProjectOwnerListingLoaded(  as_project_owner:  (currentState as AsProjectOwnerListingLoaded).as_project_owner ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as AsProjectOwnerListingLoaded).page! + 1;
				   if ((currentState as AsProjectOwnerListingLoaded).as_project_owner!.tools.paging.total_pages == oldpage) {
					yield (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  AsProjectOwnerListingModel? as_project_owner = await listingAsProjectOwner(page);
					  yield as_project_owner!.items.items.isEmpty
						  ? (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : AsProjectOwnerListingLoaded(  as_project_owner:  as_project_owner ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield AsProjectOwnerListingError();
      }
    } else if (event is AsProjectOwnerListingRefresh){
      try {
        if (currentState is AsProjectOwnerListingUninitialized) {
		   if(isSearch){
		      AsProjectOwnerListingModel? as_project_owner = await listingSearchAsProjectOwner(1);
              yield AsProjectOwnerListingLoaded( as_project_owner: as_project_owner,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     AsProjectOwnerListingModel? as_project_owner = await listingAsProjectOwner(1);
             yield AsProjectOwnerListingLoaded( as_project_owner: as_project_owner,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is AsProjectOwnerListingLoaded) {
		  if(isSearch){
		     AsProjectOwnerListingModel? as_project_owner = await listingSearchRefreshAsProjectOwner();
              yield as_project_owner!.items.items.isEmpty
              ? (currentState as AsProjectOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : AsProjectOwnerListingLoaded(  as_project_owner: as_project_owner ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      AsProjectOwnerListingModel? as_project_owner = await listingRefreshAsProjectOwner();
			   int deltaPage = as_project_owner!.items.items.length ~/ (as_project_owner!.tools.paging.total_rows/as_project_owner!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield as_project_owner!.items.items.isEmpty
              ? (currentState as AsProjectOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : AsProjectOwnerListingLoaded(  as_project_owner: as_project_owner ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield AsProjectOwnerListingError();
      }

    }
  }



  bool hasReachedMax(AsProjectOwnerState state) =>
      state is AsProjectOwnerListingLoaded && state.hasReachedMax!;


  Future<AsProjectOwnerListingModel?> listingAsProjectOwner(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getAsProjectOwnerListAPI(url, page);
	/*
	var dt  = AsProjectOwnerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveAsProjectOwnerListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<AsProjectOwnerListingModel?> listingRefreshAsProjectOwner() async {
  
  
   AsProjectOwnerListingModel? as_project_owner = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllAsProjectOwnerList1();
    as_project_owner  = await apiRepProvider!.getAsProjectOwnerListAPI(url, 1);
    return as_project_owner;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = AsProjectOwnerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveAsProjectOwnerListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<AsProjectOwnerListingModel?> listingSearchAsProjectOwner(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getAsProjectOwnerListSearchAPI(url, page);
	
	/*
	var dt  = AsProjectOwnerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveAsProjectOwnerListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<AsProjectOwnerListingModel?> listingSearchRefreshAsProjectOwner() async {
   AsProjectOwnerListingModel? as_project_owner = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllAsProjectOwnerList1();
    as_project_owner  = await apiRepProvider!.getAsProjectOwnerListSearchAPI(url, 1);
    return as_project_owner;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = AsProjectOwnerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveAsProjectOwnerListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<AsProjectOwnerListingModel> _loadAndSaveAsProjectOwnerListSearch(AsProjectOwnerListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.owner_feedback;
	  list.items.items[i].item.ttl = list.items.items[i].item.title;
    }
    return list;
 }


class  PublicAsProjectOwnerListBottomLoader extends StatelessWidget {
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







  

