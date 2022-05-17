
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class BrowseUsersController {

  ProjectscoidApplication application;
  BrowseUsersListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  BrowseUsersController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new BrowseUsersListing(this.application, this.url!, this.isSearch, BrowseUsersListingUninitialized());}
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

  Future editBrowseUsers()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editBrowseUsers;
    editBrowseUsers = await apiRepProvider?.getBrowseUsersEdit(url!, id!, title!);
    return editBrowseUsers;
  }
  
    Future viewBrowseUsers()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var viewBrowseUsers;
    viewBrowseUsers = await apiRepProvider?.getBrowseUsersView(url!, id!, title!);
    return viewBrowseUsers;
  }

  Future postBrowseUsers() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postBrowseUsers;
    postBrowseUsers = await apiRepProvider?.sendBrowseUsersPost(url!,formData);
    return postBrowseUsers;
  }
  
    Future postBrowseUsersWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postBrowseUsers;
    postBrowseUsers = await apiRepProvider?.sendBrowseUsersPostWithID(url!,formData, id!, title!);
    return postBrowseUsers;
  }

  
  
    Future editInviteToBidBrowseUsers()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editInviteToBid;
    editInviteToBid = await apiRepProvider?.getInviteToBidBrowseUsersEdit(url!, id!, title!);
    return editInviteToBid;
  }

  Future postInviteToBidBrowseUsers() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postInviteToBid;
    postInviteToBid = await apiRepProvider?.sendInviteToBidBrowseUsersPost(url!,formData);
    return postInviteToBid;
  }
  
    Future postInviteToBidBrowseUsersWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postInviteToBid;
    postInviteToBid = await apiRepProvider?.sendInviteToBidBrowseUsersPostWithID(url!,formData, id!, title!);
    return postInviteToBid;
  }
  
      Future getInviteToBidBrowseUsers(String spKey)async{
  
        APIRepository? apiRepProvider = application.projectsAPIRepository;
        var getInviteToBid;
        getInviteToBid = await apiRepProvider?.getInviteToBidBrowseUsers(url!, id!, title!, spKey);
	    return getInviteToBid ;
	 }
   Future<InviteToBidBrowseUsersModel> loadInviteToBidBrowseUsers() async{
   APIRepository? apiRepProvider = application.projectsAPIRepository;
        var loadInviteToBid;
        loadInviteToBid = await apiRepProvider?.loadInviteToBidBrowseUsers('');
	    return loadInviteToBid ;  
   }
  
   Future saveInviteToBidBrowseUsers(InviteToBidBrowseUsersModel? browse_users, String? spKey) async{  
       APIRepository? apiRepProvider = application.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateInviteToBidBrowseUsers(browse_users!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllInviteToBidBrowseUsers(String? spKey) async{
	 APIRepository? apiRepProvider = application.projectsAPIRepository;
       await apiRepProvider?.deleteAllInviteToBidBrowseUsers(spKey!);   
   }
  
  
  
    Future editHireMeBrowseUsers()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editHireMe;
    editHireMe = await apiRepProvider?.getHireMeBrowseUsersEdit(url!, id!, title!);
    return editHireMe;
  }

  Future postHireMeBrowseUsers() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postHireMe;
    postHireMe = await apiRepProvider?.sendHireMeBrowseUsersPost(url!,formData);
    return postHireMe;
  }
  
    Future postHireMeBrowseUsersWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postHireMe;
    postHireMe = await apiRepProvider?.sendHireMeBrowseUsersPostWithID(url!,formData, id!, title!);
    return postHireMe;
  }
  
      Future getHireMeBrowseUsers(String spKey)async{
  
        APIRepository? apiRepProvider = application.projectsAPIRepository;
        var getHireMe;
        getHireMe = await apiRepProvider?.getHireMeBrowseUsers(url!, id!, title!, spKey);
	    return getHireMe ;
	 }
   Future<HireMeBrowseUsersModel> loadHireMeBrowseUsers() async{
   APIRepository? apiRepProvider = application.projectsAPIRepository;
        var loadHireMe;
        loadHireMe = await apiRepProvider?.loadHireMeBrowseUsers('');
	    return loadHireMe ;  
   }
  
   Future saveHireMeBrowseUsers(HireMeBrowseUsersModel? browse_users, String? spKey) async{  
       APIRepository? apiRepProvider = application.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateHireMeBrowseUsers(browse_users!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllHireMeBrowseUsers(String? spKey) async{
	 APIRepository? apiRepProvider = application.projectsAPIRepository;
       await apiRepProvider?.deleteAllHireMeBrowseUsers(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class BrowseUsersListing extends Bloc<BrowseUsersEvent, BrowseUsersState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  BrowseUsersListing(this.application, this.url, this.isSearch, BrowseUsersState initialState):
  super(initialState){
     on<BrowseUsersList>(_BrowseUsersListEvent);
	
	  on<BrowseUsersListingRefresh>(_BrowseUsersListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<BrowseUsersEvent, BrowseUsersState>> transformEvents(
      Stream<BrowseUsersEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<BrowseUsersEvent> transform<BrowseUsersEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<BrowseUsersEvent, BrowseUsersState> transition) {
    print(transition);
  }

  @override
  get initialState => BrowseUsersListingUninitialized();

void _BrowseUsersListEvent(BrowseUsersList event, Emitter<BrowseUsersState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is BrowseUsersListingUninitialized){
			  if(isSearch!){
			     BrowseUsersListingModel? browse_users = await listingSearchBrowseUsers(1);
				  int deltaPage;
				  if(browse_users?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_users?.items.items.length ~/ (browse_users?.tools.paging.total_rows/browse_users?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( browse_users?.items.items.isEmpty
					  ? BrowseUsersListingLoaded(browse_users: browse_users!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : BrowseUsersListingLoaded(browse_users: browse_users!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  BrowseUsersListingModel? browse_users1 = await listingSearchBrowseUsers(1);
				  BrowseUsersListingModel? browse_users = await listingBrowseUsers(browse_users1?.tools.paging.total_pages);
				   int deltaPage;
				  if(browse_users?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_users?.items.items.length ~/ (browse_users?.tools.paging.total_rows/browse_users?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  deltaPage = browse_users?.tools.paging.total_pages;
				  return emit ( browse_users?.items.items.isEmpty
					  ? BrowseUsersListingLoaded(browse_users: browse_users!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseUsersListingLoaded(browse_users: browse_users!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is BrowseUsersListingLoaded) {
          //page++;
		    final oldpage = (currentState as BrowseUsersListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as BrowseUsersListingLoaded).page! + 1;
			 if ((currentState as BrowseUsersListingLoaded).browse_users?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as BrowseUsersListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      BrowseUsersListingModel? browse_users = await listingSearchBrowseUsers(page);
						  if(!browse_users?.items.items.isEmpty){
							 (currentState as BrowseUsersListingLoaded).browse_users?.items.items.addAll(browse_users?.items.items);
						  }
						  return emit ( browse_users?.items.items.isEmpty
							  ? (currentState as BrowseUsersListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : BrowseUsersListingLoaded(  browse_users:  (currentState as BrowseUsersListingLoaded).browse_users! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as BrowseUsersListingLoaded).page! - 1;
					  if (oldpage == 1) {
						return emit ( (currentState as BrowseUsersListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  BrowseUsersListingModel? browse_users = await listingBrowseUsers(page);
							  return emit ( browse_users?.items.items.isEmpty
								  ? (currentState as BrowseUsersListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : BrowseUsersListingLoaded(  browse_users:  browse_users! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( BrowseUsersListingError());
        
      }
    }
  }

void _BrowseUsersListingRefreshEvent(BrowseUsersListingRefresh event, Emitter<BrowseUsersState> emit)async{
  final currentState = state;
   try {
        if (currentState is BrowseUsersListingUninitialized) {
		   if(isSearch!){

			    BrowseUsersListingModel? browse_users = await listingSearchBrowseUsers(1);
              return emit (  BrowseUsersListingLoaded( browse_users: browse_users!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				  BrowseUsersListingModel? browse_users1 = await listingSearchBrowseUsers(1);
				  BrowseUsersListingModel? browse_users = await listingBrowseUsers(browse_users1?.tools.paging.total_pages);
				  return emit (  BrowseUsersListingLoaded( browse_users: browse_users!,
                   hasReachedMax: false,
                   page: browse_users.tools.paging.total_pages));

		   }

        }

        if (currentState is BrowseUsersListingLoaded) {
		  if(isSearch!){
		     BrowseUsersListingModel? browse_users = await listingSearchRefreshBrowseUsers();
              return emit (  browse_users?.items.items.isEmpty
              ? (currentState as BrowseUsersListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : BrowseUsersListingLoaded(  browse_users: browse_users! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  BrowseUsersListingModel? browse_users1 = await listingSearchBrowseUsers(1);
				  BrowseUsersListingModel? browse_users = await listingBrowseUsers(browse_users1?.tools.paging.total_pages);
				  int deltaPage = browse_users?.items.items.length ~/ (browse_users?.tools.paging.total_rows/browse_users?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  deltaPage = browse_users?.tools.paging.total_pages;
				  return emit (  browse_users?.items.items.isEmpty
					  ? (currentState as BrowseUsersListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseUsersListingLoaded(browse_users: browse_users!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  BrowseUsersListingError());
      }
  }

  @override

  Stream<BrowseUsersState> mapEventToState(BrowseUsersEvent event) async* {
    final currentState = state;
    if (event is BrowseUsersList && !hasReachedMax(currentState)) {
      try {
        if (currentState is BrowseUsersListingUninitialized){
			  if(isSearch!){
			     BrowseUsersListingModel? browse_users = await listingSearchBrowseUsers(1);
				  int deltaPage;
				  if(browse_users?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_users?.items.items.length ~/ (browse_users?.tools.paging.total_rows/browse_users?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield browse_users?.items.items.isEmpty
					  ? BrowseUsersListingLoaded(browse_users: browse_users!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : BrowseUsersListingLoaded(browse_users: browse_users!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  BrowseUsersListingModel? browse_users1 = await listingSearchBrowseUsers(1);
				  BrowseUsersListingModel? browse_users = await listingBrowseUsers(browse_users1?.tools.paging.total_pages);
				   int deltaPage;
				  if(browse_users?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  browse_users?.items.items.length ~/ (browse_users?.tools.paging.total_rows/browse_users?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  deltaPage = browse_users?.tools.paging.total_pages;
				  yield browse_users?.items.items.isEmpty
					  ? BrowseUsersListingLoaded(browse_users: browse_users!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseUsersListingLoaded(browse_users: browse_users!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is BrowseUsersListingLoaded) {
          //page++;
		    final oldpage = (currentState as BrowseUsersListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as BrowseUsersListingLoaded).page! + 1;
			 if ((currentState as BrowseUsersListingLoaded).browse_users?.tools.paging.total_pages == oldpage) {
					yield (currentState as BrowseUsersListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      BrowseUsersListingModel? browse_users = await listingSearchBrowseUsers(page);
						  if(!browse_users?.items.items.isEmpty){
							 (currentState as BrowseUsersListingLoaded).browse_users?.items.items.addAll(browse_users?.items.items);
						  }
						  yield browse_users?.items.items.isEmpty
							  ? (currentState as BrowseUsersListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : BrowseUsersListingLoaded(  browse_users:  (currentState as BrowseUsersListingLoaded).browse_users! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as BrowseUsersListingLoaded).page! - 1;
					  if (oldpage == 1) {
						yield (currentState as BrowseUsersListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  BrowseUsersListingModel? browse_users = await listingBrowseUsers(page);
							  yield browse_users?.items.items.isEmpty
								  ? (currentState as BrowseUsersListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : BrowseUsersListingLoaded(  browse_users:  browse_users! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield BrowseUsersListingError();
        
      }
    } else if (event is BrowseUsersListingRefresh){
      try {
        if (currentState is BrowseUsersListingUninitialized) {
		   if(isSearch!){

			    BrowseUsersListingModel? browse_users = await listingSearchBrowseUsers(1);
              yield BrowseUsersListingLoaded( browse_users: browse_users!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				  BrowseUsersListingModel? browse_users1 = await listingSearchBrowseUsers(1);
				  BrowseUsersListingModel? browse_users = await listingBrowseUsers(browse_users1?.tools.paging.total_pages);
				  yield BrowseUsersListingLoaded( browse_users: browse_users!,
                   hasReachedMax: false,
                   page: browse_users.tools.paging.total_pages);

		   }

        }

        if (currentState is BrowseUsersListingLoaded) {
		  if(isSearch!){
		     BrowseUsersListingModel? browse_users = await listingSearchRefreshBrowseUsers();
              yield browse_users?.items.items.isEmpty
              ? (currentState as BrowseUsersListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : BrowseUsersListingLoaded(  browse_users: browse_users! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  BrowseUsersListingModel? browse_users1 = await listingSearchBrowseUsers(1);
				  BrowseUsersListingModel? browse_users = await listingBrowseUsers(browse_users1?.tools.paging.total_pages);
				  int deltaPage = browse_users?.items.items.length ~/ (browse_users?.tools.paging.total_rows/browse_users?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  deltaPage = browse_users?.tools.paging.total_pages;
				  yield browse_users?.items.items.isEmpty
					  ? (currentState as BrowseUsersListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :BrowseUsersListingLoaded(browse_users: browse_users!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield BrowseUsersListingError();
      }

    }
  }

  bool hasReachedMax(BrowseUsersState state) =>
      state is BrowseUsersListingLoaded && state.hasReachedMax!;

  Future<BrowseUsersListingModel?> listingBrowseUsers(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getBrowseUsersList(url!, page!);
  }

  Future<BrowseUsersListingModel?> listingRefreshBrowseUsers() async {
    BrowseUsersListingModel? browse_users;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllBrowseUsersList();
    browse_users  = await apiRepProvider?.getBrowseUsersList(url!, 1);
    return browse_users;
  }
  
  

  Future<BrowseUsersListingModel?> listingSearchBrowseUsers(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getBrowseUsersListSearch(url!, page!);
  }

  Future<BrowseUsersListingModel?> listingSearchRefreshBrowseUsers() async {
    BrowseUsersListingModel? browse_users ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    browse_users  = await apiRepProvider?.getBrowseUsersListSearch(url!, 1);
    return browse_users;
  }
}


