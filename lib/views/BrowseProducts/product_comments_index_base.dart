
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



class ProductCommentsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ProductCommentsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ProductCommentsIndexBaseState createState() => ProductCommentsIndexBaseState();
}

class  ProductCommentsIndexBaseState extends State<ProductCommentsIndexBase>{
  String title = 'ProductComments'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  ProductCommentsListing? listing;

  ProductCommentsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String product_post_id = 'product_post_id';
	 product_post_id = product_post_id.replaceAll('_id','');
     getPath = widget.url! + product_post_id + 'page=%s';
	listing = new ProductCommentsListing(AppProvider.getApplication(context), getPath, false, ProductCommentsListingUninitialized());
    listing!.add(ProductCommentsList());
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
    return BlocBuilder<ProductCommentsListing, ProductCommentsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is ProductCommentsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is ProductCommentsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is ProductCommentsListingLoaded) {
          if (state.product_comments!.items.items.isEmpty) {
		  if (state.product_comments!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.product_comments!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.product_comments!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.product_comments!.items.items.length
									  ?  UserProductCommentsListBottomLoader()
									  : state.product_comments!.viewItem (state.product_comments!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.product_comments!.items.items.length
									: state.product_comments!.items.items.length + 1,
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

								  return index >= state.product_comments!.items.items.length
									  ?  UserProductCommentsListBottomLoader()
									  : state.product_comments!.viewItem (state.product_comments!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.product_comments!.items.items.length
									: state.product_comments!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.product_comments!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(ProductCommentsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ProductCommentsList());
    }

  }
}




abstract class ProductCommentsEvent extends Equatable {
const ProductCommentsEvent();
   @override
    List<Object> get props => [];
}

class ProductCommentsList extends ProductCommentsEvent {
  @override
  String toString() => 'ProductCommentsList';
}

class ProductCommentsListingRefresh extends ProductCommentsEvent {
  @override
  String toString() => 'ProductCommentsListingRefresh';
}

class ProductCommentsListingChangeSearch extends ProductCommentsEvent {
  @override
  String toString() => 'ProductCommentsChangeSearch';
}


abstract class ProductCommentsState extends Equatable {
  const ProductCommentsState();
   @override
    List<Object> get props => [];
}

class ProductCommentsListingUninitialized extends ProductCommentsState {
  @override
  String toString() => 'ProductCommentsListingUninitialized';
}

class ProductCommentsListingError extends ProductCommentsState {
  @override
  String toString() => 'ProductCommentsListingError';
}

class ProductCommentsListingLoaded extends ProductCommentsState {
  final ProductCommentsIndexModel? product_comments;
  final bool? hasReachedMax;
  final int?  page;

  ProductCommentsListingLoaded({
    this.product_comments,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [product_comments!, hasReachedMax!, page!];
  
  ProductCommentsListingLoaded copyWith({
    ProductCommentsIndexModel? product_comments,
    bool? hasReachedMax,
    int? page,
  }) {
    return ProductCommentsListingLoaded(
      product_comments: product_comments ?? this.product_comments,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ProductCommentsListingLoaded  ProductCommentsListing: ${ product_comments!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ProductCommentsListing extends Bloc<ProductCommentsEvent, ProductCommentsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ProductCommentsListing(this.application, this.url, this.isSearch, ProductCommentsState initialState):
  super(initialState){
     on<ProductCommentsList>(_ProductCommentsListEvent);
	 on<ProductCommentsListingRefresh>(_ProductCommentsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ProductCommentsEvent, ProductCommentsState>> transformEvents(
      Stream<ProductCommentsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<ProductCommentsEvent> transform<ProductCommentsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ProductCommentsEvent, ProductCommentsState> transition) {
    print(transition);
  }


  void _ProductCommentsListEvent(ProductCommentsList event, Emitter<ProductCommentsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is ProductCommentsListingUninitialized){
			  if(isSearch){
			     ProductCommentsIndexModel product_comments = await listingSearchProductComments(1);
				  int deltaPage = product_comments.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (ProductCommentsListingLoaded(product_comments: product_comments,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  ProductCommentsIndexModel product_comments = await listingProductComments(1);
				  int deltaPage = product_comments.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (ProductCommentsListingLoaded(product_comments: product_comments,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ProductCommentsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ProductCommentsListingLoaded).page! + 1;
				  ProductCommentsIndexModel product_comments = await listingProductComments(page);
				  if(!product_comments.items.items.isEmpty){
				     (currentState as ProductCommentsListingLoaded).product_comments!.items.items.addAll(product_comments.items.items);
				  }
				  return emit (product_comments.items.items.isEmpty
					  ? (currentState as ProductCommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ProductCommentsListingLoaded(  product_comments:  (currentState as ProductCommentsListingLoaded).product_comments ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as ProductCommentsListingLoaded).page! + 1;
				  ProductCommentsIndexModel product_comments = await listingProductComments(page);
				  return emit ( product_comments.items.items.isEmpty
					  ? (currentState as ProductCommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ProductCommentsListingLoaded(  product_comments:  product_comments ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( ProductCommentsListingError());
      }
    }
  }

  void _ProductCommentsListingRefreshEvent(ProductCommentsListingRefresh event, Emitter<ProductCommentsState> emit)async{
  final currentState = state;
    try {
        if (currentState is ProductCommentsListingUninitialized) {
		   if(isSearch){
		      ProductCommentsIndexModel product_comments = await listingSearchProductComments(1);
              return emit (ProductCommentsListingLoaded( product_comments: product_comments,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     ProductCommentsIndexModel product_comments = await listingProductComments(1);
             return emit (ProductCommentsListingLoaded( product_comments: product_comments,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is ProductCommentsListingLoaded) {
		  if(isSearch){
		     ProductCommentsIndexModel product_comments = await listingSearchRefreshProductComments();
              return emit ( product_comments.items.items.isEmpty
              ? (currentState as ProductCommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductCommentsListingLoaded(  product_comments: product_comments ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      ProductCommentsIndexModel product_comments = await listingRefreshProductComments();
              return emit ( product_comments.items.items.isEmpty
              ? (currentState as ProductCommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductCommentsListingLoaded(  product_comments: product_comments ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ProductCommentsListingError());
      }
  }

  @override
  get initialState => ProductCommentsListingUninitialized();

  @override

  Stream<ProductCommentsState> mapEventToState(ProductCommentsEvent event) async* {
    final currentState = state;
    if (event is ProductCommentsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ProductCommentsListingUninitialized){
			  if(isSearch){
			     ProductCommentsIndexModel product_comments = await listingSearchProductComments(1);
				  int deltaPage = product_comments.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ProductCommentsListingLoaded(product_comments: product_comments,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ProductCommentsIndexModel product_comments = await listingProductComments(1);
				  int deltaPage = product_comments.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ProductCommentsListingLoaded(product_comments: product_comments,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ProductCommentsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ProductCommentsListingLoaded).page! + 1;
				  ProductCommentsIndexModel product_comments = await listingProductComments(page);
				  if(!product_comments.items.items.isEmpty){
				     (currentState as ProductCommentsListingLoaded).product_comments!.items.items.addAll(product_comments.items.items);
				  }
				  yield product_comments.items.items.isEmpty
					  ? (currentState as ProductCommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ProductCommentsListingLoaded(  product_comments:  (currentState as ProductCommentsListingLoaded).product_comments ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as ProductCommentsListingLoaded).page! + 1;
				  ProductCommentsIndexModel product_comments = await listingProductComments(page);
				  yield product_comments.items.items.isEmpty
					  ? (currentState as ProductCommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ProductCommentsListingLoaded(  product_comments:  product_comments ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield ProductCommentsListingError();
      }
    } else if (event is ProductCommentsListingRefresh){
      try {
        if (currentState is ProductCommentsListingUninitialized) {
		   if(isSearch){
		      ProductCommentsIndexModel product_comments = await listingSearchProductComments(1);
              yield ProductCommentsListingLoaded( product_comments: product_comments,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ProductCommentsIndexModel product_comments = await listingProductComments(1);
             yield ProductCommentsListingLoaded( product_comments: product_comments,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ProductCommentsListingLoaded) {
		  if(isSearch){
		     ProductCommentsIndexModel product_comments = await listingSearchRefreshProductComments();
              yield product_comments.items.items.isEmpty
              ? (currentState as ProductCommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductCommentsListingLoaded(  product_comments: product_comments ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ProductCommentsIndexModel product_comments = await listingRefreshProductComments();
              yield product_comments.items.items.isEmpty
              ? (currentState as ProductCommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProductCommentsListingLoaded(  product_comments: product_comments ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ProductCommentsListingError();
      }

    }
  }



  bool hasReachedMax(ProductCommentsState state) =>
      state is ProductCommentsListingLoaded && state.hasReachedMax!;


  Future<ProductCommentsIndexModel> listingProductComments(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ProductCommentsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductCommentsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ProductCommentsIndexModel> listingRefreshProductComments() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ProductCommentsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductCommentsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ProductCommentsIndexModel> listingSearchProductComments(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ProductCommentsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductCommentsListSearch(dt ,'',page);	
	return data;
  }

  Future<ProductCommentsIndexModel> listingSearchRefreshProductComments() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ProductCommentsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveProductCommentsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ProductCommentsIndexModel> _loadAndSaveProductCommentsListSearch(ProductCommentsIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.product_post_id;
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
    }
    return list;
 }


class  UserProductCommentsListBottomLoader extends StatelessWidget {
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








  

















  

