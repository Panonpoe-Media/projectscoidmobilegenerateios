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



class ReferalsListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ReferalsListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ReferalsListBaseState createState() => ReferalsListBaseState();
}

class  ReferalsListBaseState extends State<ReferalsListBase>{
  String title = 'Referals'; 
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
  ReferalsListing? listing;

  ReferalsListBaseState() {
   
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
     String user_id = 'user_id';
	 user_id = user_id.replaceAll('_id','');
     getPath = widget.url! + user_id + 'page=%s';
	 
	listing =      ReferalsListing(AppProvider.getApplication(context), getPath, false, ReferalsListingUninitialized());
    listing!.add(ReferalsList());
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
	
	 return BlocBuilder<ReferalsListing, ReferalsState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is ReferalsListingUninitialized) {
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
        if (state is ReferalsListingError) {
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
								  'Referals',
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
        if (state is ReferalsListingLoaded) {
          if (state.referals!.items.items.isEmpty) {
		  if (state.referals!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.referals!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.referals!.listButton(context, widget.id!).length == 0){ 
		     	return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				  body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.referals!.items.items.length? 
																		state.referals!.tools.paging.total_pages == state.referals!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserReferalsListBottomLoader()
																				  : index == 0 ?
																  state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.referals!.items.items.length, index)
																  :state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.referals!.items.items.length-1, index);
																	 // : state.referals!.viewItem (state.referals!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.referals!.items.items.length
																	: state.referals!.items.items.length + 1,
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
							  child: Text('Referals', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.referals!.items.items.length? 
																		state.referals!.tools.paging.total_pages == state.referals!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserReferalsListBottomLoader()
																				  : index == 0 ?
																  state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.referals!.items.items.length, index)
																  :state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.referals!.items.items.length-1, index);
																	 // : state.referals!.viewItem (state.referals!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.referals!.items.items.length
																	: state.referals!.items.items.length + 1,
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
					//  floatingActionButton:  state.referals!.Buttons(context, _dialVisible, widget.id!)
					
					//	buildListingBar()
				);
				}else{
					return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				   body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.referals!.items.items.length? 
																		state.referals!.tools.paging.total_pages == state.referals!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserReferalsListBottomLoader()
																				  : index == 0 ?
																  state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.referals!.items.items.length, index)
																  :state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.referals!.items.items.length-1, index);
																	 // : state.referals!.viewItem (state.referals!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.referals!.items.items.length
																	: state.referals!.items.items.length + 1,
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
							  child: Text('Referals', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.referals!.items.items.length? 
																		state.referals!.tools.paging.total_pages == state.referals!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserReferalsListBottomLoader()
																				  : index == 0 ?
																  state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.referals!.items.items.length, index)
																  :state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.referals!.items.items.length-1, index);
																	 // : state.referals!.viewItem (state.referals!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.referals!.items.items.length
																	: state.referals!.items.items.length + 1,
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
					  floatingActionButton:  state.referals!.Buttons(context, _dialVisible, widget.id!)
					
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

																  return index >= state.referals!.items.items.length? 
																		state.referals!.tools.paging.total_pages == state.referals!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserReferalsListBottomLoader()
																				  : index == 0 ?
																  state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.referals!.items.items.length, index)
																  :state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.referals!.items.items.length-1, index);
																	 // : state.referals!.viewItem (state.referals!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.referals!.items.items.length
																	: state.referals!.items.items.length + 1,
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
							  child: Text('Referals', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.referals!.items.items.length? 
																		state.referals!.tools.paging.total_pages == state.referals!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserReferalsListBottomLoader()
																				  : index == 0 ?
																  state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.referals!.items.items.length, index)
																  :state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.referals!.items.items.length-1, index);
																	 // : state.referals!.viewItem (state.referals!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.referals!.items.items.length
																	: state.referals!.items.items.length + 1,
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

								  return index >= state.referals!.items.items.length? 
										state.referals!.tools.paging.total_pages == state.referals!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserReferalsListBottomLoader()
									 			  : index == 0 ?
								  state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.referals!.items.items.length, index)
								  :state.referals!.viewItem1 (state.referals!.items.items[index] , state.referals!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.referals!.items.items.length-1, index);
									 // : state.referals!.viewItem (state.referals!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.referals!.items.items.length
									: state.referals!.items.items.length + 1,
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
    listing!.add(ReferalsListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ReferalsList());
    }

  }
}




abstract class ReferalsEvent extends Equatable {
   const ReferalsEvent();
   @override
    List<Object> get props => [];
}

class ReferalsList extends ReferalsEvent {
  @override
  String toString() => 'ReferalsList';
}

class ReferalsListingRefresh extends ReferalsEvent {
  @override
  String toString() => 'ReferalsListingRefresh';
}

class ReferalsListingChangeSearch extends ReferalsEvent {
  @override
  String toString() => 'ReferalsChangeSearch';
}


abstract class ReferalsState extends Equatable {
   const ReferalsState();
   @override
    List<Object> get props => [];
}

class ReferalsListingUninitialized extends ReferalsState {
  @override
  String toString() => 'ReferalsListingUninitialized';
}

class ReferalsListingError extends ReferalsState {
  @override
  String toString() => 'ReferalsListingError';
}

class ReferalsListingLoaded extends ReferalsState {
  final ReferalsListingModel? referals;
  final bool? hasReachedMax;
  final int?  page;

  ReferalsListingLoaded({
    this.referals,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [referals!, hasReachedMax!, page!];
	
  ReferalsListingLoaded copyWith({
    ReferalsListingModel? referals,
    bool? hasReachedMax,
    int? page,
  }) {
    return ReferalsListingLoaded(
      referals: referals ?? this.referals,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ReferalsListingLoaded  ReferalsListing: ${ referals!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ReferalsListing extends Bloc<ReferalsEvent, ReferalsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ReferalsListing(this.application, this.url, this.isSearch, ReferalsState initialState):
  super(initialState){
   on<ReferalsList>(_ReferalsListEvent);
	 on<ReferalsListingRefresh>(_ReferalsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ReferalsEvent, ReferalsState>> transformEvents(
      Stream<ReferalsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<ReferalsEvent> transform<ReferalsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ReferalsEvent, ReferalsState> transition) {
    print(transition);
  }


  void _ReferalsListEvent(ReferalsList event, Emitter<ReferalsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is ReferalsListingUninitialized){
			  if(isSearch){
			     ReferalsListingModel? referals = await listingSearchReferals(1);
				  int deltaPage = referals!.items.items.length ~/(referals!.tools.paging.total_rows/referals!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( referals!.items.items.isEmpty ? (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ReferalsListingLoaded(referals: referals,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				   ReferalsListingModel? referals = await listingReferals(1);
				   int deltaPage;
				   if(referals!.tools.paging.total_pages != 0){
				      deltaPage = referals!.items.items.length ~/(referals!.tools.paging.total_rows/referals!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   return emit ( referals!.items.items.isEmpty ? (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ReferalsListingLoaded(referals: referals,
					  hasReachedMax: false,
					  page: deltaPage));
					  
					  }else{
					    deltaPage = 0;
						 return emit ( ReferalsListingLoaded(referals: referals,
					  hasReachedMax: false,
					  page: deltaPage));
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is ReferalsListingLoaded) {
          //page++;
		  final oldpage = (currentState as ReferalsListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as ReferalsListingLoaded).page! + 1;
				  ReferalsListingModel? referals = await listingSearchReferals(page);
				 if ((currentState as ReferalsListingLoaded).referals!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!referals!.items.items.isEmpty){
						 (currentState as ReferalsListingLoaded).referals!.items.items.addAll(referals!.items.items);
					  }
					  return emit ( referals!.items.items.isEmpty
						  ? (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : ReferalsListingLoaded(  referals:  (currentState as ReferalsListingLoaded).referals ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
				  final page = (currentState as ReferalsListingLoaded).page! + 1;
				   if ((currentState as ReferalsListingLoaded).referals!.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  ReferalsListingModel? referals = await listingReferals(page);
					 return emit (referals!.items.items.isEmpty
						  ? (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : ReferalsListingLoaded(  referals:  referals ,
												  hasReachedMax: false,
												  page: page,));
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        return emit ( ReferalsListingError());
      }
    }
  }

  void _ReferalsListingRefreshEvent(ReferalsListingRefresh event, Emitter<ReferalsState> emit)async{
  final currentState = state;
   try {
        if (currentState is ReferalsListingUninitialized) {
		   if(isSearch){
		      ReferalsListingModel? referals = await listingSearchReferals(1);
              return emit ( ReferalsListingLoaded( referals: referals,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
		     ReferalsListingModel? referals = await listingReferals(1);
             return emit ( ReferalsListingLoaded( referals: referals,
                   hasReachedMax: false,
                   page: 1 ));
				   
		   }

        }

        if (currentState is ReferalsListingLoaded) {
		  if(isSearch){
		     ReferalsListingModel? referals = await listingSearchRefreshReferals();
              return emit ( referals!.items.items.isEmpty
              ? (currentState as ReferalsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ReferalsListingLoaded(  referals: referals ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
		      ReferalsListingModel? referals = await listingRefreshReferals();
			   int deltaPage = referals!.items.items.length ~/ (referals!.tools.paging.total_rows/referals!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              return emit (referals!.items.items.isEmpty
              ? (currentState as ReferalsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ReferalsListingLoaded(  referals: referals ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ReferalsListingError());
      }
  }



  @override
  get initialState => ReferalsListingUninitialized();

  @override

  Stream<ReferalsState> mapEventToState(ReferalsEvent event) async* {
    final currentState = state;
    if (event is ReferalsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ReferalsListingUninitialized){
			  if(isSearch){
			     ReferalsListingModel? referals = await listingSearchReferals(1);
				  int deltaPage = referals!.items.items.length ~/(referals!.tools.paging.total_rows/referals!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield referals!.items.items.isEmpty ? (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ReferalsListingLoaded(referals: referals,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   ReferalsListingModel? referals = await listingReferals(1);
				   int deltaPage;
				   if(referals!.tools.paging.total_pages != 0){
				      deltaPage = referals!.items.items.length ~/(referals!.tools.paging.total_rows/referals!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield referals!.items.items.isEmpty ? (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ReferalsListingLoaded(referals: referals,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield ReferalsListingLoaded(referals: referals,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is ReferalsListingLoaded) {
          //page++;
		  final oldpage = (currentState as ReferalsListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as ReferalsListingLoaded).page! + 1;
				  ReferalsListingModel? referals = await listingSearchReferals(page);
				 if ((currentState as ReferalsListingLoaded).referals!.tools.paging.total_pages == oldpage) {
					yield (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!referals!.items.items.isEmpty){
						 (currentState as ReferalsListingLoaded).referals!.items.items.addAll(referals!.items.items);
					  }
					  yield referals!.items.items.isEmpty
						  ? (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : ReferalsListingLoaded(  referals:  (currentState as ReferalsListingLoaded).referals ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as ReferalsListingLoaded).page! + 1;
				   if ((currentState as ReferalsListingLoaded).referals!.tools.paging.total_pages == oldpage) {
					yield (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  ReferalsListingModel? referals = await listingReferals(page);
					  yield referals!.items.items.isEmpty
						  ? (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : ReferalsListingLoaded(  referals:  referals ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield ReferalsListingError();
      }
    } else if (event is ReferalsListingRefresh){
      try {
        if (currentState is ReferalsListingUninitialized) {
		   if(isSearch){
		      ReferalsListingModel? referals = await listingSearchReferals(1);
              yield ReferalsListingLoaded( referals: referals,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     ReferalsListingModel? referals = await listingReferals(1);
             yield ReferalsListingLoaded( referals: referals,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is ReferalsListingLoaded) {
		  if(isSearch){
		     ReferalsListingModel? referals = await listingSearchRefreshReferals();
              yield referals!.items.items.isEmpty
              ? (currentState as ReferalsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ReferalsListingLoaded(  referals: referals ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      ReferalsListingModel? referals = await listingRefreshReferals();
			   int deltaPage = referals!.items.items.length ~/ (referals!.tools.paging.total_rows/referals!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield referals!.items.items.isEmpty
              ? (currentState as ReferalsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ReferalsListingLoaded(  referals: referals ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ReferalsListingError();
      }

    }
  }



  bool hasReachedMax(ReferalsState state) =>
      state is ReferalsListingLoaded && state.hasReachedMax!;


  Future<ReferalsListingModel?> listingReferals(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getReferalsListAPI(url, page);
	/*
	var dt  = ReferalsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveReferalsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<ReferalsListingModel?> listingRefreshReferals() async {
  
  
   ReferalsListingModel? referals = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllReferalsList1();
    referals  = await apiRepProvider!.getReferalsListAPI(url, 1);
    return referals;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ReferalsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveReferalsListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<ReferalsListingModel?> listingSearchReferals(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getReferalsListSearchAPI(url, page);
	
	/*
	var dt  = ReferalsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveReferalsListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<ReferalsListingModel?> listingSearchRefreshReferals() async {
   ReferalsListingModel? referals = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllReferalsList1();
    referals  = await apiRepProvider!.getReferalsListSearchAPI(url, 1);
    return referals;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ReferalsListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveReferalsListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<ReferalsListingModel> _loadAndSaveReferalsListSearch(ReferalsListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.user_name;
    }
    return list;
 }


class  UserReferalsListBottomLoader extends StatelessWidget {
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







  

