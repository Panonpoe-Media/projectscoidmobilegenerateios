
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class PastProjectsController {

  ProjectscoidApplication application;
  PastProjectsListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  PastProjectsController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new PastProjectsListing(this.application, this.url!, this.isSearch, PastProjectsListingUninitialized());}
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

  Future editPastProjects()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editPastProjects;
    editPastProjects = await apiRepProvider?.getPastProjectsEdit(url!, id!, title!);
    return editPastProjects;
  }
  
    Future viewPastProjects()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var viewPastProjects;
    viewPastProjects = await apiRepProvider?.getPastProjectsView(url!, id!, title!);
    return viewPastProjects;
  }

  Future postPastProjects() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postPastProjects;
    postPastProjects = await apiRepProvider?.sendPastProjectsPost(url!,formData);
    return postPastProjects;
  }
  
    Future postPastProjectsWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postPastProjects;
    postPastProjects = await apiRepProvider?.sendPastProjectsPostWithID(url!,formData, id!, title!);
    return postPastProjects;
  }

  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class PastProjectsListing extends Bloc<PastProjectsEvent, PastProjectsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  PastProjectsListing(this.application, this.url, this.isSearch, PastProjectsState initialState):
  super(initialState){
     on<PastProjectsList>(_PastProjectsListEvent);
	
	  on<PastProjectsListingRefresh>(_PastProjectsListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<PastProjectsEvent, PastProjectsState>> transformEvents(
      Stream<PastProjectsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<PastProjectsEvent> transform<PastProjectsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<PastProjectsEvent, PastProjectsState> transition) {
    print(transition);
  }

  @override
  get initialState => PastProjectsListingUninitialized();

void _PastProjectsListEvent(PastProjectsList event, Emitter<PastProjectsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is PastProjectsListingUninitialized){
			  if(isSearch!){
			     PastProjectsListingModel? past_projects = await listingSearchPastProjects(1);
				  int deltaPage;
				  if(past_projects?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  past_projects?.items.items.length ~/ (past_projects?.tools.paging.total_rows/past_projects?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( past_projects?.items.items.isEmpty
					  ? PastProjectsListingLoaded(past_projects: past_projects!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : PastProjectsListingLoaded(past_projects: past_projects!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  PastProjectsListingModel? past_projects = await listingPastProjects(1);
				   int deltaPage;
				  if(past_projects?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  past_projects?.items.items.length ~/ (past_projects?.tools.paging.total_rows/past_projects?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( past_projects?.items.items.isEmpty
					  ? PastProjectsListingLoaded(past_projects: past_projects!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :PastProjectsListingLoaded(past_projects: past_projects!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is PastProjectsListingLoaded) {
          //page++;
		    final oldpage = (currentState as PastProjectsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as PastProjectsListingLoaded).page! + 1;
			 if ((currentState as PastProjectsListingLoaded).past_projects?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as PastProjectsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      PastProjectsListingModel? past_projects = await listingSearchPastProjects(page);
						  if(!past_projects?.items.items.isEmpty){
							 (currentState as PastProjectsListingLoaded).past_projects?.items.items.addAll(past_projects?.items.items);
						  }
						  return emit ( past_projects?.items.items.isEmpty
							  ? (currentState as PastProjectsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : PastProjectsListingLoaded(  past_projects:  (currentState as PastProjectsListingLoaded).past_projects! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as PastProjectsListingLoaded).page! + 1;
							  if ((currentState as PastProjectsListingLoaded).past_projects?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as PastProjectsListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  PastProjectsListingModel? past_projects = await listingPastProjects(page);
							  return emit ( past_projects?.items.items.isEmpty
								  ? (currentState as PastProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : PastProjectsListingLoaded(  past_projects:  past_projects! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( PastProjectsListingError());
        
      }
    }
  }

void _PastProjectsListingRefreshEvent(PastProjectsListingRefresh event, Emitter<PastProjectsState> emit)async{
  final currentState = state;
   try {
        if (currentState is PastProjectsListingUninitialized) {
		   if(isSearch!){

			    PastProjectsListingModel? past_projects = await listingSearchPastProjects(1);
              return emit (  PastProjectsListingLoaded( past_projects: past_projects!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    PastProjectsListingModel? past_projects = await listingPastProjects(1);
				   return emit (  PastProjectsListingLoaded( past_projects: past_projects!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is PastProjectsListingLoaded) {
		  if(isSearch!){
		     PastProjectsListingModel? past_projects = await listingSearchRefreshPastProjects();
              return emit (  past_projects?.items.items.isEmpty
              ? (currentState as PastProjectsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PastProjectsListingLoaded(  past_projects: past_projects! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  PastProjectsListingModel? past_projects = await listingPastProjects(1);
				  int deltaPage = past_projects?.items.items.length ~/ (past_projects?.tools.paging.total_rows/past_projects?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  past_projects?.items.items.isEmpty
					  ? (currentState as PastProjectsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PastProjectsListingLoaded(past_projects: past_projects!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  PastProjectsListingError());
      }
  }

  @override

  Stream<PastProjectsState> mapEventToState(PastProjectsEvent event) async* {
    final currentState = state;
    if (event is PastProjectsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PastProjectsListingUninitialized){
			  if(isSearch!){
			     PastProjectsListingModel? past_projects = await listingSearchPastProjects(1);
				  int deltaPage;
				  if(past_projects?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  past_projects?.items.items.length ~/ (past_projects?.tools.paging.total_rows/past_projects?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield past_projects?.items.items.isEmpty
					  ? PastProjectsListingLoaded(past_projects: past_projects!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : PastProjectsListingLoaded(past_projects: past_projects!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  PastProjectsListingModel? past_projects = await listingPastProjects(1);
				   int deltaPage;
				  if(past_projects?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  past_projects?.items.items.length ~/ (past_projects?.tools.paging.total_rows/past_projects?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield past_projects?.items.items.isEmpty
					  ? PastProjectsListingLoaded(past_projects: past_projects!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :PastProjectsListingLoaded(past_projects: past_projects!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is PastProjectsListingLoaded) {
          //page++;
		    final oldpage = (currentState as PastProjectsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as PastProjectsListingLoaded).page! + 1;
			 if ((currentState as PastProjectsListingLoaded).past_projects?.tools.paging.total_pages == oldpage) {
					yield (currentState as PastProjectsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      PastProjectsListingModel? past_projects = await listingSearchPastProjects(page);
						  if(!past_projects?.items.items.isEmpty){
							 (currentState as PastProjectsListingLoaded).past_projects?.items.items.addAll(past_projects?.items.items);
						  }
						  yield past_projects?.items.items.isEmpty
							  ? (currentState as PastProjectsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : PastProjectsListingLoaded(  past_projects:  (currentState as PastProjectsListingLoaded).past_projects! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as PastProjectsListingLoaded).page! + 1;
							  if ((currentState as PastProjectsListingLoaded).past_projects?.tools.paging.total_pages == oldpage) {
						yield (currentState as PastProjectsListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  PastProjectsListingModel? past_projects = await listingPastProjects(page);
							  yield past_projects?.items.items.isEmpty
								  ? (currentState as PastProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : PastProjectsListingLoaded(  past_projects:  past_projects! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield PastProjectsListingError();
        
      }
    } else if (event is PastProjectsListingRefresh){
      try {
        if (currentState is PastProjectsListingUninitialized) {
		   if(isSearch!){

			    PastProjectsListingModel? past_projects = await listingSearchPastProjects(1);
              yield PastProjectsListingLoaded( past_projects: past_projects!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    PastProjectsListingModel? past_projects = await listingPastProjects(1);
				   yield PastProjectsListingLoaded( past_projects: past_projects!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is PastProjectsListingLoaded) {
		  if(isSearch!){
		     PastProjectsListingModel? past_projects = await listingSearchRefreshPastProjects();
              yield past_projects?.items.items.isEmpty
              ? (currentState as PastProjectsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PastProjectsListingLoaded(  past_projects: past_projects! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  PastProjectsListingModel? past_projects = await listingPastProjects(1);
				  int deltaPage = past_projects?.items.items.length ~/ (past_projects?.tools.paging.total_rows/past_projects?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield past_projects?.items.items.isEmpty
					  ? (currentState as PastProjectsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :PastProjectsListingLoaded(past_projects: past_projects!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield PastProjectsListingError();
      }

    }
  }

  bool hasReachedMax(PastProjectsState state) =>
      state is PastProjectsListingLoaded && state.hasReachedMax!;

  Future<PastProjectsListingModel?> listingPastProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getPastProjectsList(url!, page!);
  }

  Future<PastProjectsListingModel?> listingRefreshPastProjects() async {
    PastProjectsListingModel? past_projects;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllPastProjectsList();
    past_projects  = await apiRepProvider?.getPastProjectsList(url!, 1);
    return past_projects;
  }
  
  

  Future<PastProjectsListingModel?> listingSearchPastProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getPastProjectsListSearch(url!, page!);
  }

  Future<PastProjectsListingModel?> listingSearchRefreshPastProjects() async {
    PastProjectsListingModel? past_projects ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    past_projects  = await apiRepProvider?.getPastProjectsListSearch(url!, 1);
    return past_projects;
  }
}


