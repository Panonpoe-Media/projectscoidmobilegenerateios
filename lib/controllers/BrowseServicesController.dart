
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class BrowseServicesController {

  ProjectscoidApplication application;
  BrowseServicesListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  BrowseServicesController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new BrowseServicesListing(this.application, this.url!, this.isSearch, BrowseServicesListingUninitialized());}
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

  Future editBrowseServices()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editBrowseServices;
    editBrowseServices = await apiRepProvider?.getBrowseServicesEdit(url!, id!, title!);
    return editBrowseServices;
  }
  
    Future viewBrowseServices()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewBrowseServices;
    viewBrowseServices = await apiRepProvider?.getBrowseServicesView(url!, id!, title!);
    return viewBrowseServices;
  }

  Future postBrowseServices() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBrowseServices;
    postBrowseServices = await apiRepProvider?.sendBrowseServicesPost(url!,formData);
    return postBrowseServices;
  }
  
    Future postBrowseServicesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBrowseServices;
    postBrowseServices = await apiRepProvider?.sendBrowseServicesPostWithID(url!,formData, id!, title!);
    return postBrowseServices;
  }

  
  
    Future editPlaceOrderBrowseServices()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editPlaceOrder;
    editPlaceOrder = await apiRepProvider?.getPlaceOrderBrowseServicesEdit(url!, id!, title!);
    return editPlaceOrder;
  }

  Future postPlaceOrderBrowseServices() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPlaceOrder;
    postPlaceOrder = await apiRepProvider?.sendPlaceOrderBrowseServicesPost(url!,formData);
    return postPlaceOrder;
  }
  
    Future postPlaceOrderBrowseServicesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPlaceOrder;
    postPlaceOrder = await apiRepProvider?.sendPlaceOrderBrowseServicesPostWithID(url!,formData, id!, title!);
    return postPlaceOrder;
  }
  
      Future getPlaceOrderBrowseServices(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getPlaceOrder;
        getPlaceOrder = await apiRepProvider?.getPlaceOrderBrowseServices(url!, id!, title!, spKey!);
	    return getPlaceOrder ;
	 }
   Future<PlaceOrderBrowseServicesModel> loadPlaceOrderBrowseServices() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadPlaceOrder;
        loadPlaceOrder = await apiRepProvider?.loadPlaceOrderBrowseServices('');
	    return loadPlaceOrder ;  
   }
  
   Future savePlaceOrderBrowseServices(PlaceOrderBrowseServicesModel? browse_services, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePlaceOrderBrowseServices(browse_services!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPlaceOrderBrowseServices(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllPlaceOrderBrowseServices(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class BrowseServicesListing extends Bloc<BrowseServicesEvent, BrowseServicesState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  BrowseServicesListing(this.application, this.url, this.isSearch, BrowseServicesState initialState):
  super(initialState){
     on<BrowseServicesList>(_BrowseServicesListEvent);
	
	  on<BrowseServicesListingRefresh>(_BrowseServicesListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<BrowseServicesEvent, BrowseServicesState>> transformEvents(
      Stream<BrowseServicesEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<BrowseServicesEvent> transform<BrowseServicesEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<BrowseServicesEvent, BrowseServicesState> transition) {
    print(transition);
  }

  @override
  get initialState => BrowseServicesListingUninitialized();

void _BrowseServicesListEvent(BrowseServicesList event, Emitter<BrowseServicesState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is BrowseServicesListingUninitialized){
			  if(isSearch!){
			     BrowseServicesListingModel? browse_services = await listingSearchBrowseServices(1);
				  int deltaPage;
				  if(browse_services?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_services?.items.items.length ~/ (browse_services?.tools.paging.total_rows/browse_services?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( browse_services?.items.items.isEmpty
					  ? BrowseServicesListingLoaded(browse_services: browse_services!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : BrowseServicesListingLoaded(browse_services: browse_services!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  BrowseServicesListingModel? browse_services = await listingBrowseServices(1);
				   int deltaPage;
				  if(browse_services?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_services?.items.items.length ~/ (browse_services?.tools.paging.total_rows/browse_services?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( browse_services?.items.items.isEmpty
					  ? BrowseServicesListingLoaded(browse_services: browse_services!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseServicesListingLoaded(browse_services: browse_services!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is BrowseServicesListingLoaded) {
          //page++;
		    final oldpage = (currentState as BrowseServicesListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as BrowseServicesListingLoaded).page! + 1;
			 if ((currentState as BrowseServicesListingLoaded).browse_services?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as BrowseServicesListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      BrowseServicesListingModel? browse_services = await listingSearchBrowseServices(page);
						  if(!browse_services?.items.items.isEmpty){
							 (currentState as BrowseServicesListingLoaded).browse_services?.items.items.addAll(browse_services?.items.items);
						  }
						  return emit ( browse_services?.items.items.isEmpty
							  ? (currentState as BrowseServicesListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : BrowseServicesListingLoaded(  browse_services:  (currentState as BrowseServicesListingLoaded).browse_services! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as BrowseServicesListingLoaded).page! + 1;
							  if ((currentState as BrowseServicesListingLoaded).browse_services?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as BrowseServicesListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  BrowseServicesListingModel? browse_services = await listingBrowseServices(page);
							  return emit ( browse_services?.items.items.isEmpty
								  ? (currentState as BrowseServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : BrowseServicesListingLoaded(  browse_services:  browse_services! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( BrowseServicesListingError());
        
      }
    }
  }

void _BrowseServicesListingRefreshEvent(BrowseServicesListingRefresh event, Emitter<BrowseServicesState> emit)async{
  final currentState = state;
   try {
        if (currentState is BrowseServicesListingUninitialized) {
		   if(isSearch!){

			    BrowseServicesListingModel? browse_services = await listingSearchBrowseServices(1);
              return emit (  BrowseServicesListingLoaded( browse_services: browse_services!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    BrowseServicesListingModel? browse_services = await listingBrowseServices(1);
				   return emit (  BrowseServicesListingLoaded( browse_services: browse_services!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is BrowseServicesListingLoaded) {
		  if(isSearch!){
		     BrowseServicesListingModel? browse_services = await listingSearchRefreshBrowseServices();
              return emit (  browse_services?.items.items.isEmpty
              ? (currentState as BrowseServicesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : BrowseServicesListingLoaded(  browse_services: browse_services! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  BrowseServicesListingModel? browse_services = await listingBrowseServices(1);
				  int deltaPage = browse_services?.items.items.length ~/ (browse_services?.tools.paging.total_rows/browse_services?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  browse_services?.items.items.isEmpty
					  ? (currentState as BrowseServicesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseServicesListingLoaded(browse_services: browse_services!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  BrowseServicesListingError());
      }
  }

  @override

  Stream<BrowseServicesState> mapEventToState(BrowseServicesEvent event) async* {
    final currentState = state;
    if (event is BrowseServicesList && !hasReachedMax(currentState)) {
      try {
        if (currentState is BrowseServicesListingUninitialized){
			  if(isSearch!){
			     BrowseServicesListingModel? browse_services = await listingSearchBrowseServices(1);
				  int deltaPage;
				  if(browse_services?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_services?.items.items.length ~/ (browse_services?.tools.paging.total_rows/browse_services?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield browse_services?.items.items.isEmpty
					  ? BrowseServicesListingLoaded(browse_services: browse_services!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : BrowseServicesListingLoaded(browse_services: browse_services!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  BrowseServicesListingModel? browse_services = await listingBrowseServices(1);
				   int deltaPage;
				  if(browse_services?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_services?.items.items.length ~/ (browse_services?.tools.paging.total_rows/browse_services?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield browse_services?.items.items.isEmpty
					  ? BrowseServicesListingLoaded(browse_services: browse_services!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseServicesListingLoaded(browse_services: browse_services!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is BrowseServicesListingLoaded) {
          //page++;
		    final oldpage = (currentState as BrowseServicesListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as BrowseServicesListingLoaded).page! + 1;
			 if ((currentState as BrowseServicesListingLoaded).browse_services?.tools.paging.total_pages == oldpage) {
					yield (currentState as BrowseServicesListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      BrowseServicesListingModel? browse_services = await listingSearchBrowseServices(page);
						  if(!browse_services?.items.items.isEmpty){
							 (currentState as BrowseServicesListingLoaded).browse_services?.items.items.addAll(browse_services?.items.items);
						  }
						  yield browse_services?.items.items.isEmpty
							  ? (currentState as BrowseServicesListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : BrowseServicesListingLoaded(  browse_services:  (currentState as BrowseServicesListingLoaded).browse_services! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as BrowseServicesListingLoaded).page! + 1;
							  if ((currentState as BrowseServicesListingLoaded).browse_services?.tools.paging.total_pages == oldpage) {
						yield (currentState as BrowseServicesListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  BrowseServicesListingModel? browse_services = await listingBrowseServices(page);
							  yield browse_services?.items.items.isEmpty
								  ? (currentState as BrowseServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : BrowseServicesListingLoaded(  browse_services:  browse_services! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield BrowseServicesListingError();
        
      }
    } else if (event is BrowseServicesListingRefresh){
      try {
        if (currentState is BrowseServicesListingUninitialized) {
		   if(isSearch!){

			    BrowseServicesListingModel? browse_services = await listingSearchBrowseServices(1);
              yield BrowseServicesListingLoaded( browse_services: browse_services!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    BrowseServicesListingModel? browse_services = await listingBrowseServices(1);
				   yield BrowseServicesListingLoaded( browse_services: browse_services!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is BrowseServicesListingLoaded) {
		  if(isSearch!){
		     BrowseServicesListingModel? browse_services = await listingSearchRefreshBrowseServices();
              yield browse_services?.items.items.isEmpty
              ? (currentState as BrowseServicesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : BrowseServicesListingLoaded(  browse_services: browse_services! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  BrowseServicesListingModel? browse_services = await listingBrowseServices(1);
				  int deltaPage = browse_services?.items.items.length ~/ (browse_services?.tools.paging.total_rows/browse_services?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield browse_services?.items.items.isEmpty
					  ? (currentState as BrowseServicesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseServicesListingLoaded(browse_services: browse_services!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield BrowseServicesListingError();
      }

    }
  }

  bool hasReachedMax(BrowseServicesState state) =>
      state is BrowseServicesListingLoaded && state.hasReachedMax!;

  Future<BrowseServicesListingModel?> listingBrowseServices(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getBrowseServicesList(url!, page!);
  }

  Future<BrowseServicesListingModel?> listingRefreshBrowseServices() async {
    BrowseServicesListingModel? browse_services;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllBrowseServicesList();
    browse_services  = await apiRepProvider?.getBrowseServicesList(url!, 1);
    return browse_services;
  }
  
  

  Future<BrowseServicesListingModel?> listingSearchBrowseServices(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getBrowseServicesListSearch(url!, page!);
  }

  Future<BrowseServicesListingModel?> listingSearchRefreshBrowseServices() async {
    BrowseServicesListingModel? browse_services ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    browse_services  = await apiRepProvider?.getBrowseServicesListSearch(url!, 1);
    return browse_services;
  }
}


