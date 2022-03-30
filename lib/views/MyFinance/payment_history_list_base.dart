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



class PaymentHistoryListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PaymentHistoryListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PaymentHistoryListBaseState createState() => PaymentHistoryListBaseState();
}

class  PaymentHistoryListBaseState extends State<PaymentHistoryListBase>{
  String title = 'Payment History'; 
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
  PaymentHistoryListing? listing;

  PaymentHistoryListBaseState() {
   
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
     String payment_id = 'payment_id';
	 payment_id = payment_id.replaceAll('_id','');
     getPath = widget.url! + payment_id + 'page=%s';
	 
	listing =      PaymentHistoryListing(AppProvider.getApplication(context), getPath, false, PaymentHistoryListingUninitialized());
    listing!.add(PaymentHistoryList());
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
	
	 return BlocBuilder<PaymentHistoryListing, PaymentHistoryState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is PaymentHistoryListingUninitialized) {
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
        if (state is PaymentHistoryListingError) {
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
								  'Payment History',
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
        if (state is PaymentHistoryListingLoaded) {
          if (state.payment_history!.items.items.isEmpty) {
		  if (state.payment_history!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.payment_history!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.payment_history!.listButton(context, widget.id!).length == 0){ 
		     	return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				  body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.payment_history!.items.items.length? 
																		state.payment_history!.tools.paging.total_pages == state.payment_history!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPaymentHistoryListBottomLoader()
																				  : index == 0 ?
																  state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.payment_history!.items.items.length, index)
																  :state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.payment_history!.items.items.length-1, index);
																	 // : state.payment_history!.viewItem (state.payment_history!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.payment_history!.items.items.length
																	: state.payment_history!.items.items.length + 1,
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
							  child: Text('Payment History', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.payment_history!.items.items.length? 
																		state.payment_history!.tools.paging.total_pages == state.payment_history!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPaymentHistoryListBottomLoader()
																				  : index == 0 ?
																  state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.payment_history!.items.items.length, index)
																  :state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.payment_history!.items.items.length-1, index);
																	 // : state.payment_history!.viewItem (state.payment_history!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.payment_history!.items.items.length
																	: state.payment_history!.items.items.length + 1,
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
					//  floatingActionButton:  state.payment_history!.Buttons(context, _dialVisible, widget.id!)
					
					//	buildListingBar()
				);
				}else{
					return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				   body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.payment_history!.items.items.length? 
																		state.payment_history!.tools.paging.total_pages == state.payment_history!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPaymentHistoryListBottomLoader()
																				  : index == 0 ?
																  state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.payment_history!.items.items.length, index)
																  :state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.payment_history!.items.items.length-1, index);
																	 // : state.payment_history!.viewItem (state.payment_history!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.payment_history!.items.items.length
																	: state.payment_history!.items.items.length + 1,
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
							  child: Text('Payment History', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.payment_history!.items.items.length? 
																		state.payment_history!.tools.paging.total_pages == state.payment_history!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPaymentHistoryListBottomLoader()
																				  : index == 0 ?
																  state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.payment_history!.items.items.length, index)
																  :state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.payment_history!.items.items.length-1, index);
																	 // : state.payment_history!.viewItem (state.payment_history!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.payment_history!.items.items.length
																	: state.payment_history!.items.items.length + 1,
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
					  floatingActionButton:  state.payment_history!.Buttons(context, _dialVisible, widget.id!)
					
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

																  return index >= state.payment_history!.items.items.length? 
																		state.payment_history!.tools.paging.total_pages == state.payment_history!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPaymentHistoryListBottomLoader()
																				  : index == 0 ?
																  state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.payment_history!.items.items.length, index)
																  :state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.payment_history!.items.items.length-1, index);
																	 // : state.payment_history!.viewItem (state.payment_history!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.payment_history!.items.items.length
																	: state.payment_history!.items.items.length + 1,
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
							  child: Text('Payment History', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.payment_history!.items.items.length? 
																		state.payment_history!.tools.paging.total_pages == state.payment_history!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPaymentHistoryListBottomLoader()
																				  : index == 0 ?
																  state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.payment_history!.items.items.length, index)
																  :state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.payment_history!.items.items.length-1, index);
																	 // : state.payment_history!.viewItem (state.payment_history!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.payment_history!.items.items.length
																	: state.payment_history!.items.items.length + 1,
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

								  return index >= state.payment_history!.items.items.length? 
										state.payment_history!.tools.paging.total_pages == state.payment_history!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserPaymentHistoryListBottomLoader()
									 			  : index == 0 ?
								  state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.payment_history!.items.items.length, index)
								  :state.payment_history!.viewItem1 (state.payment_history!.items.items[index] , state.payment_history!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.payment_history!.items.items.length-1, index);
									 // : state.payment_history!.viewItem (state.payment_history!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.payment_history!.items.items.length
									: state.payment_history!.items.items.length + 1,
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
    listing!.add(PaymentHistoryListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PaymentHistoryList());
    }

  }
}




abstract class PaymentHistoryEvent extends Equatable {
   const PaymentHistoryEvent();
   @override
    List<Object> get props => [];
}

class PaymentHistoryList extends PaymentHistoryEvent {
  @override
  String toString() => 'PaymentHistoryList';
}

class PaymentHistoryListingRefresh extends PaymentHistoryEvent {
  @override
  String toString() => 'PaymentHistoryListingRefresh';
}

class PaymentHistoryListingChangeSearch extends PaymentHistoryEvent {
  @override
  String toString() => 'PaymentHistoryChangeSearch';
}


abstract class PaymentHistoryState extends Equatable {
   const PaymentHistoryState();
   @override
    List<Object> get props => [];
}

class PaymentHistoryListingUninitialized extends PaymentHistoryState {
  @override
  String toString() => 'PaymentHistoryListingUninitialized';
}

class PaymentHistoryListingError extends PaymentHistoryState {
  @override
  String toString() => 'PaymentHistoryListingError';
}

class PaymentHistoryListingLoaded extends PaymentHistoryState {
  final PaymentHistoryListingModel? payment_history;
  final bool? hasReachedMax;
  final int?  page;

  PaymentHistoryListingLoaded({
    this.payment_history,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [payment_history!, hasReachedMax!, page!];
	
  PaymentHistoryListingLoaded copyWith({
    PaymentHistoryListingModel? payment_history,
    bool? hasReachedMax,
    int? page,
  }) {
    return PaymentHistoryListingLoaded(
      payment_history: payment_history ?? this.payment_history,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PaymentHistoryListingLoaded  PaymentHistoryListing: ${ payment_history!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PaymentHistoryListing extends Bloc<PaymentHistoryEvent, PaymentHistoryState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PaymentHistoryListing(this.application, this.url, this.isSearch, PaymentHistoryState initialState):
  super(initialState){
   on<PaymentHistoryList>(_PaymentHistoryListEvent);
	 on<PaymentHistoryListingRefresh>(_PaymentHistoryListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PaymentHistoryEvent, PaymentHistoryState>> transformEvents(
      Stream<PaymentHistoryEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<PaymentHistoryEvent> transform<PaymentHistoryEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PaymentHistoryEvent, PaymentHistoryState> transition) {
    print(transition);
  }


  void _PaymentHistoryListEvent(PaymentHistoryList event, Emitter<PaymentHistoryState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is PaymentHistoryListingUninitialized){
			  if(isSearch){
			     PaymentHistoryListingModel? payment_history = await listingSearchPaymentHistory(1);
				  int deltaPage = payment_history!.items.items.length ~/(payment_history!.tools.paging.total_rows/payment_history!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( payment_history!.items.items.isEmpty ? (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PaymentHistoryListingLoaded(payment_history: payment_history,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				  PaymentHistoryListingModel? payment_history1 = await listingSearchPaymentHistory(1);
				  if(payment_history1!.tools.paging.total_pages != 0){
				  PaymentHistoryListingModel? payment_history = await listingPaymentHistory(payment_history1!.tools.paging.total_pages);
				  
				    int deltaPage = payment_history!.tools.paging.total_pages;
				    return emit (payment_history!.items.items.isEmpty ? (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PaymentHistoryListingLoaded(payment_history: payment_history,
					  hasReachedMax: false,
					  page: deltaPage));
				  }else{
				   int deltaPage = 0;
				   return emit (PaymentHistoryListingLoaded(payment_history: payment_history1,
					  hasReachedMax: false,
					  page: deltaPage));
				  }
			  
		
						  
			   		  
			  }
        }

        if (currentState is PaymentHistoryListingLoaded) {
          //page++;
		  final oldpage = (currentState as PaymentHistoryListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as PaymentHistoryListingLoaded).page! + 1;
				  PaymentHistoryListingModel? payment_history = await listingSearchPaymentHistory(page);
				 if ((currentState as PaymentHistoryListingLoaded).payment_history!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!payment_history!.items.items.isEmpty){
						 (currentState as PaymentHistoryListingLoaded).payment_history!.items.items.addAll(payment_history!.items.items);
					  }
					  return emit ( payment_history!.items.items.isEmpty
						  ? (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : PaymentHistoryListingLoaded(  payment_history:  (currentState as PaymentHistoryListingLoaded).payment_history ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
                final page = (currentState as PaymentHistoryListingLoaded).page! - 1;
					  if (oldpage == 1) {
						return emit ( (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  PaymentHistoryListingModel? payment_history = await listingPaymentHistory(page);
							  return emit (payment_history!.items.items.isEmpty
								  ? (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : PaymentHistoryListingLoaded(  payment_history:  payment_history ,
														  hasReachedMax: false,
														  page: page,));
					  }


				 
			}	  
        }
      } catch (_) {
        return emit ( PaymentHistoryListingError());
      }
    }
  }

  void _PaymentHistoryListingRefreshEvent(PaymentHistoryListingRefresh event, Emitter<PaymentHistoryState> emit)async{
  final currentState = state;
   try {
        if (currentState is PaymentHistoryListingUninitialized) {
		   if(isSearch){
		      PaymentHistoryListingModel? payment_history = await listingSearchPaymentHistory(1);
              return emit ( PaymentHistoryListingLoaded( payment_history: payment_history,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
			 PaymentHistoryListingModel? payment_history1 = await listingSearchPaymentHistory(1);
				  PaymentHistoryListingModel? payment_history = await listingPaymentHistory(payment_history1!.tools.paging.total_pages);
				  return emit ( PaymentHistoryListingLoaded( payment_history: payment_history,
                   hasReachedMax: false,
                   page: payment_history!.tools.paging.total_pages));
		   }

        }

        if (currentState is PaymentHistoryListingLoaded) {
		  if(isSearch){
		     PaymentHistoryListingModel? payment_history = await listingSearchRefreshPaymentHistory();
              return emit ( payment_history!.items.items.isEmpty
              ? (currentState as PaymentHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PaymentHistoryListingLoaded(  payment_history: payment_history ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
			   PaymentHistoryListingModel? payment_history1 = await listingSearchPaymentHistory(1);
			  PaymentHistoryListingModel? payment_history = await listingPaymentHistory(payment_history1!.tools.paging.total_pages);
				
			   int deltaPage = payment_history!.items.items.length ~/ (payment_history!.tools.paging.total_rows/payment_history!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
				deltaPage = payment_history!.tools.paging.total_pages;
              return emit (payment_history!.items.items.isEmpty
              ? (currentState as PaymentHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PaymentHistoryListingLoaded(  payment_history: payment_history ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PaymentHistoryListingError());
      }
  }



  @override
  get initialState => PaymentHistoryListingUninitialized();

  @override

  Stream<PaymentHistoryState> mapEventToState(PaymentHistoryEvent event) async* {
    final currentState = state;
    if (event is PaymentHistoryList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PaymentHistoryListingUninitialized){
			  if(isSearch){
			     PaymentHistoryListingModel? payment_history = await listingSearchPaymentHistory(1);
				  int deltaPage = payment_history!.items.items.length ~/(payment_history!.tools.paging.total_rows/payment_history!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield payment_history!.items.items.isEmpty ? (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PaymentHistoryListingLoaded(payment_history: payment_history,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				  PaymentHistoryListingModel? payment_history1 = await listingSearchPaymentHistory(1);
				  if(payment_history1!.tools.paging.total_pages != 0){
				  PaymentHistoryListingModel? payment_history = await listingPaymentHistory(payment_history1!.tools.paging.total_pages);
				  
				    int deltaPage = payment_history!.tools.paging.total_pages;
				    yield payment_history!.items.items.isEmpty ? (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PaymentHistoryListingLoaded(payment_history: payment_history,
					  hasReachedMax: false,
					  page: deltaPage);
				  }else{
				   int deltaPage = 0;
				   yield PaymentHistoryListingLoaded(payment_history: payment_history1,
					  hasReachedMax: false,
					  page: deltaPage);
				  }
			  
		
						  
			   		  
			  }
        }

        if (currentState is PaymentHistoryListingLoaded) {
          //page++;
		  final oldpage = (currentState as PaymentHistoryListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as PaymentHistoryListingLoaded).page! + 1;
				  PaymentHistoryListingModel? payment_history = await listingSearchPaymentHistory(page);
				 if ((currentState as PaymentHistoryListingLoaded).payment_history!.tools.paging.total_pages == oldpage) {
					yield (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!payment_history!.items.items.isEmpty){
						 (currentState as PaymentHistoryListingLoaded).payment_history!.items.items.addAll(payment_history!.items.items);
					  }
					  yield payment_history!.items.items.isEmpty
						  ? (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : PaymentHistoryListingLoaded(  payment_history:  (currentState as PaymentHistoryListingLoaded).payment_history ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
                final page = (currentState as PaymentHistoryListingLoaded).page! - 1;
					  if (oldpage == 1) {
						yield (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  PaymentHistoryListingModel? payment_history = await listingPaymentHistory(page);
							  yield payment_history!.items.items.isEmpty
								  ? (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : PaymentHistoryListingLoaded(  payment_history:  payment_history ,
														  hasReachedMax: false,
														  page: page,);
					  }


				 
			}	  
        }
      } catch (_) {
        yield PaymentHistoryListingError();
      }
    } else if (event is PaymentHistoryListingRefresh){
      try {
        if (currentState is PaymentHistoryListingUninitialized) {
		   if(isSearch){
		      PaymentHistoryListingModel? payment_history = await listingSearchPaymentHistory(1);
              yield PaymentHistoryListingLoaded( payment_history: payment_history,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
			 PaymentHistoryListingModel? payment_history1 = await listingSearchPaymentHistory(1);
				  PaymentHistoryListingModel? payment_history = await listingPaymentHistory(payment_history1!.tools.paging.total_pages);
				  yield PaymentHistoryListingLoaded( payment_history: payment_history,
                   hasReachedMax: false,
                   page: payment_history!.tools.paging.total_pages);
		   }

        }

        if (currentState is PaymentHistoryListingLoaded) {
		  if(isSearch){
		     PaymentHistoryListingModel? payment_history = await listingSearchRefreshPaymentHistory();
              yield payment_history!.items.items.isEmpty
              ? (currentState as PaymentHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PaymentHistoryListingLoaded(  payment_history: payment_history ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
			   PaymentHistoryListingModel? payment_history1 = await listingSearchPaymentHistory(1);
			  PaymentHistoryListingModel? payment_history = await listingPaymentHistory(payment_history1!.tools.paging.total_pages);
				
			   int deltaPage = payment_history!.items.items.length ~/ (payment_history!.tools.paging.total_rows/payment_history!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
				deltaPage = payment_history!.tools.paging.total_pages;
              yield payment_history!.items.items.isEmpty
              ? (currentState as PaymentHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PaymentHistoryListingLoaded(  payment_history: payment_history ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PaymentHistoryListingError();
      }

    }
  }



  bool hasReachedMax(PaymentHistoryState state) =>
      state is PaymentHistoryListingLoaded && state.hasReachedMax!;


  Future<PaymentHistoryListingModel?> listingPaymentHistory(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getPaymentHistoryListAPI(url, page);
	/*
	var dt  = PaymentHistoryListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePaymentHistoryListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<PaymentHistoryListingModel?> listingRefreshPaymentHistory() async {
  
  
   PaymentHistoryListingModel? payment_history = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllPaymentHistoryList1();
    payment_history  = await apiRepProvider!.getPaymentHistoryListAPI(url, 1);
    return payment_history;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PaymentHistoryListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePaymentHistoryListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<PaymentHistoryListingModel?> listingSearchPaymentHistory(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getPaymentHistoryListSearchAPI(url, page);
	
	/*
	var dt  = PaymentHistoryListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePaymentHistoryListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<PaymentHistoryListingModel?> listingSearchRefreshPaymentHistory() async {
   PaymentHistoryListingModel? payment_history = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllPaymentHistoryList1();
    payment_history  = await apiRepProvider!.getPaymentHistoryListSearchAPI(url, 1);
    return payment_history;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PaymentHistoryListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePaymentHistoryListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<PaymentHistoryListingModel> _loadAndSavePaymentHistoryListSearch(PaymentHistoryListingModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
	  list.items.items[i].item.pht = list.items.items[i].item.attachment_url;
	  list.items.items[i].item.sbttl = list.items.items[i].item.approver_note;
    }
    return list;
 }


class  UserPaymentHistoryListBottomLoader extends StatelessWidget {
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







  

