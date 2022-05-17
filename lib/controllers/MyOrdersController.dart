
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class MyOrdersController {

  ProjectscoidApplication application;
  MyOrdersListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  MyOrdersController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MyOrdersListing(this.application, this.url!, this.isSearch, MyOrdersListingUninitialized());}
      break;
      case 1 : {}
      break;
      default:{}
    }
  }


 Future<String?> downloadFile1( ProgressDlCallback showProgress) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    return await apiRepProvider?.downloadFile1(url!, title!, showProgress);
  }
  
  Future downloadFile() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    await apiRepProvider?.downloadFile(url!, title!);
  }

  Future editMyOrders()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editMyOrders;
    editMyOrders = await apiRepProvider?.getMyOrdersEdit(url!, id!, title!);
    return editMyOrders;
  }
  
    Future viewMyOrders()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var viewMyOrders;
    viewMyOrders = await apiRepProvider?.getMyOrdersView(url!, id!, title!);
    return viewMyOrders;
  }

  Future postMyOrders() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postMyOrders;
    postMyOrders = await apiRepProvider?.sendMyOrdersPost(url!,formData);
    return postMyOrders;
  }
  
    Future postMyOrdersWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postMyOrders;
    postMyOrders = await apiRepProvider?.sendMyOrdersPostWithID(url!,formData, id!, title!);
    return postMyOrders;
  }


  Future getTableMyOrders(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    return await apiRepProvider?.getMyOrdersIndex(url!, page);
  }
  
  
    Future editConfirmPaymentMyOrders()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editConfirmPayment;
    editConfirmPayment = await apiRepProvider?.getConfirmPaymentMyOrdersEdit(url!, id!, title!);
    return editConfirmPayment;
  }

  Future postConfirmPaymentMyOrders() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postConfirmPayment;
    postConfirmPayment = await apiRepProvider?.sendConfirmPaymentMyOrdersPost(url!,formData);
    return postConfirmPayment;
  }
  
    Future postConfirmPaymentMyOrdersWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postConfirmPayment;
    postConfirmPayment = await apiRepProvider?.sendConfirmPaymentMyOrdersPostWithID(url!,formData, id!, title!);
    return postConfirmPayment;
  }
  
      Future getConfirmPaymentMyOrders(String spKey)async{
  
        APIRepository? apiRepProvider = application.projectsAPIRepository;
        var getConfirmPayment;
        getConfirmPayment = await apiRepProvider?.getConfirmPaymentMyOrders(url!, id!, title!, spKey);
	    return getConfirmPayment ;
	 }
   Future<ConfirmPaymentMyOrdersModel> loadConfirmPaymentMyOrders() async{
   APIRepository? apiRepProvider = application.projectsAPIRepository;
        var loadConfirmPayment;
        loadConfirmPayment = await apiRepProvider?.loadConfirmPaymentMyOrders('');
	    return loadConfirmPayment ;  
   }
  
   Future saveConfirmPaymentMyOrders(ConfirmPaymentMyOrdersModel? my_orders, String? spKey) async{  
       APIRepository? apiRepProvider = application.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateConfirmPaymentMyOrders(my_orders!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllConfirmPaymentMyOrders(String? spKey) async{
	 APIRepository? apiRepProvider = application.projectsAPIRepository;
       await apiRepProvider?.deleteAllConfirmPaymentMyOrders(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MyOrdersListing extends Bloc<MyOrdersEvent, MyOrdersState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MyOrdersListing(this.application, this.url, this.isSearch, MyOrdersState initialState):
  super(initialState){
     on<MyOrdersList>(_MyOrdersListEvent);
	
	  on<MyOrdersListingRefresh>(_MyOrdersListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MyOrdersEvent, MyOrdersState>> transformEvents(
      Stream<MyOrdersEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MyOrdersEvent> transform<MyOrdersEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MyOrdersEvent, MyOrdersState> transition) {
    print(transition);
  }

  @override
  get initialState => MyOrdersListingUninitialized();

void _MyOrdersListEvent(MyOrdersList event, Emitter<MyOrdersState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MyOrdersListingUninitialized){
			  if(isSearch!){
			     MyOrdersListingModel? my_orders = await listingSearchMyOrders(1);
				  int deltaPage;
				  if(my_orders?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_orders?.items.items.length ~/ (my_orders?.tools.paging.total_rows/my_orders?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_orders?.items.items.isEmpty
					  ? MyOrdersListingLoaded(my_orders: my_orders!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyOrdersListingLoaded(my_orders: my_orders!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MyOrdersListingModel? my_orders = await listingMyOrders(1);
				   int deltaPage;
				  if(my_orders?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_orders?.items.items.length ~/ (my_orders?.tools.paging.total_rows/my_orders?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_orders?.items.items.isEmpty
					  ? MyOrdersListingLoaded(my_orders: my_orders!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyOrdersListingLoaded(my_orders: my_orders!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MyOrdersListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyOrdersListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyOrdersListingLoaded).page! + 1;
			 if ((currentState as MyOrdersListingLoaded).my_orders?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MyOrdersListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MyOrdersListingModel? my_orders = await listingSearchMyOrders(page);
						  if(!my_orders?.items.items.isEmpty){
							 (currentState as MyOrdersListingLoaded).my_orders?.items.items.addAll(my_orders?.items.items);
						  }
						  return emit ( my_orders?.items.items.isEmpty
							  ? (currentState as MyOrdersListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyOrdersListingLoaded(  my_orders:  (currentState as MyOrdersListingLoaded).my_orders! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MyOrdersListingLoaded).page! + 1;
							  if ((currentState as MyOrdersListingLoaded).my_orders?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MyOrdersListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MyOrdersListingModel? my_orders = await listingMyOrders(page);
							  return emit ( my_orders?.items.items.isEmpty
								  ? (currentState as MyOrdersListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyOrdersListingLoaded(  my_orders:  my_orders! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MyOrdersListingError());
        
      }
    }
  }

void _MyOrdersListingRefreshEvent(MyOrdersListingRefresh event, Emitter<MyOrdersState> emit)async{
  final currentState = state;
   try {
        if (currentState is MyOrdersListingUninitialized) {
		   if(isSearch!){

			    MyOrdersListingModel? my_orders = await listingSearchMyOrders(1);
              return emit (  MyOrdersListingLoaded( my_orders: my_orders!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MyOrdersListingModel? my_orders = await listingMyOrders(1);
				   return emit (  MyOrdersListingLoaded( my_orders: my_orders!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MyOrdersListingLoaded) {
		  if(isSearch!){
		     MyOrdersListingModel? my_orders = await listingSearchRefreshMyOrders();
              return emit (  my_orders?.items.items.isEmpty
              ? (currentState as MyOrdersListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyOrdersListingLoaded(  my_orders: my_orders! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MyOrdersListingModel? my_orders = await listingMyOrders(1);
				  int deltaPage = my_orders?.items.items.length ~/ (my_orders?.tools.paging.total_rows/my_orders?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_orders?.items.items.isEmpty
					  ? (currentState as MyOrdersListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyOrdersListingLoaded(my_orders: my_orders!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MyOrdersListingError());
      }
  }

  @override

  Stream<MyOrdersState> mapEventToState(MyOrdersEvent event) async* {
    final currentState = state;
    if (event is MyOrdersList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MyOrdersListingUninitialized){
			  if(isSearch!){
			     MyOrdersListingModel? my_orders = await listingSearchMyOrders(1);
				  int deltaPage;
				  if(my_orders?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_orders?.items.items.length ~/ (my_orders?.tools.paging.total_rows/my_orders?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_orders?.items.items.isEmpty
					  ? MyOrdersListingLoaded(my_orders: my_orders!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyOrdersListingLoaded(my_orders: my_orders!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MyOrdersListingModel? my_orders = await listingMyOrders(1);
				   int deltaPage;
				  if(my_orders?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_orders?.items.items.length ~/ (my_orders?.tools.paging.total_rows/my_orders?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_orders?.items.items.isEmpty
					  ? MyOrdersListingLoaded(my_orders: my_orders!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyOrdersListingLoaded(my_orders: my_orders!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MyOrdersListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyOrdersListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyOrdersListingLoaded).page! + 1;
			 if ((currentState as MyOrdersListingLoaded).my_orders?.tools.paging.total_pages == oldpage) {
					yield (currentState as MyOrdersListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MyOrdersListingModel? my_orders = await listingSearchMyOrders(page);
						  if(!my_orders?.items.items.isEmpty){
							 (currentState as MyOrdersListingLoaded).my_orders?.items.items.addAll(my_orders?.items.items);
						  }
						  yield my_orders?.items.items.isEmpty
							  ? (currentState as MyOrdersListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyOrdersListingLoaded(  my_orders:  (currentState as MyOrdersListingLoaded).my_orders! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MyOrdersListingLoaded).page! + 1;
							  if ((currentState as MyOrdersListingLoaded).my_orders?.tools.paging.total_pages == oldpage) {
						yield (currentState as MyOrdersListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MyOrdersListingModel? my_orders = await listingMyOrders(page);
							  yield my_orders?.items.items.isEmpty
								  ? (currentState as MyOrdersListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyOrdersListingLoaded(  my_orders:  my_orders! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MyOrdersListingError();
        
      }
    } else if (event is MyOrdersListingRefresh){
      try {
        if (currentState is MyOrdersListingUninitialized) {
		   if(isSearch!){

			    MyOrdersListingModel? my_orders = await listingSearchMyOrders(1);
              yield MyOrdersListingLoaded( my_orders: my_orders!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MyOrdersListingModel? my_orders = await listingMyOrders(1);
				   yield MyOrdersListingLoaded( my_orders: my_orders!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MyOrdersListingLoaded) {
		  if(isSearch!){
		     MyOrdersListingModel? my_orders = await listingSearchRefreshMyOrders();
              yield my_orders?.items.items.isEmpty
              ? (currentState as MyOrdersListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyOrdersListingLoaded(  my_orders: my_orders! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MyOrdersListingModel? my_orders = await listingMyOrders(1);
				  int deltaPage = my_orders?.items.items.length ~/ (my_orders?.tools.paging.total_rows/my_orders?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_orders?.items.items.isEmpty
					  ? (currentState as MyOrdersListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyOrdersListingLoaded(my_orders: my_orders!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MyOrdersListingError();
      }

    }
  }

  bool hasReachedMax(MyOrdersState state) =>
      state is MyOrdersListingLoaded && state.hasReachedMax!;

  Future<MyOrdersListingModel?> listingMyOrders(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyOrdersList(url!, page!);
  }

  Future<MyOrdersListingModel?> listingRefreshMyOrders() async {
    MyOrdersListingModel? my_orders;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMyOrdersList();
    my_orders  = await apiRepProvider?.getMyOrdersList(url!, 1);
    return my_orders;
  }
  
  

  Future<MyOrdersListingModel?> listingSearchMyOrders(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyOrdersListSearch(url!, page!);
  }

  Future<MyOrdersListingModel?> listingSearchRefreshMyOrders() async {
    MyOrdersListingModel? my_orders ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_orders  = await apiRepProvider?.getMyOrdersListSearch(url!, 1);
    return my_orders;
  }
}


