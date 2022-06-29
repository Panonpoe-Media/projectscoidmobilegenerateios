
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class ExistingUserController {

  ProjectscoidApplication application;
  ExistingUserListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  ExistingUserController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new ExistingUserListing(this.application, this.url!, this.isSearch, ExistingUserListingUninitialized());}
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

  Future editExistingUser()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editExistingUser;
    editExistingUser = await apiRepProvider?.getExistingUserEdit(url!, id!, title!);
    return editExistingUser;
  }
  
    Future viewExistingUser()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewExistingUser;
    viewExistingUser = await apiRepProvider?.getExistingUserView(url!, id!, title!);
    return viewExistingUser;
  }

  Future postExistingUser() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postExistingUser;
    postExistingUser = await apiRepProvider?.sendExistingUserPost(url!,formData);
    return postExistingUser;
  }
  
    Future postExistingUserWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postExistingUser;
    postExistingUser = await apiRepProvider?.sendExistingUserPostWithID(url!,formData, id!, title!);
    return postExistingUser;
  }

  
  
    Future editForgotPasswordExistingUser()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editForgotPassword;
    editForgotPassword = await apiRepProvider?.getForgotPasswordExistingUserEdit(url!, id!, title!);
    return editForgotPassword;
  }

  Future postForgotPasswordExistingUser() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postForgotPassword;
    postForgotPassword = await apiRepProvider?.sendForgotPasswordExistingUserPost(url!,formData);
    return postForgotPassword;
  }
  
    Future postForgotPasswordExistingUserWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postForgotPassword;
    postForgotPassword = await apiRepProvider?.sendForgotPasswordExistingUserPostWithID(url!,formData, id!, title!);
    return postForgotPassword;
  }
  
      Future getForgotPasswordExistingUser(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getForgotPassword;
        getForgotPassword = await apiRepProvider?.getForgotPasswordExistingUser(url!, id!, title!, spKey!);
	    return getForgotPassword ;
	 }
   Future<ForgotPasswordExistingUserModel> loadForgotPasswordExistingUser() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadForgotPassword;
        loadForgotPassword = await apiRepProvider?.loadForgotPasswordExistingUser('');
	    return loadForgotPassword ;  
   }
  
   Future saveForgotPasswordExistingUser(ForgotPasswordExistingUserModel? existing_user, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateForgotPasswordExistingUser(existing_user!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllForgotPasswordExistingUser(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllForgotPasswordExistingUser(spKey!);   
   }
  
  
  
    Future editResetPasswordExistingUser()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editResetPassword;
    editResetPassword = await apiRepProvider?.getResetPasswordExistingUserEdit(url!, id!, title!);
    return editResetPassword;
  }

  Future postResetPasswordExistingUser() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postResetPassword;
    postResetPassword = await apiRepProvider?.sendResetPasswordExistingUserPost(url!,formData);
    return postResetPassword;
  }
  
    Future postResetPasswordExistingUserWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postResetPassword;
    postResetPassword = await apiRepProvider?.sendResetPasswordExistingUserPostWithID(url!,formData, id!, title!);
    return postResetPassword;
  }
  
      Future getResetPasswordExistingUser(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getResetPassword;
        getResetPassword = await apiRepProvider?.getResetPasswordExistingUser(url!, id!, title!, spKey!);
	    return getResetPassword ;
	 }
   Future<ResetPasswordExistingUserModel> loadResetPasswordExistingUser() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadResetPassword;
        loadResetPassword = await apiRepProvider?.loadResetPasswordExistingUser('');
	    return loadResetPassword ;  
   }
  
   Future saveResetPasswordExistingUser(ResetPasswordExistingUserModel? existing_user, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateResetPasswordExistingUser(existing_user!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllResetPasswordExistingUser(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllResetPasswordExistingUser(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class ExistingUserListing extends Bloc<ExistingUserEvent, ExistingUserState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  ExistingUserListing(this.application, this.url, this.isSearch, ExistingUserState initialState):
  super(initialState){
     on<ExistingUserList>(_ExistingUserListEvent);
	
	  on<ExistingUserListingRefresh>(_ExistingUserListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<ExistingUserEvent, ExistingUserState>> transformEvents(
      Stream<ExistingUserEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<ExistingUserEvent> transform<ExistingUserEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<ExistingUserEvent, ExistingUserState> transition) {
    print(transition);
  }

  @override
  get initialState => ExistingUserListingUninitialized();

void _ExistingUserListEvent(ExistingUserList event, Emitter<ExistingUserState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is ExistingUserListingUninitialized){
			  if(isSearch!){
			     ExistingUserListingModel? existing_user = await listingSearchExistingUser(1);
				  int deltaPage;
				  if(existing_user?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  existing_user?.items.items.length ~/ (existing_user?.tools.paging.total_rows/existing_user?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( existing_user?.items.items.isEmpty
					  ? ExistingUserListingLoaded(existing_user: existing_user!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : ExistingUserListingLoaded(existing_user: existing_user!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  ExistingUserListingModel? existing_user = await listingExistingUser(1);
				   int deltaPage;
				  if(existing_user?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  existing_user?.items.items.length ~/ (existing_user?.tools.paging.total_rows/existing_user?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( existing_user?.items.items.isEmpty
					  ? ExistingUserListingLoaded(existing_user: existing_user!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :ExistingUserListingLoaded(existing_user: existing_user!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ExistingUserListingLoaded) {
          //page++;
		    final oldpage = (currentState as ExistingUserListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as ExistingUserListingLoaded).page! + 1;
			 if ((currentState as ExistingUserListingLoaded).existing_user?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as ExistingUserListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      ExistingUserListingModel? existing_user = await listingSearchExistingUser(page);
						  if(!existing_user?.items.items.isEmpty){
							 (currentState as ExistingUserListingLoaded).existing_user?.items.items.addAll(existing_user?.items.items);
						  }
						  return emit ( existing_user?.items.items.isEmpty
							  ? (currentState as ExistingUserListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : ExistingUserListingLoaded(  existing_user:  (currentState as ExistingUserListingLoaded).existing_user! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as ExistingUserListingLoaded).page! + 1;
							  if ((currentState as ExistingUserListingLoaded).existing_user?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as ExistingUserListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  ExistingUserListingModel? existing_user = await listingExistingUser(page);
							  return emit ( existing_user?.items.items.isEmpty
								  ? (currentState as ExistingUserListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : ExistingUserListingLoaded(  existing_user:  existing_user! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( ExistingUserListingError());
        
      }
    }
  }

void _ExistingUserListingRefreshEvent(ExistingUserListingRefresh event, Emitter<ExistingUserState> emit)async{
  final currentState = state;
   try {
        if (currentState is ExistingUserListingUninitialized) {
		   if(isSearch!){

			    ExistingUserListingModel? existing_user = await listingSearchExistingUser(1);
              return emit (  ExistingUserListingLoaded( existing_user: existing_user!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    ExistingUserListingModel? existing_user = await listingExistingUser(1);
				   return emit (  ExistingUserListingLoaded( existing_user: existing_user!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is ExistingUserListingLoaded) {
		  if(isSearch!){
		     ExistingUserListingModel? existing_user = await listingSearchRefreshExistingUser();
              return emit (  existing_user?.items.items.isEmpty
              ? (currentState as ExistingUserListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ExistingUserListingLoaded(  existing_user: existing_user! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  ExistingUserListingModel? existing_user = await listingExistingUser(1);
				  int deltaPage = existing_user?.items.items.length ~/ (existing_user?.tools.paging.total_rows/existing_user?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  existing_user?.items.items.isEmpty
					  ? (currentState as ExistingUserListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ExistingUserListingLoaded(existing_user: existing_user!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  ExistingUserListingError());
      }
  }

  @override

  Stream<ExistingUserState> mapEventToState(ExistingUserEvent event) async* {
    final currentState = state;
    if (event is ExistingUserList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ExistingUserListingUninitialized){
			  if(isSearch!){
			     ExistingUserListingModel? existing_user = await listingSearchExistingUser(1);
				  int deltaPage;
				  if(existing_user?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  existing_user?.items.items.length ~/ (existing_user?.tools.paging.total_rows/existing_user?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield existing_user?.items.items.isEmpty
					  ? ExistingUserListingLoaded(existing_user: existing_user!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : ExistingUserListingLoaded(existing_user: existing_user!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  ExistingUserListingModel? existing_user = await listingExistingUser(1);
				   int deltaPage;
				  if(existing_user?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  existing_user?.items.items.length ~/ (existing_user?.tools.paging.total_rows/existing_user?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield existing_user?.items.items.isEmpty
					  ? ExistingUserListingLoaded(existing_user: existing_user!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :ExistingUserListingLoaded(existing_user: existing_user!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ExistingUserListingLoaded) {
          //page++;
		    final oldpage = (currentState as ExistingUserListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as ExistingUserListingLoaded).page! + 1;
			 if ((currentState as ExistingUserListingLoaded).existing_user?.tools.paging.total_pages == oldpage) {
					yield (currentState as ExistingUserListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      ExistingUserListingModel? existing_user = await listingSearchExistingUser(page);
						  if(!existing_user?.items.items.isEmpty){
							 (currentState as ExistingUserListingLoaded).existing_user?.items.items.addAll(existing_user?.items.items);
						  }
						  yield existing_user?.items.items.isEmpty
							  ? (currentState as ExistingUserListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : ExistingUserListingLoaded(  existing_user:  (currentState as ExistingUserListingLoaded).existing_user! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as ExistingUserListingLoaded).page! + 1;
							  if ((currentState as ExistingUserListingLoaded).existing_user?.tools.paging.total_pages == oldpage) {
						yield (currentState as ExistingUserListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  ExistingUserListingModel? existing_user = await listingExistingUser(page);
							  yield existing_user?.items.items.isEmpty
								  ? (currentState as ExistingUserListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : ExistingUserListingLoaded(  existing_user:  existing_user! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield ExistingUserListingError();
        
      }
    } else if (event is ExistingUserListingRefresh){
      try {
        if (currentState is ExistingUserListingUninitialized) {
		   if(isSearch!){

			    ExistingUserListingModel? existing_user = await listingSearchExistingUser(1);
              yield ExistingUserListingLoaded( existing_user: existing_user!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    ExistingUserListingModel? existing_user = await listingExistingUser(1);
				   yield ExistingUserListingLoaded( existing_user: existing_user!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is ExistingUserListingLoaded) {
		  if(isSearch!){
		     ExistingUserListingModel? existing_user = await listingSearchRefreshExistingUser();
              yield existing_user?.items.items.isEmpty
              ? (currentState as ExistingUserListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ExistingUserListingLoaded(  existing_user: existing_user! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  ExistingUserListingModel? existing_user = await listingExistingUser(1);
				  int deltaPage = existing_user?.items.items.length ~/ (existing_user?.tools.paging.total_rows/existing_user?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield existing_user?.items.items.isEmpty
					  ? (currentState as ExistingUserListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ExistingUserListingLoaded(existing_user: existing_user!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield ExistingUserListingError();
      }

    }
  }

  bool hasReachedMax(ExistingUserState state) =>
      state is ExistingUserListingLoaded && state.hasReachedMax!;

  Future<ExistingUserListingModel?> listingExistingUser(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getExistingUserList(url!, page!);
  }

  Future<ExistingUserListingModel?> listingRefreshExistingUser() async {
    ExistingUserListingModel? existing_user;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllExistingUserList();
    existing_user  = await apiRepProvider?.getExistingUserList(url!, 1);
    return existing_user;
  }
  
  

  Future<ExistingUserListingModel?> listingSearchExistingUser(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getExistingUserListSearch(url!, page!);
  }

  Future<ExistingUserListingModel?> listingSearchRefreshExistingUser() async {
    ExistingUserListingModel? existing_user ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    existing_user  = await apiRepProvider?.getExistingUserListSearch(url!, 1);
    return existing_user;
  }
}


