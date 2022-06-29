
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class CheckoutController {

  ProjectscoidApplication application;
  CheckoutListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  CheckoutController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new CheckoutListing(this.application, this.url!, this.isSearch, CheckoutListingUninitialized());}
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

  Future editCheckout()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editCheckout;
    editCheckout = await apiRepProvider?.getCheckoutEdit(url!, id!, title!);
    return editCheckout;
  }
  
    Future viewCheckout()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewCheckout;
    viewCheckout = await apiRepProvider?.getCheckoutView(url!, id!, title!);
    return viewCheckout;
  }

  Future postCheckout() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCheckout;
    postCheckout = await apiRepProvider?.sendCheckoutPost(url!,formData);
    return postCheckout;
  }
  
    Future postCheckoutWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCheckout;
    postCheckout = await apiRepProvider?.sendCheckoutPostWithID(url!,formData, id!, title!);
    return postCheckout;
  }

  
  
    Future editPayWithAvailableBalanceCheckout()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editPayWithAvailableBalance;
    editPayWithAvailableBalance = await apiRepProvider?.getPayWithAvailableBalanceCheckoutEdit(url!, id!, title!);
    return editPayWithAvailableBalance;
  }

  Future postPayWithAvailableBalanceCheckout() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithAvailableBalance;
    postPayWithAvailableBalance = await apiRepProvider?.sendPayWithAvailableBalanceCheckoutPost(url!,formData);
    return postPayWithAvailableBalance;
  }
  
    Future postPayWithAvailableBalanceCheckoutWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithAvailableBalance;
    postPayWithAvailableBalance = await apiRepProvider?.sendPayWithAvailableBalanceCheckoutPostWithID(url!,formData, id!, title!);
    return postPayWithAvailableBalance;
  }
  
      Future getPayWithAvailableBalanceCheckout(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getPayWithAvailableBalance;
        getPayWithAvailableBalance = await apiRepProvider?.getPayWithAvailableBalanceCheckout(url!, id!, title!, spKey!);
	    return getPayWithAvailableBalance ;
	 }
   Future<PayWithAvailableBalanceCheckoutModel> loadPayWithAvailableBalanceCheckout() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadPayWithAvailableBalance;
        loadPayWithAvailableBalance = await apiRepProvider?.loadPayWithAvailableBalanceCheckout('');
	    return loadPayWithAvailableBalance ;  
   }
  
   Future savePayWithAvailableBalanceCheckout(PayWithAvailableBalanceCheckoutModel? checkout, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePayWithAvailableBalanceCheckout(checkout!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPayWithAvailableBalanceCheckout(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllPayWithAvailableBalanceCheckout(spKey!);   
   }
  
  
  
    Future editPayViaBankTransferCheckout()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editPayViaBankTransfer;
    editPayViaBankTransfer = await apiRepProvider?.getPayViaBankTransferCheckoutEdit(url!, id!, title!);
    return editPayViaBankTransfer;
  }

  Future postPayViaBankTransferCheckout() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayViaBankTransfer;
    postPayViaBankTransfer = await apiRepProvider?.sendPayViaBankTransferCheckoutPost(url!,formData);
    return postPayViaBankTransfer;
  }
  
    Future postPayViaBankTransferCheckoutWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayViaBankTransfer;
    postPayViaBankTransfer = await apiRepProvider?.sendPayViaBankTransferCheckoutPostWithID(url!,formData, id!, title!);
    return postPayViaBankTransfer;
  }
  
      Future getPayViaBankTransferCheckout(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getPayViaBankTransfer;
        getPayViaBankTransfer = await apiRepProvider?.getPayViaBankTransferCheckout(url!, id!, title!, spKey!);
	    return getPayViaBankTransfer ;
	 }
   Future<PayViaBankTransferCheckoutModel> loadPayViaBankTransferCheckout() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadPayViaBankTransfer;
        loadPayViaBankTransfer = await apiRepProvider?.loadPayViaBankTransferCheckout('');
	    return loadPayViaBankTransfer ;  
   }
  
   Future savePayViaBankTransferCheckout(PayViaBankTransferCheckoutModel? checkout, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePayViaBankTransferCheckout(checkout!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPayViaBankTransferCheckout(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllPayViaBankTransferCheckout(spKey!);   
   }
  
  
  
    Future editPayWithCreditCardCheckout()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editPayWithCreditCard;
    editPayWithCreditCard = await apiRepProvider?.getPayWithCreditCardCheckoutEdit(url!, id!, title!);
    return editPayWithCreditCard;
  }

  Future postPayWithCreditCardCheckout() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithCreditCard;
    postPayWithCreditCard = await apiRepProvider?.sendPayWithCreditCardCheckoutPost(url!,formData);
    return postPayWithCreditCard;
  }
  
    Future postPayWithCreditCardCheckoutWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithCreditCard;
    postPayWithCreditCard = await apiRepProvider?.sendPayWithCreditCardCheckoutPostWithID(url!,formData, id!, title!);
    return postPayWithCreditCard;
  }
  
      Future getPayWithCreditCardCheckout(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getPayWithCreditCard;
        getPayWithCreditCard = await apiRepProvider?.getPayWithCreditCardCheckout(url!, id!, title!, spKey!);
	    return getPayWithCreditCard ;
	 }
   Future<PayWithCreditCardCheckoutModel> loadPayWithCreditCardCheckout() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadPayWithCreditCard;
        loadPayWithCreditCard = await apiRepProvider?.loadPayWithCreditCardCheckout('');
	    return loadPayWithCreditCard ;  
   }
  
   Future savePayWithCreditCardCheckout(PayWithCreditCardCheckoutModel? checkout, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePayWithCreditCardCheckout(checkout!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPayWithCreditCardCheckout(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllPayWithCreditCardCheckout(spKey!);   
   }
  
  
  
    Future editPayWithCimbClicksCheckout()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editPayWithCimbClicks;
    editPayWithCimbClicks = await apiRepProvider?.getPayWithCimbClicksCheckoutEdit(url!, id!, title!);
    return editPayWithCimbClicks;
  }

  Future postPayWithCimbClicksCheckout() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithCimbClicks;
    postPayWithCimbClicks = await apiRepProvider?.sendPayWithCimbClicksCheckoutPost(url!,formData);
    return postPayWithCimbClicks;
  }
  
    Future postPayWithCimbClicksCheckoutWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithCimbClicks;
    postPayWithCimbClicks = await apiRepProvider?.sendPayWithCimbClicksCheckoutPostWithID(url!,formData, id!, title!);
    return postPayWithCimbClicks;
  }
  
      Future getPayWithCimbClicksCheckout(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getPayWithCimbClicks;
        getPayWithCimbClicks = await apiRepProvider?.getPayWithCimbClicksCheckout(url!, id!, title!, spKey!);
	    return getPayWithCimbClicks ;
	 }
   Future<PayWithCimbClicksCheckoutModel> loadPayWithCimbClicksCheckout() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadPayWithCimbClicks;
        loadPayWithCimbClicks = await apiRepProvider?.loadPayWithCimbClicksCheckout('');
	    return loadPayWithCimbClicks ;  
   }
  
   Future savePayWithCimbClicksCheckout(PayWithCimbClicksCheckoutModel? checkout, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePayWithCimbClicksCheckout(checkout!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPayWithCimbClicksCheckout(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllPayWithCimbClicksCheckout(spKey!);   
   }
  
  
  
    Future editPayWithBcaKlikpayCheckout()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editPayWithBcaKlikpay;
    editPayWithBcaKlikpay = await apiRepProvider?.getPayWithBcaKlikpayCheckoutEdit(url!, id!, title!);
    return editPayWithBcaKlikpay;
  }

  Future postPayWithBcaKlikpayCheckout() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithBcaKlikpay;
    postPayWithBcaKlikpay = await apiRepProvider?.sendPayWithBcaKlikpayCheckoutPost(url!,formData);
    return postPayWithBcaKlikpay;
  }
  
    Future postPayWithBcaKlikpayCheckoutWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithBcaKlikpay;
    postPayWithBcaKlikpay = await apiRepProvider?.sendPayWithBcaKlikpayCheckoutPostWithID(url!,formData, id!, title!);
    return postPayWithBcaKlikpay;
  }
  
      Future getPayWithBcaKlikpayCheckout(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getPayWithBcaKlikpay;
        getPayWithBcaKlikpay = await apiRepProvider?.getPayWithBcaKlikpayCheckout(url!, id!, title!, spKey!);
	    return getPayWithBcaKlikpay ;
	 }
   Future<PayWithBcaKlikpayCheckoutModel> loadPayWithBcaKlikpayCheckout() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadPayWithBcaKlikpay;
        loadPayWithBcaKlikpay = await apiRepProvider?.loadPayWithBcaKlikpayCheckout('');
	    return loadPayWithBcaKlikpay ;  
   }
  
   Future savePayWithBcaKlikpayCheckout(PayWithBcaKlikpayCheckoutModel? checkout, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePayWithBcaKlikpayCheckout(checkout!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPayWithBcaKlikpayCheckout(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllPayWithBcaKlikpayCheckout(spKey!);   
   }
  
  
  
    Future editPayWithMandiriClickpayCheckout()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editPayWithMandiriClickpay;
    editPayWithMandiriClickpay = await apiRepProvider?.getPayWithMandiriClickpayCheckoutEdit(url!, id!, title!);
    return editPayWithMandiriClickpay;
  }

  Future postPayWithMandiriClickpayCheckout() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithMandiriClickpay;
    postPayWithMandiriClickpay = await apiRepProvider?.sendPayWithMandiriClickpayCheckoutPost(url!,formData);
    return postPayWithMandiriClickpay;
  }
  
    Future postPayWithMandiriClickpayCheckoutWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithMandiriClickpay;
    postPayWithMandiriClickpay = await apiRepProvider?.sendPayWithMandiriClickpayCheckoutPostWithID(url!,formData, id!, title!);
    return postPayWithMandiriClickpay;
  }
  
      Future getPayWithMandiriClickpayCheckout(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getPayWithMandiriClickpay;
        getPayWithMandiriClickpay = await apiRepProvider?.getPayWithMandiriClickpayCheckout(url!, id!, title!, spKey!);
	    return getPayWithMandiriClickpay ;
	 }
   Future<PayWithMandiriClickpayCheckoutModel> loadPayWithMandiriClickpayCheckout() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadPayWithMandiriClickpay;
        loadPayWithMandiriClickpay = await apiRepProvider?.loadPayWithMandiriClickpayCheckout('');
	    return loadPayWithMandiriClickpay ;  
   }
  
   Future savePayWithMandiriClickpayCheckout(PayWithMandiriClickpayCheckoutModel? checkout, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePayWithMandiriClickpayCheckout(checkout!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPayWithMandiriClickpayCheckout(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllPayWithMandiriClickpayCheckout(spKey!);   
   }
  
  
  
    Future editPayWithQrisCheckout()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editPayWithQris;
    editPayWithQris = await apiRepProvider?.getPayWithQrisCheckoutEdit(url!, id!, title!);
    return editPayWithQris;
  }

  Future postPayWithQrisCheckout() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithQris;
    postPayWithQris = await apiRepProvider?.sendPayWithQrisCheckoutPost(url!,formData);
    return postPayWithQris;
  }
  
    Future postPayWithQrisCheckoutWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithQris;
    postPayWithQris = await apiRepProvider?.sendPayWithQrisCheckoutPostWithID(url!,formData, id!, title!);
    return postPayWithQris;
  }
  
      Future getPayWithQrisCheckout(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getPayWithQris;
        getPayWithQris = await apiRepProvider?.getPayWithQrisCheckout(url!, id!, title!, spKey!);
	    return getPayWithQris ;
	 }
   Future<PayWithQrisCheckoutModel> loadPayWithQrisCheckout() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadPayWithQris;
        loadPayWithQris = await apiRepProvider?.loadPayWithQrisCheckout('');
	    return loadPayWithQris ;  
   }
  
   Future savePayWithQrisCheckout(PayWithQrisCheckoutModel? checkout, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePayWithQrisCheckout(checkout!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPayWithQrisCheckout(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllPayWithQrisCheckout(spKey!);   
   }
  
  
  
    Future editPayWithPaypalCheckout()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editPayWithPaypal;
    editPayWithPaypal = await apiRepProvider?.getPayWithPaypalCheckoutEdit(url!, id!, title!);
    return editPayWithPaypal;
  }

  Future postPayWithPaypalCheckout() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithPaypal;
    postPayWithPaypal = await apiRepProvider?.sendPayWithPaypalCheckoutPost(url!,formData);
    return postPayWithPaypal;
  }
  
    Future postPayWithPaypalCheckoutWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPayWithPaypal;
    postPayWithPaypal = await apiRepProvider?.sendPayWithPaypalCheckoutPostWithID(url!,formData, id!, title!);
    return postPayWithPaypal;
  }
  
      Future getPayWithPaypalCheckout(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getPayWithPaypal;
        getPayWithPaypal = await apiRepProvider?.getPayWithPaypalCheckout(url!, id!, title!, spKey!);
	    return getPayWithPaypal ;
	 }
   Future<PayWithPaypalCheckoutModel> loadPayWithPaypalCheckout() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadPayWithPaypal;
        loadPayWithPaypal = await apiRepProvider?.loadPayWithPaypalCheckout('');
	    return loadPayWithPaypal ;  
   }
  
   Future savePayWithPaypalCheckout(PayWithPaypalCheckoutModel? checkout, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePayWithPaypalCheckout(checkout!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPayWithPaypalCheckout(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllPayWithPaypalCheckout(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class CheckoutListing extends Bloc<CheckoutEvent, CheckoutState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  CheckoutListing(this.application, this.url, this.isSearch, CheckoutState initialState):
  super(initialState){
     on<CheckoutList>(_CheckoutListEvent);
	
	  on<CheckoutListingRefresh>(_CheckoutListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<CheckoutEvent, CheckoutState>> transformEvents(
      Stream<CheckoutEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<CheckoutEvent> transform<CheckoutEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<CheckoutEvent, CheckoutState> transition) {
    print(transition);
  }

  @override
  get initialState => CheckoutListingUninitialized();

void _CheckoutListEvent(CheckoutList event, Emitter<CheckoutState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is CheckoutListingUninitialized){
			  if(isSearch!){
			     CheckoutListingModel? checkout = await listingSearchCheckout(1);
				  int deltaPage;
				  if(checkout?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  checkout?.items.items.length ~/ (checkout?.tools.paging.total_rows/checkout?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( checkout?.items.items.isEmpty
					  ? CheckoutListingLoaded(checkout: checkout!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : CheckoutListingLoaded(checkout: checkout!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  CheckoutListingModel? checkout = await listingCheckout(1);
				   int deltaPage;
				  if(checkout?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  checkout?.items.items.length ~/ (checkout?.tools.paging.total_rows/checkout?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( checkout?.items.items.isEmpty
					  ? CheckoutListingLoaded(checkout: checkout!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :CheckoutListingLoaded(checkout: checkout!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is CheckoutListingLoaded) {
          //page++;
		    final oldpage = (currentState as CheckoutListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as CheckoutListingLoaded).page! + 1;
			 if ((currentState as CheckoutListingLoaded).checkout?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as CheckoutListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      CheckoutListingModel? checkout = await listingSearchCheckout(page);
						  if(!checkout?.items.items.isEmpty){
							 (currentState as CheckoutListingLoaded).checkout?.items.items.addAll(checkout?.items.items);
						  }
						  return emit ( checkout?.items.items.isEmpty
							  ? (currentState as CheckoutListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : CheckoutListingLoaded(  checkout:  (currentState as CheckoutListingLoaded).checkout! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as CheckoutListingLoaded).page! + 1;
							  if ((currentState as CheckoutListingLoaded).checkout?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as CheckoutListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  CheckoutListingModel? checkout = await listingCheckout(page);
							  return emit ( checkout?.items.items.isEmpty
								  ? (currentState as CheckoutListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : CheckoutListingLoaded(  checkout:  checkout! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( CheckoutListingError());
        
      }
    }
  }

void _CheckoutListingRefreshEvent(CheckoutListingRefresh event, Emitter<CheckoutState> emit)async{
  final currentState = state;
   try {
        if (currentState is CheckoutListingUninitialized) {
		   if(isSearch!){

			    CheckoutListingModel? checkout = await listingSearchCheckout(1);
              return emit (  CheckoutListingLoaded( checkout: checkout!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    CheckoutListingModel? checkout = await listingCheckout(1);
				   return emit (  CheckoutListingLoaded( checkout: checkout!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is CheckoutListingLoaded) {
		  if(isSearch!){
		     CheckoutListingModel? checkout = await listingSearchRefreshCheckout();
              return emit (  checkout?.items.items.isEmpty
              ? (currentState as CheckoutListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CheckoutListingLoaded(  checkout: checkout! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  CheckoutListingModel? checkout = await listingCheckout(1);
				  int deltaPage = checkout?.items.items.length ~/ (checkout?.tools.paging.total_rows/checkout?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  checkout?.items.items.isEmpty
					  ? (currentState as CheckoutListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CheckoutListingLoaded(checkout: checkout!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  CheckoutListingError());
      }
  }

  @override

  Stream<CheckoutState> mapEventToState(CheckoutEvent event) async* {
    final currentState = state;
    if (event is CheckoutList && !hasReachedMax(currentState)) {
      try {
        if (currentState is CheckoutListingUninitialized){
			  if(isSearch!){
			     CheckoutListingModel? checkout = await listingSearchCheckout(1);
				  int deltaPage;
				  if(checkout?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  checkout?.items.items.length ~/ (checkout?.tools.paging.total_rows/checkout?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield checkout?.items.items.isEmpty
					  ? CheckoutListingLoaded(checkout: checkout!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : CheckoutListingLoaded(checkout: checkout!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  CheckoutListingModel? checkout = await listingCheckout(1);
				   int deltaPage;
				  if(checkout?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  checkout?.items.items.length ~/ (checkout?.tools.paging.total_rows/checkout?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield checkout?.items.items.isEmpty
					  ? CheckoutListingLoaded(checkout: checkout!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :CheckoutListingLoaded(checkout: checkout!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is CheckoutListingLoaded) {
          //page++;
		    final oldpage = (currentState as CheckoutListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as CheckoutListingLoaded).page! + 1;
			 if ((currentState as CheckoutListingLoaded).checkout?.tools.paging.total_pages == oldpage) {
					yield (currentState as CheckoutListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      CheckoutListingModel? checkout = await listingSearchCheckout(page);
						  if(!checkout?.items.items.isEmpty){
							 (currentState as CheckoutListingLoaded).checkout?.items.items.addAll(checkout?.items.items);
						  }
						  yield checkout?.items.items.isEmpty
							  ? (currentState as CheckoutListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : CheckoutListingLoaded(  checkout:  (currentState as CheckoutListingLoaded).checkout! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as CheckoutListingLoaded).page! + 1;
							  if ((currentState as CheckoutListingLoaded).checkout?.tools.paging.total_pages == oldpage) {
						yield (currentState as CheckoutListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  CheckoutListingModel? checkout = await listingCheckout(page);
							  yield checkout?.items.items.isEmpty
								  ? (currentState as CheckoutListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : CheckoutListingLoaded(  checkout:  checkout! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield CheckoutListingError();
        
      }
    } else if (event is CheckoutListingRefresh){
      try {
        if (currentState is CheckoutListingUninitialized) {
		   if(isSearch!){

			    CheckoutListingModel? checkout = await listingSearchCheckout(1);
              yield CheckoutListingLoaded( checkout: checkout!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    CheckoutListingModel? checkout = await listingCheckout(1);
				   yield CheckoutListingLoaded( checkout: checkout!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is CheckoutListingLoaded) {
		  if(isSearch!){
		     CheckoutListingModel? checkout = await listingSearchRefreshCheckout();
              yield checkout?.items.items.isEmpty
              ? (currentState as CheckoutListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CheckoutListingLoaded(  checkout: checkout! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  CheckoutListingModel? checkout = await listingCheckout(1);
				  int deltaPage = checkout?.items.items.length ~/ (checkout?.tools.paging.total_rows/checkout?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield checkout?.items.items.isEmpty
					  ? (currentState as CheckoutListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CheckoutListingLoaded(checkout: checkout!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield CheckoutListingError();
      }

    }
  }

  bool hasReachedMax(CheckoutState state) =>
      state is CheckoutListingLoaded && state.hasReachedMax!;

  Future<CheckoutListingModel?> listingCheckout(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getCheckoutList(url!, page!);
  }

  Future<CheckoutListingModel?> listingRefreshCheckout() async {
    CheckoutListingModel? checkout;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllCheckoutList();
    checkout  = await apiRepProvider?.getCheckoutList(url!, 1);
    return checkout;
  }
  
  

  Future<CheckoutListingModel?> listingSearchCheckout(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getCheckoutListSearch(url!, page!);
  }

  Future<CheckoutListingModel?> listingSearchRefreshCheckout() async {
    CheckoutListingModel? checkout ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    checkout  = await apiRepProvider?.getCheckoutListSearch(url!, 1);
    return checkout;
  }
}


