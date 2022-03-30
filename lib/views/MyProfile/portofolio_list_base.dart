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
import 'portofolio_add_portofolio.dart';
import 'portofolio_edit.dart';

/** AUTOGENERATE OFF **/

class PortofolioListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PortofolioListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PortofolioListBaseState createState() => PortofolioListBaseState();
}

class  PortofolioListBaseState extends State<PortofolioListBase>{
  String title = 'Portofolio'; 
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
  PortofolioListing? listing;

  PortofolioListBaseState() {
   
    scrollController.addListener(_onScroll);
  }




  @override
  Widget build(BuildContext context) {
    bool darkMode = false;
	String userid = '';
   final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
     String portofolio_id = 'portofolio_id';
	 portofolio_id = portofolio_id.replaceAll('_id','');
     getPath = widget.url! + portofolio_id + 'page=%s';
	 
	listing =     PortofolioListing(AppProvider.getApplication(context), getPath, false, PortofolioListingUninitialized());
    listing!.add(PortofolioList());
	accountController =     AccountController(AppProvider.getApplication(context),
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
	
	 return BlocBuilder<PortofolioListing, PortofolioState>(
     // cubit: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is PortofolioListingUninitialized) {
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
								  'Portofolio',
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
					 valueColor:     AlwaysStoppedAnimation<Color>(
							 Colors.green),
				))
		  );
        }
        if (state is PortofolioListingError) {
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
								  'Portofolio',
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
        if (state is PortofolioListingLoaded) {
          if (state.portofolio!.items.items.isEmpty) {
		  if (state.portofolio!.listButton(context, widget.id!).length == 0){
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
                 floatingActionButton: state.portofolio!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.portofolio!.listButton(context, widget.id!).length == 0){
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
								  'Portofolio',
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
						  title: Text(readText(widget.title!, 40), style: TextStyle(color: Colors.white, fontSize: 14)),
						  // Allows the user to reveal the app bar if they begin scrolling
						  // back up the list of items.
						  floating: true,
						   leading:     IconButton(
									  icon:     Icon(Icons.close, color: Colors.white,),
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
														  child :     Column(
															  mainAxisAlignment: MainAxisAlignment.end,
															  children: <Widget>[
																Text('Portofolio', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.portofolio!.items.items.length? 
													state.portofolio!.tools.paging.total_pages == state.portofolio!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserPortofolioListBottomLoader()
															  : index == 0 ?
							state.portofolio!.viewItem2 (state.portofolio!.items.items[index] ,  searchText ,account, widget.id!,  this)
									:state.portofolio!.viewItem2 (state.portofolio!.items.items[index] ,  searchText ,account, widget.id!, this);

								// : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.portofolio!.items.items.length
										: state.portofolio!.items.items.length + 1,
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
							  child: Text('Portofolio', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.portofolio!.items.items.length? 
																		state.portofolio!.tools.paging.total_pages == state.portofolio!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPortofolioListBottomLoader()
																				  : index == 0 ?
																  state.portofolio!.viewItem1 (state.portofolio!.items.items[index] , state.portofolio!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.portofolio!.items.items.length, index)
																  :state.portofolio!.viewItem1 (state.portofolio!.items.items[index] , state.portofolio!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.portofolio!.items.items.length-1, index);
																	 // : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.portofolio!.items.items.length
																	: state.portofolio!.items.items.length + 1,
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
					//  floatingActionButton:  state.portofolio!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Portofolio',
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
						  title: Text(readText(widget.title!, 40), style: TextStyle(color: Colors.white, fontSize: 14)),
						  // Allows the user to reveal the app bar if they begin scrolling
						  // back up the list of items.
						  floating: true,
						   leading:     IconButton(
									  icon:     Icon(Icons.close, color: Colors.white,),
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
														  child :     Column(
															  mainAxisAlignment: MainAxisAlignment.end,
															  children: <Widget>[
																Text('Portofolio', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.portofolio!.items.items.length? 
													state.portofolio!.tools.paging.total_pages == state.portofolio!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserPortofolioListBottomLoader()
															  : index == 0 ?
											   state.portofolio!.viewItem2 (state.portofolio!.items.items[index] ,  searchText ,account, widget.id!,  this)
											  :state.portofolio!.viewItem2 (state.portofolio!.items.items[index] ,  searchText ,account, widget.id!, this);
											  // : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.portofolio!.items.items.length
										: state.portofolio!.items.items.length + 1,
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
							  child: Text('Portofolio', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.portofolio!.items.items.length? 
																		state.portofolio!.tools.paging.total_pages == state.portofolio!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPortofolioListBottomLoader()
																				  : index == 0 ?
																  state.portofolio!.viewItem1 (state.portofolio!.items.items[index] , state.portofolio!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.portofolio!.items.items.length, index)
																  :state.portofolio!.viewItem1 (state.portofolio!.items.items[index] , state.portofolio!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.portofolio!.items.items.length-1, index);
																	 // : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.portofolio!.items.items.length
																	: state.portofolio!.items.items.length + 1,
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
					  floatingActionButton:  state.portofolio!.Buttons(context, _dialVisible, widget.id!)
					
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
								  'Portofolio',
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
						  title: Text(readText(widget.title!, 40), style: TextStyle(color: Colors.white, fontSize: 14)),
						  // Allows the user to reveal the app bar if they begin scrolling
						  // back up the list of items.
						  floating: true,
						   leading:     IconButton(
									  icon:     Icon(Icons.close, color: Colors.white,),
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
														  child :     Column(
															  mainAxisAlignment: MainAxisAlignment.end,
															  children: <Widget>[
																Text('Portofolio', style: TextStyle(fontSize: 20.0, color: darkMode ? CurrentTheme.BackgroundColor : Colors.white)),
															

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
							(context, index){  return index >= state.portofolio!.items.items.length? 
													state.portofolio!.tools.paging.total_pages == state.portofolio!.tools.paging.current_page?
													Container(height: 0.0, width: 0.0,):	
													UserPortofolioListBottomLoader()
															  : index == 0 ?
											   state.portofolio!.viewItem1 (state.portofolio!.items.items[index] , state.portofolio!.items.items[index] , searchText ,context, account, widget.id!,  state.hasReachedMax!, state.portofolio!.items.items.length, index)
											  :state.portofolio!.viewItem1 (state.portofolio!.items.items[index] , state.portofolio!.items.items[index-1] , searchText ,context,  account, widget.id!, state.hasReachedMax!, state.portofolio!.items.items.length-1, index);											
											  // : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText, account, widget.id!, );
												 },
							// Builds 1000 ListTiles
							childCount: state.hasReachedMax!
										? state.portofolio!.items.items.length
										: state.portofolio!.items.items.length + 1,
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
							  child: Text('Portofolio', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.portofolio!.items.items.length? 
																		state.portofolio!.tools.paging.total_pages == state.portofolio!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPortofolioListBottomLoader()
																				  : index == 0 ?
																  state.portofolio!.viewItem1 (state.portofolio!.items.items[index] , state.portofolio!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.portofolio!.items.items.length, index)
																  :state.portofolio!.viewItem1 (state.portofolio!.items.items[index] , state.portofolio!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.portofolio!.items.items.length-1, index);
																	 // : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.portofolio!.items.items.length
																	: state.portofolio!.items.items.length + 1,
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
		
		return     Container(width: 0.0, height: 0.0);
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
            style:     TextStyle(
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
			  child:     ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.portofolio!.items.items.length? 
										state.portofolio!.tools.paging.total_pages == state.portofolio!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserPortofolioListBottomLoader()
									 			  : index == 0 ?
								  state.portofolio!.viewItem1 (state.portofolio!.items.items[index] , state.portofolio!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.portofolio!.items.items.length, index)
								  :state.portofolio!.viewItem1 (state.portofolio!.items.items[index] , state.portofolio!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.portofolio!.items.items.length-1, index);
									 // : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.portofolio!.items.items.length
									: state.portofolio!.items.items.length + 1,
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
    Completer<Null> completer =     Completer<Null>();
    listing!.add(PortofolioListingRefresh());

    Timer timer =     Timer(    Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PortofolioList());
    }

  }
}




abstract class PortofolioEvent extends Equatable {
   const PortofolioEvent();
   @override
    List<Object> get props => [];
}

class PortofolioList extends PortofolioEvent {
  @override
  String toString() => 'PortofolioList';
}

class PortofolioListingRefresh extends PortofolioEvent {
  @override
  String toString() => 'PortofolioListingRefresh';
}

class PortofolioListingChangeSearch extends PortofolioEvent {
  @override
  String toString() => 'PortofolioChangeSearch';
}


abstract class PortofolioState extends Equatable {
   const PortofolioState();
   @override
    List<Object> get props => [];
}

class PortofolioListingUninitialized extends PortofolioState {
  @override
  String toString() => 'PortofolioListingUninitialized';
}

class PortofolioListingError extends PortofolioState {
  @override
  String toString() => 'PortofolioListingError';
}

class PortofolioListingLoaded extends PortofolioState {
  final PortofolioListingModel?portofolio;
  final bool? hasReachedMax;
  final int?  page;

  PortofolioListingLoaded({
    this.portofolio,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [portofolio!, hasReachedMax!, page!];
	
  PortofolioListingLoaded copyWith({
    PortofolioListingModel? portofolio,
    bool? hasReachedMax,
    int? page,
  }) {
    return PortofolioListingLoaded(
      portofolio: portofolio ?? this.portofolio,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PortofolioListingLoaded  PortofolioListing: ${ portofolio!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PortofolioListing extends Bloc<PortofolioEvent, PortofolioState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PortofolioListing(this.application, this.url, this.isSearch, PortofolioState initialState):super(initialState);
  @override
  void dispose() {
   // super.dispose();
  }


  @override
	/*
 Stream<Transition<PortofolioEvent, PortofolioState>> transformEvents(
      Stream<PortofolioEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }

	 */
	EventTransformer<PortofolioEvent> transform<PortofolioEvent>(Duration duration) {
		return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
	}

  @override
  void onTransition(Transition<PortofolioEvent, PortofolioState> transition) {
    print(transition);
  }

  @override
  get initialState => PortofolioListingUninitialized();

  @override

  Stream<PortofolioState> mapEventToState(PortofolioEvent event) async* {
    final currentState = state;
    if (event is PortofolioList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PortofolioListingUninitialized){
			  if(isSearch){
			     PortofolioListingModel? portofolio = await listingSearchPortofolio(1);
				  int deltaPage = portofolio!.items.items.length ~/(portofolio!.tools.paging.total_rows/portofolio!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield portofolio!.items.items.isEmpty ? (currentState as PortofolioListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PortofolioListingLoaded(portofolio: portofolio,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  PortofolioListingModel? portofolio = await listingPortofolio(1);
				  int deltaPage = portofolio!.items.items.length ~/(portofolio!.tools.paging.total_rows/portofolio!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				    deltaPage = 1;
				  }
				  yield portofolio!.items.items.isEmpty ? (currentState as PortofolioListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PortofolioListingLoaded(portofolio: portofolio,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is PortofolioListingLoaded) {
          //page++;
		  final oldpage = (currentState as PortofolioListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as PortofolioListingLoaded).page! + 1;
				  PortofolioListingModel? portofolio = await listingSearchPortofolio(page);
				 if ((currentState as PortofolioListingLoaded).portofolio!.tools.paging.total_pages == oldpage) {
					yield (currentState as PortofolioListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!portofolio!.items.items.isEmpty){
						 (currentState as PortofolioListingLoaded).portofolio!.items.items.addAll(portofolio!.items.items);
					  }
					  yield portofolio!.items.items.isEmpty
						  ? (currentState as PortofolioListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : PortofolioListingLoaded(  portofolio:  (currentState as PortofolioListingLoaded).portofolio ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
		  
				  final page = (currentState as PortofolioListingLoaded).page! + 1;
				   if ((currentState as PortofolioListingLoaded).portofolio!.tools.paging.total_pages == oldpage) {
					yield (currentState as PortofolioListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  PortofolioListingModel? portofolio = await listingPortofolio(page);
					  yield portofolio!.items.items.isEmpty
						  ? (currentState as PortofolioListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : PortofolioListingLoaded(  portofolio:  portofolio ,
												  hasReachedMax: false,
												  page: page,);
				 }								  
			}	  
        }
      } catch (_) {
        yield PortofolioListingError();
      }
    } else if (event is PortofolioListingRefresh){
      try {
        if (currentState is PortofolioListingUninitialized) {
		   if(isSearch){
		      PortofolioListingModel? portofolio = await listingSearchPortofolio(1);
              yield PortofolioListingLoaded( portofolio: portofolio,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     PortofolioListingModel? portofolio = await listingPortofolio(1);
             yield PortofolioListingLoaded( portofolio: portofolio,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is PortofolioListingLoaded) {
		  if(isSearch){
		     PortofolioListingModel? portofolio = await listingSearchRefreshPortofolio();
              yield portofolio!.items.items.isEmpty
              ? (currentState as PortofolioListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PortofolioListingLoaded(  portofolio: portofolio ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      PortofolioListingModel? portofolio = await listingRefreshPortofolio();
              yield portofolio!.items.items.isEmpty
              ? (currentState as PortofolioListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PortofolioListingLoaded(  portofolio: portofolio ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PortofolioListingError();
      }

    }
  }



  bool hasReachedMax(PortofolioState state) =>
      state is PortofolioListingLoaded && state.hasReachedMax!;




		Future<PortofolioListingModel?> listingPortofolio(int page) async {
			APIRepository? apiRepProvider = application.projectsAPIRepository;
			return await apiRepProvider!.getPortofolioListAPI1(url, page);
			/*
	var dt  = PortofolioListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePortofolioListSearch(dt ,'',page);
	return data;
	*/
		}

		Future<PortofolioListingModel?> listingRefreshPortofolio() async {


			PortofolioListingModel? portofolio = null;
			APIRepository? apiRepProvider = application.projectsAPIRepository;
			await application.projectsDBRepository!.deleteAllPortofolioList2();
			portofolio  = await apiRepProvider!.getPortofolioListAPI1(url, 1);
			return portofolio;
			/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PortofolioListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePortofolioListSearch(dt ,'',page);
	return data;
	*/
		}

		Future<PortofolioListingModel?> listingSearchPortofolio(int page) async {
			APIRepository? apiRepProvider = application.projectsAPIRepository;
			return await apiRepProvider!.getPortofolioListSearchAPI1(url, page);

			/*
	var dt  = PortofolioListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePortofolioListSearch(dt ,'',page);
	return data;
	*/
		}

		Future<PortofolioListingModel?> listingSearchRefreshPortofolio() async {
			PortofolioListingModel? portofolio = null;
			APIRepository? apiRepProvider = application.projectsAPIRepository;
			await application.projectsDBRepository!.deleteAllPortofolioList1();
			portofolio  = await apiRepProvider!.getPortofolioListSearchAPI1(url, 1);
			return portofolio;
			/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PortofolioListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePortofolioListSearch(dt ,'',page);
	return data;
	*/
		}
}


Future<PortofolioListingModel> _loadAndSavePortofolioListSearch(PortofolioListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.description;
	  list.items.items[i].item.pht = list.items.items[i].item.image_url;
    }
    return list;
 }


class  UserPortofolioListBottomLoader extends StatelessWidget {
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







  

