
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class MySalesController {

  ProjectscoidApplication application;
  MySalesListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  MySalesController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MySalesListing(this.application, this.url!, this.isSearch, MySalesListingUninitialized());}
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

  Future editMySales()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editMySales;
    editMySales = await apiRepProvider?.getMySalesEdit(url!, id!, title!);
    return editMySales;
  }
  
    Future viewMySales()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewMySales;
    viewMySales = await apiRepProvider?.getMySalesView(url!, id!, title!);
    return viewMySales;
  }

  Future postMySales() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMySales;
    postMySales = await apiRepProvider?.sendMySalesPost(url!,formData);
    return postMySales;
  }
  
    Future postMySalesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMySales;
    postMySales = await apiRepProvider?.sendMySalesPostWithID(url!,formData, id!, title!);
    return postMySales;
  }


  Future getTableMySales(int page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMySalesIndex(url!, page);
  }
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MySalesListing extends Bloc<MySalesEvent, MySalesState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MySalesListing(this.application, this.url, this.isSearch, MySalesState initialState):
  super(initialState){
     on<MySalesList>(_MySalesListEvent);
	
	  on<MySalesListingRefresh>(_MySalesListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MySalesEvent, MySalesState>> transformEvents(
      Stream<MySalesEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MySalesEvent> transform<MySalesEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MySalesEvent, MySalesState> transition) {
    print(transition);
  }

  @override
  get initialState => MySalesListingUninitialized();

void _MySalesListEvent(MySalesList event, Emitter<MySalesState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MySalesListingUninitialized){
			  if(isSearch!){
			     MySalesListingModel? my_sales = await listingSearchMySales(1);
				  int deltaPage;
				  if(my_sales?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_sales?.items.items.length ~/ (my_sales?.tools.paging.total_rows/my_sales?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_sales?.items.items.isEmpty
					  ? MySalesListingLoaded(my_sales: my_sales!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MySalesListingLoaded(my_sales: my_sales!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MySalesListingModel? my_sales = await listingMySales(1);
				   int deltaPage;
				  if(my_sales?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_sales?.items.items.length ~/ (my_sales?.tools.paging.total_rows/my_sales?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_sales?.items.items.isEmpty
					  ? MySalesListingLoaded(my_sales: my_sales!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MySalesListingLoaded(my_sales: my_sales!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MySalesListingLoaded) {
          //page++;
		    final oldpage = (currentState as MySalesListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MySalesListingLoaded).page! + 1;
			 if ((currentState as MySalesListingLoaded).my_sales?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MySalesListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MySalesListingModel? my_sales = await listingSearchMySales(page);
						  if(!my_sales?.items.items.isEmpty){
							 (currentState as MySalesListingLoaded).my_sales?.items.items.addAll(my_sales?.items.items);
						  }
						  return emit ( my_sales?.items.items.isEmpty
							  ? (currentState as MySalesListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MySalesListingLoaded(  my_sales:  (currentState as MySalesListingLoaded).my_sales! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MySalesListingLoaded).page! + 1;
							  if ((currentState as MySalesListingLoaded).my_sales?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MySalesListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MySalesListingModel? my_sales = await listingMySales(page);
							  return emit ( my_sales?.items.items.isEmpty
								  ? (currentState as MySalesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MySalesListingLoaded(  my_sales:  my_sales! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MySalesListingError());
        
      }
    }
  }

void _MySalesListingRefreshEvent(MySalesListingRefresh event, Emitter<MySalesState> emit)async{
  final currentState = state;
   try {
        if (currentState is MySalesListingUninitialized) {
		   if(isSearch!){

			    MySalesListingModel? my_sales = await listingSearchMySales(1);
              return emit (  MySalesListingLoaded( my_sales: my_sales!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MySalesListingModel? my_sales = await listingMySales(1);
				   return emit (  MySalesListingLoaded( my_sales: my_sales!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MySalesListingLoaded) {
		  if(isSearch!){
		     MySalesListingModel? my_sales = await listingSearchRefreshMySales();
              return emit (  my_sales?.items.items.isEmpty
              ? (currentState as MySalesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MySalesListingLoaded(  my_sales: my_sales! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MySalesListingModel? my_sales = await listingMySales(1);
				  int deltaPage = my_sales?.items.items.length ~/ (my_sales?.tools.paging.total_rows/my_sales?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_sales?.items.items.isEmpty
					  ? (currentState as MySalesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MySalesListingLoaded(my_sales: my_sales!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MySalesListingError());
      }
  }

  @override

  Stream<MySalesState> mapEventToState(MySalesEvent event) async* {
    final currentState = state;
    if (event is MySalesList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MySalesListingUninitialized){
			  if(isSearch!){
			     MySalesListingModel? my_sales = await listingSearchMySales(1);
				  int deltaPage;
				  if(my_sales?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_sales?.items.items.length ~/ (my_sales?.tools.paging.total_rows/my_sales?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_sales?.items.items.isEmpty
					  ? MySalesListingLoaded(my_sales: my_sales!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MySalesListingLoaded(my_sales: my_sales!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MySalesListingModel? my_sales = await listingMySales(1);
				   int deltaPage;
				  if(my_sales?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_sales?.items.items.length ~/ (my_sales?.tools.paging.total_rows/my_sales?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_sales?.items.items.isEmpty
					  ? MySalesListingLoaded(my_sales: my_sales!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MySalesListingLoaded(my_sales: my_sales!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MySalesListingLoaded) {
          //page++;
		    final oldpage = (currentState as MySalesListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MySalesListingLoaded).page! + 1;
			 if ((currentState as MySalesListingLoaded).my_sales?.tools.paging.total_pages == oldpage) {
					yield (currentState as MySalesListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MySalesListingModel? my_sales = await listingSearchMySales(page);
						  if(!my_sales?.items.items.isEmpty){
							 (currentState as MySalesListingLoaded).my_sales?.items.items.addAll(my_sales?.items.items);
						  }
						  yield my_sales?.items.items.isEmpty
							  ? (currentState as MySalesListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MySalesListingLoaded(  my_sales:  (currentState as MySalesListingLoaded).my_sales! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MySalesListingLoaded).page! + 1;
							  if ((currentState as MySalesListingLoaded).my_sales?.tools.paging.total_pages == oldpage) {
						yield (currentState as MySalesListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MySalesListingModel? my_sales = await listingMySales(page);
							  yield my_sales?.items.items.isEmpty
								  ? (currentState as MySalesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MySalesListingLoaded(  my_sales:  my_sales! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MySalesListingError();
        
      }
    } else if (event is MySalesListingRefresh){
      try {
        if (currentState is MySalesListingUninitialized) {
		   if(isSearch!){

			    MySalesListingModel? my_sales = await listingSearchMySales(1);
              yield MySalesListingLoaded( my_sales: my_sales!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MySalesListingModel? my_sales = await listingMySales(1);
				   yield MySalesListingLoaded( my_sales: my_sales!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MySalesListingLoaded) {
		  if(isSearch!){
		     MySalesListingModel? my_sales = await listingSearchRefreshMySales();
              yield my_sales?.items.items.isEmpty
              ? (currentState as MySalesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MySalesListingLoaded(  my_sales: my_sales! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MySalesListingModel? my_sales = await listingMySales(1);
				  int deltaPage = my_sales?.items.items.length ~/ (my_sales?.tools.paging.total_rows/my_sales?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_sales?.items.items.isEmpty
					  ? (currentState as MySalesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MySalesListingLoaded(my_sales: my_sales!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MySalesListingError();
      }

    }
  }

  bool hasReachedMax(MySalesState state) =>
      state is MySalesListingLoaded && state.hasReachedMax!;

  Future<MySalesListingModel?> listingMySales(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMySalesList(url!, page!);
  }

  Future<MySalesListingModel?> listingRefreshMySales() async {
    MySalesListingModel? my_sales;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMySalesList();
    my_sales  = await apiRepProvider?.getMySalesList(url!, 1);
    return my_sales;
  }
  
  

  Future<MySalesListingModel?> listingSearchMySales(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMySalesListSearch(url!, page!);
  }

  Future<MySalesListingModel?> listingSearchRefreshMySales() async {
    MySalesListingModel? my_sales ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_sales  = await apiRepProvider?.getMySalesListSearch(url!, 1);
    return my_sales;
  }
}


