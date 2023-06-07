
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';
//////
class BrowseProductsController {

  ProjectscoidApplication application;
  BrowseProductsListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  BrowseProductsController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new BrowseProductsListing(this.application, this.url!, this.isSearch, BrowseProductsListingUninitialized());}
      break;
      case 1 : {}
      break;
      default:{}
    }
  }


 Future<String?> downloadFile1( ProgressDlCallback showProgress) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.downloadFile1(url!, title!, showProgress!);
  }
  
  Future downloadFile() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await apiRepProvider?.downloadFile(url!, title!);
  }

  Future editBrowseProducts()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editBrowseProducts;
    editBrowseProducts = await apiRepProvider?.getBrowseProductsEdit(url!, id!, title!);
    return editBrowseProducts;
  }
  
    Future viewBrowseProducts()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewBrowseProducts;
    viewBrowseProducts = await apiRepProvider?.getBrowseProductsView(url!, id!, title!);
    return viewBrowseProducts;
  }

  Future postBrowseProducts() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBrowseProducts;
    postBrowseProducts = await apiRepProvider?.sendBrowseProductsPost(url!,formData);
    return postBrowseProducts;
  }
  
    Future postBrowseProductsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBrowseProducts;
    postBrowseProducts = await apiRepProvider?.sendBrowseProductsPostWithID(url!,formData, id!, title!);
    return postBrowseProducts;
  }

  
  
    Future editAddToCartBrowseProducts()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editAddToCart;
    editAddToCart = await apiRepProvider?.getAddToCartBrowseProductsEdit(url!, id!, title!);
    return editAddToCart;
  }

  Future postAddToCartBrowseProducts() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAddToCart;
    postAddToCart = await apiRepProvider?.sendAddToCartBrowseProductsPost(url!,formData);
    return postAddToCart;
  }
  
    Future postAddToCartBrowseProductsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAddToCart;
    postAddToCart = await apiRepProvider?.sendAddToCartBrowseProductsPostWithID(url!,formData, id!, title!);
    return postAddToCart;
  }
  
      Future getAddToCartBrowseProducts(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getAddToCart;
        getAddToCart = await apiRepProvider?.getAddToCartBrowseProducts(url!, id!, title!, spKey!);
	    return getAddToCart ;
	 }
   Future<AddToCartBrowseProductsModel> loadAddToCartBrowseProducts() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadAddToCart;
        loadAddToCart = await apiRepProvider?.loadAddToCartBrowseProducts('');
	    return loadAddToCart ;  
   }
  
   Future saveAddToCartBrowseProducts(AddToCartBrowseProductsModel? browse_products, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateAddToCartBrowseProducts(browse_products!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllAddToCartBrowseProducts(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllAddToCartBrowseProducts(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class BrowseProductsListing extends Bloc<BrowseProductsEvent, BrowseProductsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  BrowseProductsListing(this.application, this.url, this.isSearch, BrowseProductsState initialState):
  super(initialState){
     on<BrowseProductsList>(_BrowseProductsListEvent);
	
	  on<BrowseProductsListingRefresh>(_BrowseProductsListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<BrowseProductsEvent, BrowseProductsState>> transformEvents(
      Stream<BrowseProductsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<BrowseProductsEvent> transform<BrowseProductsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<BrowseProductsEvent, BrowseProductsState> transition) {
    print(transition);
  }

  @override
  get initialState => BrowseProductsListingUninitialized();

void _BrowseProductsListEvent(BrowseProductsList event, Emitter<BrowseProductsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is BrowseProductsListingUninitialized){
			  if(isSearch!){
			     BrowseProductsListingModel? browse_products = await listingSearchBrowseProducts(1);
				  int deltaPage;
				  if(browse_products?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_products?.items.items.length ~/ (browse_products?.tools.paging.total_rows/browse_products?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( browse_products?.items.items.isEmpty
					  ? BrowseProductsListingLoaded(browse_products: browse_products!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : BrowseProductsListingLoaded(browse_products: browse_products!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  BrowseProductsListingModel? browse_products = await listingBrowseProducts(1);
				   int deltaPage;
				  if(browse_products?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_products?.items.items.length ~/ (browse_products?.tools.paging.total_rows/browse_products?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( browse_products?.items.items.isEmpty
					  ? BrowseProductsListingLoaded(browse_products: browse_products!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseProductsListingLoaded(browse_products: browse_products!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is BrowseProductsListingLoaded) {
          //page++;
		    final oldpage = (currentState as BrowseProductsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as BrowseProductsListingLoaded).page! + 1;
			 if ((currentState as BrowseProductsListingLoaded).browse_products?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as BrowseProductsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      BrowseProductsListingModel? browse_products = await listingSearchBrowseProducts(page);
						  if(!browse_products?.items.items.isEmpty){
							 (currentState as BrowseProductsListingLoaded).browse_products?.items.items.addAll(browse_products?.items.items);
						  }
						  return emit ( browse_products?.items.items.isEmpty
							  ? (currentState as BrowseProductsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : BrowseProductsListingLoaded(  browse_products:  (currentState as BrowseProductsListingLoaded).browse_products! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as BrowseProductsListingLoaded).page! + 1;
							  if ((currentState as BrowseProductsListingLoaded).browse_products?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as BrowseProductsListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  BrowseProductsListingModel? browse_products = await listingBrowseProducts(page);
							  return emit ( browse_products?.items.items.isEmpty
								  ? (currentState as BrowseProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : BrowseProductsListingLoaded(  browse_products:  browse_products! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( BrowseProductsListingError());
        
      }
    }
  }

void _BrowseProductsListingRefreshEvent(BrowseProductsListingRefresh event, Emitter<BrowseProductsState> emit)async{
  final currentState = state;
   try {
        if (currentState is BrowseProductsListingUninitialized) {
		   if(isSearch!){

			    BrowseProductsListingModel? browse_products = await listingSearchBrowseProducts(1);
              return emit (  BrowseProductsListingLoaded( browse_products: browse_products!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    BrowseProductsListingModel? browse_products = await listingBrowseProducts(1);
				   return emit (  BrowseProductsListingLoaded( browse_products: browse_products!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is BrowseProductsListingLoaded) {
		  if(isSearch!){
		     BrowseProductsListingModel? browse_products = await listingSearchRefreshBrowseProducts();
              return emit (  browse_products?.items.items.isEmpty
              ? (currentState as BrowseProductsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : BrowseProductsListingLoaded(  browse_products: browse_products! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  BrowseProductsListingModel? browse_products = await listingBrowseProducts(1);
				  int deltaPage = browse_products?.items.items.length ~/ (browse_products?.tools.paging.total_rows/browse_products?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  browse_products?.items.items.isEmpty
					  ? (currentState as BrowseProductsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseProductsListingLoaded(browse_products: browse_products!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  BrowseProductsListingError());
      }
  }

  @override

  Stream<BrowseProductsState> mapEventToState(BrowseProductsEvent event) async* {
    final currentState = state;
    if (event is BrowseProductsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is BrowseProductsListingUninitialized){
			  if(isSearch!){
			     BrowseProductsListingModel? browse_products = await listingSearchBrowseProducts(1);
				  int deltaPage;
				  if(browse_products?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_products?.items.items.length ~/ (browse_products?.tools.paging.total_rows/browse_products?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield browse_products?.items.items.isEmpty
					  ? BrowseProductsListingLoaded(browse_products: browse_products!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : BrowseProductsListingLoaded(browse_products: browse_products!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  BrowseProductsListingModel? browse_products = await listingBrowseProducts(1);
				   int deltaPage;
				  if(browse_products?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_products?.items.items.length ~/ (browse_products?.tools.paging.total_rows/browse_products?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield browse_products?.items.items.isEmpty
					  ? BrowseProductsListingLoaded(browse_products: browse_products!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseProductsListingLoaded(browse_products: browse_products!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is BrowseProductsListingLoaded) {
          //page++;
		    final oldpage = (currentState as BrowseProductsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as BrowseProductsListingLoaded).page! + 1;
			 if ((currentState as BrowseProductsListingLoaded).browse_products?.tools.paging.total_pages == oldpage) {
					yield (currentState as BrowseProductsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      BrowseProductsListingModel? browse_products = await listingSearchBrowseProducts(page);
						  if(!browse_products?.items.items.isEmpty){
							 (currentState as BrowseProductsListingLoaded).browse_products?.items.items.addAll(browse_products?.items.items);
						  }
						  yield browse_products?.items.items.isEmpty
							  ? (currentState as BrowseProductsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : BrowseProductsListingLoaded(  browse_products:  (currentState as BrowseProductsListingLoaded).browse_products! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as BrowseProductsListingLoaded).page! + 1;
							  if ((currentState as BrowseProductsListingLoaded).browse_products?.tools.paging.total_pages == oldpage) {
						yield (currentState as BrowseProductsListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  BrowseProductsListingModel? browse_products = await listingBrowseProducts(page);
							  yield browse_products?.items.items.isEmpty
								  ? (currentState as BrowseProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : BrowseProductsListingLoaded(  browse_products:  browse_products! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield BrowseProductsListingError();
        
      }
    } else if (event is BrowseProductsListingRefresh){
      try {
        if (currentState is BrowseProductsListingUninitialized) {
		   if(isSearch!){

			    BrowseProductsListingModel? browse_products = await listingSearchBrowseProducts(1);
              yield BrowseProductsListingLoaded( browse_products: browse_products!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    BrowseProductsListingModel? browse_products = await listingBrowseProducts(1);
				   yield BrowseProductsListingLoaded( browse_products: browse_products!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is BrowseProductsListingLoaded) {
		  if(isSearch!){
		     BrowseProductsListingModel? browse_products = await listingSearchRefreshBrowseProducts();
              yield browse_products?.items.items.isEmpty
              ? (currentState as BrowseProductsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : BrowseProductsListingLoaded(  browse_products: browse_products! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  BrowseProductsListingModel? browse_products = await listingBrowseProducts(1);
				  int deltaPage = browse_products?.items.items.length ~/ (browse_products?.tools.paging.total_rows/browse_products?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield browse_products?.items.items.isEmpty
					  ? (currentState as BrowseProductsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseProductsListingLoaded(browse_products: browse_products!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield BrowseProductsListingError();
      }

    }
  }

  bool hasReachedMax(BrowseProductsState state) =>
      state is BrowseProductsListingLoaded && state.hasReachedMax!;

  Future<BrowseProductsListingModel?> listingBrowseProducts(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getBrowseProductsList(url!, page!);
  }

  Future<BrowseProductsListingModel?> listingRefreshBrowseProducts() async {
    BrowseProductsListingModel? browse_products;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllBrowseProductsList();
    browse_products  = await apiRepProvider?.getBrowseProductsList(url!, 1);
    return browse_products;
  }
  
  

  Future<BrowseProductsListingModel?> listingSearchBrowseProducts(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getBrowseProductsListSearch(url!, page!);
  }

  Future<BrowseProductsListingModel?> listingSearchRefreshBrowseProducts() async {
    BrowseProductsListingModel? browse_products ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    browse_products  = await apiRepProvider?.getBrowseProductsListSearch(url!, 1);
    return browse_products;
  }
}


