
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class CeritaSuksesController {

  ProjectscoidApplication application;
  CeritaSuksesListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  CeritaSuksesController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new CeritaSuksesListing(this.application, this.url!, this.isSearch, CeritaSuksesListingUninitialized());}
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

  Future editCeritaSukses()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editCeritaSukses;
    editCeritaSukses = await apiRepProvider?.getCeritaSuksesEdit(url!, id!, title!);
    return editCeritaSukses;
  }
  
    Future viewCeritaSukses()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewCeritaSukses;
    viewCeritaSukses = await apiRepProvider?.getCeritaSuksesView(url!, id!, title!);
    return viewCeritaSukses;
  }

  Future postCeritaSukses() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCeritaSukses;
    postCeritaSukses = await apiRepProvider?.sendCeritaSuksesPost(url!,formData);
    return postCeritaSukses;
  }
  
    Future postCeritaSuksesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCeritaSukses;
    postCeritaSukses = await apiRepProvider?.sendCeritaSuksesPostWithID(url!,formData, id!, title!);
    return postCeritaSukses;
  }

  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class CeritaSuksesListing extends Bloc<CeritaSuksesEvent, CeritaSuksesState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  CeritaSuksesListing(this.application, this.url, this.isSearch, CeritaSuksesState initialState):
  super(initialState){
     on<CeritaSuksesList>(_CeritaSuksesListEvent);
	
	  on<CeritaSuksesListingRefresh>(_CeritaSuksesListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<CeritaSuksesEvent, CeritaSuksesState>> transformEvents(
      Stream<CeritaSuksesEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<CeritaSuksesEvent> transform<CeritaSuksesEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<CeritaSuksesEvent, CeritaSuksesState> transition) {
    print(transition);
  }

  @override
  get initialState => CeritaSuksesListingUninitialized();

void _CeritaSuksesListEvent(CeritaSuksesList event, Emitter<CeritaSuksesState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is CeritaSuksesListingUninitialized){
			  if(isSearch!){
			     CeritaSuksesListingModel? cerita_sukses = await listingSearchCeritaSukses(1);
				  int deltaPage;
				  if(cerita_sukses?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  cerita_sukses?.items.items.length ~/ (cerita_sukses?.tools.paging.total_rows/cerita_sukses?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( cerita_sukses?.items.items.isEmpty
					  ? CeritaSuksesListingLoaded(cerita_sukses: cerita_sukses!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : CeritaSuksesListingLoaded(cerita_sukses: cerita_sukses!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  CeritaSuksesListingModel? cerita_sukses = await listingCeritaSukses(1);
				   int deltaPage;
				  if(cerita_sukses?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  cerita_sukses?.items.items.length ~/ (cerita_sukses?.tools.paging.total_rows/cerita_sukses?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( cerita_sukses?.items.items.isEmpty
					  ? CeritaSuksesListingLoaded(cerita_sukses: cerita_sukses!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :CeritaSuksesListingLoaded(cerita_sukses: cerita_sukses!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is CeritaSuksesListingLoaded) {
          //page++;
		    final oldpage = (currentState as CeritaSuksesListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as CeritaSuksesListingLoaded).page! + 1;
			 if ((currentState as CeritaSuksesListingLoaded).cerita_sukses?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as CeritaSuksesListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      CeritaSuksesListingModel? cerita_sukses = await listingSearchCeritaSukses(page);
						  if(!cerita_sukses?.items.items.isEmpty){
							 (currentState as CeritaSuksesListingLoaded).cerita_sukses?.items.items.addAll(cerita_sukses?.items.items);
						  }
						  return emit ( cerita_sukses?.items.items.isEmpty
							  ? (currentState as CeritaSuksesListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : CeritaSuksesListingLoaded(  cerita_sukses:  (currentState as CeritaSuksesListingLoaded).cerita_sukses! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as CeritaSuksesListingLoaded).page! + 1;
							  if ((currentState as CeritaSuksesListingLoaded).cerita_sukses?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as CeritaSuksesListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  CeritaSuksesListingModel? cerita_sukses = await listingCeritaSukses(page);
							  return emit ( cerita_sukses?.items.items.isEmpty
								  ? (currentState as CeritaSuksesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : CeritaSuksesListingLoaded(  cerita_sukses:  cerita_sukses! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( CeritaSuksesListingError());
        
      }
    }
  }

void _CeritaSuksesListingRefreshEvent(CeritaSuksesListingRefresh event, Emitter<CeritaSuksesState> emit)async{
  final currentState = state;
   try {
        if (currentState is CeritaSuksesListingUninitialized) {
		   if(isSearch!){

			    CeritaSuksesListingModel? cerita_sukses = await listingSearchCeritaSukses(1);
              return emit (  CeritaSuksesListingLoaded( cerita_sukses: cerita_sukses!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    CeritaSuksesListingModel? cerita_sukses = await listingCeritaSukses(1);
				   return emit (  CeritaSuksesListingLoaded( cerita_sukses: cerita_sukses!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is CeritaSuksesListingLoaded) {
		  if(isSearch!){
		     CeritaSuksesListingModel? cerita_sukses = await listingSearchRefreshCeritaSukses();
              return emit (  cerita_sukses?.items.items.isEmpty
              ? (currentState as CeritaSuksesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CeritaSuksesListingLoaded(  cerita_sukses: cerita_sukses! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  CeritaSuksesListingModel? cerita_sukses = await listingCeritaSukses(1);
				  int deltaPage = cerita_sukses?.items.items.length ~/ (cerita_sukses?.tools.paging.total_rows/cerita_sukses?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  cerita_sukses?.items.items.isEmpty
					  ? (currentState as CeritaSuksesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CeritaSuksesListingLoaded(cerita_sukses: cerita_sukses!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  CeritaSuksesListingError());
      }
  }

  @override

  Stream<CeritaSuksesState> mapEventToState(CeritaSuksesEvent event) async* {
    final currentState = state;
    if (event is CeritaSuksesList && !hasReachedMax(currentState)) {
      try {
        if (currentState is CeritaSuksesListingUninitialized){
			  if(isSearch!){
			     CeritaSuksesListingModel? cerita_sukses = await listingSearchCeritaSukses(1);
				  int deltaPage;
				  if(cerita_sukses?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  cerita_sukses?.items.items.length ~/ (cerita_sukses?.tools.paging.total_rows/cerita_sukses?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield cerita_sukses?.items.items.isEmpty
					  ? CeritaSuksesListingLoaded(cerita_sukses: cerita_sukses!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : CeritaSuksesListingLoaded(cerita_sukses: cerita_sukses!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  CeritaSuksesListingModel? cerita_sukses = await listingCeritaSukses(1);
				   int deltaPage;
				  if(cerita_sukses?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  cerita_sukses?.items.items.length ~/ (cerita_sukses?.tools.paging.total_rows/cerita_sukses?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield cerita_sukses?.items.items.isEmpty
					  ? CeritaSuksesListingLoaded(cerita_sukses: cerita_sukses!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :CeritaSuksesListingLoaded(cerita_sukses: cerita_sukses!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is CeritaSuksesListingLoaded) {
          //page++;
		    final oldpage = (currentState as CeritaSuksesListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as CeritaSuksesListingLoaded).page! + 1;
			 if ((currentState as CeritaSuksesListingLoaded).cerita_sukses?.tools.paging.total_pages == oldpage) {
					yield (currentState as CeritaSuksesListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      CeritaSuksesListingModel? cerita_sukses = await listingSearchCeritaSukses(page);
						  if(!cerita_sukses?.items.items.isEmpty){
							 (currentState as CeritaSuksesListingLoaded).cerita_sukses?.items.items.addAll(cerita_sukses?.items.items);
						  }
						  yield cerita_sukses?.items.items.isEmpty
							  ? (currentState as CeritaSuksesListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : CeritaSuksesListingLoaded(  cerita_sukses:  (currentState as CeritaSuksesListingLoaded).cerita_sukses! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as CeritaSuksesListingLoaded).page! + 1;
							  if ((currentState as CeritaSuksesListingLoaded).cerita_sukses?.tools.paging.total_pages == oldpage) {
						yield (currentState as CeritaSuksesListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  CeritaSuksesListingModel? cerita_sukses = await listingCeritaSukses(page);
							  yield cerita_sukses?.items.items.isEmpty
								  ? (currentState as CeritaSuksesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : CeritaSuksesListingLoaded(  cerita_sukses:  cerita_sukses! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield CeritaSuksesListingError();
        
      }
    } else if (event is CeritaSuksesListingRefresh){
      try {
        if (currentState is CeritaSuksesListingUninitialized) {
		   if(isSearch!){

			    CeritaSuksesListingModel? cerita_sukses = await listingSearchCeritaSukses(1);
              yield CeritaSuksesListingLoaded( cerita_sukses: cerita_sukses!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    CeritaSuksesListingModel? cerita_sukses = await listingCeritaSukses(1);
				   yield CeritaSuksesListingLoaded( cerita_sukses: cerita_sukses!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is CeritaSuksesListingLoaded) {
		  if(isSearch!){
		     CeritaSuksesListingModel? cerita_sukses = await listingSearchRefreshCeritaSukses();
              yield cerita_sukses?.items.items.isEmpty
              ? (currentState as CeritaSuksesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CeritaSuksesListingLoaded(  cerita_sukses: cerita_sukses! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  CeritaSuksesListingModel? cerita_sukses = await listingCeritaSukses(1);
				  int deltaPage = cerita_sukses?.items.items.length ~/ (cerita_sukses?.tools.paging.total_rows/cerita_sukses?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield cerita_sukses?.items.items.isEmpty
					  ? (currentState as CeritaSuksesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :CeritaSuksesListingLoaded(cerita_sukses: cerita_sukses!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield CeritaSuksesListingError();
      }

    }
  }

  bool hasReachedMax(CeritaSuksesState state) =>
      state is CeritaSuksesListingLoaded && state.hasReachedMax!;

  Future<CeritaSuksesListingModel?> listingCeritaSukses(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getCeritaSuksesList(url!, page!);
  }

  Future<CeritaSuksesListingModel?> listingRefreshCeritaSukses() async {
    CeritaSuksesListingModel? cerita_sukses;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllCeritaSuksesList();
    cerita_sukses  = await apiRepProvider?.getCeritaSuksesList(url!, 1);
    return cerita_sukses;
  }
  
  

  Future<CeritaSuksesListingModel?> listingSearchCeritaSukses(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getCeritaSuksesListSearch(url!, page!);
  }

  Future<CeritaSuksesListingModel?> listingSearchRefreshCeritaSukses() async {
    CeritaSuksesListingModel? cerita_sukses ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    cerita_sukses  = await apiRepProvider?.getCeritaSuksesListSearch(url!, 1);
    return cerita_sukses;
  }
}


