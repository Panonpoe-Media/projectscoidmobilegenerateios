
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



class ProductReviewsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ProductReviewsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ProductReviewsIndexBaseState createState() => ProductReviewsIndexBaseState();
}

class  ProductReviewsIndexBaseState extends State<ProductReviewsIndexBase>{
  String title = 'ProductReviews'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  ProductReviewsListing? listing;

  ProductReviewsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String order_item_id = 'order_item_id';
	 order_item_id = order_item_id.replaceAll('_id','');
     getPath = widget.url! + order_item_id + 'page=%s';
	listing = new ProductReviewsListing(AppProvider.getApplication(context), getPath, false, ProductReviewsListingUninitialized());
    listing!.add(ProductReviewsList());
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
    return BlocBuilder<ProductReviewsListing, ProductReviewsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is ProductReviewsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is ProductReviewsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is ProductReviewsListingLoaded) {
          if (state.product_reviews!.items.items.isEmpty) {
		  if (state.product_reviews!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.product_reviews!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.product_reviews!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.product_reviews!.items.items.length
									  ?  UserProductReviewsListBottomLoader()
									  : state.product_reviews!.viewItem (state.product_reviews!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.product_reviews!.items.items.length
									: state.product_reviews!.items.items.length + 1,
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

								  return index >= state.product_reviews!.items.items.length
									  ?  UserProductReviewsListBottomLoader()
									  : state.product_reviews!.viewItem (state.product_reviews!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.product_reviews!.items.items.length
									: state.product_reviews!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.product_reviews!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(ProductReviewsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ProductReviewsList());
    }

  }
}




abstract class ProductReviewsEvent extends Equatable {
const ProductReviewsEvent();
   @override
    List<Object> get props => [];
}

class ProductReviewsList extends ProductReviewsEvent {
  @override
  String toString() => 'ProductReviewsList';
}

class ProductReviewsListingRefresh extends ProductReviewsEvent {
  @override
  String toString() => 'ProductReviewsListingRefresh';
}

class ProductReviewsListingChangeSearch extends ProductReviewsEvent {
  @override
  String toString() => 'ProductReviewsChangeSearch';
}


abstract class ProductReviewsState extends Equatable {
  const ProductReviewsState();
   @override
    List<Object> get props => [];
}

class ProductReviewsListingUninitialized extends ProductReviewsState {
  @override
  String toString() => 'ProductReviewsListingUninitialized';
}

class ProductReviewsListingError extends ProductReviewsState {
  @override
  String toString() => 'ProductReviewsListingError';
}

class ProductReviewsListingLoaded extends ProductReviewsState {
  final ProductReviewsIndexModel? product_reviews;
  final bool? hasReachedMax;
  final int?  page;

  ProductReviewsListingLoaded({
    this.product_reviews,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [product_reviews!, hasReachedMax!, page!];
  
  ProductReviewsListingLoaded copyWith({
    ProductReviewsIndexModel? product_reviews,
    bool? hasReachedMax,
    int? page,
  }) {
    return ProductReviewsListingLoaded(
      product_reviews: product_reviews ?? this.product_reviews,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ProductReviewsListingLoaded  ProductReviewsListing: ${ product_reviews!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ProductReviewsListing extends Bloc<ProductReviewsEvent, ProductReviewsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ProductReviewsListing(this.application, this.url, this.isSearch, ProductReviewsState initialState):
  super(initialState){
     on<ProductReviewsList>(_ProductReviewsListEvent);
	 on<ProductReviewsListingRefresh>(_ProductReviewsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ProductReviewsEvent, ProductReviewsState>> transformEvents(
      Stream<ProductReviewsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<ProductReviewsEvent> transform<ProductReviewsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ProductReviewsEvent, ProductReviewsState> transition) {
    print(transition);
  }


  void _ProductReviewsListEvent(ProductReviewsList event, Emitter<ProductReviewsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is ProductReviewsListingUninitialized){
			  if(isSearch){
			     ProductReviewsIndexModel product_reviews = await listingSearchProductReviews(1);
				  int deltaPage = product_reviews.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (ProductReviewsListingLoaded(product_reviews: product_reviews,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  ProductReviewsIndexModel product_reviews = await listingProductReviews(1);
				  int deltaPage = product_reviews.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (ProductReviewsListingLoaded(product_reviews: product_reviews,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ProductReviewsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ProductReviewsListingLoaded).page! + 1;
				  ProductReviewsIndexModel product_reviews = await listingProductReviews(page);
				  if(!product_reviews.items.items.isEmpty){
				     (currentState as ProductReviewsListingLoaded).product_reviews!.items.items.addAll(product_reviews.items.items);
				  }
				  return emit (product_reviews.items.items.isEmpty
					  ? (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ProductReviewsListingLoaded(  product_reviews:  (currentState as ProductReviewsListingLoaded).product_reviews ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as ProductReviewsListingLoaded).page! + 1;
				  ProductReviewsIndexModel product_reviews = await listingProductReviews(page);
				  return emit ( product_reviews.items.items.isEmpty
					  ? (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ProductReviewsListingLoaded(  product_reviews:  product_reviews ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( ProductReviewsListingError());
      }
    }
  }

  void _ProductReviewsListingRefreshEvent(ProductReviewsListingRefresh event, Emitter<ProductReviewsState> emit)async{
  final currentState = state;
    try {
        if (currentState is ProductReviewsListingUninitialized) {
		   if(isSearch){
		      ProductReviewsIndexModel product_reviews = await listingSearchProductReviews(1);
              return emit (ProductReviewsListingLoaded( product_reviews: product_reviews,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     ProductReviewsIndexModel product_reviews = await listingProductReviews(1);
             return emit (ProductReviewsListingLoaded( product_reviews: product_reviews,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is ProductReviewsListingLoaded) {
		  if(isSearch){
		     ProductReviewsIndexModel product_reviews = await listingSearchRefreshProductReviews();
              return emit ( product_reviews.items.items.isEmpty
              ? (currentState as ProductReviewsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductReviewsListingLoaded(  product_reviews: product_reviews ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      ProductReviewsIndexModel product_reviews = await listingRefreshProductReviews();
              return emit ( product_reviews.items.items.isEmpty
              ? (currentState as ProductReviewsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductReviewsListingLoaded(  product_reviews: product_reviews ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ProductReviewsListingError());
      }
  }

  @override
  get initialState => ProductReviewsListingUninitialized();

  @override

  Stream<ProductReviewsState> mapEventToState(ProductReviewsEvent event) async* {
    final currentState = state;
    if (event is ProductReviewsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ProductReviewsListingUninitialized){
			  if(isSearch){
			     ProductReviewsIndexModel product_reviews = await listingSearchProductReviews(1);
				  int deltaPage = product_reviews.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ProductReviewsListingLoaded(product_reviews: product_reviews,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ProductReviewsIndexModel product_reviews = await listingProductReviews(1);
				  int deltaPage = product_reviews.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ProductReviewsListingLoaded(product_reviews: product_reviews,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ProductReviewsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ProductReviewsListingLoaded).page! + 1;
				  ProductReviewsIndexModel product_reviews = await listingProductReviews(page);
				  if(!product_reviews.items.items.isEmpty){
				     (currentState as ProductReviewsListingLoaded).product_reviews!.items.items.addAll(product_reviews.items.items);
				  }
				  yield product_reviews.items.items.isEmpty
					  ? (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ProductReviewsListingLoaded(  product_reviews:  (currentState as ProductReviewsListingLoaded).product_reviews ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as ProductReviewsListingLoaded).page! + 1;
				  ProductReviewsIndexModel product_reviews = await listingProductReviews(page);
				  yield product_reviews.items.items.isEmpty
					  ? (currentState as ProductReviewsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ProductReviewsListingLoaded(  product_reviews:  product_reviews ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield ProductReviewsListingError();
      }
    } else if (event is ProductReviewsListingRefresh){
      try {
        if (currentState is ProductReviewsListingUninitialized) {
		   if(isSearch){
		      ProductReviewsIndexModel product_reviews = await listingSearchProductReviews(1);
              yield ProductReviewsListingLoaded( product_reviews: product_reviews,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ProductReviewsIndexModel product_reviews = await listingProductReviews(1);
             yield ProductReviewsListingLoaded( product_reviews: product_reviews,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ProductReviewsListingLoaded) {
		  if(isSearch){
		     ProductReviewsIndexModel product_reviews = await listingSearchRefreshProductReviews();
              yield product_reviews.items.items.isEmpty
              ? (currentState as ProductReviewsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductReviewsListingLoaded(  product_reviews: product_reviews ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ProductReviewsIndexModel product_reviews = await listingRefreshProductReviews();
              yield product_reviews.items.items.isEmpty
              ? (currentState as ProductReviewsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductReviewsListingLoaded(  product_reviews: product_reviews ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ProductReviewsListingError();
      }

    }
  }



  bool hasReachedMax(ProductReviewsState state) =>
      state is ProductReviewsListingLoaded && state.hasReachedMax!;


  Future<ProductReviewsIndexModel> listingProductReviews(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ProductReviewsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductReviewsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ProductReviewsIndexModel> listingRefreshProductReviews() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ProductReviewsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductReviewsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ProductReviewsIndexModel> listingSearchProductReviews(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ProductReviewsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductReviewsListSearch(dt ,'',page);	
	return data;
  }

  Future<ProductReviewsIndexModel> listingSearchRefreshProductReviews() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ProductReviewsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductReviewsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ProductReviewsIndexModel> _loadAndSaveProductReviewsListSearch(ProductReviewsIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.order_item_id;
    }
    return list;
 }


class  UserProductReviewsListBottomLoader extends StatelessWidget {
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








  

















  

