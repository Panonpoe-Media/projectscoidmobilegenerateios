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



class PointsWorkerListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PointsWorkerListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PointsWorkerListBaseState createState() => PointsWorkerListBaseState();
}

class  PointsWorkerListBaseState extends State<PointsWorkerListBase>{
  String title = 'Points Worker'; 
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
  PointsWorkerListing? listing;

  PointsWorkerListBaseState() {
   
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
	 
	listing =      PointsWorkerListing(AppProvider.getApplication(context), getPath, false, PointsWorkerListingUninitialized());
    listing!.add(PointsWorkerList());
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
	
	 return BlocBuilder<PointsWorkerListing, PointsWorkerState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is PointsWorkerListingUninitialized) {
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
        if (state is PointsWorkerListingError) {
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
								  'Points Worker',
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
        if (state is PointsWorkerListingLoaded) {
          if (state.points_worker!.items.items.isEmpty) {
		  if (state.points_worker!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.points_worker!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.points_worker!.listButton(context, widget.id!).length == 0){ 
		     	return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				  body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.points_worker!.items.items.length? 
																		state.points_worker!.tools.paging.total_pages == state.points_worker!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsWorkerListBottomLoader()
																				  : index == 0 ?
																  state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_worker!.items.items.length, index)
																  :state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_worker!.items.items.length-1, index);
																	 // : state.points_worker!.viewItem (state.points_worker!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_worker!.items.items.length
																	: state.points_worker!.items.items.length + 1,
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
							  child: Text('Points Worker', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_worker!.items.items.length? 
																		state.points_worker!.tools.paging.total_pages == state.points_worker!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsWorkerListBottomLoader()
																				  : index == 0 ?
																  state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_worker!.items.items.length, index)
																  :state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_worker!.items.items.length-1, index);
																	 // : state.points_worker!.viewItem (state.points_worker!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_worker!.items.items.length
																	: state.points_worker!.items.items.length + 1,
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
					//  floatingActionButton:  state.points_worker!.Buttons(context, _dialVisible, widget.id!)
					
					//	buildListingBar()
				);
				}else{
					return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				   body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.points_worker!.items.items.length? 
																		state.points_worker!.tools.paging.total_pages == state.points_worker!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsWorkerListBottomLoader()
																				  : index == 0 ?
																  state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_worker!.items.items.length, index)
																  :state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_worker!.items.items.length-1, index);
																	 // : state.points_worker!.viewItem (state.points_worker!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_worker!.items.items.length
																	: state.points_worker!.items.items.length + 1,
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
							  child: Text('Points Worker', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_worker!.items.items.length? 
																		state.points_worker!.tools.paging.total_pages == state.points_worker!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsWorkerListBottomLoader()
																				  : index == 0 ?
																  state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_worker!.items.items.length, index)
																  :state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_worker!.items.items.length-1, index);
																	 // : state.points_worker!.viewItem (state.points_worker!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_worker!.items.items.length
																	: state.points_worker!.items.items.length + 1,
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
					  floatingActionButton:  state.points_worker!.Buttons(context, _dialVisible, widget.id!)
					
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

																  return index >= state.points_worker!.items.items.length? 
																		state.points_worker!.tools.paging.total_pages == state.points_worker!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsWorkerListBottomLoader()
																				  : index == 0 ?
																  state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_worker!.items.items.length, index)
																  :state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_worker!.items.items.length-1, index);
																	 // : state.points_worker!.viewItem (state.points_worker!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_worker!.items.items.length
																	: state.points_worker!.items.items.length + 1,
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
							  child: Text('Points Worker', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_worker!.items.items.length? 
																		state.points_worker!.tools.paging.total_pages == state.points_worker!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsWorkerListBottomLoader()
																				  : index == 0 ?
																  state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_worker!.items.items.length, index)
																  :state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_worker!.items.items.length-1, index);
																	 // : state.points_worker!.viewItem (state.points_worker!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_worker!.items.items.length
																	: state.points_worker!.items.items.length + 1,
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

								  return index >= state.points_worker!.items.items.length? 
										state.points_worker!.tools.paging.total_pages == state.points_worker!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserPointsWorkerListBottomLoader()
									 			  : index == 0 ?
								  state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_worker!.items.items.length, index)
								  :state.points_worker!.viewItem1 (state.points_worker!.items.items[index] , state.points_worker!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_worker!.items.items.length-1, index);
									 // : state.points_worker!.viewItem (state.points_worker!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.points_worker!.items.items.length
									: state.points_worker!.items.items.length + 1,
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
    listing!.add(PointsWorkerListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PointsWorkerList());
    }

  }
}




abstract class PointsWorkerEvent extends Equatable {
   const PointsWorkerEvent();
   @override
    List<Object> get props => [];
}

class PointsWorkerList extends PointsWorkerEvent {
  @override
  String toString() => 'PointsWorkerList';
}

class PointsWorkerListingRefresh extends PointsWorkerEvent {
  @override
  String toString() => 'PointsWorkerListingRefresh';
}

class PointsWorkerListingChangeSearch extends PointsWorkerEvent {
  @override
  String toString() => 'PointsWorkerChangeSearch';
}


abstract class PointsWorkerState extends Equatable {
   const PointsWorkerState();
   @override
    List<Object> get props => [];
}

class PointsWorkerListingUninitialized extends PointsWorkerState {
  @override
  String toString() => 'PointsWorkerListingUninitialized';
}

class PointsWorkerListingError extends PointsWorkerState {
  @override
  String toString() => 'PointsWorkerListingError';
}

class PointsWorkerListingLoaded extends PointsWorkerState {
  final PointsWorkerListingModel? points_worker;
  final bool? hasReachedMax;
  final int?  page;

  PointsWorkerListingLoaded({
    this.points_worker,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [points_worker!, hasReachedMax!, page!];
	
  PointsWorkerListingLoaded copyWith({
    PointsWorkerListingModel? points_worker,
    bool? hasReachedMax,
    int? page,
  }) {
    return PointsWorkerListingLoaded(
      points_worker: points_worker ?? this.points_worker,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PointsWorkerListingLoaded  PointsWorkerListing: ${ points_worker!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PointsWorkerListing extends Bloc<PointsWorkerEvent, PointsWorkerState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PointsWorkerListing(this.application, this.url, this.isSearch, PointsWorkerState initialState):
  super(initialState){
   on<PointsWorkerList>(_PointsWorkerListEvent);
	 on<PointsWorkerListingRefresh>(_PointsWorkerListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PointsWorkerEvent, PointsWorkerState>> transformEvents(
      Stream<PointsWorkerEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<PointsWorkerEvent> transform<PointsWorkerEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PointsWorkerEvent, PointsWorkerState> transition) {
    print(transition);
  }


  void _PointsWorkerListEvent(PointsWorkerList event, Emitter<PointsWorkerState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is PointsWorkerListingUninitialized){
			  if(isSearch){
			     PointsWorkerListingModel? points_worker = await listingSearchPointsWorker(1);
				  int deltaPage = points_worker!.items.items.length ~/(points_worker!.tools.paging.total_rows/points_worker!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( points_worker!.items.items.isEmpty ? (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsWorkerListingLoaded(points_worker: points_worker,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				   PointsWorkerListingModel? points_worker = await listingPointsWorker(1);
				   int deltaPage;
				   if(points_worker!.tools.paging.total_pages != 0){
				      deltaPage = points_worker!.items.items.length ~/(points_worker!.tools.paging.total_rows/points_worker!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   return emit ( points_worker!.items.items.isEmpty ? (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsWorkerListingLoaded(points_worker: points_worker,
					  hasReachedMax: false,
					  page: deltaPage));
					  
					  }else{
					    deltaPage = 0;
						 return emit ( PointsWorkerListingLoaded(points_worker: points_worker,
					  hasReachedMax: false,
					  page: deltaPage));
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is PointsWorkerListingLoaded) {
          //page++;
		  final oldpage = (currentState as PointsWorkerListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as PointsWorkerListingLoaded).page! + 1;
				  PointsWorkerListingModel? points_worker = await listingSearchPointsWorker(page);
				 if ((currentState as PointsWorkerListingLoaded).points_worker!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!points_worker!.items.items.isEmpty){
						 (currentState as PointsWorkerListingLoaded).points_worker!.items.items.addAll(points_worker!.items.items);
					  }
					  return emit ( points_worker!.items.items.isEmpty
						  ? (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : PointsWorkerListingLoaded(  points_worker:  (currentState as PointsWorkerListingLoaded).points_worker ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
				  final page = (currentState as PointsWorkerListingLoaded).page! + 1;
				   if ((currentState as PointsWorkerListingLoaded).points_worker!.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  PointsWorkerListingModel? points_worker = await listingPointsWorker(page);
					 return emit (points_worker!.items.items.isEmpty
						  ? (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : PointsWorkerListingLoaded(  points_worker:  points_worker ,
												  hasReachedMax: false,
												  page: page,));
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        return emit ( PointsWorkerListingError());
      }
    }
  }

  void _PointsWorkerListingRefreshEvent(PointsWorkerListingRefresh event, Emitter<PointsWorkerState> emit)async{
  final currentState = state;
   try {
        if (currentState is PointsWorkerListingUninitialized) {
		   if(isSearch){
		      PointsWorkerListingModel? points_worker = await listingSearchPointsWorker(1);
              return emit ( PointsWorkerListingLoaded( points_worker: points_worker,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
		     PointsWorkerListingModel? points_worker = await listingPointsWorker(1);
             return emit ( PointsWorkerListingLoaded( points_worker: points_worker,
                   hasReachedMax: false,
                   page: 1 ));
				   
		   }

        }

        if (currentState is PointsWorkerListingLoaded) {
		  if(isSearch){
		     PointsWorkerListingModel? points_worker = await listingSearchRefreshPointsWorker();
              return emit ( points_worker!.items.items.isEmpty
              ? (currentState as PointsWorkerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsWorkerListingLoaded(  points_worker: points_worker ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
		      PointsWorkerListingModel? points_worker = await listingRefreshPointsWorker();
			   int deltaPage = points_worker!.items.items.length ~/ (points_worker!.tools.paging.total_rows/points_worker!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              return emit (points_worker!.items.items.isEmpty
              ? (currentState as PointsWorkerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsWorkerListingLoaded(  points_worker: points_worker ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PointsWorkerListingError());
      }
  }



  @override
  get initialState => PointsWorkerListingUninitialized();

  @override

  Stream<PointsWorkerState> mapEventToState(PointsWorkerEvent event) async* {
    final currentState = state;
    if (event is PointsWorkerList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsWorkerListingUninitialized){
			  if(isSearch){
			     PointsWorkerListingModel? points_worker = await listingSearchPointsWorker(1);
				  int deltaPage = points_worker!.items.items.length ~/(points_worker!.tools.paging.total_rows/points_worker!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield points_worker!.items.items.isEmpty ? (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsWorkerListingLoaded(points_worker: points_worker,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   PointsWorkerListingModel? points_worker = await listingPointsWorker(1);
				   int deltaPage;
				   if(points_worker!.tools.paging.total_pages != 0){
				      deltaPage = points_worker!.items.items.length ~/(points_worker!.tools.paging.total_rows/points_worker!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield points_worker!.items.items.isEmpty ? (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsWorkerListingLoaded(points_worker: points_worker,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield PointsWorkerListingLoaded(points_worker: points_worker,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is PointsWorkerListingLoaded) {
          //page++;
		  final oldpage = (currentState as PointsWorkerListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as PointsWorkerListingLoaded).page! + 1;
				  PointsWorkerListingModel? points_worker = await listingSearchPointsWorker(page);
				 if ((currentState as PointsWorkerListingLoaded).points_worker!.tools.paging.total_pages == oldpage) {
					yield (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!points_worker!.items.items.isEmpty){
						 (currentState as PointsWorkerListingLoaded).points_worker!.items.items.addAll(points_worker!.items.items);
					  }
					  yield points_worker!.items.items.isEmpty
						  ? (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : PointsWorkerListingLoaded(  points_worker:  (currentState as PointsWorkerListingLoaded).points_worker ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as PointsWorkerListingLoaded).page! + 1;
				   if ((currentState as PointsWorkerListingLoaded).points_worker!.tools.paging.total_pages == oldpage) {
					yield (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  PointsWorkerListingModel? points_worker = await listingPointsWorker(page);
					  yield points_worker!.items.items.isEmpty
						  ? (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : PointsWorkerListingLoaded(  points_worker:  points_worker ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield PointsWorkerListingError();
      }
    } else if (event is PointsWorkerListingRefresh){
      try {
        if (currentState is PointsWorkerListingUninitialized) {
		   if(isSearch){
		      PointsWorkerListingModel? points_worker = await listingSearchPointsWorker(1);
              yield PointsWorkerListingLoaded( points_worker: points_worker,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     PointsWorkerListingModel? points_worker = await listingPointsWorker(1);
             yield PointsWorkerListingLoaded( points_worker: points_worker,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is PointsWorkerListingLoaded) {
		  if(isSearch){
		     PointsWorkerListingModel? points_worker = await listingSearchRefreshPointsWorker();
              yield points_worker!.items.items.isEmpty
              ? (currentState as PointsWorkerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsWorkerListingLoaded(  points_worker: points_worker ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      PointsWorkerListingModel? points_worker = await listingRefreshPointsWorker();
			   int deltaPage = points_worker!.items.items.length ~/ (points_worker!.tools.paging.total_rows/points_worker!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield points_worker!.items.items.isEmpty
              ? (currentState as PointsWorkerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsWorkerListingLoaded(  points_worker: points_worker ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PointsWorkerListingError();
      }

    }
  }



  bool hasReachedMax(PointsWorkerState state) =>
      state is PointsWorkerListingLoaded && state.hasReachedMax!;


  Future<PointsWorkerListingModel?> listingPointsWorker(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getPointsWorkerListAPI(url, page);
	/*
	var dt  = PointsWorkerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsWorkerListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<PointsWorkerListingModel?> listingRefreshPointsWorker() async {
  
  
   PointsWorkerListingModel? points_worker = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllPointsWorkerList1();
    points_worker  = await apiRepProvider!.getPointsWorkerListAPI(url, 1);
    return points_worker;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PointsWorkerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsWorkerListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<PointsWorkerListingModel?> listingSearchPointsWorker(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getPointsWorkerListSearchAPI(url, page);
	
	/*
	var dt  = PointsWorkerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsWorkerListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<PointsWorkerListingModel?> listingSearchRefreshPointsWorker() async {
   PointsWorkerListingModel? points_worker = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllPointsWorkerList1();
    points_worker  = await apiRepProvider!.getPointsWorkerListSearchAPI(url, 1);
    return points_worker;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PointsWorkerListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsWorkerListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<PointsWorkerListingModel> _loadAndSavePointsWorkerListSearch(PointsWorkerListingModel list, String searchKey, int page) async{

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


class  UserPointsWorkerListBottomLoader extends StatelessWidget {
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







  

