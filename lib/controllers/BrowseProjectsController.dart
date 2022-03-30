
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class BrowseProjectsController {

  ProjectscoidApplication application;
  BrowseProjectsListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  BrowseProjectsController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new BrowseProjectsListing(this.application, this.url!, this.isSearch, BrowseProjectsListingUninitialized());}
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

  Future editBrowseProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editBrowseProjects;
    editBrowseProjects = await apiRepProvider?.getBrowseProjectsEdit(url!, id!, title!);
    return editBrowseProjects;
  }
  
    Future viewBrowseProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewBrowseProjects;
    viewBrowseProjects = await apiRepProvider?.getBrowseProjectsView(url!, id!, title!);
    return viewBrowseProjects;
  }

  Future postBrowseProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBrowseProjects;
    postBrowseProjects = await apiRepProvider?.sendBrowseProjectsPost(url!,formData);
    return postBrowseProjects;
  }
  
    Future postBrowseProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBrowseProjects;
    postBrowseProjects = await apiRepProvider?.sendBrowseProjectsPostWithID(url!,formData, id!, title!);
    return postBrowseProjects;
  }

  
  
    Future editPlaceNewBidBrowseProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editPlaceNewBid;
    editPlaceNewBid = await apiRepProvider?.getPlaceNewBidBrowseProjectsEdit(url!, id!, title!);
    return editPlaceNewBid;
  }

  Future postPlaceNewBidBrowseProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPlaceNewBid;
    postPlaceNewBid = await apiRepProvider?.sendPlaceNewBidBrowseProjectsPost(url!,formData);
    return postPlaceNewBid;
  }
  
    Future postPlaceNewBidBrowseProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPlaceNewBid;
    postPlaceNewBid = await apiRepProvider?.sendPlaceNewBidBrowseProjectsPostWithID(url!,formData, id!, title!);
    return postPlaceNewBid;
  }
  
      Future getPlaceNewBidBrowseProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getPlaceNewBid;
        getPlaceNewBid = await apiRepProvider?.getPlaceNewBidBrowseProjects(url!, id!, title!, spKey!);
	    return getPlaceNewBid ;
	 }
   Future<PlaceNewBidBrowseProjectsModel> loadPlaceNewBidBrowseProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadPlaceNewBid;
        loadPlaceNewBid = await apiRepProvider?.loadPlaceNewBidBrowseProjects('');
	    return loadPlaceNewBid ;  
   }
  
   Future savePlaceNewBidBrowseProjects(PlaceNewBidBrowseProjectsModel? browse_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePlaceNewBidBrowseProjects(browse_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPlaceNewBidBrowseProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllPlaceNewBidBrowseProjects(spKey!);   
   }
  
  
  
    Future editAskOwnerBrowseProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editAskOwner;
    editAskOwner = await apiRepProvider?.getAskOwnerBrowseProjectsEdit(url!, id!, title!);
    return editAskOwner;
  }

  Future postAskOwnerBrowseProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAskOwner;
    postAskOwner = await apiRepProvider?.sendAskOwnerBrowseProjectsPost(url!,formData);
    return postAskOwner;
  }
  
    Future postAskOwnerBrowseProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAskOwner;
    postAskOwner = await apiRepProvider?.sendAskOwnerBrowseProjectsPostWithID(url!,formData, id!, title!);
    return postAskOwner;
  }
  
      Future getAskOwnerBrowseProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getAskOwner;
        getAskOwner = await apiRepProvider?.getAskOwnerBrowseProjects(url!, id!, title!, spKey!);
	    return getAskOwner ;
	 }
   Future<AskOwnerBrowseProjectsModel> loadAskOwnerBrowseProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadAskOwner;
        loadAskOwner = await apiRepProvider?.loadAskOwnerBrowseProjects('');
	    return loadAskOwner ;  
   }
  
   Future saveAskOwnerBrowseProjects(AskOwnerBrowseProjectsModel? browse_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateAskOwnerBrowseProjects(browse_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllAskOwnerBrowseProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllAskOwnerBrowseProjects(spKey!);   
   }
  
  
  
    Future editGuestCreateProjectBrowseProjects()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editGuestCreateProject;
    editGuestCreateProject = await apiRepProvider?.getGuestCreateProjectBrowseProjectsEdit(url!, id!, title!);
    return editGuestCreateProject;
  }

  Future postGuestCreateProjectBrowseProjects() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postGuestCreateProject;
    postGuestCreateProject = await apiRepProvider?.sendGuestCreateProjectBrowseProjectsPost(url!,formData);
    return postGuestCreateProject;
  }
  
    Future postGuestCreateProjectBrowseProjectsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postGuestCreateProject;
    postGuestCreateProject = await apiRepProvider?.sendGuestCreateProjectBrowseProjectsPostWithID(url!,formData, id!, title!);
    return postGuestCreateProject;
  }
  
      Future getGuestCreateProjectBrowseProjects(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getGuestCreateProject;
        getGuestCreateProject = await apiRepProvider?.getGuestCreateProjectBrowseProjects(url!, id!, title!, spKey!);
	    return getGuestCreateProject ;
	 }
   Future<GuestCreateProjectBrowseProjectsModel> loadGuestCreateProjectBrowseProjects() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadGuestCreateProject;
        loadGuestCreateProject = await apiRepProvider?.loadGuestCreateProjectBrowseProjects('');
	    return loadGuestCreateProject ;  
   }
  
   Future saveGuestCreateProjectBrowseProjects(GuestCreateProjectBrowseProjectsModel? browse_projects, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateGuestCreateProjectBrowseProjects(browse_projects!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllGuestCreateProjectBrowseProjects(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllGuestCreateProjectBrowseProjects(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class BrowseProjectsListing extends Bloc<BrowseProjectsEvent, BrowseProjectsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  BrowseProjectsListing(this.application, this.url, this.isSearch, BrowseProjectsState initialState):
  super(initialState){
     on<BrowseProjectsList>(_BrowseProjectsListEvent);
	
	  on<BrowseProjectsListingRefresh>(_BrowseProjectsListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<BrowseProjectsEvent, BrowseProjectsState>> transformEvents(
      Stream<BrowseProjectsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<BrowseProjectsEvent> transform<BrowseProjectsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<BrowseProjectsEvent, BrowseProjectsState> transition) {
    print(transition);
  }

  @override
  get initialState => BrowseProjectsListingUninitialized();

void _BrowseProjectsListEvent(BrowseProjectsList event, Emitter<BrowseProjectsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is BrowseProjectsListingUninitialized){
			  if(isSearch!){
			     BrowseProjectsListingModel? browse_projects = await listingSearchBrowseProjects(1);
				  int deltaPage;
				  if(browse_projects?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_projects?.items.items.length ~/ (browse_projects?.tools.paging.total_rows/browse_projects?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( browse_projects?.items.items.isEmpty
					  ? BrowseProjectsListingLoaded(browse_projects: browse_projects!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : BrowseProjectsListingLoaded(browse_projects: browse_projects!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  BrowseProjectsListingModel? browse_projects = await listingBrowseProjects(1);
				   int deltaPage;
				  if(browse_projects?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_projects?.items.items.length ~/ (browse_projects?.tools.paging.total_rows/browse_projects?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( browse_projects?.items.items.isEmpty
					  ? BrowseProjectsListingLoaded(browse_projects: browse_projects!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseProjectsListingLoaded(browse_projects: browse_projects!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is BrowseProjectsListingLoaded) {
          //page++;
		    final oldpage = (currentState as BrowseProjectsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as BrowseProjectsListingLoaded).page! + 1;
			 if ((currentState as BrowseProjectsListingLoaded).browse_projects?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as BrowseProjectsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      BrowseProjectsListingModel? browse_projects = await listingSearchBrowseProjects(page);
						  if(!browse_projects?.items.items.isEmpty){
							 (currentState as BrowseProjectsListingLoaded).browse_projects?.items.items.addAll(browse_projects?.items.items);
						  }
						  return emit ( browse_projects?.items.items.isEmpty
							  ? (currentState as BrowseProjectsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : BrowseProjectsListingLoaded(  browse_projects:  (currentState as BrowseProjectsListingLoaded).browse_projects! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as BrowseProjectsListingLoaded).page! + 1;
							  if ((currentState as BrowseProjectsListingLoaded).browse_projects?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as BrowseProjectsListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  BrowseProjectsListingModel? browse_projects = await listingBrowseProjects(page);
							  return emit ( browse_projects?.items.items.isEmpty
								  ? (currentState as BrowseProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : BrowseProjectsListingLoaded(  browse_projects:  browse_projects! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( BrowseProjectsListingError());
        
      }
    }
  }

void _BrowseProjectsListingRefreshEvent(BrowseProjectsListingRefresh event, Emitter<BrowseProjectsState> emit)async{
  final currentState = state;
   try {
        if (currentState is BrowseProjectsListingUninitialized) {
		   if(isSearch!){

			    BrowseProjectsListingModel? browse_projects = await listingSearchBrowseProjects(1);
              return emit (  BrowseProjectsListingLoaded( browse_projects: browse_projects!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    BrowseProjectsListingModel? browse_projects = await listingBrowseProjects(1);
				   return emit (  BrowseProjectsListingLoaded( browse_projects: browse_projects!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is BrowseProjectsListingLoaded) {
		  if(isSearch!){
		     BrowseProjectsListingModel? browse_projects = await listingSearchRefreshBrowseProjects();
              return emit (  browse_projects?.items.items.isEmpty
              ? (currentState as BrowseProjectsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : BrowseProjectsListingLoaded(  browse_projects: browse_projects! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  BrowseProjectsListingModel? browse_projects = await listingBrowseProjects(1);
				  int deltaPage = browse_projects?.items.items.length ~/ (browse_projects?.tools.paging.total_rows/browse_projects?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  browse_projects?.items.items.isEmpty
					  ? (currentState as BrowseProjectsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseProjectsListingLoaded(browse_projects: browse_projects!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  BrowseProjectsListingError());
      }
  }

  @override

  Stream<BrowseProjectsState> mapEventToState(BrowseProjectsEvent event) async* {
    final currentState = state;
    if (event is BrowseProjectsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is BrowseProjectsListingUninitialized){
			  if(isSearch!){
			     BrowseProjectsListingModel? browse_projects = await listingSearchBrowseProjects(1);
				  int deltaPage;
				  if(browse_projects?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_projects?.items.items.length ~/ (browse_projects?.tools.paging.total_rows/browse_projects?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield browse_projects?.items.items.isEmpty
					  ? BrowseProjectsListingLoaded(browse_projects: browse_projects!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : BrowseProjectsListingLoaded(browse_projects: browse_projects!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  BrowseProjectsListingModel? browse_projects = await listingBrowseProjects(1);
				   int deltaPage;
				  if(browse_projects?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_projects?.items.items.length ~/ (browse_projects?.tools.paging.total_rows/browse_projects?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield browse_projects?.items.items.isEmpty
					  ? BrowseProjectsListingLoaded(browse_projects: browse_projects!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseProjectsListingLoaded(browse_projects: browse_projects!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is BrowseProjectsListingLoaded) {
          //page++;
		    final oldpage = (currentState as BrowseProjectsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as BrowseProjectsListingLoaded).page! + 1;
			 if ((currentState as BrowseProjectsListingLoaded).browse_projects?.tools.paging.total_pages == oldpage) {
					yield (currentState as BrowseProjectsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      BrowseProjectsListingModel? browse_projects = await listingSearchBrowseProjects(page);
						  if(!browse_projects?.items.items.isEmpty){
							 (currentState as BrowseProjectsListingLoaded).browse_projects?.items.items.addAll(browse_projects?.items.items);
						  }
						  yield browse_projects?.items.items.isEmpty
							  ? (currentState as BrowseProjectsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : BrowseProjectsListingLoaded(  browse_projects:  (currentState as BrowseProjectsListingLoaded).browse_projects! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as BrowseProjectsListingLoaded).page! + 1;
							  if ((currentState as BrowseProjectsListingLoaded).browse_projects?.tools.paging.total_pages == oldpage) {
						yield (currentState as BrowseProjectsListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  BrowseProjectsListingModel? browse_projects = await listingBrowseProjects(page);
							  yield browse_projects?.items.items.isEmpty
								  ? (currentState as BrowseProjectsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : BrowseProjectsListingLoaded(  browse_projects:  browse_projects! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield BrowseProjectsListingError();
        
      }
    } else if (event is BrowseProjectsListingRefresh){
      try {
        if (currentState is BrowseProjectsListingUninitialized) {
		   if(isSearch!){

			    BrowseProjectsListingModel? browse_projects = await listingSearchBrowseProjects(1);
              yield BrowseProjectsListingLoaded( browse_projects: browse_projects!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    BrowseProjectsListingModel? browse_projects = await listingBrowseProjects(1);
				   yield BrowseProjectsListingLoaded( browse_projects: browse_projects!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is BrowseProjectsListingLoaded) {
		  if(isSearch!){
		     BrowseProjectsListingModel? browse_projects = await listingSearchRefreshBrowseProjects();
              yield browse_projects?.items.items.isEmpty
              ? (currentState as BrowseProjectsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : BrowseProjectsListingLoaded(  browse_projects: browse_projects! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  BrowseProjectsListingModel? browse_projects = await listingBrowseProjects(1);
				  int deltaPage = browse_projects?.items.items.length ~/ (browse_projects?.tools.paging.total_rows/browse_projects?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield browse_projects?.items.items.isEmpty
					  ? (currentState as BrowseProjectsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseProjectsListingLoaded(browse_projects: browse_projects!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield BrowseProjectsListingError();
      }

    }
  }

  bool hasReachedMax(BrowseProjectsState state) =>
      state is BrowseProjectsListingLoaded && state.hasReachedMax!;

  Future<BrowseProjectsListingModel?> listingBrowseProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getBrowseProjectsList(url!, page!);
  }

  Future<BrowseProjectsListingModel?> listingRefreshBrowseProjects() async {
    BrowseProjectsListingModel? browse_projects;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllBrowseProjectsList();
    browse_projects  = await apiRepProvider?.getBrowseProjectsList(url!, 1);
    return browse_projects;
  }
  
  

  Future<BrowseProjectsListingModel?> listingSearchBrowseProjects(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getBrowseProjectsListSearch(url!, page!);
  }

  Future<BrowseProjectsListingModel?> listingSearchRefreshBrowseProjects() async {
    BrowseProjectsListingModel? browse_projects ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    browse_projects  = await apiRepProvider?.getBrowseProjectsListSearch(url!, 1);
    return browse_projects;
  }
}


