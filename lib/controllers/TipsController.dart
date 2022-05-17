
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class TipsController {

  ProjectscoidApplication application;
  TipsListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  TipsController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new TipsListing(this.application, this.url!, this.isSearch, TipsListingUninitialized());}
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

  Future editTips()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editTips;
    editTips = await apiRepProvider?.getTipsEdit(url!, id!, title!);
    return editTips;
  }
  
    Future viewTips()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var viewTips;
    viewTips = await apiRepProvider?.getTipsView(url!, id!, title!);
    return viewTips;
  }

  Future postTips() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postTips;
    postTips = await apiRepProvider?.sendTipsPost(url!,formData);
    return postTips;
  }
  
    Future postTipsWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postTips;
    postTips = await apiRepProvider?.sendTipsPostWithID(url!,formData, id!, title!);
    return postTips;
  }

  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class TipsListing extends Bloc<TipsEvent, TipsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  TipsListing(this.application, this.url, this.isSearch, TipsState initialState):
  super(initialState){
     on<TipsList>(_TipsListEvent);
	
	  on<TipsListingRefresh>(_TipsListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<TipsEvent, TipsState>> transformEvents(
      Stream<TipsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<TipsEvent> transform<TipsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<TipsEvent, TipsState> transition) {
    print(transition);
  }

  @override
  get initialState => TipsListingUninitialized();

void _TipsListEvent(TipsList event, Emitter<TipsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is TipsListingUninitialized){
			  if(isSearch!){
			     TipsListingModel? tips = await listingSearchTips(1);
				  int deltaPage;
				  if(tips?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  tips?.items.items.length ~/ (tips?.tools.paging.total_rows/tips?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( tips?.items.items.isEmpty
					  ? TipsListingLoaded(tips: tips!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : TipsListingLoaded(tips: tips!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  TipsListingModel? tips = await listingTips(1);
				   int deltaPage;
				  if(tips?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  tips?.items.items.length ~/ (tips?.tools.paging.total_rows/tips?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( tips?.items.items.isEmpty
					  ? TipsListingLoaded(tips: tips!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :TipsListingLoaded(tips: tips!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is TipsListingLoaded) {
          //page++;
		    final oldpage = (currentState as TipsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as TipsListingLoaded).page! + 1;
			 if ((currentState as TipsListingLoaded).tips?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as TipsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      TipsListingModel? tips = await listingSearchTips(page);
						  if(!tips?.items.items.isEmpty){
							 (currentState as TipsListingLoaded).tips?.items.items.addAll(tips?.items.items);
						  }
						  return emit ( tips?.items.items.isEmpty
							  ? (currentState as TipsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : TipsListingLoaded(  tips:  (currentState as TipsListingLoaded).tips! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as TipsListingLoaded).page! + 1;
							  if ((currentState as TipsListingLoaded).tips?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as TipsListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  TipsListingModel? tips = await listingTips(page);
							  return emit ( tips?.items.items.isEmpty
								  ? (currentState as TipsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : TipsListingLoaded(  tips:  tips! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( TipsListingError());
        
      }
    }
  }

void _TipsListingRefreshEvent(TipsListingRefresh event, Emitter<TipsState> emit)async{
  final currentState = state;
   try {
        if (currentState is TipsListingUninitialized) {
		   if(isSearch!){

			    TipsListingModel? tips = await listingSearchTips(1);
              return emit (  TipsListingLoaded( tips: tips!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    TipsListingModel? tips = await listingTips(1);
				   return emit (  TipsListingLoaded( tips: tips!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is TipsListingLoaded) {
		  if(isSearch!){
		     TipsListingModel? tips = await listingSearchRefreshTips();
              return emit (  tips?.items.items.isEmpty
              ? (currentState as TipsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : TipsListingLoaded(  tips: tips! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  TipsListingModel? tips = await listingTips(1);
				  int deltaPage = tips?.items.items.length ~/ (tips?.tools.paging.total_rows/tips?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  tips?.items.items.isEmpty
					  ? (currentState as TipsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :TipsListingLoaded(tips: tips!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  TipsListingError());
      }
  }

  @override

  Stream<TipsState> mapEventToState(TipsEvent event) async* {
    final currentState = state;
    if (event is TipsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is TipsListingUninitialized){
			  if(isSearch!){
			     TipsListingModel? tips = await listingSearchTips(1);
				  int deltaPage;
				  if(tips?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  tips?.items.items.length ~/ (tips?.tools.paging.total_rows/tips?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield tips?.items.items.isEmpty
					  ? TipsListingLoaded(tips: tips!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : TipsListingLoaded(tips: tips!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  TipsListingModel? tips = await listingTips(1);
				   int deltaPage;
				  if(tips?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  tips?.items.items.length ~/ (tips?.tools.paging.total_rows/tips?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield tips?.items.items.isEmpty
					  ? TipsListingLoaded(tips: tips!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :TipsListingLoaded(tips: tips!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is TipsListingLoaded) {
          //page++;
		    final oldpage = (currentState as TipsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as TipsListingLoaded).page! + 1;
			 if ((currentState as TipsListingLoaded).tips?.tools.paging.total_pages == oldpage) {
					yield (currentState as TipsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      TipsListingModel? tips = await listingSearchTips(page);
						  if(!tips?.items.items.isEmpty){
							 (currentState as TipsListingLoaded).tips?.items.items.addAll(tips?.items.items);
						  }
						  yield tips?.items.items.isEmpty
							  ? (currentState as TipsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : TipsListingLoaded(  tips:  (currentState as TipsListingLoaded).tips! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as TipsListingLoaded).page! + 1;
							  if ((currentState as TipsListingLoaded).tips?.tools.paging.total_pages == oldpage) {
						yield (currentState as TipsListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  TipsListingModel? tips = await listingTips(page);
							  yield tips?.items.items.isEmpty
								  ? (currentState as TipsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : TipsListingLoaded(  tips:  tips! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield TipsListingError();
        
      }
    } else if (event is TipsListingRefresh){
      try {
        if (currentState is TipsListingUninitialized) {
		   if(isSearch!){

			    TipsListingModel? tips = await listingSearchTips(1);
              yield TipsListingLoaded( tips: tips!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    TipsListingModel? tips = await listingTips(1);
				   yield TipsListingLoaded( tips: tips!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is TipsListingLoaded) {
		  if(isSearch!){
		     TipsListingModel? tips = await listingSearchRefreshTips();
              yield tips?.items.items.isEmpty
              ? (currentState as TipsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : TipsListingLoaded(  tips: tips! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  TipsListingModel? tips = await listingTips(1);
				  int deltaPage = tips?.items.items.length ~/ (tips?.tools.paging.total_rows/tips?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield tips?.items.items.isEmpty
					  ? (currentState as TipsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :TipsListingLoaded(tips: tips!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield TipsListingError();
      }

    }
  }

  bool hasReachedMax(TipsState state) =>
      state is TipsListingLoaded && state.hasReachedMax!;

  Future<TipsListingModel?> listingTips(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getTipsList(url!, page!);
  }

  Future<TipsListingModel?> listingRefreshTips() async {
    TipsListingModel? tips;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllTipsList();
    tips  = await apiRepProvider?.getTipsList(url!, 1);
    return tips;
  }
  
  

  Future<TipsListingModel?> listingSearchTips(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getTipsListSearch(url!, page!);
  }

  Future<TipsListingModel?> listingSearchRefreshTips() async {
    TipsListingModel? tips ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    tips  = await apiRepProvider?.getTipsListSearch(url!, 1);
    return tips;
  }
}


