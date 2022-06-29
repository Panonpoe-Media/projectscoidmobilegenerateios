
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class KelurahanController {

  ProjectscoidApplication application;
  KelurahanListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  KelurahanController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new KelurahanListing(this.application, this.url!, this.isSearch, KelurahanListingUninitialized());}
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

  Future editKelurahan()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editKelurahan;
    editKelurahan = await apiRepProvider?.getKelurahanEdit(url!, id!, title!);
    return editKelurahan;
  }
  
    Future viewKelurahan()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewKelurahan;
    viewKelurahan = await apiRepProvider?.getKelurahanView(url!, id!, title!);
    return viewKelurahan;
  }

  Future postKelurahan() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postKelurahan;
    postKelurahan = await apiRepProvider?.sendKelurahanPost(url!,formData);
    return postKelurahan;
  }
  
    Future postKelurahanWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postKelurahan;
    postKelurahan = await apiRepProvider?.sendKelurahanPostWithID(url!,formData, id!, title!);
    return postKelurahan;
  }

  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class KelurahanListing extends Bloc<KelurahanEvent, KelurahanState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  KelurahanListing(this.application, this.url, this.isSearch, KelurahanState initialState):
  super(initialState){
     on<KelurahanList>(_KelurahanListEvent);
	
	  on<KelurahanListingRefresh>(_KelurahanListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<KelurahanEvent, KelurahanState>> transformEvents(
      Stream<KelurahanEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<KelurahanEvent> transform<KelurahanEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<KelurahanEvent, KelurahanState> transition) {
    print(transition);
  }

  @override
  get initialState => KelurahanListingUninitialized();

void _KelurahanListEvent(KelurahanList event, Emitter<KelurahanState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is KelurahanListingUninitialized){
			  if(isSearch!){
			     KelurahanListingModel? kelurahan = await listingSearchKelurahan(1);
				  int deltaPage;
				  if(kelurahan?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  kelurahan?.items.items.length ~/ (kelurahan?.tools.paging.total_rows/kelurahan?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( kelurahan?.items.items.isEmpty
					  ? KelurahanListingLoaded(kelurahan: kelurahan!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : KelurahanListingLoaded(kelurahan: kelurahan!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  KelurahanListingModel? kelurahan = await listingKelurahan(1);
				   int deltaPage;
				  if(kelurahan?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  kelurahan?.items.items.length ~/ (kelurahan?.tools.paging.total_rows/kelurahan?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( kelurahan?.items.items.isEmpty
					  ? KelurahanListingLoaded(kelurahan: kelurahan!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :KelurahanListingLoaded(kelurahan: kelurahan!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is KelurahanListingLoaded) {
          //page++;
		    final oldpage = (currentState as KelurahanListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as KelurahanListingLoaded).page! + 1;
			 if ((currentState as KelurahanListingLoaded).kelurahan?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as KelurahanListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      KelurahanListingModel? kelurahan = await listingSearchKelurahan(page);
						  if(!kelurahan?.items.items.isEmpty){
							 (currentState as KelurahanListingLoaded).kelurahan?.items.items.addAll(kelurahan?.items.items);
						  }
						  return emit ( kelurahan?.items.items.isEmpty
							  ? (currentState as KelurahanListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : KelurahanListingLoaded(  kelurahan:  (currentState as KelurahanListingLoaded).kelurahan! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as KelurahanListingLoaded).page! + 1;
							  if ((currentState as KelurahanListingLoaded).kelurahan?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as KelurahanListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  KelurahanListingModel? kelurahan = await listingKelurahan(page);
							  return emit ( kelurahan?.items.items.isEmpty
								  ? (currentState as KelurahanListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : KelurahanListingLoaded(  kelurahan:  kelurahan! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( KelurahanListingError());
        
      }
    }
  }

void _KelurahanListingRefreshEvent(KelurahanListingRefresh event, Emitter<KelurahanState> emit)async{
  final currentState = state;
   try {
        if (currentState is KelurahanListingUninitialized) {
		   if(isSearch!){

			    KelurahanListingModel? kelurahan = await listingSearchKelurahan(1);
              return emit (  KelurahanListingLoaded( kelurahan: kelurahan!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    KelurahanListingModel? kelurahan = await listingKelurahan(1);
				   return emit (  KelurahanListingLoaded( kelurahan: kelurahan!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is KelurahanListingLoaded) {
		  if(isSearch!){
		     KelurahanListingModel? kelurahan = await listingSearchRefreshKelurahan();
              return emit (  kelurahan?.items.items.isEmpty
              ? (currentState as KelurahanListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : KelurahanListingLoaded(  kelurahan: kelurahan! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  KelurahanListingModel? kelurahan = await listingKelurahan(1);
				  int deltaPage = kelurahan?.items.items.length ~/ (kelurahan?.tools.paging.total_rows/kelurahan?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  kelurahan?.items.items.isEmpty
					  ? (currentState as KelurahanListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :KelurahanListingLoaded(kelurahan: kelurahan!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  KelurahanListingError());
      }
  }

  @override

  Stream<KelurahanState> mapEventToState(KelurahanEvent event) async* {
    final currentState = state;
    if (event is KelurahanList && !hasReachedMax(currentState)) {
      try {
        if (currentState is KelurahanListingUninitialized){
			  if(isSearch!){
			     KelurahanListingModel? kelurahan = await listingSearchKelurahan(1);
				  int deltaPage;
				  if(kelurahan?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  kelurahan?.items.items.length ~/ (kelurahan?.tools.paging.total_rows/kelurahan?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield kelurahan?.items.items.isEmpty
					  ? KelurahanListingLoaded(kelurahan: kelurahan!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : KelurahanListingLoaded(kelurahan: kelurahan!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  KelurahanListingModel? kelurahan = await listingKelurahan(1);
				   int deltaPage;
				  if(kelurahan?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  kelurahan?.items.items.length ~/ (kelurahan?.tools.paging.total_rows/kelurahan?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield kelurahan?.items.items.isEmpty
					  ? KelurahanListingLoaded(kelurahan: kelurahan!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :KelurahanListingLoaded(kelurahan: kelurahan!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is KelurahanListingLoaded) {
          //page++;
		    final oldpage = (currentState as KelurahanListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as KelurahanListingLoaded).page! + 1;
			 if ((currentState as KelurahanListingLoaded).kelurahan?.tools.paging.total_pages == oldpage) {
					yield (currentState as KelurahanListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      KelurahanListingModel? kelurahan = await listingSearchKelurahan(page);
						  if(!kelurahan?.items.items.isEmpty){
							 (currentState as KelurahanListingLoaded).kelurahan?.items.items.addAll(kelurahan?.items.items);
						  }
						  yield kelurahan?.items.items.isEmpty
							  ? (currentState as KelurahanListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : KelurahanListingLoaded(  kelurahan:  (currentState as KelurahanListingLoaded).kelurahan! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as KelurahanListingLoaded).page! + 1;
							  if ((currentState as KelurahanListingLoaded).kelurahan?.tools.paging.total_pages == oldpage) {
						yield (currentState as KelurahanListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  KelurahanListingModel? kelurahan = await listingKelurahan(page);
							  yield kelurahan?.items.items.isEmpty
								  ? (currentState as KelurahanListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : KelurahanListingLoaded(  kelurahan:  kelurahan! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield KelurahanListingError();
        
      }
    } else if (event is KelurahanListingRefresh){
      try {
        if (currentState is KelurahanListingUninitialized) {
		   if(isSearch!){

			    KelurahanListingModel? kelurahan = await listingSearchKelurahan(1);
              yield KelurahanListingLoaded( kelurahan: kelurahan!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    KelurahanListingModel? kelurahan = await listingKelurahan(1);
				   yield KelurahanListingLoaded( kelurahan: kelurahan!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is KelurahanListingLoaded) {
		  if(isSearch!){
		     KelurahanListingModel? kelurahan = await listingSearchRefreshKelurahan();
              yield kelurahan?.items.items.isEmpty
              ? (currentState as KelurahanListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : KelurahanListingLoaded(  kelurahan: kelurahan! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  KelurahanListingModel? kelurahan = await listingKelurahan(1);
				  int deltaPage = kelurahan?.items.items.length ~/ (kelurahan?.tools.paging.total_rows/kelurahan?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield kelurahan?.items.items.isEmpty
					  ? (currentState as KelurahanListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :KelurahanListingLoaded(kelurahan: kelurahan!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield KelurahanListingError();
      }

    }
  }

  bool hasReachedMax(KelurahanState state) =>
      state is KelurahanListingLoaded && state.hasReachedMax!;

  Future<KelurahanListingModel?> listingKelurahan(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getKelurahanList(url!, page!);
  }

  Future<KelurahanListingModel?> listingRefreshKelurahan() async {
    KelurahanListingModel? kelurahan;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllKelurahanList();
    kelurahan  = await apiRepProvider?.getKelurahanList(url!, 1);
    return kelurahan;
  }
  
  

  Future<KelurahanListingModel?> listingSearchKelurahan(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getKelurahanListSearch(url!, page!);
  }

  Future<KelurahanListingModel?> listingSearchRefreshKelurahan() async {
    KelurahanListingModel? kelurahan ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    kelurahan  = await apiRepProvider?.getKelurahanListSearch(url!, 1);
    return kelurahan;
  }
}


