
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



class CheckoutItemsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  CheckoutItemsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  CheckoutItemsIndexBaseState createState() => CheckoutItemsIndexBaseState();
}

class  CheckoutItemsIndexBaseState extends State<CheckoutItemsIndexBase>{
  String title = 'CheckoutItems'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  CheckoutItemsListing? listing;

  CheckoutItemsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String cart_id = 'cart_id';
	 cart_id = cart_id.replaceAll('_id','');
     getPath = widget.url! + cart_id + 'page=%s';
	listing = new CheckoutItemsListing(AppProvider.getApplication(context), getPath, false, CheckoutItemsListingUninitialized());
    listing!.add(CheckoutItemsList());
    return Scaffold(
        appBar: null,
        body: buildListingBar()
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
            style: new TextStyle(
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

          //  hasFloatingPlaceholder: false,
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


   // @override
  Widget buildListingBar(){
    return BlocBuilder<CheckoutItemsListing, CheckoutItemsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is CheckoutItemsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is CheckoutItemsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is CheckoutItemsListingLoaded) {
          if (state.checkout_items!.items.items.isEmpty) {
		  if (state.checkout_items!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.checkout_items!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.checkout_items!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.checkout_items!.items.items.length
									  ?  UserCheckoutItemsListBottomLoader()
									  : state.checkout_items!.viewItem (state.checkout_items!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.checkout_items!.items.items.length
									: state.checkout_items!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							)
				);					
			}
          return
		  Scaffold(
                    body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.checkout_items!.items.items.length
									  ?  UserCheckoutItemsListBottomLoader()
									  : state.checkout_items!.viewItem (state.checkout_items!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.checkout_items!.items.items.length
									: state.checkout_items!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.checkout_items!.Buttons(context, _dialVisible)
							
                   
			 );
        }
		
		return new Container(width: 0.0, height: 0.0);
      },
    );
  }

  @override
  void dispose() {
    listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();
    listing!.add(CheckoutItemsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(CheckoutItemsList());
    }

  }
}




abstract class CheckoutItemsEvent extends Equatable {
const CheckoutItemsEvent();
   @override
    List<Object> get props => [];
}

class CheckoutItemsList extends CheckoutItemsEvent {
  @override
  String toString() => 'CheckoutItemsList';
}

class CheckoutItemsListingRefresh extends CheckoutItemsEvent {
  @override
  String toString() => 'CheckoutItemsListingRefresh';
}

class CheckoutItemsListingChangeSearch extends CheckoutItemsEvent {
  @override
  String toString() => 'CheckoutItemsChangeSearch';
}


abstract class CheckoutItemsState extends Equatable {
  const CheckoutItemsState();
   @override
    List<Object> get props => [];
}

class CheckoutItemsListingUninitialized extends CheckoutItemsState {
  @override
  String toString() => 'CheckoutItemsListingUninitialized';
}

class CheckoutItemsListingError extends CheckoutItemsState {
  @override
  String toString() => 'CheckoutItemsListingError';
}

class CheckoutItemsListingLoaded extends CheckoutItemsState {
  final CheckoutItemsIndexModel? checkout_items;
  final bool? hasReachedMax;
  final int?  page;

  CheckoutItemsListingLoaded({
    this.checkout_items,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [checkout_items!, hasReachedMax!, page!];
  
  CheckoutItemsListingLoaded copyWith({
    CheckoutItemsIndexModel? checkout_items,
    bool? hasReachedMax,
    int? page,
  }) {
    return CheckoutItemsListingLoaded(
      checkout_items: checkout_items ?? this.checkout_items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'CheckoutItemsListingLoaded  CheckoutItemsListing: ${ checkout_items!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class CheckoutItemsListing extends Bloc<CheckoutItemsEvent, CheckoutItemsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  CheckoutItemsListing(this.application, this.url, this.isSearch, CheckoutItemsState initialState):
  super(initialState){
     on<CheckoutItemsList>(_CheckoutItemsListEvent);
	 on<CheckoutItemsListingRefresh>(_CheckoutItemsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<CheckoutItemsEvent, CheckoutItemsState>> transformEvents(
      Stream<CheckoutItemsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<CheckoutItemsEvent> transform<CheckoutItemsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<CheckoutItemsEvent, CheckoutItemsState> transition) {
    print(transition);
  }


  void _CheckoutItemsListEvent(CheckoutItemsList event, Emitter<CheckoutItemsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is CheckoutItemsListingUninitialized){
			  if(isSearch){
			     CheckoutItemsIndexModel checkout_items = await listingSearchCheckoutItems(1);
				  int deltaPage = checkout_items.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (CheckoutItemsListingLoaded(checkout_items: checkout_items,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  CheckoutItemsIndexModel checkout_items = await listingCheckoutItems(1);
				  int deltaPage = checkout_items.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (CheckoutItemsListingLoaded(checkout_items: checkout_items,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is CheckoutItemsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as CheckoutItemsListingLoaded).page! + 1;
				  CheckoutItemsIndexModel checkout_items = await listingCheckoutItems(page);
				  if(!checkout_items.items.items.isEmpty){
				     (currentState as CheckoutItemsListingLoaded).checkout_items!.items.items.addAll(checkout_items.items.items);
				  }
				  return emit (checkout_items.items.items.isEmpty
					  ? (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : CheckoutItemsListingLoaded(  checkout_items:  (currentState as CheckoutItemsListingLoaded).checkout_items ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as CheckoutItemsListingLoaded).page! + 1;
				  CheckoutItemsIndexModel checkout_items = await listingCheckoutItems(page);
				  return emit ( checkout_items.items.items.isEmpty
					  ? (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : CheckoutItemsListingLoaded(  checkout_items:  checkout_items ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( CheckoutItemsListingError());
      }
    }
  }

  void _CheckoutItemsListingRefreshEvent(CheckoutItemsListingRefresh event, Emitter<CheckoutItemsState> emit)async{
  final currentState = state;
    try {
        if (currentState is CheckoutItemsListingUninitialized) {
		   if(isSearch){
		      CheckoutItemsIndexModel checkout_items = await listingSearchCheckoutItems(1);
              return emit (CheckoutItemsListingLoaded( checkout_items: checkout_items,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     CheckoutItemsIndexModel checkout_items = await listingCheckoutItems(1);
             return emit (CheckoutItemsListingLoaded( checkout_items: checkout_items,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is CheckoutItemsListingLoaded) {
		  if(isSearch){
		     CheckoutItemsIndexModel checkout_items = await listingSearchRefreshCheckoutItems();
              return emit ( checkout_items.items.items.isEmpty
              ? (currentState as CheckoutItemsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CheckoutItemsListingLoaded(  checkout_items: checkout_items ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      CheckoutItemsIndexModel checkout_items = await listingRefreshCheckoutItems();
              return emit ( checkout_items.items.items.isEmpty
              ? (currentState as CheckoutItemsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CheckoutItemsListingLoaded(  checkout_items: checkout_items ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (CheckoutItemsListingError());
      }
  }

  @override
  get initialState => CheckoutItemsListingUninitialized();

  @override

  Stream<CheckoutItemsState> mapEventToState(CheckoutItemsEvent event) async* {
    final currentState = state;
    if (event is CheckoutItemsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is CheckoutItemsListingUninitialized){
			  if(isSearch){
			     CheckoutItemsIndexModel checkout_items = await listingSearchCheckoutItems(1);
				  int deltaPage = checkout_items.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield CheckoutItemsListingLoaded(checkout_items: checkout_items,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  CheckoutItemsIndexModel checkout_items = await listingCheckoutItems(1);
				  int deltaPage = checkout_items.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield CheckoutItemsListingLoaded(checkout_items: checkout_items,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is CheckoutItemsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as CheckoutItemsListingLoaded).page! + 1;
				  CheckoutItemsIndexModel checkout_items = await listingCheckoutItems(page);
				  if(!checkout_items.items.items.isEmpty){
				     (currentState as CheckoutItemsListingLoaded).checkout_items!.items.items.addAll(checkout_items.items.items);
				  }
				  yield checkout_items.items.items.isEmpty
					  ? (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : CheckoutItemsListingLoaded(  checkout_items:  (currentState as CheckoutItemsListingLoaded).checkout_items ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as CheckoutItemsListingLoaded).page! + 1;
				  CheckoutItemsIndexModel checkout_items = await listingCheckoutItems(page);
				  yield checkout_items.items.items.isEmpty
					  ? (currentState as CheckoutItemsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : CheckoutItemsListingLoaded(  checkout_items:  checkout_items ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield CheckoutItemsListingError();
      }
    } else if (event is CheckoutItemsListingRefresh){
      try {
        if (currentState is CheckoutItemsListingUninitialized) {
		   if(isSearch){
		      CheckoutItemsIndexModel checkout_items = await listingSearchCheckoutItems(1);
              yield CheckoutItemsListingLoaded( checkout_items: checkout_items,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     CheckoutItemsIndexModel checkout_items = await listingCheckoutItems(1);
             yield CheckoutItemsListingLoaded( checkout_items: checkout_items,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is CheckoutItemsListingLoaded) {
		  if(isSearch){
		     CheckoutItemsIndexModel checkout_items = await listingSearchRefreshCheckoutItems();
              yield checkout_items.items.items.isEmpty
              ? (currentState as CheckoutItemsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CheckoutItemsListingLoaded(  checkout_items: checkout_items ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      CheckoutItemsIndexModel checkout_items = await listingRefreshCheckoutItems();
              yield checkout_items.items.items.isEmpty
              ? (currentState as CheckoutItemsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CheckoutItemsListingLoaded(  checkout_items: checkout_items ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield CheckoutItemsListingError();
      }

    }
  }



  bool hasReachedMax(CheckoutItemsState state) =>
      state is CheckoutItemsListingLoaded && state.hasReachedMax!;


  Future<CheckoutItemsIndexModel> listingCheckoutItems(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = CheckoutItemsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCheckoutItemsListSearch(dt ,'',page);
	
	return data;
  }

  Future<CheckoutItemsIndexModel> listingRefreshCheckoutItems() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = CheckoutItemsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCheckoutItemsListSearch(dt ,'',page);
	
	return data;
  }

  Future<CheckoutItemsIndexModel> listingSearchCheckoutItems(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = CheckoutItemsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCheckoutItemsListSearch(dt ,'',page);	
	return data;
  }

  Future<CheckoutItemsIndexModel> listingSearchRefreshCheckoutItems() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = CheckoutItemsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCheckoutItemsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<CheckoutItemsIndexModel> _loadAndSaveCheckoutItemsListSearch(CheckoutItemsIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.cart_id;
    }
    return list;
 }


class  UserCheckoutItemsListBottomLoader extends StatelessWidget {
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








  

















  

