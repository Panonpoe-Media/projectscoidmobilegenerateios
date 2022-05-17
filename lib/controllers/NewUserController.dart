
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class NewUserController {

  ProjectscoidApplication application;
  NewUserListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  NewUserController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new NewUserListing(this.application, this.url!, this.isSearch, NewUserListingUninitialized());}
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

  Future editNewUser()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editNewUser;
    editNewUser = await apiRepProvider?.getNewUserEdit(url!, id!, title!);
    return editNewUser;
  }
  
    Future viewNewUser()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var viewNewUser;
    viewNewUser = await apiRepProvider?.getNewUserView(url!, id!, title!);
    return viewNewUser;
  }

  Future postNewUser() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postNewUser;
    postNewUser = await apiRepProvider?.sendNewUserPost(url!,formData);
    return postNewUser;
  }
  
    Future postNewUserWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postNewUser;
    postNewUser = await apiRepProvider?.sendNewUserPostWithID(url!,formData, id!, title!);
    return postNewUser;
  }

  
  
    Future editRegisterNewUser()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editRegister;
    editRegister = await apiRepProvider?.getRegisterNewUserEdit(url!, id!, title!);
    return editRegister;
  }

  Future postRegisterNewUser() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postRegister;
    postRegister = await apiRepProvider?.sendRegisterNewUserPost(url!,formData);
    return postRegister;
  }
  
    Future postRegisterNewUserWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postRegister;
    postRegister = await apiRepProvider?.sendRegisterNewUserPostWithID(url!,formData, id!, title!);
    return postRegister;
  }
  
      Future getRegisterNewUser(String spKey)async{
  
        APIRepository? apiRepProvider = application.projectsAPIRepository;
        var getRegister;
        getRegister = await apiRepProvider?.getRegisterNewUser(url!, id!, title!, spKey);
	    return getRegister ;
	 }
   Future<RegisterNewUserModel> loadRegisterNewUser() async{
   APIRepository? apiRepProvider = application.projectsAPIRepository;
        var loadRegister;
        loadRegister = await apiRepProvider?.loadRegisterNewUser('');
	    return loadRegister ;  
   }
  
   Future saveRegisterNewUser(RegisterNewUserModel? new_user, String? spKey) async{  
       APIRepository? apiRepProvider = application.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateRegisterNewUser(new_user!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllRegisterNewUser(String? spKey) async{
	 APIRepository? apiRepProvider = application.projectsAPIRepository;
       await apiRepProvider?.deleteAllRegisterNewUser(spKey!);   
   }
  
  
  
    Future editVerifyNewUser()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editVerify;
    editVerify = await apiRepProvider?.getVerifyNewUserEdit(url!, id!, title!);
    return editVerify;
  }

  Future postVerifyNewUser() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postVerify;
    postVerify = await apiRepProvider?.sendVerifyNewUserPost(url!,formData);
    return postVerify;
  }
  
    Future postVerifyNewUserWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postVerify;
    postVerify = await apiRepProvider?.sendVerifyNewUserPostWithID(url!,formData, id!, title!);
    return postVerify;
  }
  
      Future getVerifyNewUser(String spKey)async{
  
        APIRepository? apiRepProvider = application.projectsAPIRepository;
        var getVerify;
        getVerify = await apiRepProvider?.getVerifyNewUser(url!, id!, title!, spKey);
	    return getVerify ;
	 }
   Future<VerifyNewUserModel> loadVerifyNewUser() async{
   APIRepository? apiRepProvider = application.projectsAPIRepository;
        var loadVerify;
        loadVerify = await apiRepProvider?.loadVerifyNewUser('');
	    return loadVerify ;  
   }
  
   Future saveVerifyNewUser(VerifyNewUserModel? new_user, String? spKey) async{  
       APIRepository? apiRepProvider = application.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateVerifyNewUser(new_user!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllVerifyNewUser(String? spKey) async{
	 APIRepository? apiRepProvider = application.projectsAPIRepository;
       await apiRepProvider?.deleteAllVerifyNewUser(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class NewUserListing extends Bloc<NewUserEvent, NewUserState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  NewUserListing(this.application, this.url, this.isSearch, NewUserState initialState):
  super(initialState){
     on<NewUserList>(_NewUserListEvent);
	
	  on<NewUserListingRefresh>(_NewUserListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<NewUserEvent, NewUserState>> transformEvents(
      Stream<NewUserEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<NewUserEvent> transform<NewUserEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<NewUserEvent, NewUserState> transition) {
    print(transition);
  }

  @override
  get initialState => NewUserListingUninitialized();

void _NewUserListEvent(NewUserList event, Emitter<NewUserState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is NewUserListingUninitialized){
			  if(isSearch!){
			     NewUserListingModel? new_user = await listingSearchNewUser(1);
				  int deltaPage;
				  if(new_user?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  new_user?.items.items.length ~/ (new_user?.tools.paging.total_rows/new_user?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( new_user?.items.items.isEmpty
					  ? NewUserListingLoaded(new_user: new_user!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : NewUserListingLoaded(new_user: new_user!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  NewUserListingModel? new_user = await listingNewUser(1);
				   int deltaPage;
				  if(new_user?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  new_user?.items.items.length ~/ (new_user?.tools.paging.total_rows/new_user?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( new_user?.items.items.isEmpty
					  ? NewUserListingLoaded(new_user: new_user!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :NewUserListingLoaded(new_user: new_user!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is NewUserListingLoaded) {
          //page++;
		    final oldpage = (currentState as NewUserListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as NewUserListingLoaded).page! + 1;
			 if ((currentState as NewUserListingLoaded).new_user?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as NewUserListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      NewUserListingModel? new_user = await listingSearchNewUser(page);
						  if(!new_user?.items.items.isEmpty){
							 (currentState as NewUserListingLoaded).new_user?.items.items.addAll(new_user?.items.items);
						  }
						  return emit ( new_user?.items.items.isEmpty
							  ? (currentState as NewUserListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : NewUserListingLoaded(  new_user:  (currentState as NewUserListingLoaded).new_user! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as NewUserListingLoaded).page! + 1;
							  if ((currentState as NewUserListingLoaded).new_user?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as NewUserListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  NewUserListingModel? new_user = await listingNewUser(page);
							  return emit ( new_user?.items.items.isEmpty
								  ? (currentState as NewUserListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : NewUserListingLoaded(  new_user:  new_user! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( NewUserListingError());
        
      }
    }
  }

void _NewUserListingRefreshEvent(NewUserListingRefresh event, Emitter<NewUserState> emit)async{
  final currentState = state;
   try {
        if (currentState is NewUserListingUninitialized) {
		   if(isSearch!){

			    NewUserListingModel? new_user = await listingSearchNewUser(1);
              return emit (  NewUserListingLoaded( new_user: new_user!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    NewUserListingModel? new_user = await listingNewUser(1);
				   return emit (  NewUserListingLoaded( new_user: new_user!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is NewUserListingLoaded) {
		  if(isSearch!){
		     NewUserListingModel? new_user = await listingSearchRefreshNewUser();
              return emit (  new_user?.items.items.isEmpty
              ? (currentState as NewUserListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : NewUserListingLoaded(  new_user: new_user! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  NewUserListingModel? new_user = await listingNewUser(1);
				  int deltaPage = new_user?.items.items.length ~/ (new_user?.tools.paging.total_rows/new_user?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  new_user?.items.items.isEmpty
					  ? (currentState as NewUserListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :NewUserListingLoaded(new_user: new_user!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  NewUserListingError());
      }
  }

  @override

  Stream<NewUserState> mapEventToState(NewUserEvent event) async* {
    final currentState = state;
    if (event is NewUserList && !hasReachedMax(currentState)) {
      try {
        if (currentState is NewUserListingUninitialized){
			  if(isSearch!){
			     NewUserListingModel? new_user = await listingSearchNewUser(1);
				  int deltaPage;
				  if(new_user?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  new_user?.items.items.length ~/ (new_user?.tools.paging.total_rows/new_user?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield new_user?.items.items.isEmpty
					  ? NewUserListingLoaded(new_user: new_user!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : NewUserListingLoaded(new_user: new_user!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  NewUserListingModel? new_user = await listingNewUser(1);
				   int deltaPage;
				  if(new_user?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  new_user?.items.items.length ~/ (new_user?.tools.paging.total_rows/new_user?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield new_user?.items.items.isEmpty
					  ? NewUserListingLoaded(new_user: new_user!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :NewUserListingLoaded(new_user: new_user!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is NewUserListingLoaded) {
          //page++;
		    final oldpage = (currentState as NewUserListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as NewUserListingLoaded).page! + 1;
			 if ((currentState as NewUserListingLoaded).new_user?.tools.paging.total_pages == oldpage) {
					yield (currentState as NewUserListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      NewUserListingModel? new_user = await listingSearchNewUser(page);
						  if(!new_user?.items.items.isEmpty){
							 (currentState as NewUserListingLoaded).new_user?.items.items.addAll(new_user?.items.items);
						  }
						  yield new_user?.items.items.isEmpty
							  ? (currentState as NewUserListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : NewUserListingLoaded(  new_user:  (currentState as NewUserListingLoaded).new_user! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as NewUserListingLoaded).page! + 1;
							  if ((currentState as NewUserListingLoaded).new_user?.tools.paging.total_pages == oldpage) {
						yield (currentState as NewUserListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  NewUserListingModel? new_user = await listingNewUser(page);
							  yield new_user?.items.items.isEmpty
								  ? (currentState as NewUserListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : NewUserListingLoaded(  new_user:  new_user! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield NewUserListingError();
        
      }
    } else if (event is NewUserListingRefresh){
      try {
        if (currentState is NewUserListingUninitialized) {
		   if(isSearch!){

			    NewUserListingModel? new_user = await listingSearchNewUser(1);
              yield NewUserListingLoaded( new_user: new_user!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    NewUserListingModel? new_user = await listingNewUser(1);
				   yield NewUserListingLoaded( new_user: new_user!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is NewUserListingLoaded) {
		  if(isSearch!){
		     NewUserListingModel? new_user = await listingSearchRefreshNewUser();
              yield new_user?.items.items.isEmpty
              ? (currentState as NewUserListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : NewUserListingLoaded(  new_user: new_user! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  NewUserListingModel? new_user = await listingNewUser(1);
				  int deltaPage = new_user?.items.items.length ~/ (new_user?.tools.paging.total_rows/new_user?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield new_user?.items.items.isEmpty
					  ? (currentState as NewUserListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :NewUserListingLoaded(new_user: new_user!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield NewUserListingError();
      }

    }
  }

  bool hasReachedMax(NewUserState state) =>
      state is NewUserListingLoaded && state.hasReachedMax!;

  Future<NewUserListingModel?> listingNewUser(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getNewUserList(url!, page!);
  }

  Future<NewUserListingModel?> listingRefreshNewUser() async {
    NewUserListingModel? new_user;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllNewUserList();
    new_user  = await apiRepProvider?.getNewUserList(url!, 1);
    return new_user;
  }
  
  

  Future<NewUserListingModel?> listingSearchNewUser(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getNewUserListSearch(url!, page!);
  }

  Future<NewUserListingModel?> listingSearchRefreshNewUser() async {
    NewUserListingModel? new_user ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    new_user  = await apiRepProvider?.getNewUserListSearch(url!, 1);
    return new_user;
  }
}


