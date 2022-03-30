
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



class ProductsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ProductsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ProductsIndexBaseState createState() => ProductsIndexBaseState();
}

class  ProductsIndexBaseState extends State<ProductsIndexBase>{
  String title = 'Products'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  ProductsListing? listing;

  ProductsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String product_id = 'product_id';
	 product_id = product_id.replaceAll('_id','');
     getPath = widget.url! + product_id + 'page=%s';
	listing = new ProductsListing(AppProvider.getApplication(context), getPath, false, ProductsListingUninitialized());
    listing!.add(ProductsList());
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
    return BlocBuilder<ProductsListing, ProductsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is ProductsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is ProductsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is ProductsListingLoaded) {
          if (state.products!.items.items.isEmpty) {
		  if (state.products!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.products!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.products!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.products!.items.items.length
									  ?  PublicProductsListBottomLoader()
									  : state.products!.viewItem (state.products!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.products!.items.items.length
									: state.products!.items.items.length + 1,
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

								  return index >= state.products!.items.items.length
									  ?  PublicProductsListBottomLoader()
									  : state.products!.viewItem (state.products!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.products!.items.items.length
									: state.products!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.products!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(ProductsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ProductsList());
    }

  }
}




abstract class ProductsEvent extends Equatable {
const ProductsEvent();
   @override
    List<Object> get props => [];
}

class ProductsList extends ProductsEvent {
  @override
  String toString() => 'ProductsList';
}

class ProductsListingRefresh extends ProductsEvent {
  @override
  String toString() => 'ProductsListingRefresh';
}

class ProductsListingChangeSearch extends ProductsEvent {
  @override
  String toString() => 'ProductsChangeSearch';
}


abstract class ProductsState extends Equatable {
  const ProductsState();
   @override
    List<Object> get props => [];
}

class ProductsListingUninitialized extends ProductsState {
  @override
  String toString() => 'ProductsListingUninitialized';
}

class ProductsListingError extends ProductsState {
  @override
  String toString() => 'ProductsListingError';
}

class ProductsListingLoaded extends ProductsState {
  final ProductsIndexModel? products;
  final bool? hasReachedMax;
  final int?  page;

  ProductsListingLoaded({
    this.products,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [products!, hasReachedMax!, page!];
  
  ProductsListingLoaded copyWith({
    ProductsIndexModel? products,
    bool? hasReachedMax,
    int? page,
  }) {
    return ProductsListingLoaded(
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ProductsListingLoaded  ProductsListing: ${ products!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ProductsListing extends Bloc<ProductsEvent, ProductsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ProductsListing(this.application, this.url, this.isSearch, ProductsState initialState):
  super(initialState){
     on<ProductsList>(_ProductsListEvent);
	 on<ProductsListingRefresh>(_ProductsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ProductsEvent, ProductsState>> transformEvents(
      Stream<ProductsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<ProductsEvent> transform<ProductsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ProductsEvent, ProductsState> transition) {
    print(transition);
  }


  void _ProductsListEvent(ProductsList event, Emitter<ProductsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is ProductsListingUninitialized){
			  if(isSearch){
			     ProductsIndexModel products = await listingSearchProducts(1);
				  int deltaPage = products.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (ProductsListingLoaded(products: products,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  ProductsIndexModel products = await listingProducts(1);
				  int deltaPage = products.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (ProductsListingLoaded(products: products,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ProductsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ProductsListingLoaded).page! + 1;
				  ProductsIndexModel products = await listingProducts(page);
				  if(!products.items.items.isEmpty){
				     (currentState as ProductsListingLoaded).products!.items.items.addAll(products.items.items);
				  }
				  return emit (products.items.items.isEmpty
					  ? (currentState as ProductsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ProductsListingLoaded(  products:  (currentState as ProductsListingLoaded).products ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as ProductsListingLoaded).page! + 1;
				  ProductsIndexModel products = await listingProducts(page);
				  return emit ( products.items.items.isEmpty
					  ? (currentState as ProductsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ProductsListingLoaded(  products:  products ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( ProductsListingError());
      }
    }
  }

  void _ProductsListingRefreshEvent(ProductsListingRefresh event, Emitter<ProductsState> emit)async{
  final currentState = state;
    try {
        if (currentState is ProductsListingUninitialized) {
		   if(isSearch){
		      ProductsIndexModel products = await listingSearchProducts(1);
              return emit (ProductsListingLoaded( products: products,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     ProductsIndexModel products = await listingProducts(1);
             return emit (ProductsListingLoaded( products: products,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is ProductsListingLoaded) {
		  if(isSearch){
		     ProductsIndexModel products = await listingSearchRefreshProducts();
              return emit ( products.items.items.isEmpty
              ? (currentState as ProductsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductsListingLoaded(  products: products ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      ProductsIndexModel products = await listingRefreshProducts();
              return emit ( products.items.items.isEmpty
              ? (currentState as ProductsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductsListingLoaded(  products: products ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ProductsListingError());
      }
  }

  @override
  get initialState => ProductsListingUninitialized();

  @override

  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    final currentState = state;
    if (event is ProductsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ProductsListingUninitialized){
			  if(isSearch){
			     ProductsIndexModel products = await listingSearchProducts(1);
				  int deltaPage = products.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ProductsListingLoaded(products: products,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ProductsIndexModel products = await listingProducts(1);
				  int deltaPage = products.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ProductsListingLoaded(products: products,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ProductsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ProductsListingLoaded).page! + 1;
				  ProductsIndexModel products = await listingProducts(page);
				  if(!products.items.items.isEmpty){
				     (currentState as ProductsListingLoaded).products!.items.items.addAll(products.items.items);
				  }
				  yield products.items.items.isEmpty
					  ? (currentState as ProductsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ProductsListingLoaded(  products:  (currentState as ProductsListingLoaded).products ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as ProductsListingLoaded).page! + 1;
				  ProductsIndexModel products = await listingProducts(page);
				  yield products.items.items.isEmpty
					  ? (currentState as ProductsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ProductsListingLoaded(  products:  products ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield ProductsListingError();
      }
    } else if (event is ProductsListingRefresh){
      try {
        if (currentState is ProductsListingUninitialized) {
		   if(isSearch){
		      ProductsIndexModel products = await listingSearchProducts(1);
              yield ProductsListingLoaded( products: products,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ProductsIndexModel products = await listingProducts(1);
             yield ProductsListingLoaded( products: products,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ProductsListingLoaded) {
		  if(isSearch){
		     ProductsIndexModel products = await listingSearchRefreshProducts();
              yield products.items.items.isEmpty
              ? (currentState as ProductsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductsListingLoaded(  products: products ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ProductsIndexModel products = await listingRefreshProducts();
              yield products.items.items.isEmpty
              ? (currentState as ProductsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductsListingLoaded(  products: products ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ProductsListingError();
      }

    }
  }



  bool hasReachedMax(ProductsState state) =>
      state is ProductsListingLoaded && state.hasReachedMax!;


  Future<ProductsIndexModel> listingProducts(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ProductsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ProductsIndexModel> listingRefreshProducts() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ProductsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ProductsIndexModel> listingSearchProducts(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ProductsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductsListSearch(dt ,'',page);	
	return data;
  }

  Future<ProductsIndexModel> listingSearchRefreshProducts() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ProductsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ProductsIndexModel> _loadAndSaveProductsListSearch(ProductsIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.product_id;
	  list.items.items[i].item.pht = list.items.items[i].item.logo_url;
	  list.items.items[i].item.ttl = list.items.items[i].item.title;
    }
    return list;
 }


class  PublicProductsListBottomLoader extends StatelessWidget {
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








  

















  

