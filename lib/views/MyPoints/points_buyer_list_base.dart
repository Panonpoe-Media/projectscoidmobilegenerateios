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



class PointsBuyerListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PointsBuyerListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PointsBuyerListBaseState createState() => PointsBuyerListBaseState();
}

class  PointsBuyerListBaseState extends State<PointsBuyerListBase>{
  String title = 'Points Buyer'; 
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
  PointsBuyerListing? listing;

  PointsBuyerListBaseState() {
   
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
	 
	listing =      PointsBuyerListing(AppProvider.getApplication(context), getPath, false, PointsBuyerListingUninitialized());
    listing!.add(PointsBuyerList());
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
	
	 return BlocBuilder<PointsBuyerListing, PointsBuyerState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is PointsBuyerListingUninitialized) {
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
        if (state is PointsBuyerListingError) {
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
								  'Points Buyer',
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
        if (state is PointsBuyerListingLoaded) {
          if (state.points_buyer!.items.items.isEmpty) {
		  if (state.points_buyer!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.points_buyer!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.points_buyer!.listButton(context, widget.id!).length == 0){ 
		     	return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				  body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.points_buyer!.items.items.length? 
																		state.points_buyer!.tools.paging.total_pages == state.points_buyer!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsBuyerListBottomLoader()
																				  : index == 0 ?
																  state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_buyer!.items.items.length, index)
																  :state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_buyer!.items.items.length-1, index);
																	 // : state.points_buyer!.viewItem (state.points_buyer!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_buyer!.items.items.length
																	: state.points_buyer!.items.items.length + 1,
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
							  child: Text('Points Buyer', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_buyer!.items.items.length? 
																		state.points_buyer!.tools.paging.total_pages == state.points_buyer!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsBuyerListBottomLoader()
																				  : index == 0 ?
																  state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_buyer!.items.items.length, index)
																  :state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_buyer!.items.items.length-1, index);
																	 // : state.points_buyer!.viewItem (state.points_buyer!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_buyer!.items.items.length
																	: state.points_buyer!.items.items.length + 1,
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
					//  floatingActionButton:  state.points_buyer!.Buttons(context, _dialVisible, widget.id!)
					
					//	buildListingBar()
				);
				}else{
					return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				   body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.points_buyer!.items.items.length? 
																		state.points_buyer!.tools.paging.total_pages == state.points_buyer!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsBuyerListBottomLoader()
																				  : index == 0 ?
																  state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_buyer!.items.items.length, index)
																  :state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_buyer!.items.items.length-1, index);
																	 // : state.points_buyer!.viewItem (state.points_buyer!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_buyer!.items.items.length
																	: state.points_buyer!.items.items.length + 1,
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
							  child: Text('Points Buyer', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_buyer!.items.items.length? 
																		state.points_buyer!.tools.paging.total_pages == state.points_buyer!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsBuyerListBottomLoader()
																				  : index == 0 ?
																  state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_buyer!.items.items.length, index)
																  :state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_buyer!.items.items.length-1, index);
																	 // : state.points_buyer!.viewItem (state.points_buyer!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_buyer!.items.items.length
																	: state.points_buyer!.items.items.length + 1,
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
					  floatingActionButton:  state.points_buyer!.Buttons(context, _dialVisible, widget.id!)
					
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

																  return index >= state.points_buyer!.items.items.length? 
																		state.points_buyer!.tools.paging.total_pages == state.points_buyer!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsBuyerListBottomLoader()
																				  : index == 0 ?
																  state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_buyer!.items.items.length, index)
																  :state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_buyer!.items.items.length-1, index);
																	 // : state.points_buyer!.viewItem (state.points_buyer!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_buyer!.items.items.length
																	: state.points_buyer!.items.items.length + 1,
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
							  child: Text('Points Buyer', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_buyer!.items.items.length? 
																		state.points_buyer!.tools.paging.total_pages == state.points_buyer!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsBuyerListBottomLoader()
																				  : index == 0 ?
																  state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_buyer!.items.items.length, index)
																  :state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_buyer!.items.items.length-1, index);
																	 // : state.points_buyer!.viewItem (state.points_buyer!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_buyer!.items.items.length
																	: state.points_buyer!.items.items.length + 1,
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

								  return index >= state.points_buyer!.items.items.length? 
										state.points_buyer!.tools.paging.total_pages == state.points_buyer!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserPointsBuyerListBottomLoader()
									 			  : index == 0 ?
								  state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_buyer!.items.items.length, index)
								  :state.points_buyer!.viewItem1 (state.points_buyer!.items.items[index] , state.points_buyer!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_buyer!.items.items.length-1, index);
									 // : state.points_buyer!.viewItem (state.points_buyer!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.points_buyer!.items.items.length
									: state.points_buyer!.items.items.length + 1,
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
    listing!.add(PointsBuyerListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PointsBuyerList());
    }

  }
}




abstract class PointsBuyerEvent extends Equatable {
   const PointsBuyerEvent();
   @override
    List<Object> get props => [];
}

class PointsBuyerList extends PointsBuyerEvent {
  @override
  String toString() => 'PointsBuyerList';
}

class PointsBuyerListingRefresh extends PointsBuyerEvent {
  @override
  String toString() => 'PointsBuyerListingRefresh';
}

class PointsBuyerListingChangeSearch extends PointsBuyerEvent {
  @override
  String toString() => 'PointsBuyerChangeSearch';
}


abstract class PointsBuyerState extends Equatable {
   const PointsBuyerState();
   @override
    List<Object> get props => [];
}

class PointsBuyerListingUninitialized extends PointsBuyerState {
  @override
  String toString() => 'PointsBuyerListingUninitialized';
}

class PointsBuyerListingError extends PointsBuyerState {
  @override
  String toString() => 'PointsBuyerListingError';
}

class PointsBuyerListingLoaded extends PointsBuyerState {
  final PointsBuyerListingModel? points_buyer;
  final bool? hasReachedMax;
  final int?  page;

  PointsBuyerListingLoaded({
    this.points_buyer,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [points_buyer!, hasReachedMax!, page!];
	
  PointsBuyerListingLoaded copyWith({
    PointsBuyerListingModel? points_buyer,
    bool? hasReachedMax,
    int? page,
  }) {
    return PointsBuyerListingLoaded(
      points_buyer: points_buyer ?? this.points_buyer,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PointsBuyerListingLoaded  PointsBuyerListing: ${ points_buyer!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PointsBuyerListing extends Bloc<PointsBuyerEvent, PointsBuyerState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PointsBuyerListing(this.application, this.url, this.isSearch, PointsBuyerState initialState):
  super(initialState){
   on<PointsBuyerList>(_PointsBuyerListEvent);
	 on<PointsBuyerListingRefresh>(_PointsBuyerListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PointsBuyerEvent, PointsBuyerState>> transformEvents(
      Stream<PointsBuyerEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<PointsBuyerEvent> transform<PointsBuyerEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PointsBuyerEvent, PointsBuyerState> transition) {
    print(transition);
  }


  void _PointsBuyerListEvent(PointsBuyerList event, Emitter<PointsBuyerState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is PointsBuyerListingUninitialized){
			  if(isSearch){
			     PointsBuyerListingModel? points_buyer = await listingSearchPointsBuyer(1);
				  int deltaPage = points_buyer!.items.items.length ~/(points_buyer!.tools.paging.total_rows/points_buyer!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( points_buyer!.items.items.isEmpty ? (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsBuyerListingLoaded(points_buyer: points_buyer,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				   PointsBuyerListingModel? points_buyer = await listingPointsBuyer(1);
				   int deltaPage;
				   if(points_buyer!.tools.paging.total_pages != 0){
				      deltaPage = points_buyer!.items.items.length ~/(points_buyer!.tools.paging.total_rows/points_buyer!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   return emit ( points_buyer!.items.items.isEmpty ? (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsBuyerListingLoaded(points_buyer: points_buyer,
					  hasReachedMax: false,
					  page: deltaPage));
					  
					  }else{
					    deltaPage = 0;
						 return emit ( PointsBuyerListingLoaded(points_buyer: points_buyer,
					  hasReachedMax: false,
					  page: deltaPage));
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is PointsBuyerListingLoaded) {
          //page++;
		  final oldpage = (currentState as PointsBuyerListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as PointsBuyerListingLoaded).page! + 1;
				  PointsBuyerListingModel? points_buyer = await listingSearchPointsBuyer(page);
				 if ((currentState as PointsBuyerListingLoaded).points_buyer!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!points_buyer!.items.items.isEmpty){
						 (currentState as PointsBuyerListingLoaded).points_buyer!.items.items.addAll(points_buyer!.items.items);
					  }
					  return emit ( points_buyer!.items.items.isEmpty
						  ? (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : PointsBuyerListingLoaded(  points_buyer:  (currentState as PointsBuyerListingLoaded).points_buyer ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
				  final page = (currentState as PointsBuyerListingLoaded).page! + 1;
				   if ((currentState as PointsBuyerListingLoaded).points_buyer!.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  PointsBuyerListingModel? points_buyer = await listingPointsBuyer(page);
					 return emit (points_buyer!.items.items.isEmpty
						  ? (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : PointsBuyerListingLoaded(  points_buyer:  points_buyer ,
												  hasReachedMax: false,
												  page: page,));
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        return emit ( PointsBuyerListingError());
      }
    }
  }

  void _PointsBuyerListingRefreshEvent(PointsBuyerListingRefresh event, Emitter<PointsBuyerState> emit)async{
  final currentState = state;
   try {
        if (currentState is PointsBuyerListingUninitialized) {
		   if(isSearch){
		      PointsBuyerListingModel? points_buyer = await listingSearchPointsBuyer(1);
              return emit ( PointsBuyerListingLoaded( points_buyer: points_buyer,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
		     PointsBuyerListingModel? points_buyer = await listingPointsBuyer(1);
             return emit ( PointsBuyerListingLoaded( points_buyer: points_buyer,
                   hasReachedMax: false,
                   page: 1 ));
				   
		   }

        }

        if (currentState is PointsBuyerListingLoaded) {
		  if(isSearch){
		     PointsBuyerListingModel? points_buyer = await listingSearchRefreshPointsBuyer();
              return emit ( points_buyer!.items.items.isEmpty
              ? (currentState as PointsBuyerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsBuyerListingLoaded(  points_buyer: points_buyer ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
		      PointsBuyerListingModel? points_buyer = await listingRefreshPointsBuyer();
			   int deltaPage = points_buyer!.items.items.length ~/ (points_buyer!.tools.paging.total_rows/points_buyer!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              return emit (points_buyer!.items.items.isEmpty
              ? (currentState as PointsBuyerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsBuyerListingLoaded(  points_buyer: points_buyer ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PointsBuyerListingError());
      }
  }



  @override
  get initialState => PointsBuyerListingUninitialized();

  @override

  Stream<PointsBuyerState> mapEventToState(PointsBuyerEvent event) async* {
    final currentState = state;
    if (event is PointsBuyerList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsBuyerListingUninitialized){
			  if(isSearch){
			     PointsBuyerListingModel? points_buyer = await listingSearchPointsBuyer(1);
				  int deltaPage = points_buyer!.items.items.length ~/(points_buyer!.tools.paging.total_rows/points_buyer!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield points_buyer!.items.items.isEmpty ? (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsBuyerListingLoaded(points_buyer: points_buyer,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   PointsBuyerListingModel? points_buyer = await listingPointsBuyer(1);
				   int deltaPage;
				   if(points_buyer!.tools.paging.total_pages != 0){
				      deltaPage = points_buyer!.items.items.length ~/(points_buyer!.tools.paging.total_rows/points_buyer!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield points_buyer!.items.items.isEmpty ? (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsBuyerListingLoaded(points_buyer: points_buyer,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield PointsBuyerListingLoaded(points_buyer: points_buyer,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is PointsBuyerListingLoaded) {
          //page++;
		  final oldpage = (currentState as PointsBuyerListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as PointsBuyerListingLoaded).page! + 1;
				  PointsBuyerListingModel? points_buyer = await listingSearchPointsBuyer(page);
				 if ((currentState as PointsBuyerListingLoaded).points_buyer!.tools.paging.total_pages == oldpage) {
					yield (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!points_buyer!.items.items.isEmpty){
						 (currentState as PointsBuyerListingLoaded).points_buyer!.items.items.addAll(points_buyer!.items.items);
					  }
					  yield points_buyer!.items.items.isEmpty
						  ? (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : PointsBuyerListingLoaded(  points_buyer:  (currentState as PointsBuyerListingLoaded).points_buyer ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as PointsBuyerListingLoaded).page! + 1;
				   if ((currentState as PointsBuyerListingLoaded).points_buyer!.tools.paging.total_pages == oldpage) {
					yield (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  PointsBuyerListingModel? points_buyer = await listingPointsBuyer(page);
					  yield points_buyer!.items.items.isEmpty
						  ? (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : PointsBuyerListingLoaded(  points_buyer:  points_buyer ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield PointsBuyerListingError();
      }
    } else if (event is PointsBuyerListingRefresh){
      try {
        if (currentState is PointsBuyerListingUninitialized) {
		   if(isSearch){
		      PointsBuyerListingModel? points_buyer = await listingSearchPointsBuyer(1);
              yield PointsBuyerListingLoaded( points_buyer: points_buyer,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     PointsBuyerListingModel? points_buyer = await listingPointsBuyer(1);
             yield PointsBuyerListingLoaded( points_buyer: points_buyer,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is PointsBuyerListingLoaded) {
		  if(isSearch){
		     PointsBuyerListingModel? points_buyer = await listingSearchRefreshPointsBuyer();
              yield points_buyer!.items.items.isEmpty
              ? (currentState as PointsBuyerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsBuyerListingLoaded(  points_buyer: points_buyer ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      PointsBuyerListingModel? points_buyer = await listingRefreshPointsBuyer();
			   int deltaPage = points_buyer!.items.items.length ~/ (points_buyer!.tools.paging.total_rows/points_buyer!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield points_buyer!.items.items.isEmpty
              ? (currentState as PointsBuyerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsBuyerListingLoaded(  points_buyer: points_buyer ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PointsBuyerListingError();
      }

    }
  }



  bool hasReachedMax(PointsBuyerState state) =>
      state is PointsBuyerListingLoaded && state.hasReachedMax!;


  Future<PointsBuyerListingModel?> listingPointsBuyer(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getPointsBuyerListAPI(url, page);
	/*
	var dt  = PointsBuyerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsBuyerListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<PointsBuyerListingModel?> listingRefreshPointsBuyer() async {
  
  
   PointsBuyerListingModel? points_buyer = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllPointsBuyerList1();
    points_buyer  = await apiRepProvider!.getPointsBuyerListAPI(url, 1);
    return points_buyer;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PointsBuyerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsBuyerListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<PointsBuyerListingModel?> listingSearchPointsBuyer(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getPointsBuyerListSearchAPI(url, page);
	
	/*
	var dt  = PointsBuyerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsBuyerListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<PointsBuyerListingModel?> listingSearchRefreshPointsBuyer() async {
   PointsBuyerListingModel? points_buyer = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllPointsBuyerList1();
    points_buyer  = await apiRepProvider!.getPointsBuyerListSearchAPI(url, 1);
    return points_buyer;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PointsBuyerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsBuyerListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<PointsBuyerListingModel> _loadAndSavePointsBuyerListSearch(PointsBuyerListingModel list, String searchKey, int page) async{

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


class  UserPointsBuyerListBottomLoader extends StatelessWidget {
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







  

