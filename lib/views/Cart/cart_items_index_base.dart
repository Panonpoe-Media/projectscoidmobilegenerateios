
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



class CartItemsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  CartItemsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  CartItemsIndexBaseState createState() => CartItemsIndexBaseState();
}

class  CartItemsIndexBaseState extends State<CartItemsIndexBase>{
  String title = 'CartItems'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  CartItemsListing? listing;

  CartItemsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String cart_id = 'cart_id';
	 cart_id = cart_id.replaceAll('_id','');
     getPath = widget.url! + cart_id + 'page=%s';
	listing = new CartItemsListing(AppProvider.getApplication(context), getPath, false, CartItemsListingUninitialized());
    listing!.add(CartItemsList());
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
    return BlocBuilder<CartItemsListing, CartItemsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is CartItemsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is CartItemsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is CartItemsListingLoaded) {
          if (state.cart_items!.items.items.isEmpty) {
		  if (state.cart_items!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.cart_items!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.cart_items!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.cart_items!.items.items.length
									  ?  UserCartItemsListBottomLoader()
									  : state.cart_items!.viewItem (state.cart_items!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.cart_items!.items.items.length
									: state.cart_items!.items.items.length + 1,
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

								  return index >= state.cart_items!.items.items.length
									  ?  UserCartItemsListBottomLoader()
									  : state.cart_items!.viewItem (state.cart_items!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.cart_items!.items.items.length
									: state.cart_items!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.cart_items!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(CartItemsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(CartItemsList());
    }

  }
}




abstract class CartItemsEvent extends Equatable {
const CartItemsEvent();
   @override
    List<Object> get props => [];
}

class CartItemsList extends CartItemsEvent {
  @override
  String toString() => 'CartItemsList';
}

class CartItemsListingRefresh extends CartItemsEvent {
  @override
  String toString() => 'CartItemsListingRefresh';
}

class CartItemsListingChangeSearch extends CartItemsEvent {
  @override
  String toString() => 'CartItemsChangeSearch';
}


abstract class CartItemsState extends Equatable {
  const CartItemsState();
   @override
    List<Object> get props => [];
}

class CartItemsListingUninitialized extends CartItemsState {
  @override
  String toString() => 'CartItemsListingUninitialized';
}

class CartItemsListingError extends CartItemsState {
  @override
  String toString() => 'CartItemsListingError';
}

class CartItemsListingLoaded extends CartItemsState {
  final CartItemsIndexModel? cart_items;
  final bool? hasReachedMax;
  final int?  page;

  CartItemsListingLoaded({
    this.cart_items,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [cart_items!, hasReachedMax!, page!];
  
  CartItemsListingLoaded copyWith({
    CartItemsIndexModel? cart_items,
    bool? hasReachedMax,
    int? page,
  }) {
    return CartItemsListingLoaded(
      cart_items: cart_items ?? this.cart_items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'CartItemsListingLoaded  CartItemsListing: ${ cart_items!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class CartItemsListing extends Bloc<CartItemsEvent, CartItemsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  CartItemsListing(this.application, this.url, this.isSearch, CartItemsState initialState):
  super(initialState){
     on<CartItemsList>(_CartItemsListEvent);
	 on<CartItemsListingRefresh>(_CartItemsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<CartItemsEvent, CartItemsState>> transformEvents(
      Stream<CartItemsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<CartItemsEvent> transform<CartItemsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<CartItemsEvent, CartItemsState> transition) {
    print(transition);
  }


  void _CartItemsListEvent(CartItemsList event, Emitter<CartItemsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is CartItemsListingUninitialized){
			  if(isSearch){
			     CartItemsIndexModel cart_items = await listingSearchCartItems(1);
				  int deltaPage = cart_items.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (CartItemsListingLoaded(cart_items: cart_items,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  CartItemsIndexModel cart_items = await listingCartItems(1);
				  int deltaPage = cart_items.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (CartItemsListingLoaded(cart_items: cart_items,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is CartItemsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as CartItemsListingLoaded).page! + 1;
				  CartItemsIndexModel cart_items = await listingCartItems(page);
				  if(!cart_items.items.items.isEmpty){
				     (currentState as CartItemsListingLoaded).cart_items!.items.items.addAll(cart_items.items.items);
				  }
				  return emit (cart_items.items.items.isEmpty
					  ? (currentState as CartItemsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : CartItemsListingLoaded(  cart_items:  (currentState as CartItemsListingLoaded).cart_items ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as CartItemsListingLoaded).page! + 1;
				  CartItemsIndexModel cart_items = await listingCartItems(page);
				  return emit ( cart_items.items.items.isEmpty
					  ? (currentState as CartItemsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : CartItemsListingLoaded(  cart_items:  cart_items ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( CartItemsListingError());
      }
    }
  }

  void _CartItemsListingRefreshEvent(CartItemsListingRefresh event, Emitter<CartItemsState> emit)async{
  final currentState = state;
    try {
        if (currentState is CartItemsListingUninitialized) {
		   if(isSearch){
		      CartItemsIndexModel cart_items = await listingSearchCartItems(1);
              return emit (CartItemsListingLoaded( cart_items: cart_items,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     CartItemsIndexModel cart_items = await listingCartItems(1);
             return emit (CartItemsListingLoaded( cart_items: cart_items,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is CartItemsListingLoaded) {
		  if(isSearch){
		     CartItemsIndexModel cart_items = await listingSearchRefreshCartItems();
              return emit ( cart_items.items.items.isEmpty
              ? (currentState as CartItemsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CartItemsListingLoaded(  cart_items: cart_items ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      CartItemsIndexModel cart_items = await listingRefreshCartItems();
              return emit ( cart_items.items.items.isEmpty
              ? (currentState as CartItemsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CartItemsListingLoaded(  cart_items: cart_items ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (CartItemsListingError());
      }
  }

  @override
  get initialState => CartItemsListingUninitialized();

  @override

  Stream<CartItemsState> mapEventToState(CartItemsEvent event) async* {
    final currentState = state;
    if (event is CartItemsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is CartItemsListingUninitialized){
			  if(isSearch){
			     CartItemsIndexModel cart_items = await listingSearchCartItems(1);
				  int deltaPage = cart_items.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield CartItemsListingLoaded(cart_items: cart_items,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  CartItemsIndexModel cart_items = await listingCartItems(1);
				  int deltaPage = cart_items.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield CartItemsListingLoaded(cart_items: cart_items,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is CartItemsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as CartItemsListingLoaded).page! + 1;
				  CartItemsIndexModel cart_items = await listingCartItems(page);
				  if(!cart_items.items.items.isEmpty){
				     (currentState as CartItemsListingLoaded).cart_items!.items.items.addAll(cart_items.items.items);
				  }
				  yield cart_items.items.items.isEmpty
					  ? (currentState as CartItemsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : CartItemsListingLoaded(  cart_items:  (currentState as CartItemsListingLoaded).cart_items ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as CartItemsListingLoaded).page! + 1;
				  CartItemsIndexModel cart_items = await listingCartItems(page);
				  yield cart_items.items.items.isEmpty
					  ? (currentState as CartItemsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : CartItemsListingLoaded(  cart_items:  cart_items ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield CartItemsListingError();
      }
    } else if (event is CartItemsListingRefresh){
      try {
        if (currentState is CartItemsListingUninitialized) {
		   if(isSearch){
		      CartItemsIndexModel cart_items = await listingSearchCartItems(1);
              yield CartItemsListingLoaded( cart_items: cart_items,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     CartItemsIndexModel cart_items = await listingCartItems(1);
             yield CartItemsListingLoaded( cart_items: cart_items,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is CartItemsListingLoaded) {
		  if(isSearch){
		     CartItemsIndexModel cart_items = await listingSearchRefreshCartItems();
              yield cart_items.items.items.isEmpty
              ? (currentState as CartItemsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CartItemsListingLoaded(  cart_items: cart_items ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      CartItemsIndexModel cart_items = await listingRefreshCartItems();
              yield cart_items.items.items.isEmpty
              ? (currentState as CartItemsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CartItemsListingLoaded(  cart_items: cart_items ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield CartItemsListingError();
      }

    }
  }



  bool hasReachedMax(CartItemsState state) =>
      state is CartItemsListingLoaded && state.hasReachedMax!;


  Future<CartItemsIndexModel> listingCartItems(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = CartItemsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCartItemsListSearch(dt ,'',page);
	
	return data;
  }

  Future<CartItemsIndexModel> listingRefreshCartItems() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = CartItemsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCartItemsListSearch(dt ,'',page);
	
	return data;
  }

  Future<CartItemsIndexModel> listingSearchCartItems(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = CartItemsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCartItemsListSearch(dt ,'',page);	
	return data;
  }

  Future<CartItemsIndexModel> listingSearchRefreshCartItems() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = CartItemsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCartItemsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<CartItemsIndexModel> _loadAndSaveCartItemsListSearch(CartItemsIndexModel list, String searchKey, int page) async{

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


class  UserCartItemsListBottomLoader extends StatelessWidget {
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








  

















  

