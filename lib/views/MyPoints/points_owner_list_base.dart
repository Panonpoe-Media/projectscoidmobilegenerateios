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



class PointsOwnerListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PointsOwnerListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PointsOwnerListBaseState createState() => PointsOwnerListBaseState();
}

class  PointsOwnerListBaseState extends State<PointsOwnerListBase>{
  String title = 'Points Owner'; 
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
  PointsOwnerListing? listing;

  PointsOwnerListBaseState() {
   
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
	 
	listing =      PointsOwnerListing(AppProvider.getApplication(context), getPath, false, PointsOwnerListingUninitialized());
    listing!.add(PointsOwnerList());
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
	
	 return BlocBuilder<PointsOwnerListing, PointsOwnerState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is PointsOwnerListingUninitialized) {
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
        if (state is PointsOwnerListingError) {
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
								  'Points Owner',
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
        if (state is PointsOwnerListingLoaded) {
          if (state.points_owner!.items.items.isEmpty) {
		  if (state.points_owner!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.points_owner!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.points_owner!.listButton(context, widget.id!).length == 0){ 
		     	return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				  body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.points_owner!.items.items.length? 
																		state.points_owner!.tools.paging.total_pages == state.points_owner!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsOwnerListBottomLoader()
																				  : index == 0 ?
																  state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_owner!.items.items.length, index)
																  :state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_owner!.items.items.length-1, index);
																	 // : state.points_owner!.viewItem (state.points_owner!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_owner!.items.items.length
																	: state.points_owner!.items.items.length + 1,
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
							  child: Text('Points Owner', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_owner!.items.items.length? 
																		state.points_owner!.tools.paging.total_pages == state.points_owner!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsOwnerListBottomLoader()
																				  : index == 0 ?
																  state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_owner!.items.items.length, index)
																  :state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_owner!.items.items.length-1, index);
																	 // : state.points_owner!.viewItem (state.points_owner!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_owner!.items.items.length
																	: state.points_owner!.items.items.length + 1,
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
					//  floatingActionButton:  state.points_owner!.Buttons(context, _dialVisible, widget.id!)
					
					//	buildListingBar()
				);
				}else{
					return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				   body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.points_owner!.items.items.length? 
																		state.points_owner!.tools.paging.total_pages == state.points_owner!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsOwnerListBottomLoader()
																				  : index == 0 ?
																  state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_owner!.items.items.length, index)
																  :state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_owner!.items.items.length-1, index);
																	 // : state.points_owner!.viewItem (state.points_owner!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_owner!.items.items.length
																	: state.points_owner!.items.items.length + 1,
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
							  child: Text('Points Owner', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_owner!.items.items.length? 
																		state.points_owner!.tools.paging.total_pages == state.points_owner!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsOwnerListBottomLoader()
																				  : index == 0 ?
																  state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_owner!.items.items.length, index)
																  :state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_owner!.items.items.length-1, index);
																	 // : state.points_owner!.viewItem (state.points_owner!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_owner!.items.items.length
																	: state.points_owner!.items.items.length + 1,
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
					  floatingActionButton:  state.points_owner!.Buttons(context, _dialVisible, widget.id!)
					
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

																  return index >= state.points_owner!.items.items.length? 
																		state.points_owner!.tools.paging.total_pages == state.points_owner!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsOwnerListBottomLoader()
																				  : index == 0 ?
																  state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_owner!.items.items.length, index)
																  :state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_owner!.items.items.length-1, index);
																	 // : state.points_owner!.viewItem (state.points_owner!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_owner!.items.items.length
																	: state.points_owner!.items.items.length + 1,
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
							  child: Text('Points Owner', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_owner!.items.items.length? 
																		state.points_owner!.tools.paging.total_pages == state.points_owner!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsOwnerListBottomLoader()
																				  : index == 0 ?
																  state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_owner!.items.items.length, index)
																  :state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_owner!.items.items.length-1, index);
																	 // : state.points_owner!.viewItem (state.points_owner!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_owner!.items.items.length
																	: state.points_owner!.items.items.length + 1,
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

								  return index >= state.points_owner!.items.items.length? 
										state.points_owner!.tools.paging.total_pages == state.points_owner!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserPointsOwnerListBottomLoader()
									 			  : index == 0 ?
								  state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_owner!.items.items.length, index)
								  :state.points_owner!.viewItem1 (state.points_owner!.items.items[index] , state.points_owner!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_owner!.items.items.length-1, index);
									 // : state.points_owner!.viewItem (state.points_owner!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.points_owner!.items.items.length
									: state.points_owner!.items.items.length + 1,
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
    listing!.add(PointsOwnerListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PointsOwnerList());
    }

  }
}




abstract class PointsOwnerEvent extends Equatable {
   const PointsOwnerEvent();
   @override
    List<Object> get props => [];
}

class PointsOwnerList extends PointsOwnerEvent {
  @override
  String toString() => 'PointsOwnerList';
}

class PointsOwnerListingRefresh extends PointsOwnerEvent {
  @override
  String toString() => 'PointsOwnerListingRefresh';
}

class PointsOwnerListingChangeSearch extends PointsOwnerEvent {
  @override
  String toString() => 'PointsOwnerChangeSearch';
}


abstract class PointsOwnerState extends Equatable {
   const PointsOwnerState();
   @override
    List<Object> get props => [];
}

class PointsOwnerListingUninitialized extends PointsOwnerState {
  @override
  String toString() => 'PointsOwnerListingUninitialized';
}

class PointsOwnerListingError extends PointsOwnerState {
  @override
  String toString() => 'PointsOwnerListingError';
}

class PointsOwnerListingLoaded extends PointsOwnerState {
  final PointsOwnerListingModel? points_owner;
  final bool? hasReachedMax;
  final int?  page;

  PointsOwnerListingLoaded({
    this.points_owner,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [points_owner!, hasReachedMax!, page!];
	
  PointsOwnerListingLoaded copyWith({
    PointsOwnerListingModel? points_owner,
    bool? hasReachedMax,
    int? page,
  }) {
    return PointsOwnerListingLoaded(
      points_owner: points_owner ?? this.points_owner,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PointsOwnerListingLoaded  PointsOwnerListing: ${ points_owner!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PointsOwnerListing extends Bloc<PointsOwnerEvent, PointsOwnerState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PointsOwnerListing(this.application, this.url, this.isSearch, PointsOwnerState initialState):
  super(initialState){
   on<PointsOwnerList>(_PointsOwnerListEvent);
	 on<PointsOwnerListingRefresh>(_PointsOwnerListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PointsOwnerEvent, PointsOwnerState>> transformEvents(
      Stream<PointsOwnerEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<PointsOwnerEvent> transform<PointsOwnerEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PointsOwnerEvent, PointsOwnerState> transition) {
    print(transition);
  }


  void _PointsOwnerListEvent(PointsOwnerList event, Emitter<PointsOwnerState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is PointsOwnerListingUninitialized){
			  if(isSearch){
			     PointsOwnerListingModel? points_owner = await listingSearchPointsOwner(1);
				  int deltaPage = points_owner!.items.items.length ~/(points_owner!.tools.paging.total_rows/points_owner!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( points_owner!.items.items.isEmpty ? (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsOwnerListingLoaded(points_owner: points_owner,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				   PointsOwnerListingModel? points_owner = await listingPointsOwner(1);
				   int deltaPage;
				   if(points_owner!.tools.paging.total_pages != 0){
				      deltaPage = points_owner!.items.items.length ~/(points_owner!.tools.paging.total_rows/points_owner!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   return emit ( points_owner!.items.items.isEmpty ? (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsOwnerListingLoaded(points_owner: points_owner,
					  hasReachedMax: false,
					  page: deltaPage));
					  
					  }else{
					    deltaPage = 0;
						 return emit ( PointsOwnerListingLoaded(points_owner: points_owner,
					  hasReachedMax: false,
					  page: deltaPage));
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is PointsOwnerListingLoaded) {
          //page++;
		  final oldpage = (currentState as PointsOwnerListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as PointsOwnerListingLoaded).page! + 1;
				  PointsOwnerListingModel? points_owner = await listingSearchPointsOwner(page);
				 if ((currentState as PointsOwnerListingLoaded).points_owner!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!points_owner!.items.items.isEmpty){
						 (currentState as PointsOwnerListingLoaded).points_owner!.items.items.addAll(points_owner!.items.items);
					  }
					  return emit ( points_owner!.items.items.isEmpty
						  ? (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : PointsOwnerListingLoaded(  points_owner:  (currentState as PointsOwnerListingLoaded).points_owner ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
				  final page = (currentState as PointsOwnerListingLoaded).page! + 1;
				   if ((currentState as PointsOwnerListingLoaded).points_owner!.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  PointsOwnerListingModel? points_owner = await listingPointsOwner(page);
					 return emit (points_owner!.items.items.isEmpty
						  ? (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : PointsOwnerListingLoaded(  points_owner:  points_owner ,
												  hasReachedMax: false,
												  page: page,));
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        return emit ( PointsOwnerListingError());
      }
    }
  }

  void _PointsOwnerListingRefreshEvent(PointsOwnerListingRefresh event, Emitter<PointsOwnerState> emit)async{
  final currentState = state;
   try {
        if (currentState is PointsOwnerListingUninitialized) {
		   if(isSearch){
		      PointsOwnerListingModel? points_owner = await listingSearchPointsOwner(1);
              return emit ( PointsOwnerListingLoaded( points_owner: points_owner,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
		     PointsOwnerListingModel? points_owner = await listingPointsOwner(1);
             return emit ( PointsOwnerListingLoaded( points_owner: points_owner,
                   hasReachedMax: false,
                   page: 1 ));
				   
		   }

        }

        if (currentState is PointsOwnerListingLoaded) {
		  if(isSearch){
		     PointsOwnerListingModel? points_owner = await listingSearchRefreshPointsOwner();
              return emit ( points_owner!.items.items.isEmpty
              ? (currentState as PointsOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsOwnerListingLoaded(  points_owner: points_owner ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
		      PointsOwnerListingModel? points_owner = await listingRefreshPointsOwner();
			   int deltaPage = points_owner!.items.items.length ~/ (points_owner!.tools.paging.total_rows/points_owner!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              return emit (points_owner!.items.items.isEmpty
              ? (currentState as PointsOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsOwnerListingLoaded(  points_owner: points_owner ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PointsOwnerListingError());
      }
  }



  @override
  get initialState => PointsOwnerListingUninitialized();

  @override

  Stream<PointsOwnerState> mapEventToState(PointsOwnerEvent event) async* {
    final currentState = state;
    if (event is PointsOwnerList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsOwnerListingUninitialized){
			  if(isSearch){
			     PointsOwnerListingModel? points_owner = await listingSearchPointsOwner(1);
				  int deltaPage = points_owner!.items.items.length ~/(points_owner!.tools.paging.total_rows/points_owner!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield points_owner!.items.items.isEmpty ? (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsOwnerListingLoaded(points_owner: points_owner,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   PointsOwnerListingModel? points_owner = await listingPointsOwner(1);
				   int deltaPage;
				   if(points_owner!.tools.paging.total_pages != 0){
				      deltaPage = points_owner!.items.items.length ~/(points_owner!.tools.paging.total_rows/points_owner!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield points_owner!.items.items.isEmpty ? (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsOwnerListingLoaded(points_owner: points_owner,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield PointsOwnerListingLoaded(points_owner: points_owner,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is PointsOwnerListingLoaded) {
          //page++;
		  final oldpage = (currentState as PointsOwnerListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as PointsOwnerListingLoaded).page! + 1;
				  PointsOwnerListingModel? points_owner = await listingSearchPointsOwner(page);
				 if ((currentState as PointsOwnerListingLoaded).points_owner!.tools.paging.total_pages == oldpage) {
					yield (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!points_owner!.items.items.isEmpty){
						 (currentState as PointsOwnerListingLoaded).points_owner!.items.items.addAll(points_owner!.items.items);
					  }
					  yield points_owner!.items.items.isEmpty
						  ? (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : PointsOwnerListingLoaded(  points_owner:  (currentState as PointsOwnerListingLoaded).points_owner ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as PointsOwnerListingLoaded).page! + 1;
				   if ((currentState as PointsOwnerListingLoaded).points_owner!.tools.paging.total_pages == oldpage) {
					yield (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  PointsOwnerListingModel? points_owner = await listingPointsOwner(page);
					  yield points_owner!.items.items.isEmpty
						  ? (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : PointsOwnerListingLoaded(  points_owner:  points_owner ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield PointsOwnerListingError();
      }
    } else if (event is PointsOwnerListingRefresh){
      try {
        if (currentState is PointsOwnerListingUninitialized) {
		   if(isSearch){
		      PointsOwnerListingModel? points_owner = await listingSearchPointsOwner(1);
              yield PointsOwnerListingLoaded( points_owner: points_owner,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     PointsOwnerListingModel? points_owner = await listingPointsOwner(1);
             yield PointsOwnerListingLoaded( points_owner: points_owner,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is PointsOwnerListingLoaded) {
		  if(isSearch){
		     PointsOwnerListingModel? points_owner = await listingSearchRefreshPointsOwner();
              yield points_owner!.items.items.isEmpty
              ? (currentState as PointsOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsOwnerListingLoaded(  points_owner: points_owner ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      PointsOwnerListingModel? points_owner = await listingRefreshPointsOwner();
			   int deltaPage = points_owner!.items.items.length ~/ (points_owner!.tools.paging.total_rows/points_owner!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield points_owner!.items.items.isEmpty
              ? (currentState as PointsOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsOwnerListingLoaded(  points_owner: points_owner ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PointsOwnerListingError();
      }

    }
  }



  bool hasReachedMax(PointsOwnerState state) =>
      state is PointsOwnerListingLoaded && state.hasReachedMax!;


  Future<PointsOwnerListingModel?> listingPointsOwner(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getPointsOwnerListAPI(url, page);
	/*
	var dt  = PointsOwnerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsOwnerListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<PointsOwnerListingModel?> listingRefreshPointsOwner() async {
  
  
   PointsOwnerListingModel? points_owner = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllPointsOwnerList1();
    points_owner  = await apiRepProvider!.getPointsOwnerListAPI(url, 1);
    return points_owner;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PointsOwnerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsOwnerListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<PointsOwnerListingModel?> listingSearchPointsOwner(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getPointsOwnerListSearchAPI(url, page);
	
	/*
	var dt  = PointsOwnerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsOwnerListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<PointsOwnerListingModel?> listingSearchRefreshPointsOwner() async {
   PointsOwnerListingModel? points_owner = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllPointsOwnerList1();
    points_owner  = await apiRepProvider!.getPointsOwnerListSearchAPI(url, 1);
    return points_owner;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PointsOwnerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsOwnerListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<PointsOwnerListingModel> _loadAndSavePointsOwnerListSearch(PointsOwnerListingModel list, String searchKey, int page) async{

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


class  UserPointsOwnerListBottomLoader extends StatelessWidget {
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







  

