
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class MyProfileController {

  ProjectscoidApplication application;
  MyProfileListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;
  PortofolioMyProfileListing? listingPortofolio;

  MyProfileController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MyProfileListing(this.application, this.url!, this.isSearch, MyProfileListingUninitialized());}
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

  Future editMyProfile()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editMyProfile;
    editMyProfile = await apiRepProvider?.getMyProfileEdit(url!, id!, title!);
    return editMyProfile;
  }
  
    Future viewMyProfile()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var viewMyProfile;
    viewMyProfile = await apiRepProvider?.getMyProfileView(url!, id!, title!);
    return viewMyProfile;
  }

  Future postMyProfile() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postMyProfile;
    postMyProfile = await apiRepProvider?.sendMyProfilePost(url!,formData);
    return postMyProfile;
  }
  
    Future postMyProfileWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postMyProfile;
    postMyProfile = await apiRepProvider?.sendMyProfilePostWithID(url!,formData, id!, title!);
    return postMyProfile;
  }

  
  
    Future editEditProfileMyProfile()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editEditProfile;
    editEditProfile = await apiRepProvider?.getEditProfileMyProfileEdit(url!, id!, title!);
    return editEditProfile;
  }

  Future postEditProfileMyProfile() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postEditProfile;
    postEditProfile = await apiRepProvider?.sendEditProfileMyProfilePost(url!,formData);
    return postEditProfile;
  }
  
    Future postEditProfileMyProfileWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postEditProfile;
    postEditProfile = await apiRepProvider?.sendEditProfileMyProfilePostWithID(url!,formData, id!, title!);
    return postEditProfile;
  }
  
      Future getEditProfileMyProfile(String spKey)async{
  
        APIRepository? apiRepProvider = application.projectsAPIRepository;
        var getEditProfile;
        getEditProfile = await apiRepProvider?.getEditProfileMyProfile(url!, id!, title!, spKey);
	    return getEditProfile ;
	 }
   Future<EditProfileMyProfileModel> loadEditProfileMyProfile() async{
   APIRepository? apiRepProvider = application.projectsAPIRepository;
        var loadEditProfile;
        loadEditProfile = await apiRepProvider?.loadEditProfileMyProfile('');
	    return loadEditProfile ;  
   }
  
   Future saveEditProfileMyProfile(EditProfileMyProfileModel? my_profile, String? spKey) async{  
       APIRepository? apiRepProvider = application.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateEditProfileMyProfile(my_profile!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllEditProfileMyProfile(String? spKey) async{
	 APIRepository? apiRepProvider = application.projectsAPIRepository;
       await apiRepProvider?.deleteAllEditProfileMyProfile(spKey!);   
   }
  
  
  void listMyProfilePortofolio() async {
   listingPortofolio = new PortofolioMyProfileListing(this.application!, this.url!, this.isSearch, PortofolioMyProfileListingUninitialized());
  }
  
    Future editChangePasswordMyProfile()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editChangePassword;
    editChangePassword = await apiRepProvider?.getChangePasswordMyProfileEdit(url!, id!, title!);
    return editChangePassword;
  }

  Future postChangePasswordMyProfile() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postChangePassword;
    postChangePassword = await apiRepProvider?.sendChangePasswordMyProfilePost(url!,formData);
    return postChangePassword;
  }
  
    Future postChangePasswordMyProfileWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postChangePassword;
    postChangePassword = await apiRepProvider?.sendChangePasswordMyProfilePostWithID(url!,formData, id!, title!);
    return postChangePassword;
  }
  
      Future getChangePasswordMyProfile(String spKey)async{
  
        APIRepository? apiRepProvider = application.projectsAPIRepository;
        var getChangePassword;
        getChangePassword = await apiRepProvider?.getChangePasswordMyProfile(url!, id!, title!, spKey);
	    return getChangePassword ;
	 }
   Future<ChangePasswordMyProfileModel> loadChangePasswordMyProfile() async{
   APIRepository? apiRepProvider = application.projectsAPIRepository;
        var loadChangePassword;
        loadChangePassword = await apiRepProvider?.loadChangePasswordMyProfile('');
	    return loadChangePassword ;  
   }
  
   Future saveChangePasswordMyProfile(ChangePasswordMyProfileModel? my_profile, String? spKey) async{  
       APIRepository? apiRepProvider = application.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateChangePasswordMyProfile(my_profile!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllChangePasswordMyProfile(String? spKey) async{
	 APIRepository? apiRepProvider = application.projectsAPIRepository;
       await apiRepProvider?.deleteAllChangePasswordMyProfile(spKey!);   
   }
  
  
  
    Future editChangeEmailMyProfile()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editChangeEmail;
    editChangeEmail = await apiRepProvider?.getChangeEmailMyProfileEdit(url!, id!, title!);
    return editChangeEmail;
  }

  Future postChangeEmailMyProfile() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postChangeEmail;
    postChangeEmail = await apiRepProvider?.sendChangeEmailMyProfilePost(url!,formData);
    return postChangeEmail;
  }
  
    Future postChangeEmailMyProfileWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postChangeEmail;
    postChangeEmail = await apiRepProvider?.sendChangeEmailMyProfilePostWithID(url!,formData, id!, title!);
    return postChangeEmail;
  }
  
      Future getChangeEmailMyProfile(String spKey)async{
  
        APIRepository? apiRepProvider = application.projectsAPIRepository;
        var getChangeEmail;
        getChangeEmail = await apiRepProvider?.getChangeEmailMyProfile(url!, id!, title!, spKey);
	    return getChangeEmail ;
	 }
   Future<ChangeEmailMyProfileModel> loadChangeEmailMyProfile() async{
   APIRepository? apiRepProvider = application.projectsAPIRepository;
        var loadChangeEmail;
        loadChangeEmail = await apiRepProvider?.loadChangeEmailMyProfile('');
	    return loadChangeEmail ;  
   }
  
   Future saveChangeEmailMyProfile(ChangeEmailMyProfileModel? my_profile, String? spKey) async{  
       APIRepository? apiRepProvider = application.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateChangeEmailMyProfile(my_profile!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllChangeEmailMyProfile(String? spKey) async{
	 APIRepository? apiRepProvider = application.projectsAPIRepository;
       await apiRepProvider?.deleteAllChangeEmailMyProfile(spKey!);   
   }
  
  
  
    Future editChangeHandphoneMyProfile()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editChangeHandphone;
    editChangeHandphone = await apiRepProvider?.getChangeHandphoneMyProfileEdit(url!, id!, title!);
    return editChangeHandphone;
  }

  Future postChangeHandphoneMyProfile() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postChangeHandphone;
    postChangeHandphone = await apiRepProvider?.sendChangeHandphoneMyProfilePost(url!,formData);
    return postChangeHandphone;
  }
  
    Future postChangeHandphoneMyProfileWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postChangeHandphone;
    postChangeHandphone = await apiRepProvider?.sendChangeHandphoneMyProfilePostWithID(url!,formData, id!, title!);
    return postChangeHandphone;
  }
  
      Future getChangeHandphoneMyProfile(String spKey)async{
  
        APIRepository? apiRepProvider = application.projectsAPIRepository;
        var getChangeHandphone;
        getChangeHandphone = await apiRepProvider?.getChangeHandphoneMyProfile(url!, id!, title!, spKey);
	    return getChangeHandphone ;
	 }
   Future<ChangeHandphoneMyProfileModel> loadChangeHandphoneMyProfile() async{
   APIRepository? apiRepProvider = application.projectsAPIRepository;
        var loadChangeHandphone;
        loadChangeHandphone = await apiRepProvider?.loadChangeHandphoneMyProfile('');
	    return loadChangeHandphone ;  
   }
  
   Future saveChangeHandphoneMyProfile(ChangeHandphoneMyProfileModel? my_profile, String? spKey) async{  
       APIRepository? apiRepProvider = application.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateChangeHandphoneMyProfile(my_profile!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllChangeHandphoneMyProfile(String? spKey) async{
	 APIRepository? apiRepProvider = application.projectsAPIRepository;
       await apiRepProvider?.deleteAllChangeHandphoneMyProfile(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MyProfileListing extends Bloc<MyProfileEvent, MyProfileState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MyProfileListing(this.application, this.url, this.isSearch, MyProfileState initialState):
  super(initialState){
     on<MyProfileList>(_MyProfileListEvent);
	
	  on<MyProfileListingRefresh>(_MyProfileListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MyProfileEvent, MyProfileState>> transformEvents(
      Stream<MyProfileEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MyProfileEvent> transform<MyProfileEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MyProfileEvent, MyProfileState> transition) {
    print(transition);
  }

  @override
  get initialState => MyProfileListingUninitialized();

void _MyProfileListEvent(MyProfileList event, Emitter<MyProfileState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MyProfileListingUninitialized){
			  if(isSearch!){
			     MyProfileListingModel? my_profile = await listingSearchMyProfile(1);
				  int deltaPage;
				  if(my_profile?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_profile?.items.items.length ~/ (my_profile?.tools.paging.total_rows/my_profile?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_profile?.items.items.isEmpty
					  ? MyProfileListingLoaded(my_profile: my_profile!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyProfileListingLoaded(my_profile: my_profile!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MyProfileListingModel? my_profile = await listingMyProfile(1);
				   int deltaPage;
				  if(my_profile?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_profile?.items.items.length ~/ (my_profile?.tools.paging.total_rows/my_profile?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_profile?.items.items.isEmpty
					  ? MyProfileListingLoaded(my_profile: my_profile!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyProfileListingLoaded(my_profile: my_profile!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MyProfileListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyProfileListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyProfileListingLoaded).page! + 1;
			 if ((currentState as MyProfileListingLoaded).my_profile?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MyProfileListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MyProfileListingModel? my_profile = await listingSearchMyProfile(page);
						  if(!my_profile?.items.items.isEmpty){
							 (currentState as MyProfileListingLoaded).my_profile?.items.items.addAll(my_profile?.items.items);
						  }
						  return emit ( my_profile?.items.items.isEmpty
							  ? (currentState as MyProfileListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyProfileListingLoaded(  my_profile:  (currentState as MyProfileListingLoaded).my_profile! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MyProfileListingLoaded).page! + 1;
							  if ((currentState as MyProfileListingLoaded).my_profile?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MyProfileListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MyProfileListingModel? my_profile = await listingMyProfile(page);
							  return emit ( my_profile?.items.items.isEmpty
								  ? (currentState as MyProfileListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyProfileListingLoaded(  my_profile:  my_profile! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MyProfileListingError());
        
      }
    }
  }

void _MyProfileListingRefreshEvent(MyProfileListingRefresh event, Emitter<MyProfileState> emit)async{
  final currentState = state;
   try {
        if (currentState is MyProfileListingUninitialized) {
		   if(isSearch!){

			    MyProfileListingModel? my_profile = await listingSearchMyProfile(1);
              return emit (  MyProfileListingLoaded( my_profile: my_profile!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MyProfileListingModel? my_profile = await listingMyProfile(1);
				   return emit (  MyProfileListingLoaded( my_profile: my_profile!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MyProfileListingLoaded) {
		  if(isSearch!){
		     MyProfileListingModel? my_profile = await listingSearchRefreshMyProfile();
              return emit (  my_profile?.items.items.isEmpty
              ? (currentState as MyProfileListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyProfileListingLoaded(  my_profile: my_profile! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MyProfileListingModel? my_profile = await listingMyProfile(1);
				  int deltaPage = my_profile?.items.items.length ~/ (my_profile?.tools.paging.total_rows/my_profile?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_profile?.items.items.isEmpty
					  ? (currentState as MyProfileListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyProfileListingLoaded(my_profile: my_profile!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MyProfileListingError());
      }
  }

  @override

  Stream<MyProfileState> mapEventToState(MyProfileEvent event) async* {
    final currentState = state;
    if (event is MyProfileList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MyProfileListingUninitialized){
			  if(isSearch!){
			     MyProfileListingModel? my_profile = await listingSearchMyProfile(1);
				  int deltaPage;
				  if(my_profile?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_profile?.items.items.length ~/ (my_profile?.tools.paging.total_rows/my_profile?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_profile?.items.items.isEmpty
					  ? MyProfileListingLoaded(my_profile: my_profile!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyProfileListingLoaded(my_profile: my_profile!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MyProfileListingModel? my_profile = await listingMyProfile(1);
				   int deltaPage;
				  if(my_profile?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_profile?.items.items.length ~/ (my_profile?.tools.paging.total_rows/my_profile?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_profile?.items.items.isEmpty
					  ? MyProfileListingLoaded(my_profile: my_profile!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyProfileListingLoaded(my_profile: my_profile!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MyProfileListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyProfileListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyProfileListingLoaded).page! + 1;
			 if ((currentState as MyProfileListingLoaded).my_profile?.tools.paging.total_pages == oldpage) {
					yield (currentState as MyProfileListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MyProfileListingModel? my_profile = await listingSearchMyProfile(page);
						  if(!my_profile?.items.items.isEmpty){
							 (currentState as MyProfileListingLoaded).my_profile?.items.items.addAll(my_profile?.items.items);
						  }
						  yield my_profile?.items.items.isEmpty
							  ? (currentState as MyProfileListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyProfileListingLoaded(  my_profile:  (currentState as MyProfileListingLoaded).my_profile! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MyProfileListingLoaded).page! + 1;
							  if ((currentState as MyProfileListingLoaded).my_profile?.tools.paging.total_pages == oldpage) {
						yield (currentState as MyProfileListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MyProfileListingModel? my_profile = await listingMyProfile(page);
							  yield my_profile?.items.items.isEmpty
								  ? (currentState as MyProfileListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyProfileListingLoaded(  my_profile:  my_profile! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MyProfileListingError();
        
      }
    } else if (event is MyProfileListingRefresh){
      try {
        if (currentState is MyProfileListingUninitialized) {
		   if(isSearch!){

			    MyProfileListingModel? my_profile = await listingSearchMyProfile(1);
              yield MyProfileListingLoaded( my_profile: my_profile!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MyProfileListingModel? my_profile = await listingMyProfile(1);
				   yield MyProfileListingLoaded( my_profile: my_profile!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MyProfileListingLoaded) {
		  if(isSearch!){
		     MyProfileListingModel? my_profile = await listingSearchRefreshMyProfile();
              yield my_profile?.items.items.isEmpty
              ? (currentState as MyProfileListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyProfileListingLoaded(  my_profile: my_profile! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MyProfileListingModel? my_profile = await listingMyProfile(1);
				  int deltaPage = my_profile?.items.items.length ~/ (my_profile?.tools.paging.total_rows/my_profile?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_profile?.items.items.isEmpty
					  ? (currentState as MyProfileListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyProfileListingLoaded(my_profile: my_profile!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MyProfileListingError();
      }

    }
  }

  bool hasReachedMax(MyProfileState state) =>
      state is MyProfileListingLoaded && state.hasReachedMax!;

  Future<MyProfileListingModel?> listingMyProfile(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyProfileList(url!, page!);
  }

  Future<MyProfileListingModel?> listingRefreshMyProfile() async {
    MyProfileListingModel? my_profile;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMyProfileList();
    my_profile  = await apiRepProvider?.getMyProfileList(url!, 1);
    return my_profile;
  }
  
  

  Future<MyProfileListingModel?> listingSearchMyProfile(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyProfileListSearch(url!, page!);
  }

  Future<MyProfileListingModel?> listingSearchRefreshMyProfile() async {
    MyProfileListingModel? my_profile ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_profile  = await apiRepProvider?.getMyProfileListSearch(url!, 1);
    return my_profile;
  }
}


class PortofolioMyProfileListing extends Bloc<PortofolioMyProfileEvent, PortofolioMyProfileState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  PortofolioMyProfileListing(this.application, this.url, this.isSearch, PortofolioMyProfileState initialState):
  super(initialState){
     on<PortofolioMyProfileList>(_PortofolioMyProfileListEvent);
	 on<PortofolioMyProfileListingRefresh>(_PortofolioMyProfileListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<PortofolioMyProfileEvent, PortofolioMyProfileState>> transformEvents(
      Stream<PortofolioMyProfileEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
 */ 
     EventTransformer<PortofolioMyProfileEvent> transform<PortofolioMyProfileEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<PortofolioMyProfileEvent, PortofolioMyProfileState> transition) {
    print(transition);
  }

  @override
  get initialState => PortofolioMyProfileListingUninitialized();
  
  
  void _PortofolioMyProfileListEvent(PortofolioMyProfileList event, Emitter<PortofolioMyProfileState> emit)async{
  final currentState = state;
    if (!hasReachedMax(currentState)) {
      try {
					if (currentState is PortofolioMyProfileListingUninitialized){
						  if(isSearch!){
							 PortofolioListingModel? portofolio = await listingSearchPortofolioMyProfile(-1);
							  int deltaPage;
							  
							  if(portofolio?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = portofolio?.items.items.length ~/(portofolio?.tools.paging.total_rows/portofolio?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( portofolio?.items.items.isEmpty ?
							  PortofolioMyProfileListingLoaded(portofolio: portofolio!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : PortofolioMyProfileListingLoaded(portofolio: portofolio!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }else{
							  PortofolioListingModel? portofolio = await listingPortofolioMyProfile(1);
							  int deltaPage = portofolio?.items.items.length ~/ (portofolio?.tools.paging.total_rows/portofolio?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( PortofolioMyProfileListingLoaded(portofolio: portofolio!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }
					}

					if (currentState is PortofolioMyProfileListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as PortofolioMyProfileListingLoaded).page! + 1;
							  bool max = false;
							  PortofolioListingModel? portofolio = await listingPortofolioMyProfile(page);
							  if(portofolio?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!portofolio?.items.items.isEmpty && !max){
								 (currentState as PortofolioMyProfileListingLoaded).portofolio?.items.items.addAll(portofolio?.items.items);
							  }
							  return emit ( portofolio?.items.items.isEmpty || max
								  ? (currentState as PortofolioMyProfileListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : PortofolioMyProfileListingLoaded(  portofolio:  (currentState as PortofolioMyProfileListingLoaded).portofolio! ,
														  hasReachedMax: false,
														  page: page,));
						}else{
					  
							  final page = (currentState as PortofolioMyProfileListingLoaded).page! + 1;
							  PortofolioListingModel? portofolio = await listingPortofolioMyProfile(page);
							  return emit ( portofolio?.items.items.isEmpty
								  ? (currentState as PortofolioMyProfileListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : PortofolioMyProfileListingLoaded(  portofolio:  portofolio! ,
														  hasReachedMax: false,
														  page: page,));
						}	  
					}
					
      } catch (_) {
        return emit ( PortofolioMyProfileListingError());
      }
    }
  }
  
  void _PortofolioMyProfileListingRefreshEvent(PortofolioMyProfileListingRefresh event, Emitter<PortofolioMyProfileState> emit)async{
  final currentState = state;
   try {
					if (currentState is PortofolioMyProfileListingUninitialized) {
					   if(isSearch!){
						  PortofolioListingModel? portofolio = await listingSearchPortofolioMyProfile(1);
						  return emit (  PortofolioMyProfileListingLoaded( portofolio: portofolio!,
							   hasReachedMax: false,
							   page: 1 ));
					   }else{
						 PortofolioListingModel? portofolio = await listingPortofolioMyProfile(1);
						 return emit ( PortofolioMyProfileListingLoaded( portofolio: portofolio!,
							   hasReachedMax: false,
							   page: 1 ));
					   }

					}

					if (currentState is PortofolioMyProfileListingLoaded) {
					  if(isSearch!){
						 PortofolioListingModel? portofolio = await listingSearchRefreshPortofolioMyProfile();
						  return emit (  portofolio?.items.items.isEmpty
						  ? (currentState as PortofolioMyProfileListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : PortofolioMyProfileListingLoaded(  portofolio: portofolio! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }else{
						  PortofolioListingModel? portofolio = await listingRefreshPortofolioMyProfile();
						  return emit (  portofolio?.items.items.isEmpty
						  ? (currentState as PortofolioMyProfileListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : PortofolioMyProfileListingLoaded(  portofolio: portofolio! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }

					}
			
      } catch (_) {
        return emit ( PortofolioMyProfileListingError());
      }

  }

  @override

  Stream<PortofolioMyProfileState> mapEventToState(PortofolioMyProfileEvent event) async* {
  final currentState = state;
    if (event is PortofolioMyProfileList && !hasReachedMax(currentState)) {
      try {
					if (currentState is PortofolioMyProfileListingUninitialized){
						  if(isSearch!){
							 PortofolioListingModel? portofolio = await listingSearchPortofolioMyProfile(-1);
							  int deltaPage;
							  
							  if(portofolio?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = portofolio?.items.items.length ~/(portofolio?.tools.paging.total_rows/portofolio?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield portofolio?.items.items.isEmpty ?
							  PortofolioMyProfileListingLoaded(portofolio: portofolio!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : PortofolioMyProfileListingLoaded(portofolio: portofolio!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }else{
							  PortofolioListingModel? portofolio = await listingPortofolioMyProfile(1);
							  int deltaPage = portofolio?.items.items.length ~/ (portofolio?.tools.paging.total_rows/portofolio?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield PortofolioMyProfileListingLoaded(portofolio: portofolio!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }
					}

					if (currentState is PortofolioMyProfileListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as PortofolioMyProfileListingLoaded).page! + 1;
							  bool max = false;
							  PortofolioListingModel? portofolio = await listingPortofolioMyProfile(page);
							  if(portofolio?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!portofolio?.items.items.isEmpty && !max){
								 (currentState as PortofolioMyProfileListingLoaded).portofolio?.items.items.addAll(portofolio?.items.items);
							  }
							  yield portofolio?.items.items.isEmpty || max
								  ? (currentState as PortofolioMyProfileListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : PortofolioMyProfileListingLoaded(  portofolio:  (currentState as PortofolioMyProfileListingLoaded).portofolio! ,
														  hasReachedMax: false,
														  page: page,);
						}else{
					  
							  final page = (currentState as PortofolioMyProfileListingLoaded).page! + 1;
							  PortofolioListingModel? portofolio = await listingPortofolioMyProfile(page);
							  yield portofolio?.items.items.isEmpty
								  ? (currentState as PortofolioMyProfileListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : PortofolioMyProfileListingLoaded(  portofolio:  portofolio! ,
														  hasReachedMax: false,
														  page: page,);
						}	  
					}
					
      } catch (_) {
        yield PortofolioMyProfileListingError();
      }
    } else if (event is PortofolioMyProfileListingRefresh){
      try {
					if (currentState is PortofolioMyProfileListingUninitialized) {
					   if(isSearch!){
						  PortofolioListingModel? portofolio = await listingSearchPortofolioMyProfile(1);
						  yield PortofolioMyProfileListingLoaded( portofolio: portofolio!,
							   hasReachedMax: false,
							   page: 1 );
					   }else{
						 PortofolioListingModel? portofolio = await listingPortofolioMyProfile(1);
						 yield PortofolioMyProfileListingLoaded( portofolio: portofolio!,
							   hasReachedMax: false,
							   page: 1 );
					   }

					}

					if (currentState is PortofolioMyProfileListingLoaded) {
					  if(isSearch!){
						 PortofolioListingModel? portofolio = await listingSearchRefreshPortofolioMyProfile();
						  yield portofolio?.items.items.isEmpty
						  ? (currentState as PortofolioMyProfileListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : PortofolioMyProfileListingLoaded(  portofolio: portofolio! ,
						  hasReachedMax: false,
						  page: 1 );
					  }else{
						  PortofolioListingModel? portofolio = await listingRefreshPortofolioMyProfile();
						  yield portofolio?.items.items.isEmpty
						  ? (currentState as PortofolioMyProfileListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : PortofolioMyProfileListingLoaded(  portofolio: portofolio! ,
						  hasReachedMax: false,
						  page: 1 );
					  }

					}
			
      } catch (_) {
        yield PortofolioMyProfileListingError();
      }

    }
  }

  bool hasReachedMax(PortofolioMyProfileState state) =>
      state is PortofolioMyProfileListingLoaded && state.hasReachedMax!;

  Future<PortofolioListingModel?> listingPortofolioMyProfile(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getPortofolioMyProfileListSearch(url!, page!);
  }
    Future<PortofolioListingModel?> listingRefreshPortofolioMyProfile() async {
    PortofolioListingModel? portofolio ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    portofolio  = await apiRepProvider?.getPortofolioMyProfileListSearch(url!, 1);
    return portofolio;
  }
  Future<PortofolioListingModel?> listingSearchPortofolioMyProfile(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getPortofolioMyProfileListSearch(url!, page!);
  }

  Future<PortofolioListingModel?> listingSearchRefreshPortofolioMyProfile() async {
    PortofolioListingModel? portofolio ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    portofolio  = await apiRepProvider?.getPortofolioMyProfileListSearch(url!, 1);
    return portofolio;
  }
  
  
  
}




