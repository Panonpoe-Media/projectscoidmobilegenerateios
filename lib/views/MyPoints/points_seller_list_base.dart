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



class PointsSellerListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PointsSellerListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PointsSellerListBaseState createState() => PointsSellerListBaseState();
}

class  PointsSellerListBaseState extends State<PointsSellerListBase>{
  String title = 'Points Seller'; 
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
  PointsSellerListing? listing;

  PointsSellerListBaseState() {
   
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
     String point_id = 'point_id';
	 point_id = point_id.replaceAll('_id','');
     getPath = widget.url! + point_id + 'page=%s';
	 
	listing =      PointsSellerListing(AppProvider.getApplication(context), getPath, false, PointsSellerListingUninitialized());
    listing!.add(PointsSellerList());
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
	
	 return BlocBuilder<PointsSellerListing, PointsSellerState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is PointsSellerListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
           return Scaffold(
		   
                  body:
					   Center(
					 child:CircularProgressIndicator(
					 valueColor:      AlwaysStoppedAnimation<Color>(
							 Colors.green),
				))
		  );
        }
        if (state is PointsSellerListingError) {
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
								  'Points Seller',
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
        if (state is PointsSellerListingLoaded) {
          if (state.points_seller!.items.items.isEmpty) {
		  if (state.points_seller!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.points_seller!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.points_seller!.listButton(context, widget.id!).length == 0){ 
		     	return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				  body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.points_seller!.items.items.length? 
																		state.points_seller!.tools.paging.total_pages == state.points_seller!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsSellerListBottomLoader()
																				  : index == 0 ?
																  state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_seller!.items.items.length, index)
																  :state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_seller!.items.items.length-1, index);
																	 // : state.points_seller!.viewItem (state.points_seller!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_seller!.items.items.length
																	: state.points_seller!.items.items.length + 1,
																controller: scrollController,
															  ),
															  
														  
															  onRefresh: _onRefresh,
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
							  child: Text('Points Seller', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_seller!.items.items.length? 
																		state.points_seller!.tools.paging.total_pages == state.points_seller!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsSellerListBottomLoader()
																				  : index == 0 ?
																  state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_seller!.items.items.length, index)
																  :state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_seller!.items.items.length-1, index);
																	 // : state.points_seller!.viewItem (state.points_seller!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_seller!.items.items.length
																	: state.points_seller!.items.items.length + 1,
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
					//  floatingActionButton:  state.points_seller!.Buttons(context, _dialVisible, widget.id!)
					
					//	buildListingBar()
				);
				}else{
					return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				   body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.points_seller!.items.items.length? 
																		state.points_seller!.tools.paging.total_pages == state.points_seller!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsSellerListBottomLoader()
																				  : index == 0 ?
																  state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_seller!.items.items.length, index)
																  :state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_seller!.items.items.length-1, index);
																	 // : state.points_seller!.viewItem (state.points_seller!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_seller!.items.items.length
																	: state.points_seller!.items.items.length + 1,
																controller: scrollController,
															  ),
															  
														  
															  onRefresh: _onRefresh,
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
							  child: Text('Points Seller', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_seller!.items.items.length? 
																		state.points_seller!.tools.paging.total_pages == state.points_seller!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsSellerListBottomLoader()
																				  : index == 0 ?
																  state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_seller!.items.items.length, index)
																  :state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_seller!.items.items.length-1, index);
																	 // : state.points_seller!.viewItem (state.points_seller!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_seller!.items.items.length
																	: state.points_seller!.items.items.length + 1,
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
					  floatingActionButton:  state.points_seller!.Buttons(context, _dialVisible, widget.id!)
					
					//	buildListingBar()
				);
				}
		  }  
	
				return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				  body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.points_seller!.items.items.length? 
																		state.points_seller!.tools.paging.total_pages == state.points_seller!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsSellerListBottomLoader()
																				  : index == 0 ?
																  state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_seller!.items.items.length, index)
																  :state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_seller!.items.items.length-1, index);
																	 // : state.points_seller!.viewItem (state.points_seller!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_seller!.items.items.length
																	: state.points_seller!.items.items.length + 1,
																controller: scrollController,
															  ),
															  
														  
															  onRefresh: _onRefresh,
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
							  child: Text('Points Seller', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_seller!.items.items.length? 
																		state.points_seller!.tools.paging.total_pages == state.points_seller!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsSellerListBottomLoader()
																				  : index == 0 ?
																  state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_seller!.items.items.length, index)
																  :state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_seller!.items.items.length-1, index);
																	 // : state.points_seller!.viewItem (state.points_seller!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_seller!.items.items.length
																	: state.points_seller!.items.items.length + 1,
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

								  return index >= state.points_seller!.items.items.length? 
										state.points_seller!.tools.paging.total_pages == state.points_seller!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserPointsSellerListBottomLoader()
									 			  : index == 0 ?
								  state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_seller!.items.items.length, index)
								  :state.points_seller!.viewItem1 (state.points_seller!.items.items[index] , state.points_seller!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_seller!.items.items.length-1, index);
									 // : state.points_seller!.viewItem (state.points_seller!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.points_seller!.items.items.length
									: state.points_seller!.items.items.length + 1,
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
    listing!.add(PointsSellerListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PointsSellerList());
    }

  }
}




abstract class PointsSellerEvent extends Equatable {
   const PointsSellerEvent();
   @override
    List<Object> get props => [];
}

class PointsSellerList extends PointsSellerEvent {
  @override
  String toString() => 'PointsSellerList';
}

class PointsSellerListingRefresh extends PointsSellerEvent {
  @override
  String toString() => 'PointsSellerListingRefresh';
}

class PointsSellerListingChangeSearch extends PointsSellerEvent {
  @override
  String toString() => 'PointsSellerChangeSearch';
}


abstract class PointsSellerState extends Equatable {
   const PointsSellerState();
   @override
    List<Object> get props => [];
}

class PointsSellerListingUninitialized extends PointsSellerState {
  @override
  String toString() => 'PointsSellerListingUninitialized';
}

class PointsSellerListingError extends PointsSellerState {
  @override
  String toString() => 'PointsSellerListingError';
}

class PointsSellerListingLoaded extends PointsSellerState {
  final PointsSellerListingModel? points_seller;
  final bool? hasReachedMax;
  final int?  page;

  PointsSellerListingLoaded({
    this.points_seller,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [points_seller!, hasReachedMax!, page!];
	
  PointsSellerListingLoaded copyWith({
    PointsSellerListingModel? points_seller,
    bool? hasReachedMax,
    int? page,
  }) {
    return PointsSellerListingLoaded(
      points_seller: points_seller ?? this.points_seller,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PointsSellerListingLoaded  PointsSellerListing: ${ points_seller!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PointsSellerListing extends Bloc<PointsSellerEvent, PointsSellerState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PointsSellerListing(this.application, this.url, this.isSearch, PointsSellerState initialState):
  super(initialState){
   on<PointsSellerList>(_PointsSellerListEvent);
	 on<PointsSellerListingRefresh>(_PointsSellerListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PointsSellerEvent, PointsSellerState>> transformEvents(
      Stream<PointsSellerEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<PointsSellerEvent> transform<PointsSellerEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PointsSellerEvent, PointsSellerState> transition) {
    print(transition);
  }


  void _PointsSellerListEvent(PointsSellerList event, Emitter<PointsSellerState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is PointsSellerListingUninitialized){
			  if(isSearch){
			     PointsSellerListingModel? points_seller = await listingSearchPointsSeller(1);
				  int deltaPage = points_seller!.items.items.length ~/(points_seller!.tools.paging.total_rows/points_seller!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( points_seller!.items.items.isEmpty ? (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsSellerListingLoaded(points_seller: points_seller,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				   PointsSellerListingModel? points_seller = await listingPointsSeller(1);
				   int deltaPage;
				   if(points_seller!.tools.paging.total_pages != 0){
				      deltaPage = points_seller!.items.items.length ~/(points_seller!.tools.paging.total_rows/points_seller!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   return emit ( points_seller!.items.items.isEmpty ? (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsSellerListingLoaded(points_seller: points_seller,
					  hasReachedMax: false,
					  page: deltaPage));
					  
					  }else{
					    deltaPage = 0;
						 return emit ( PointsSellerListingLoaded(points_seller: points_seller,
					  hasReachedMax: false,
					  page: deltaPage));
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is PointsSellerListingLoaded) {
          //page++;
		  final oldpage = (currentState as PointsSellerListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as PointsSellerListingLoaded).page! + 1;
				  PointsSellerListingModel? points_seller = await listingSearchPointsSeller(page);
				 if ((currentState as PointsSellerListingLoaded).points_seller!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!points_seller!.items.items.isEmpty){
						 (currentState as PointsSellerListingLoaded).points_seller!.items.items.addAll(points_seller!.items.items);
					  }
					  return emit ( points_seller!.items.items.isEmpty
						  ? (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : PointsSellerListingLoaded(  points_seller:  (currentState as PointsSellerListingLoaded).points_seller ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
				  final page = (currentState as PointsSellerListingLoaded).page! + 1;
				   if ((currentState as PointsSellerListingLoaded).points_seller!.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  PointsSellerListingModel? points_seller = await listingPointsSeller(page);
					 return emit (points_seller!.items.items.isEmpty
						  ? (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : PointsSellerListingLoaded(  points_seller:  points_seller ,
												  hasReachedMax: false,
												  page: page,));
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        return emit ( PointsSellerListingError());
      }
    }
  }

  void _PointsSellerListingRefreshEvent(PointsSellerListingRefresh event, Emitter<PointsSellerState> emit)async{
  final currentState = state;
   try {
        if (currentState is PointsSellerListingUninitialized) {
		   if(isSearch){
		      PointsSellerListingModel? points_seller = await listingSearchPointsSeller(1);
              return emit ( PointsSellerListingLoaded( points_seller: points_seller,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
		     PointsSellerListingModel? points_seller = await listingPointsSeller(1);
             return emit ( PointsSellerListingLoaded( points_seller: points_seller,
                   hasReachedMax: false,
                   page: 1 ));
				   
		   }

        }

        if (currentState is PointsSellerListingLoaded) {
		  if(isSearch){
		     PointsSellerListingModel? points_seller = await listingSearchRefreshPointsSeller();
              return emit ( points_seller!.items.items.isEmpty
              ? (currentState as PointsSellerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsSellerListingLoaded(  points_seller: points_seller ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
		      PointsSellerListingModel? points_seller = await listingRefreshPointsSeller();
			   int deltaPage = points_seller!.items.items.length ~/ (points_seller!.tools.paging.total_rows/points_seller!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              return emit (points_seller!.items.items.isEmpty
              ? (currentState as PointsSellerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsSellerListingLoaded(  points_seller: points_seller ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PointsSellerListingError());
      }
  }



  @override
  get initialState => PointsSellerListingUninitialized();

  @override

  Stream<PointsSellerState> mapEventToState(PointsSellerEvent event) async* {
    final currentState = state;
    if (event is PointsSellerList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsSellerListingUninitialized){
			  if(isSearch){
			     PointsSellerListingModel? points_seller = await listingSearchPointsSeller(1);
				  int deltaPage = points_seller!.items.items.length ~/(points_seller!.tools.paging.total_rows/points_seller!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield points_seller!.items.items.isEmpty ? (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsSellerListingLoaded(points_seller: points_seller,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   PointsSellerListingModel? points_seller = await listingPointsSeller(1);
				   int deltaPage;
				   if(points_seller!.tools.paging.total_pages != 0){
				      deltaPage = points_seller!.items.items.length ~/(points_seller!.tools.paging.total_rows/points_seller!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield points_seller!.items.items.isEmpty ? (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsSellerListingLoaded(points_seller: points_seller,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield PointsSellerListingLoaded(points_seller: points_seller,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is PointsSellerListingLoaded) {
          //page++;
		  final oldpage = (currentState as PointsSellerListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as PointsSellerListingLoaded).page! + 1;
				  PointsSellerListingModel? points_seller = await listingSearchPointsSeller(page);
				 if ((currentState as PointsSellerListingLoaded).points_seller!.tools.paging.total_pages == oldpage) {
					yield (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!points_seller!.items.items.isEmpty){
						 (currentState as PointsSellerListingLoaded).points_seller!.items.items.addAll(points_seller!.items.items);
					  }
					  yield points_seller!.items.items.isEmpty
						  ? (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : PointsSellerListingLoaded(  points_seller:  (currentState as PointsSellerListingLoaded).points_seller ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as PointsSellerListingLoaded).page! + 1;
				   if ((currentState as PointsSellerListingLoaded).points_seller!.tools.paging.total_pages == oldpage) {
					yield (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  PointsSellerListingModel? points_seller = await listingPointsSeller(page);
					  yield points_seller!.items.items.isEmpty
						  ? (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : PointsSellerListingLoaded(  points_seller:  points_seller ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield PointsSellerListingError();
      }
    } else if (event is PointsSellerListingRefresh){
      try {
        if (currentState is PointsSellerListingUninitialized) {
		   if(isSearch){
		      PointsSellerListingModel? points_seller = await listingSearchPointsSeller(1);
              yield PointsSellerListingLoaded( points_seller: points_seller,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     PointsSellerListingModel? points_seller = await listingPointsSeller(1);
             yield PointsSellerListingLoaded( points_seller: points_seller,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is PointsSellerListingLoaded) {
		  if(isSearch){
		     PointsSellerListingModel? points_seller = await listingSearchRefreshPointsSeller();
              yield points_seller!.items.items.isEmpty
              ? (currentState as PointsSellerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsSellerListingLoaded(  points_seller: points_seller ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      PointsSellerListingModel? points_seller = await listingRefreshPointsSeller();
			   int deltaPage = points_seller!.items.items.length ~/ (points_seller!.tools.paging.total_rows/points_seller!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield points_seller!.items.items.isEmpty
              ? (currentState as PointsSellerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsSellerListingLoaded(  points_seller: points_seller ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PointsSellerListingError();
      }

    }
  }



  bool hasReachedMax(PointsSellerState state) =>
      state is PointsSellerListingLoaded && state.hasReachedMax!;


  Future<PointsSellerListingModel?> listingPointsSeller(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getPointsSellerListAPI(url, page);
	/*
	var dt  = PointsSellerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsSellerListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<PointsSellerListingModel?> listingRefreshPointsSeller() async {
  
  
   PointsSellerListingModel? points_seller = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllPointsSellerList1();
    points_seller  = await apiRepProvider!.getPointsSellerListAPI(url, 1);
    return points_seller;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PointsSellerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsSellerListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<PointsSellerListingModel?> listingSearchPointsSeller(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getPointsSellerListSearchAPI(url, page);
	
	/*
	var dt  = PointsSellerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsSellerListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<PointsSellerListingModel?> listingSearchRefreshPointsSeller() async {
   PointsSellerListingModel? points_seller = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllPointsSellerList1();
    points_seller  = await apiRepProvider!.getPointsSellerListSearchAPI(url, 1);
    return points_seller;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PointsSellerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsSellerListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<PointsSellerListingModel> _loadAndSavePointsSellerListSearch(PointsSellerListingModel list, String searchKey, int page) async{

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


class  UserPointsSellerListBottomLoader extends StatelessWidget {
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







  

