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



class PointsAffiliateListBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PointsAffiliateListBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PointsAffiliateListBaseState createState() => PointsAffiliateListBaseState();
}

class  PointsAffiliateListBaseState extends State<PointsAffiliateListBase>{
  String title = 'Points Affiliate'; 
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
  PointsAffiliateListing? listing;

  PointsAffiliateListBaseState() {
   
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
	 
	listing =      PointsAffiliateListing(AppProvider.getApplication(context), getPath, false, PointsAffiliateListingUninitialized());
    listing!.add(PointsAffiliateList());
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
	
	 return BlocBuilder<PointsAffiliateListing, PointsAffiliateState>(
      bloc: listing,

      builder: (BuildContext context, state) {
	  final mediaQueryData = MediaQuery.of(context);
	    bool darkMode = false;
      final themeManager =  Provider.of<ThemeManager>(context);
      themeManager.themeMode == ThemeMode.dark? darkMode = true : darkMode = false;
        if (state is PointsAffiliateListingUninitialized) {
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
        if (state is PointsAffiliateListingError) {
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
								  'Points Affiliate',
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
        if (state is PointsAffiliateListingLoaded) {
          if (state.points_affiliate!.items.items.isEmpty) {
		  if (state.points_affiliate!.listButton(context, widget.id!).length == 0){ 
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
                 floatingActionButton: state.points_affiliate!.Buttons(context, _dialVisible, widget.id!)
              );
			  }
          }else{
		  
		      if (state.points_affiliate!.listButton(context, widget.id!).length == 0){ 
		     	return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				  body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.points_affiliate!.items.items.length? 
																		state.points_affiliate!.tools.paging.total_pages == state.points_affiliate!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsAffiliateListBottomLoader()
																				  : index == 0 ?
																  state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_affiliate!.items.items.length, index)
																  :state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_affiliate!.items.items.length-1, index);
																	 // : state.points_affiliate!.viewItem (state.points_affiliate!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_affiliate!.items.items.length
																	: state.points_affiliate!.items.items.length + 1,
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
							  child: Text('Points Affiliate', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_affiliate!.items.items.length? 
																		state.points_affiliate!.tools.paging.total_pages == state.points_affiliate!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsAffiliateListBottomLoader()
																				  : index == 0 ?
																  state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_affiliate!.items.items.length, index)
																  :state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_affiliate!.items.items.length-1, index);
																	 // : state.points_affiliate!.viewItem (state.points_affiliate!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_affiliate!.items.items.length
																	: state.points_affiliate!.items.items.length + 1,
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
					//  floatingActionButton:  state.points_affiliate!.Buttons(context, _dialVisible, widget.id!)
					
					//	buildListingBar()
				);
				}else{
					return Scaffold(
				backgroundColor: darkMode? Colors.black : Colors.white,
				   body: RefreshIndicator(
											  child:  

											          ListView.builder(
																itemBuilder: (BuildContext context, int index) {

																  return index >= state.points_affiliate!.items.items.length? 
																		state.points_affiliate!.tools.paging.total_pages == state.points_affiliate!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsAffiliateListBottomLoader()
																				  : index == 0 ?
																  state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_affiliate!.items.items.length, index)
																  :state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_affiliate!.items.items.length-1, index);
																	 // : state.points_affiliate!.viewItem (state.points_affiliate!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_affiliate!.items.items.length
																	: state.points_affiliate!.items.items.length + 1,
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
							  child: Text('Points Affiliate', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_affiliate!.items.items.length? 
																		state.points_affiliate!.tools.paging.total_pages == state.points_affiliate!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsAffiliateListBottomLoader()
																				  : index == 0 ?
																  state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_affiliate!.items.items.length, index)
																  :state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_affiliate!.items.items.length-1, index);
																	 // : state.points_affiliate!.viewItem (state.points_affiliate!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_affiliate!.items.items.length
																	: state.points_affiliate!.items.items.length + 1,
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
					  floatingActionButton:  state.points_affiliate!.Buttons(context, _dialVisible, widget.id!)
					
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

																  return index >= state.points_affiliate!.items.items.length? 
																		state.points_affiliate!.tools.paging.total_pages == state.points_affiliate!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsAffiliateListBottomLoader()
																				  : index == 0 ?
																  state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_affiliate!.items.items.length, index)
																  :state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_affiliate!.items.items.length-1, index);
																	 // : state.points_affiliate!.viewItem (state.points_affiliate!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_affiliate!.items.items.length
																	: state.points_affiliate!.items.items.length + 1,
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
							  child: Text('Points Affiliate', style: TextStyle(fontSize: 20, color: Colors.white),),
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

																  return index >= state.points_affiliate!.items.items.length? 
																		state.points_affiliate!.tools.paging.total_pages == state.points_affiliate!.tools.paging.current_page?
																		Container(height: 0.0, width: 0.0,):	
																		UserPointsAffiliateListBottomLoader()
																				  : index == 0 ?
																  state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_affiliate!.items.items.length, index)
																  :state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_affiliate!.items.items.length-1, index);
																	 // : state.points_affiliate!.viewItem (state.points_affiliate!.items.items[index] , searchText, account, widget.id!, );
																},
																itemCount: state.hasReachedMax!
																	? state.points_affiliate!.items.items.length
																	: state.points_affiliate!.items.items.length + 1,
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

								  return index >= state.points_affiliate!.items.items.length? 
										state.points_affiliate!.tools.paging.total_pages == state.points_affiliate!.tools.paging.current_page?
										Container(height: 0.0, width: 0.0,):	
										UserPointsAffiliateListBottomLoader()
									 			  : index == 0 ?
								  state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index] , searchText ,context, account, widget.title!,  state.hasReachedMax!, state.points_affiliate!.items.items.length, index)
								  :state.points_affiliate!.viewItem1 (state.points_affiliate!.items.items[index] , state.points_affiliate!.items.items[index-1] , searchText ,context,  account, widget.title!, state.hasReachedMax!, state.points_affiliate!.items.items.length-1, index);
									 // : state.points_affiliate!.viewItem (state.points_affiliate!.items.items[index] , searchText, account, widget.id!, );
								},
								itemCount: state.hasReachedMax!
									? state.points_affiliate!.items.items.length
									: state.points_affiliate!.items.items.length + 1,
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
    listing!.add(PointsAffiliateListingRefresh());

    Timer timer =      Timer(     Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PointsAffiliateList());
    }

  }
}




abstract class PointsAffiliateEvent extends Equatable {
   const PointsAffiliateEvent();
   @override
    List<Object> get props => [];
}

class PointsAffiliateList extends PointsAffiliateEvent {
  @override
  String toString() => 'PointsAffiliateList';
}

class PointsAffiliateListingRefresh extends PointsAffiliateEvent {
  @override
  String toString() => 'PointsAffiliateListingRefresh';
}

class PointsAffiliateListingChangeSearch extends PointsAffiliateEvent {
  @override
  String toString() => 'PointsAffiliateChangeSearch';
}


abstract class PointsAffiliateState extends Equatable {
   const PointsAffiliateState();
   @override
    List<Object> get props => [];
}

class PointsAffiliateListingUninitialized extends PointsAffiliateState {
  @override
  String toString() => 'PointsAffiliateListingUninitialized';
}

class PointsAffiliateListingError extends PointsAffiliateState {
  @override
  String toString() => 'PointsAffiliateListingError';
}

class PointsAffiliateListingLoaded extends PointsAffiliateState {
  final PointsAffiliateListingModel? points_affiliate;
  final bool? hasReachedMax;
  final int?  page;

  PointsAffiliateListingLoaded({
    this.points_affiliate,
    this.hasReachedMax,
    this.page,

  });
  @override
    List<Object> get props => [points_affiliate!, hasReachedMax!, page!];
	
  PointsAffiliateListingLoaded copyWith({
    PointsAffiliateListingModel? points_affiliate,
    bool? hasReachedMax,
    int? page,
  }) {
    return PointsAffiliateListingLoaded(
      points_affiliate: points_affiliate ?? this.points_affiliate,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PointsAffiliateListingLoaded  PointsAffiliateListing: ${ points_affiliate!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PointsAffiliateListing extends Bloc<PointsAffiliateEvent, PointsAffiliateState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PointsAffiliateListing(this.application, this.url, this.isSearch, PointsAffiliateState initialState):
  super(initialState){
   on<PointsAffiliateList>(_PointsAffiliateListEvent);
	 on<PointsAffiliateListingRefresh>(_PointsAffiliateListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PointsAffiliateEvent, PointsAffiliateState>> transformEvents(
      Stream<PointsAffiliateEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<PointsAffiliateEvent> transform<PointsAffiliateEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PointsAffiliateEvent, PointsAffiliateState> transition) {
    print(transition);
  }


  void _PointsAffiliateListEvent(PointsAffiliateList event, Emitter<PointsAffiliateState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is PointsAffiliateListingUninitialized){
			  if(isSearch){
			     PointsAffiliateListingModel? points_affiliate = await listingSearchPointsAffiliate(1);
				  int deltaPage = points_affiliate!.items.items.length ~/(points_affiliate!.tools.paging.total_rows/points_affiliate!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  return emit ( points_affiliate!.items.items.isEmpty ? (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsAffiliateListingLoaded(points_affiliate: points_affiliate,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
			  
				   PointsAffiliateListingModel? points_affiliate = await listingPointsAffiliate(1);
				   int deltaPage;
				   if(points_affiliate!.tools.paging.total_pages != 0){
				      deltaPage = points_affiliate!.items.items.length ~/(points_affiliate!.tools.paging.total_rows/points_affiliate!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   return emit ( points_affiliate!.items.items.isEmpty ? (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsAffiliateListingLoaded(points_affiliate: points_affiliate,
					  hasReachedMax: false,
					  page: deltaPage));
					  
					  }else{
					    deltaPage = 0;
						 return emit ( PointsAffiliateListingLoaded(points_affiliate: points_affiliate,
					  hasReachedMax: false,
					  page: deltaPage));
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is PointsAffiliateListingLoaded) {
          //page++;
		  final oldpage = (currentState as PointsAffiliateListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as PointsAffiliateListingLoaded).page! + 1;
				  PointsAffiliateListingModel? points_affiliate = await listingSearchPointsAffiliate(page);
				 if ((currentState as PointsAffiliateListingLoaded).points_affiliate!.tools.paging.total_pages == oldpage) {
					return emit ((currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  if(!points_affiliate!.items.items.isEmpty){
						 (currentState as PointsAffiliateListingLoaded).points_affiliate!.items.items.addAll(points_affiliate!.items.items);
					  }
					  return emit ( points_affiliate!.items.items.isEmpty
						  ? (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : PointsAffiliateListingLoaded(  points_affiliate:  (currentState as PointsAffiliateListingLoaded).points_affiliate ,
												  hasReachedMax: false,
												  page: page,));
				};
			}else{
				  final page = (currentState as PointsAffiliateListingLoaded).page! + 1;
				   if ((currentState as PointsAffiliateListingLoaded).points_affiliate!.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{   
					  PointsAffiliateListingModel? points_affiliate = await listingPointsAffiliate(page);
					 return emit (points_affiliate!.items.items.isEmpty
						  ? (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : PointsAffiliateListingLoaded(  points_affiliate:  points_affiliate ,
												  hasReachedMax: false,
												  page: page,));
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        return emit ( PointsAffiliateListingError());
      }
    }
  }

  void _PointsAffiliateListingRefreshEvent(PointsAffiliateListingRefresh event, Emitter<PointsAffiliateState> emit)async{
  final currentState = state;
   try {
        if (currentState is PointsAffiliateListingUninitialized) {
		   if(isSearch){
		      PointsAffiliateListingModel? points_affiliate = await listingSearchPointsAffiliate(1);
              return emit ( PointsAffiliateListingLoaded( points_affiliate: points_affiliate,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		   
		   
		     PointsAffiliateListingModel? points_affiliate = await listingPointsAffiliate(1);
             return emit ( PointsAffiliateListingLoaded( points_affiliate: points_affiliate,
                   hasReachedMax: false,
                   page: 1 ));
				   
		   }

        }

        if (currentState is PointsAffiliateListingLoaded) {
		  if(isSearch){
		     PointsAffiliateListingModel? points_affiliate = await listingSearchRefreshPointsAffiliate();
              return emit ( points_affiliate!.items.items.isEmpty
              ? (currentState as PointsAffiliateListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsAffiliateListingLoaded(  points_affiliate: points_affiliate ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		  
		      PointsAffiliateListingModel? points_affiliate = await listingRefreshPointsAffiliate();
			   int deltaPage = points_affiliate!.items.items.length ~/ (points_affiliate!.tools.paging.total_rows/points_affiliate!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              return emit (points_affiliate!.items.items.isEmpty
              ? (currentState as PointsAffiliateListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsAffiliateListingLoaded(  points_affiliate: points_affiliate ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PointsAffiliateListingError());
      }
  }



  @override
  get initialState => PointsAffiliateListingUninitialized();

  @override

  Stream<PointsAffiliateState> mapEventToState(PointsAffiliateEvent event) async* {
    final currentState = state;
    if (event is PointsAffiliateList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsAffiliateListingUninitialized){
			  if(isSearch){
			     PointsAffiliateListingModel? points_affiliate = await listingSearchPointsAffiliate(1);
				  int deltaPage = points_affiliate!.items.items.length ~/(points_affiliate!.tools.paging.total_rows/points_affiliate!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  } else{
				  deltaPage = 1;
				  }
				  yield points_affiliate!.items.items.isEmpty ? (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsAffiliateListingLoaded(points_affiliate: points_affiliate,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
			  
				   PointsAffiliateListingModel? points_affiliate = await listingPointsAffiliate(1);
				   int deltaPage;
				   if(points_affiliate!.tools.paging.total_pages != 0){
				      deltaPage = points_affiliate!.items.items.length ~/(points_affiliate!.tools.paging.total_rows/points_affiliate!.tools.paging.total_pages).round();
					  if (deltaPage < 1){
						deltaPage = 1;
					  } else{
						deltaPage = 1;
					  }
					   yield points_affiliate!.items.items.isEmpty ? (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PointsAffiliateListingLoaded(points_affiliate: points_affiliate,
					  hasReachedMax: false,
					  page: deltaPage);
					  
					  }else{
					    deltaPage = 0;
						 yield PointsAffiliateListingLoaded(points_affiliate: points_affiliate,
					  hasReachedMax: false,
					  page: deltaPage);
					  }
					  
					   
					  
				   
			  
		
						  
			   		  
			  }
        }

        if (currentState is PointsAffiliateListingLoaded) {
          //page++;
		  final oldpage = (currentState as PointsAffiliateListingLoaded).page;
		  	if(isSearch){
			  	  final page = (currentState as PointsAffiliateListingLoaded).page! + 1;
				  PointsAffiliateListingModel? points_affiliate = await listingSearchPointsAffiliate(page);
				 if ((currentState as PointsAffiliateListingLoaded).points_affiliate!.tools.paging.total_pages == oldpage) {
					yield (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  if(!points_affiliate!.items.items.isEmpty){
						 (currentState as PointsAffiliateListingLoaded).points_affiliate!.items.items.addAll(points_affiliate!.items.items);
					  }
					  yield points_affiliate!.items.items.isEmpty
						  ? (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
						  page: page)                           
						  : PointsAffiliateListingLoaded(  points_affiliate:  (currentState as PointsAffiliateListingLoaded).points_affiliate ,
												  hasReachedMax: false,
												  page: page,);
				};
			}else{
				  final page = (currentState as PointsAffiliateListingLoaded).page! + 1;
				   if ((currentState as PointsAffiliateListingLoaded).points_affiliate!.tools.paging.total_pages == oldpage) {
					yield (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{   
					  PointsAffiliateListingModel? points_affiliate = await listingPointsAffiliate(page);
					  yield points_affiliate!.items.items.isEmpty
						  ? (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
						  page: page)
						  : PointsAffiliateListingLoaded(  points_affiliate:  points_affiliate ,
												  hasReachedMax: false,
												  page: page,);
				 }	
				 

				 
			}	  
        }
      } catch (_) {
        yield PointsAffiliateListingError();
      }
    } else if (event is PointsAffiliateListingRefresh){
      try {
        if (currentState is PointsAffiliateListingUninitialized) {
		   if(isSearch){
		      PointsAffiliateListingModel? points_affiliate = await listingSearchPointsAffiliate(1);
              yield PointsAffiliateListingLoaded( points_affiliate: points_affiliate,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		   
		   
		     PointsAffiliateListingModel? points_affiliate = await listingPointsAffiliate(1);
             yield PointsAffiliateListingLoaded( points_affiliate: points_affiliate,
                   hasReachedMax: false,
                   page: 1 );
				   
		   }

        }

        if (currentState is PointsAffiliateListingLoaded) {
		  if(isSearch){
		     PointsAffiliateListingModel? points_affiliate = await listingSearchRefreshPointsAffiliate();
              yield points_affiliate!.items.items.isEmpty
              ? (currentState as PointsAffiliateListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsAffiliateListingLoaded(  points_affiliate: points_affiliate ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		  
		      PointsAffiliateListingModel? points_affiliate = await listingRefreshPointsAffiliate();
			   int deltaPage = points_affiliate!.items.items.length ~/ (points_affiliate!.tools.paging.total_rows/points_affiliate!.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  
              yield points_affiliate!.items.items.isEmpty
              ? (currentState as PointsAffiliateListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsAffiliateListingLoaded(  points_affiliate: points_affiliate ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PointsAffiliateListingError();
      }

    }
  }



  bool hasReachedMax(PointsAffiliateState state) =>
      state is PointsAffiliateListingLoaded && state.hasReachedMax!;


  Future<PointsAffiliateListingModel?> listingPointsAffiliate(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getPointsAffiliateListAPI(url, page);
	/*
	var dt  = PointsAffiliateListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsAffiliateListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<PointsAffiliateListingModel?> listingRefreshPointsAffiliate() async {
  
  
   PointsAffiliateListingModel? points_affiliate = null;
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllPointsAffiliateList1();
    points_affiliate  = await apiRepProvider!.getPointsAffiliateListAPI(url, 1);
    return points_affiliate;
	/*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PointsAffiliateListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsAffiliateListSearch(dt ,'',page);
	return data;
	*/
  }

  Future<PointsAffiliateListingModel?> listingSearchPointsAffiliate(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	return await apiRepProvider!.getPointsAffiliateListSearchAPI(url, page);
	
	/*
	var dt  = PointsAffiliateListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsAffiliateListSearch(dt ,'',page);	
	return data;
	*/
  }

  Future<PointsAffiliateListingModel?> listingSearchRefreshPointsAffiliate() async {
   PointsAffiliateListingModel? points_affiliate = null;
     APIRepository? apiRepProvider = application.projectsAPIRepository;
    await application.projectsDBRepository!.deleteAllPointsAffiliateList1();
    points_affiliate  = await apiRepProvider!.getPointsAffiliateListSearchAPI(url, 1);
    return points_affiliate;
  /*
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PointsAffiliateListingModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsAffiliateListSearch(dt ,'',page);
	return data;
	*/
  }
}


Future<PointsAffiliateListingModel> _loadAndSavePointsAffiliateListSearch(PointsAffiliateListingModel list, String searchKey, int page) async{

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


class  UserPointsAffiliateListBottomLoader extends StatelessWidget {
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







  

