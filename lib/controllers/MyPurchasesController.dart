
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';
//////
class MyPurchasesController {

  ProjectscoidApplication application;
  MyPurchasesListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  MyPurchasesController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MyPurchasesListing(this.application, this.url!, this.isSearch, MyPurchasesListingUninitialized());}
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

  Future editMyPurchases()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editMyPurchases;
    editMyPurchases = await apiRepProvider?.getMyPurchasesEdit(url!, id!, title!);
    return editMyPurchases;
  }
  
    Future viewMyPurchases()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewMyPurchases;
    viewMyPurchases = await apiRepProvider?.getMyPurchasesView(url!, id!, title!);
    return viewMyPurchases;
  }

  Future postMyPurchases() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyPurchases;
    postMyPurchases = await apiRepProvider?.sendMyPurchasesPost(url!,formData);
    return postMyPurchases;
  }
  
    Future postMyPurchasesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyPurchases;
    postMyPurchases = await apiRepProvider?.sendMyPurchasesPostWithID(url!,formData, id!, title!);
    return postMyPurchases;
  }


  Future getTableMyPurchases(int page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyPurchasesIndex(url!, page);
  }
  
  
    Future editDownloadMyPurchases()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editDownload;
    editDownload = await apiRepProvider?.getDownloadMyPurchasesEdit(url!, id!, title!);
    return editDownload;
  }

  Future postDownloadMyPurchases() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postDownload;
    postDownload = await apiRepProvider?.sendDownloadMyPurchasesPost(url!,formData);
    return postDownload;
  }
  
    Future postDownloadMyPurchasesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postDownload;
    postDownload = await apiRepProvider?.sendDownloadMyPurchasesPostWithID(url!,formData, id!, title!);
    return postDownload;
  }
  
      Future getDownloadMyPurchases(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getDownload;
        getDownload = await apiRepProvider?.getDownloadMyPurchases(url!, id!, title!, spKey!);
	    return getDownload ;
	 }
   Future<DownloadMyPurchasesModel> loadDownloadMyPurchases() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadDownload;
        loadDownload = await apiRepProvider?.loadDownloadMyPurchases('');
	    return loadDownload ;  
   }
  
   Future saveDownloadMyPurchases(DownloadMyPurchasesModel? my_purchases, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateDownloadMyPurchases(my_purchases!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllDownloadMyPurchases(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllDownloadMyPurchases(spKey!);   
   }
  
  
  
    Future editRateProductMyPurchases()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editRateProduct;
    editRateProduct = await apiRepProvider?.getRateProductMyPurchasesEdit(url!, id!, title!);
    return editRateProduct;
  }

  Future postRateProductMyPurchases() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postRateProduct;
    postRateProduct = await apiRepProvider?.sendRateProductMyPurchasesPost(url!,formData);
    return postRateProduct;
  }
  
    Future postRateProductMyPurchasesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postRateProduct;
    postRateProduct = await apiRepProvider?.sendRateProductMyPurchasesPostWithID(url!,formData, id!, title!);
    return postRateProduct;
  }
  
      Future getRateProductMyPurchases(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getRateProduct;
        getRateProduct = await apiRepProvider?.getRateProductMyPurchases(url!, id!, title!, spKey!);
	    return getRateProduct ;
	 }
   Future<RateProductMyPurchasesModel> loadRateProductMyPurchases() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadRateProduct;
        loadRateProduct = await apiRepProvider?.loadRateProductMyPurchases('');
	    return loadRateProduct ;  
   }
  
   Future saveRateProductMyPurchases(RateProductMyPurchasesModel? my_purchases, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateRateProductMyPurchases(my_purchases!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllRateProductMyPurchases(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllRateProductMyPurchases(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MyPurchasesListing extends Bloc<MyPurchasesEvent, MyPurchasesState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MyPurchasesListing(this.application, this.url, this.isSearch, MyPurchasesState initialState):
  super(initialState){
     on<MyPurchasesList>(_MyPurchasesListEvent);
	
	  on<MyPurchasesListingRefresh>(_MyPurchasesListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MyPurchasesEvent, MyPurchasesState>> transformEvents(
      Stream<MyPurchasesEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MyPurchasesEvent> transform<MyPurchasesEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MyPurchasesEvent, MyPurchasesState> transition) {
    print(transition);
  }

  @override
  get initialState => MyPurchasesListingUninitialized();

void _MyPurchasesListEvent(MyPurchasesList event, Emitter<MyPurchasesState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MyPurchasesListingUninitialized){
			  if(isSearch!){
			     MyPurchasesListingModel? my_purchases = await listingSearchMyPurchases(1);
				  int deltaPage;
				  if(my_purchases?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_purchases?.items.items.length ~/ (my_purchases?.tools.paging.total_rows/my_purchases?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_purchases?.items.items.isEmpty
					  ? MyPurchasesListingLoaded(my_purchases: my_purchases!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyPurchasesListingLoaded(my_purchases: my_purchases!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MyPurchasesListingModel? my_purchases = await listingMyPurchases(1);
				   int deltaPage;
				  if(my_purchases?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_purchases?.items.items.length ~/ (my_purchases?.tools.paging.total_rows/my_purchases?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_purchases?.items.items.isEmpty
					  ? MyPurchasesListingLoaded(my_purchases: my_purchases!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyPurchasesListingLoaded(my_purchases: my_purchases!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MyPurchasesListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyPurchasesListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyPurchasesListingLoaded).page! + 1;
			 if ((currentState as MyPurchasesListingLoaded).my_purchases?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MyPurchasesListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MyPurchasesListingModel? my_purchases = await listingSearchMyPurchases(page);
						  if(!my_purchases?.items.items.isEmpty){
							 (currentState as MyPurchasesListingLoaded).my_purchases?.items.items.addAll(my_purchases?.items.items);
						  }
						  return emit ( my_purchases?.items.items.isEmpty
							  ? (currentState as MyPurchasesListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyPurchasesListingLoaded(  my_purchases:  (currentState as MyPurchasesListingLoaded).my_purchases! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MyPurchasesListingLoaded).page! + 1;
							  if ((currentState as MyPurchasesListingLoaded).my_purchases?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MyPurchasesListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MyPurchasesListingModel? my_purchases = await listingMyPurchases(page);
							  return emit ( my_purchases?.items.items.isEmpty
								  ? (currentState as MyPurchasesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyPurchasesListingLoaded(  my_purchases:  my_purchases! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MyPurchasesListingError());
        
      }
    }
  }

void _MyPurchasesListingRefreshEvent(MyPurchasesListingRefresh event, Emitter<MyPurchasesState> emit)async{
  final currentState = state;
   try {
        if (currentState is MyPurchasesListingUninitialized) {
		   if(isSearch!){

			    MyPurchasesListingModel? my_purchases = await listingSearchMyPurchases(1);
              return emit (  MyPurchasesListingLoaded( my_purchases: my_purchases!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MyPurchasesListingModel? my_purchases = await listingMyPurchases(1);
				   return emit (  MyPurchasesListingLoaded( my_purchases: my_purchases!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MyPurchasesListingLoaded) {
		  if(isSearch!){
		     MyPurchasesListingModel? my_purchases = await listingSearchRefreshMyPurchases();
              return emit (  my_purchases?.items.items.isEmpty
              ? (currentState as MyPurchasesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyPurchasesListingLoaded(  my_purchases: my_purchases! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MyPurchasesListingModel? my_purchases = await listingMyPurchases(1);
				  int deltaPage = my_purchases?.items.items.length ~/ (my_purchases?.tools.paging.total_rows/my_purchases?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_purchases?.items.items.isEmpty
					  ? (currentState as MyPurchasesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyPurchasesListingLoaded(my_purchases: my_purchases!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MyPurchasesListingError());
      }
  }

  @override

  Stream<MyPurchasesState> mapEventToState(MyPurchasesEvent event) async* {
    final currentState = state;
    if (event is MyPurchasesList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MyPurchasesListingUninitialized){
			  if(isSearch!){
			     MyPurchasesListingModel? my_purchases = await listingSearchMyPurchases(1);
				  int deltaPage;
				  if(my_purchases?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_purchases?.items.items.length ~/ (my_purchases?.tools.paging.total_rows/my_purchases?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_purchases?.items.items.isEmpty
					  ? MyPurchasesListingLoaded(my_purchases: my_purchases!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyPurchasesListingLoaded(my_purchases: my_purchases!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MyPurchasesListingModel? my_purchases = await listingMyPurchases(1);
				   int deltaPage;
				  if(my_purchases?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_purchases?.items.items.length ~/ (my_purchases?.tools.paging.total_rows/my_purchases?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_purchases?.items.items.isEmpty
					  ? MyPurchasesListingLoaded(my_purchases: my_purchases!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyPurchasesListingLoaded(my_purchases: my_purchases!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MyPurchasesListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyPurchasesListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyPurchasesListingLoaded).page! + 1;
			 if ((currentState as MyPurchasesListingLoaded).my_purchases?.tools.paging.total_pages == oldpage) {
					yield (currentState as MyPurchasesListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MyPurchasesListingModel? my_purchases = await listingSearchMyPurchases(page);
						  if(!my_purchases?.items.items.isEmpty){
							 (currentState as MyPurchasesListingLoaded).my_purchases?.items.items.addAll(my_purchases?.items.items);
						  }
						  yield my_purchases?.items.items.isEmpty
							  ? (currentState as MyPurchasesListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyPurchasesListingLoaded(  my_purchases:  (currentState as MyPurchasesListingLoaded).my_purchases! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MyPurchasesListingLoaded).page! + 1;
							  if ((currentState as MyPurchasesListingLoaded).my_purchases?.tools.paging.total_pages == oldpage) {
						yield (currentState as MyPurchasesListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MyPurchasesListingModel? my_purchases = await listingMyPurchases(page);
							  yield my_purchases?.items.items.isEmpty
								  ? (currentState as MyPurchasesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyPurchasesListingLoaded(  my_purchases:  my_purchases! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MyPurchasesListingError();
        
      }
    } else if (event is MyPurchasesListingRefresh){
      try {
        if (currentState is MyPurchasesListingUninitialized) {
		   if(isSearch!){

			    MyPurchasesListingModel? my_purchases = await listingSearchMyPurchases(1);
              yield MyPurchasesListingLoaded( my_purchases: my_purchases!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MyPurchasesListingModel? my_purchases = await listingMyPurchases(1);
				   yield MyPurchasesListingLoaded( my_purchases: my_purchases!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MyPurchasesListingLoaded) {
		  if(isSearch!){
		     MyPurchasesListingModel? my_purchases = await listingSearchRefreshMyPurchases();
              yield my_purchases?.items.items.isEmpty
              ? (currentState as MyPurchasesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyPurchasesListingLoaded(  my_purchases: my_purchases! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MyPurchasesListingModel? my_purchases = await listingMyPurchases(1);
				  int deltaPage = my_purchases?.items.items.length ~/ (my_purchases?.tools.paging.total_rows/my_purchases?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_purchases?.items.items.isEmpty
					  ? (currentState as MyPurchasesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyPurchasesListingLoaded(my_purchases: my_purchases!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MyPurchasesListingError();
      }

    }
  }

  bool hasReachedMax(MyPurchasesState state) =>
      state is MyPurchasesListingLoaded && state.hasReachedMax!;

  Future<MyPurchasesListingModel?> listingMyPurchases(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyPurchasesList(url!, page!);
  }

  Future<MyPurchasesListingModel?> listingRefreshMyPurchases() async {
    MyPurchasesListingModel? my_purchases;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMyPurchasesList();
    my_purchases  = await apiRepProvider?.getMyPurchasesList(url!, 1);
    return my_purchases;
  }
  
  

  Future<MyPurchasesListingModel?> listingSearchMyPurchases(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyPurchasesListSearch(url!, page!);
  }

  Future<MyPurchasesListingModel?> listingSearchRefreshMyPurchases() async {
    MyPurchasesListingModel? my_purchases ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_purchases  = await apiRepProvider?.getMyPurchasesListSearch(url!, 1);
    return my_purchases;
  }
}


