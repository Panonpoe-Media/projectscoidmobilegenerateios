
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';
//////
class CartController {

  ProjectscoidApplication application;
  CartListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  CartController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new CartListing(this.application, this.url!, this.isSearch, CartListingUninitialized());}
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

  Future editCart()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editCart;
    editCart = await apiRepProvider?.getCartEdit(url!, id!, title!);
    return editCart;
  }
  
    Future viewCart()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewCart;
    viewCart = await apiRepProvider?.getCartView(url!, id!, title!);
    return viewCart;
  }

  Future postCart() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCart;
    postCart = await apiRepProvider?.sendCartPost(url!,formData);
    return postCart;
  }
  
    Future postCartWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCart;
    postCart = await apiRepProvider?.sendCartPostWithID(url!,formData, id!, title!);
    return postCart;
  }

  
  
    Future editEmptyCartCart()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editEmptyCart;
    editEmptyCart = await apiRepProvider?.getEmptyCartCartEdit(url!, id!, title!);
    return editEmptyCart;
  }

  Future postEmptyCartCart() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postEmptyCart;
    postEmptyCart = await apiRepProvider?.sendEmptyCartCartPost(url!,formData);
    return postEmptyCart;
  }
  
    Future postEmptyCartCartWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postEmptyCart;
    postEmptyCart = await apiRepProvider?.sendEmptyCartCartPostWithID(url!,formData, id!, title!);
    return postEmptyCart;
  }
  
      Future getEmptyCartCart(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getEmptyCart;
        getEmptyCart = await apiRepProvider?.getEmptyCartCart(url!, id!, title!, spKey!);
	    return getEmptyCart ;
	 }
   Future<EmptyCartCartModel> loadEmptyCartCart() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadEmptyCart;
        loadEmptyCart = await apiRepProvider?.loadEmptyCartCart('');
	    return loadEmptyCart ;  
   }
  
   Future saveEmptyCartCart(EmptyCartCartModel? cart, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateEmptyCartCart(cart!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllEmptyCartCart(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllEmptyCartCart(spKey!);   
   }
  
  
  
    Future editApplyCouponCart()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editApplyCoupon;
    editApplyCoupon = await apiRepProvider?.getApplyCouponCartEdit(url!, id!, title!);
    return editApplyCoupon;
  }

  Future postApplyCouponCart() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postApplyCoupon;
    postApplyCoupon = await apiRepProvider?.sendApplyCouponCartPost(url!,formData);
    return postApplyCoupon;
  }
  
    Future postApplyCouponCartWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postApplyCoupon;
    postApplyCoupon = await apiRepProvider?.sendApplyCouponCartPostWithID(url!,formData, id!, title!);
    return postApplyCoupon;
  }
  
      Future getApplyCouponCart(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getApplyCoupon;
        getApplyCoupon = await apiRepProvider?.getApplyCouponCart(url!, id!, title!, spKey!);
	    return getApplyCoupon ;
	 }
   Future<ApplyCouponCartModel> loadApplyCouponCart() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadApplyCoupon;
        loadApplyCoupon = await apiRepProvider?.loadApplyCouponCart('');
	    return loadApplyCoupon ;  
   }
  
   Future saveApplyCouponCart(ApplyCouponCartModel? cart, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateApplyCouponCart(cart!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllApplyCouponCart(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllApplyCouponCart(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class CartListing extends Bloc<CartEvent, CartState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  CartListing(this.application, this.url, this.isSearch, CartState initialState):
  super(initialState){
     on<CartList>(_CartListEvent);
	
	  on<CartListingRefresh>(_CartListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<CartEvent, CartState>> transformEvents(
      Stream<CartEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<CartEvent> transform<CartEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<CartEvent, CartState> transition) {
    print(transition);
  }

  @override
  get initialState => CartListingUninitialized();

void _CartListEvent(CartList event, Emitter<CartState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is CartListingUninitialized){
			  if(isSearch!){
			     CartListingModel? cart = await listingSearchCart(1);
				  int deltaPage;
				  if(cart?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  cart?.items.items.length ~/ (cart?.tools.paging.total_rows/cart?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( cart?.items.items.isEmpty
					  ? CartListingLoaded(cart: cart!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : CartListingLoaded(cart: cart!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  CartListingModel? cart = await listingCart(1);
				   int deltaPage;
				  if(cart?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  cart?.items.items.length ~/ (cart?.tools.paging.total_rows/cart?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( cart?.items.items.isEmpty
					  ? CartListingLoaded(cart: cart!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :CartListingLoaded(cart: cart!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is CartListingLoaded) {
          //page++;
		    final oldpage = (currentState as CartListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as CartListingLoaded).page! + 1;
			 if ((currentState as CartListingLoaded).cart?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as CartListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      CartListingModel? cart = await listingSearchCart(page);
						  if(!cart?.items.items.isEmpty){
							 (currentState as CartListingLoaded).cart?.items.items.addAll(cart?.items.items);
						  }
						  return emit ( cart?.items.items.isEmpty
							  ? (currentState as CartListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : CartListingLoaded(  cart:  (currentState as CartListingLoaded).cart! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as CartListingLoaded).page! + 1;
							  if ((currentState as CartListingLoaded).cart?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as CartListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  CartListingModel? cart = await listingCart(page);
							  return emit ( cart?.items.items.isEmpty
								  ? (currentState as CartListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : CartListingLoaded(  cart:  cart! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( CartListingError());
        
      }
    }
  }

void _CartListingRefreshEvent(CartListingRefresh event, Emitter<CartState> emit)async{
  final currentState = state;
   try {
        if (currentState is CartListingUninitialized) {
		   if(isSearch!){

			    CartListingModel? cart = await listingSearchCart(1);
              return emit (  CartListingLoaded( cart: cart!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    CartListingModel? cart = await listingCart(1);
				   return emit (  CartListingLoaded( cart: cart!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is CartListingLoaded) {
		  if(isSearch!){
		     CartListingModel? cart = await listingSearchRefreshCart();
              return emit (  cart?.items.items.isEmpty
              ? (currentState as CartListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CartListingLoaded(  cart: cart! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  CartListingModel? cart = await listingCart(1);
				  int deltaPage = cart?.items.items.length ~/ (cart?.tools.paging.total_rows/cart?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  cart?.items.items.isEmpty
					  ? (currentState as CartListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CartListingLoaded(cart: cart!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  CartListingError());
      }
  }

  @override

  Stream<CartState> mapEventToState(CartEvent event) async* {
    final currentState = state;
    if (event is CartList && !hasReachedMax(currentState)) {
      try {
        if (currentState is CartListingUninitialized){
			  if(isSearch!){
			     CartListingModel? cart = await listingSearchCart(1);
				  int deltaPage;
				  if(cart?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  cart?.items.items.length ~/ (cart?.tools.paging.total_rows/cart?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield cart?.items.items.isEmpty
					  ? CartListingLoaded(cart: cart!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : CartListingLoaded(cart: cart!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  CartListingModel? cart = await listingCart(1);
				   int deltaPage;
				  if(cart?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  cart?.items.items.length ~/ (cart?.tools.paging.total_rows/cart?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield cart?.items.items.isEmpty
					  ? CartListingLoaded(cart: cart!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :CartListingLoaded(cart: cart!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is CartListingLoaded) {
          //page++;
		    final oldpage = (currentState as CartListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as CartListingLoaded).page! + 1;
			 if ((currentState as CartListingLoaded).cart?.tools.paging.total_pages == oldpage) {
					yield (currentState as CartListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      CartListingModel? cart = await listingSearchCart(page);
						  if(!cart?.items.items.isEmpty){
							 (currentState as CartListingLoaded).cart?.items.items.addAll(cart?.items.items);
						  }
						  yield cart?.items.items.isEmpty
							  ? (currentState as CartListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : CartListingLoaded(  cart:  (currentState as CartListingLoaded).cart! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as CartListingLoaded).page! + 1;
							  if ((currentState as CartListingLoaded).cart?.tools.paging.total_pages == oldpage) {
						yield (currentState as CartListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  CartListingModel? cart = await listingCart(page);
							  yield cart?.items.items.isEmpty
								  ? (currentState as CartListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : CartListingLoaded(  cart:  cart! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield CartListingError();
        
      }
    } else if (event is CartListingRefresh){
      try {
        if (currentState is CartListingUninitialized) {
		   if(isSearch!){

			    CartListingModel? cart = await listingSearchCart(1);
              yield CartListingLoaded( cart: cart!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    CartListingModel? cart = await listingCart(1);
				   yield CartListingLoaded( cart: cart!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is CartListingLoaded) {
		  if(isSearch!){
		     CartListingModel? cart = await listingSearchRefreshCart();
              yield cart?.items.items.isEmpty
              ? (currentState as CartListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CartListingLoaded(  cart: cart! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  CartListingModel? cart = await listingCart(1);
				  int deltaPage = cart?.items.items.length ~/ (cart?.tools.paging.total_rows/cart?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield cart?.items.items.isEmpty
					  ? (currentState as CartListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CartListingLoaded(cart: cart!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield CartListingError();
      }

    }
  }

  bool hasReachedMax(CartState state) =>
      state is CartListingLoaded && state.hasReachedMax!;

  Future<CartListingModel?> listingCart(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getCartList(url!, page!);
  }

  Future<CartListingModel?> listingRefreshCart() async {
    CartListingModel? cart;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllCartList();
    cart  = await apiRepProvider?.getCartList(url!, 1);
    return cart;
  }
  
  

  Future<CartListingModel?> listingSearchCart(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getCartListSearch(url!, page!);
  }

  Future<CartListingModel?> listingSearchRefreshCart() async {
    CartListingModel? cart ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    cart  = await apiRepProvider?.getCartListSearch(url!, 1);
    return cart;
  }
}


