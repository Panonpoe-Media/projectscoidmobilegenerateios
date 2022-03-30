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



class CreditHistoryListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  CreditHistoryListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  CreditHistoryListBaseState createState() => CreditHistoryListBaseState();
}

class  CreditHistoryListBaseState extends State<CreditHistoryListBase>{
  String title = 'Credit History'; 
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
  CreditHistoryListing? listing;

  CreditHistoryListBaseState() {
   
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
     String credit_id = 'credit_id';
	 credit_id = credit_id.replaceAll('_id','');
     getPath = widget.url! + credit_id + 'page=%s';
	 
	listing =      CreditHistoryListing(AppProvider.getApplication(context), getPath, false, CreditHistoryListingUninitialized());
    listing!.add(CreditHistoryList());
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
	
	 return BlocBuilder<CreditHistoryListing, CreditHistoryState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is CreditHistoryListingUninitialized) {
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
        if (state is CreditHistoryListingError) {
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
								  'Credit History',
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
        if (state is CreditHistoryListingLoaded) {
          if (state.credit_history!.items.items.isEmpty) {
		  if (state.credit_history!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.credit_history!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.credit_history!.listButton(context, widget.id!).length == 0){ 
		     	return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				  body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.credit_history!.items.items.length? 
																		state.credit_history!.tools.paging.total_pages == state.credit_history!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserCreditHistoryListBottomLoader()
																				  : index == 0 ?
																  state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.credit_history!.items.items.length, index)
																  :state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.credit_history!.items.items.length-1, index);
																	 // : state.credit_history!.viewItem (state.credit_history!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.credit_history!.items.items.length
																	: state.credit_history!.items.items.length + 1,
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
							  child: Text('Credit History', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.credit_history!.items.items.length? 
																		state.credit_history!.tools.paging.total_pages == state.credit_history!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserCreditHistoryListBottomLoader()
																				  : index == 0 ?
																  state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.credit_history!.items.items.length, index)
																  :state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.credit_history!.items.items.length-1, index);
																	 // : state.credit_history!.viewItem (state.credit_history!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.credit_history!.items.items.length
																	: state.credit_history!.items.items.length + 1,
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
					//  floatingActionButton:  state.credit_history!.Buttons(context, _dialVisible, widget.id!)
					
					//	buildListingBar()
				);
				}else{
					return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				   body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.credit_history!.items.items.length? 
																		state.credit_history!.tools.paging.total_pages == state.credit_history!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserCreditHistoryListBottomLoader()
																				  : index == 0 ?
																  state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.credit_history!.items.items.length, index)
																  :state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.credit_history!.items.items.length-1, index);
																	 // : state.credit_history!.viewItem (state.credit_history!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.credit_history!.items.items.length
																	: state.credit_history!.items.items.length + 1,
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
							  child: Text('Credit History', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.credit_history!.items.items.length? 
																		state.credit_history!.tools.paging.total_pages == state.credit_history!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserCreditHistoryListBottomLoader()
																				  : index == 0 ?
																  state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.credit_history!.items.items.length, index)
																  :state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.credit_history!.items.items.length-1, index);
																	 // : state.credit_history!.viewItem (state.credit_history!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.credit_history!.items.items.length
																	: state.credit_history!.items.items.length + 1,
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
					  floatingActionButton:  state.credit_history!.Buttons(context, _dialVisible, widget.id!)
					
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

																  return index >= state.credit_history!.items.items.length? 
																		state.credit_history!.tools.paging.total_pages == state.credit_history!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserCreditHistoryListBottomLoader()
																				  : index == 0 ?
																  state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.credit_history!.items.items.length, index)
																  :state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.credit_history!.items.items.length-1, index);
																	 // : state.credit_history!.viewItem (state.credit_history!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.credit_history!.items.items.length
																	: state.credit_history!.items.items.length + 1,
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
							  child: Text('Credit History', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.credit_history!.items.items.length? 
																		state.credit_history!.tools.paging.total_pages == state.credit_history!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserCreditHistoryListBottomLoader()
																				  : index == 0 ?
																  state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.credit_history!.items.items.length, index)
																  :state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.credit_history!.items.items.length-1, index);
																	 // : state.credit_history!.viewItem (state.credit_history!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.credit_history!.items.items.length
																	: state.credit_history!.items.items.length + 1,
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

								  return index >= state.credit_history!.items.items.length? 
										state.credit_history!.tools.paging.total_pages == state.credit_history!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserCreditHistoryListBottomLoader()
									 			  : index == 0 ?
								  state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.credit_history!.items.items.length, index)
								  :state.credit_history!.viewItem1 (state.credit_history!.items.items[index] , state.credit_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.credit_history!.items.items.length-1, index);
									 // : state.credit_history!.viewItem (state.credit_history!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.credit_history!.items.items.length
									: state.credit_history!.items.items.length + 1,
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
    listing!.add(CreditHistoryListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(CreditHistoryList());
    }

  }
}




abstract class CreditHistoryEvent extends Equatable {
   const CreditHistoryEvent();
   @override
    List<Object> get props => [];
}

class CreditHistoryList extends CreditHistoryEvent {
  @override
  String toString() => 'CreditHistoryList';
}

class CreditHistoryListingRefresh extends CreditHistoryEvent {
  @override
  String toString() => 'CreditHistoryListingRefresh';
}

class CreditHistoryListingChangeSearch extends CreditHistoryEvent {
  @override
  String toString() => 'CreditHistoryChangeSearch';
}


abstract class CreditHistoryState extends Equatable {
   const CreditHistoryState();
   @override
    List<Object> get props => [];
}

class CreditHistoryListingUninitialized extends CreditHistoryState {
  @override
  String toString() => 'CreditHistoryListingUninitialized';
}

class CreditHistoryListingError extends CreditHistoryState {
  @override
  String toString() => 'CreditHistoryListingError';
}

class CreditHistoryListingLoaded extends CreditHistoryState {
  final CreditHistoryListingModel? credit_history;
  final bool? hasReachedMax;
  final int?  page;

  CreditHistoryListingLoaded({
    this.credit_history,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [credit_history!, hasReachedMax!, page!];
	
  CreditHistoryListingLoaded copyWith({
    CreditHistoryListingModel? credit_history,
    bool? hasReachedMax,
    int? page,
  }) {
    return CreditHistoryListingLoaded(
      credit_history: credit_history ?? this.credit_history,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'CreditHistoryListingLoaded  CreditHistoryListing: ${ credit_history!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class CreditHistoryListing extends Bloc<CreditHistoryEvent, CreditHistoryState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  CreditHistoryListing(this.application, this.url, this.isSearch, CreditHistoryState initialState):
  super(initialState){
   on<CreditHistoryList>(_CreditHistoryListEvent);
	 on<CreditHistoryListingRefresh>(_CreditHistoryListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<CreditHistoryEvent, CreditHistoryState>> transformEvents(
      Stream<CreditHistoryEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<CreditHistoryEvent> transform<CreditHistoryEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<CreditHistoryEvent, CreditHistoryState> transition) {
    print(transition);
  }


  void _CreditHistoryListEvent(CreditHistoryList event, Emitter<CreditHistoryState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is CreditHistoryListingUninitialized){
			  if(isSearch){
			     CreditHistoryListingModel? credit_history = await listingSearchCreditHistory(1);
				  int deltaPage = credit_history!.items.items.length ~/(credit_history!.tools.paging.total_rows/credit_history!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( credit_history!.items.items.isEmpty ? (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CreditHistoryListingLoaded(credit_history: credit_history,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				  CreditHistoryListingModel? credit_history1 = await listingSearchCreditHistory(1);
				  if(credit_history1!.tools.paging.total_pages != 0){
				  CreditHistoryListingModel? credit_history = await listingCreditHistory(credit_history1!.tools.paging.total_pages);
				  
				    int deltaPage = credit_history!.tools.paging.total_pages;
				    return emit (credit_history!.items.items.isEmpty ? (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CreditHistoryListingLoaded(credit_history: credit_history,
					  hasReachedMax: false,
					  page: deltaPage));
				  }else{
				   int deltaPage = 0;
				   return emit (CreditHistoryListingLoaded(credit_history: credit_history1,
					  hasReachedMax: false,
					  page: deltaPage));
				  }
			  
		
						  
			   		  
			  }
        }

        if (currentState is CreditHistoryListingLoaded) {
          //page++;
		  final oldpage = (currentState as CreditHistoryListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as CreditHistoryListingLoaded).page! + 1;
				  CreditHistoryListingModel? credit_history = await listingSearchCreditHistory(page);
				 if ((currentState as CreditHistoryListingLoaded).credit_history!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!credit_history!.items.items.isEmpty){
						 (currentState as CreditHistoryListingLoaded).credit_history!.items.items.addAll(credit_history!.items.items);
					  }
					  return emit ( credit_history!.items.items.isEmpty
						  ? (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : CreditHistoryListingLoaded(  credit_history:  (currentState as CreditHistoryListingLoaded).credit_history ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
                final page = (currentState as CreditHistoryListingLoaded).page! - 1;
					  if (oldpage == 1) {
						return emit ( (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  CreditHistoryListingModel? credit_history = await listingCreditHistory(page);
							  return emit (credit_history!.items.items.isEmpty
								  ? (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : CreditHistoryListingLoaded(  credit_history:  credit_history ,
														  hasReachedMax: false,
														  page: page,));
					  }


				 
			}	  
        }
      } catch (_) {
        return emit ( CreditHistoryListingError());
      }
    }
  }

  void _CreditHistoryListingRefreshEvent(CreditHistoryListingRefresh event, Emitter<CreditHistoryState> emit)async{
  final currentState = state;
   try {
        if (currentState is CreditHistoryListingUninitialized) {
		   if(isSearch){
		      CreditHistoryListingModel? credit_history = await listingSearchCreditHistory(1);
              return emit ( CreditHistoryListingLoaded( credit_history: credit_history,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
			 CreditHistoryListingModel? credit_history1 = await listingSearchCreditHistory(1);
				  CreditHistoryListingModel? credit_history = await listingCreditHistory(credit_history1!.tools.paging.total_pages);
				  return emit ( CreditHistoryListingLoaded( credit_history: credit_history,
                   hasReachedMax: false,
                   page: credit_history!.tools.paging.total_pages));
		   }

        }

        if (currentState is CreditHistoryListingLoaded) {
		  if(isSearch){
		     CreditHistoryListingModel? credit_history = await listingSearchRefreshCreditHistory();
              return emit ( credit_history!.items.items.isEmpty
              ? (currentState as CreditHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CreditHistoryListingLoaded(  credit_history: credit_history ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
			   CreditHistoryListingModel? credit_history1 = await listingSearchCreditHistory(1);
			  CreditHistoryListingModel? credit_history = await listingCreditHistory(credit_history1!.tools.paging.total_pages);
				
			   int deltaPage = credit_history!.items.items.length ~/ (credit_history!.tools.paging.total_rows/credit_history!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
				deltaPage = credit_history!.tools.paging.total_pages;
              return emit (credit_history!.items.items.isEmpty
              ? (currentState as CreditHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CreditHistoryListingLoaded(  credit_history: credit_history ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (CreditHistoryListingError());
      }
  }



  @override
  get initialState => CreditHistoryListingUninitialized();

  @override

  Stream<CreditHistoryState> mapEventToState(CreditHistoryEvent event) async* {
    final currentState = state;
    if (event is CreditHistoryList && !hasReachedMax(currentState)) {
      try {
        if (currentState is CreditHistoryListingUninitialized){
			  if(isSearch){
			     CreditHistoryListingModel? credit_history = await listingSearchCreditHistory(1);
				  int deltaPage = credit_history!.items.items.length ~/(credit_history!.tools.paging.total_rows/credit_history!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield credit_history!.items.items.isEmpty ? (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CreditHistoryListingLoaded(credit_history: credit_history,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				  CreditHistoryListingModel? credit_history1 = await listingSearchCreditHistory(1);
				  if(credit_history1!.tools.paging.total_pages != 0){
				  CreditHistoryListingModel? credit_history = await listingCreditHistory(credit_history1!.tools.paging.total_pages);
				  
				    int deltaPage = credit_history!.tools.paging.total_pages;
				    yield credit_history!.items.items.isEmpty ? (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CreditHistoryListingLoaded(credit_history: credit_history,
					  hasReachedMax: false,
					  page: deltaPage);
				  }else{
				   int deltaPage = 0;
				   yield CreditHistoryListingLoaded(credit_history: credit_history1,
					  hasReachedMax: false,
					  page: deltaPage);
				  }
			  
		
						  
			   		  
			  }
        }

        if (currentState is CreditHistoryListingLoaded) {
          //page++;
		  final oldpage = (currentState as CreditHistoryListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as CreditHistoryListingLoaded).page! + 1;
				  CreditHistoryListingModel? credit_history = await listingSearchCreditHistory(page);
				 if ((currentState as CreditHistoryListingLoaded).credit_history!.tools.paging.total_pages == oldpage) {
					yield (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!credit_history!.items.items.isEmpty){
						 (currentState as CreditHistoryListingLoaded).credit_history!.items.items.addAll(credit_history!.items.items);
					  }
					  yield credit_history!.items.items.isEmpty
						  ? (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : CreditHistoryListingLoaded(  credit_history:  (currentState as CreditHistoryListingLoaded).credit_history ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
                final page = (currentState as CreditHistoryListingLoaded).page! - 1;
					  if (oldpage == 1) {
						yield (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  CreditHistoryListingModel? credit_history = await listingCreditHistory(page);
							  yield credit_history!.items.items.isEmpty
								  ? (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : CreditHistoryListingLoaded(  credit_history:  credit_history ,
														  hasReachedMax: false,
														  page: page,);
					  }


				 
			}	  
        }
      } catch (_) {
        yield CreditHistoryListingError();
      }
    } else if (event is CreditHistoryListingRefresh){
      try {
        if (currentState is CreditHistoryListingUninitialized) {
		   if(isSearch){
		      CreditHistoryListingModel? credit_history = await listingSearchCreditHistory(1);
              yield CreditHistoryListingLoaded( credit_history: credit_history,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
			 CreditHistoryListingModel? credit_history1 = await listingSearchCreditHistory(1);
				  CreditHistoryListingModel? credit_history = await listingCreditHistory(credit_history1!.tools.paging.total_pages);
				  yield CreditHistoryListingLoaded( credit_history: credit_history,
                   hasReachedMax: false,
                   page: credit_history!.tools.paging.total_pages);
		   }

        }

        if (currentState is CreditHistoryListingLoaded) {
		  if(isSearch){
		     CreditHistoryListingModel? credit_history = await listingSearchRefreshCreditHistory();
              yield credit_history!.items.items.isEmpty
              ? (currentState as CreditHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CreditHistoryListingLoaded(  credit_history: credit_history ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
			   CreditHistoryListingModel? credit_history1 = await listingSearchCreditHistory(1);
			  CreditHistoryListingModel? credit_history = await listingCreditHistory(credit_history1!.tools.paging.total_pages);
				
			   int deltaPage = credit_history!.items.items.length ~/ (credit_history!.tools.paging.total_rows/credit_history!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
				deltaPage = credit_history!.tools.paging.total_pages;
              yield credit_history!.items.items.isEmpty
              ? (currentState as CreditHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CreditHistoryListingLoaded(  credit_history: credit_history ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield CreditHistoryListingError();
      }

    }
  }



  bool hasReachedMax(CreditHistoryState state) =>
      state is CreditHistoryListingLoaded && state.hasReachedMax!;


  Future<CreditHistoryListingModel?> listingCreditHistory(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getCreditHistoryListAPI(url, page);
	/*
	var dt  = CreditHistoryListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCreditHistoryListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<CreditHistoryListingModel?> listingRefreshCreditHistory() async {
  
  
   CreditHistoryListingModel? credit_history = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllCreditHistoryList1();
    credit_history  = await apiRepProvider!.getCreditHistoryListAPI(url, 1);
    return credit_history;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = CreditHistoryListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCreditHistoryListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<CreditHistoryListingModel?> listingSearchCreditHistory(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getCreditHistoryListSearchAPI(url, page);
	
	/*
	var dt  = CreditHistoryListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCreditHistoryListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<CreditHistoryListingModel?> listingSearchRefreshCreditHistory() async {
   CreditHistoryListingModel? credit_history = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllCreditHistoryList1();
    credit_history  = await apiRepProvider!.getCreditHistoryListSearchAPI(url, 1);
    return credit_history;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = CreditHistoryListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCreditHistoryListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<CreditHistoryListingModel> _loadAndSaveCreditHistoryListSearch(CreditHistoryListingModel list, String searchKey, int page) async{

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


class  UserCreditHistoryListBottomLoader extends StatelessWidget {
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







  

