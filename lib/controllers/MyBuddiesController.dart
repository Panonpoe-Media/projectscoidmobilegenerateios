
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class MyBuddiesController {

  ProjectscoidApplication application;
  MyBuddiesListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  MyBuddiesController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MyBuddiesListing(this.application, this.url!, this.isSearch, MyBuddiesListingUninitialized());}
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

  Future editMyBuddies()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editMyBuddies;
    editMyBuddies = await apiRepProvider?.getMyBuddiesEdit(url!, id!, title!);
    return editMyBuddies;
  }
  
    Future viewMyBuddies()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewMyBuddies;
    viewMyBuddies = await apiRepProvider?.getMyBuddiesView(url!, id!, title!);
    return viewMyBuddies;
  }

  Future postMyBuddies() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyBuddies;
    postMyBuddies = await apiRepProvider?.sendMyBuddiesPost(url!,formData);
    return postMyBuddies;
  }
  
    Future postMyBuddiesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyBuddies;
    postMyBuddies = await apiRepProvider?.sendMyBuddiesPostWithID(url!,formData, id!, title!);
    return postMyBuddies;
  }

  
  
    Future editRemoveMyBuddies()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editRemove;
    editRemove = await apiRepProvider?.getRemoveMyBuddiesEdit(url!, id!, title!);
    return editRemove;
  }

  Future postRemoveMyBuddies() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postRemove;
    postRemove = await apiRepProvider?.sendRemoveMyBuddiesPost(url!,formData);
    return postRemove;
  }
  
    Future postRemoveMyBuddiesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postRemove;
    postRemove = await apiRepProvider?.sendRemoveMyBuddiesPostWithID(url!,formData, id!, title!);
    return postRemove;
  }
  
      Future getRemoveMyBuddies(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getRemove;
        getRemove = await apiRepProvider?.getRemoveMyBuddies(url!, id!, title!, spKey!);
	    return getRemove ;
	 }
   Future<RemoveMyBuddiesModel> loadRemoveMyBuddies() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadRemove;
        loadRemove = await apiRepProvider?.loadRemoveMyBuddies('');
	    return loadRemove ;  
   }
  
   Future saveRemoveMyBuddies(RemoveMyBuddiesModel? my_buddies, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateRemoveMyBuddies(my_buddies!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllRemoveMyBuddies(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllRemoveMyBuddies(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MyBuddiesListing extends Bloc<MyBuddiesEvent, MyBuddiesState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MyBuddiesListing(this.application, this.url, this.isSearch, MyBuddiesState initialState):
  super(initialState){
     on<MyBuddiesList>(_MyBuddiesListEvent);
	
	  on<MyBuddiesListingRefresh>(_MyBuddiesListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MyBuddiesEvent, MyBuddiesState>> transformEvents(
      Stream<MyBuddiesEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MyBuddiesEvent> transform<MyBuddiesEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MyBuddiesEvent, MyBuddiesState> transition) {
    print(transition);
  }

  @override
  get initialState => MyBuddiesListingUninitialized();

void _MyBuddiesListEvent(MyBuddiesList event, Emitter<MyBuddiesState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MyBuddiesListingUninitialized){
			  if(isSearch!){
			     MyBuddiesListingModel? my_buddies = await listingSearchMyBuddies(1);
				  int deltaPage;
				  if(my_buddies?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_buddies?.items.items.length ~/ (my_buddies?.tools.paging.total_rows/my_buddies?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_buddies?.items.items.isEmpty
					  ? MyBuddiesListingLoaded(my_buddies: my_buddies!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyBuddiesListingLoaded(my_buddies: my_buddies!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MyBuddiesListingModel? my_buddies = await listingMyBuddies(1);
				   int deltaPage;
				  if(my_buddies?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_buddies?.items.items.length ~/ (my_buddies?.tools.paging.total_rows/my_buddies?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_buddies?.items.items.isEmpty
					  ? MyBuddiesListingLoaded(my_buddies: my_buddies!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyBuddiesListingLoaded(my_buddies: my_buddies!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MyBuddiesListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyBuddiesListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyBuddiesListingLoaded).page! + 1;
			 if ((currentState as MyBuddiesListingLoaded).my_buddies?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MyBuddiesListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MyBuddiesListingModel? my_buddies = await listingSearchMyBuddies(page);
						  if(!my_buddies?.items.items.isEmpty){
							 (currentState as MyBuddiesListingLoaded).my_buddies?.items.items.addAll(my_buddies?.items.items);
						  }
						  return emit ( my_buddies?.items.items.isEmpty
							  ? (currentState as MyBuddiesListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyBuddiesListingLoaded(  my_buddies:  (currentState as MyBuddiesListingLoaded).my_buddies! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MyBuddiesListingLoaded).page! + 1;
							  if ((currentState as MyBuddiesListingLoaded).my_buddies?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MyBuddiesListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MyBuddiesListingModel? my_buddies = await listingMyBuddies(page);
							  return emit ( my_buddies?.items.items.isEmpty
								  ? (currentState as MyBuddiesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyBuddiesListingLoaded(  my_buddies:  my_buddies! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MyBuddiesListingError());
        
      }
    }
  }

void _MyBuddiesListingRefreshEvent(MyBuddiesListingRefresh event, Emitter<MyBuddiesState> emit)async{
  final currentState = state;
   try {
        if (currentState is MyBuddiesListingUninitialized) {
		   if(isSearch!){

			    MyBuddiesListingModel? my_buddies = await listingSearchMyBuddies(1);
              return emit (  MyBuddiesListingLoaded( my_buddies: my_buddies!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MyBuddiesListingModel? my_buddies = await listingMyBuddies(1);
				   return emit (  MyBuddiesListingLoaded( my_buddies: my_buddies!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MyBuddiesListingLoaded) {
		  if(isSearch!){
		     MyBuddiesListingModel? my_buddies = await listingSearchRefreshMyBuddies();
              return emit (  my_buddies?.items.items.isEmpty
              ? (currentState as MyBuddiesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyBuddiesListingLoaded(  my_buddies: my_buddies! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MyBuddiesListingModel? my_buddies = await listingMyBuddies(1);
				  int deltaPage = my_buddies?.items.items.length ~/ (my_buddies?.tools.paging.total_rows/my_buddies?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_buddies?.items.items.isEmpty
					  ? (currentState as MyBuddiesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyBuddiesListingLoaded(my_buddies: my_buddies!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MyBuddiesListingError());
      }
  }

  @override

  Stream<MyBuddiesState> mapEventToState(MyBuddiesEvent event) async* {
    final currentState = state;
    if (event is MyBuddiesList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MyBuddiesListingUninitialized){
			  if(isSearch!){
			     MyBuddiesListingModel? my_buddies = await listingSearchMyBuddies(1);
				  int deltaPage;
				  if(my_buddies?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_buddies?.items.items.length ~/ (my_buddies?.tools.paging.total_rows/my_buddies?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_buddies?.items.items.isEmpty
					  ? MyBuddiesListingLoaded(my_buddies: my_buddies!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyBuddiesListingLoaded(my_buddies: my_buddies!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MyBuddiesListingModel? my_buddies = await listingMyBuddies(1);
				   int deltaPage;
				  if(my_buddies?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_buddies?.items.items.length ~/ (my_buddies?.tools.paging.total_rows/my_buddies?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_buddies?.items.items.isEmpty
					  ? MyBuddiesListingLoaded(my_buddies: my_buddies!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyBuddiesListingLoaded(my_buddies: my_buddies!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MyBuddiesListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyBuddiesListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyBuddiesListingLoaded).page! + 1;
			 if ((currentState as MyBuddiesListingLoaded).my_buddies?.tools.paging.total_pages == oldpage) {
					yield (currentState as MyBuddiesListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MyBuddiesListingModel? my_buddies = await listingSearchMyBuddies(page);
						  if(!my_buddies?.items.items.isEmpty){
							 (currentState as MyBuddiesListingLoaded).my_buddies?.items.items.addAll(my_buddies?.items.items);
						  }
						  yield my_buddies?.items.items.isEmpty
							  ? (currentState as MyBuddiesListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyBuddiesListingLoaded(  my_buddies:  (currentState as MyBuddiesListingLoaded).my_buddies! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MyBuddiesListingLoaded).page! + 1;
							  if ((currentState as MyBuddiesListingLoaded).my_buddies?.tools.paging.total_pages == oldpage) {
						yield (currentState as MyBuddiesListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MyBuddiesListingModel? my_buddies = await listingMyBuddies(page);
							  yield my_buddies?.items.items.isEmpty
								  ? (currentState as MyBuddiesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyBuddiesListingLoaded(  my_buddies:  my_buddies! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MyBuddiesListingError();
        
      }
    } else if (event is MyBuddiesListingRefresh){
      try {
        if (currentState is MyBuddiesListingUninitialized) {
		   if(isSearch!){

			    MyBuddiesListingModel? my_buddies = await listingSearchMyBuddies(1);
              yield MyBuddiesListingLoaded( my_buddies: my_buddies!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MyBuddiesListingModel? my_buddies = await listingMyBuddies(1);
				   yield MyBuddiesListingLoaded( my_buddies: my_buddies!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MyBuddiesListingLoaded) {
		  if(isSearch!){
		     MyBuddiesListingModel? my_buddies = await listingSearchRefreshMyBuddies();
              yield my_buddies?.items.items.isEmpty
              ? (currentState as MyBuddiesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyBuddiesListingLoaded(  my_buddies: my_buddies! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MyBuddiesListingModel? my_buddies = await listingMyBuddies(1);
				  int deltaPage = my_buddies?.items.items.length ~/ (my_buddies?.tools.paging.total_rows/my_buddies?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_buddies?.items.items.isEmpty
					  ? (currentState as MyBuddiesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyBuddiesListingLoaded(my_buddies: my_buddies!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MyBuddiesListingError();
      }

    }
  }

  bool hasReachedMax(MyBuddiesState state) =>
      state is MyBuddiesListingLoaded && state.hasReachedMax!;

  Future<MyBuddiesListingModel?> listingMyBuddies(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyBuddiesList(url!, page!);
  }

  Future<MyBuddiesListingModel?> listingRefreshMyBuddies() async {
    MyBuddiesListingModel? my_buddies;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMyBuddiesList();
    my_buddies  = await apiRepProvider?.getMyBuddiesList(url!, 1);
    return my_buddies;
  }
  
  

  Future<MyBuddiesListingModel?> listingSearchMyBuddies(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyBuddiesListSearch(url!, page!);
  }

  Future<MyBuddiesListingModel?> listingSearchRefreshMyBuddies() async {
    MyBuddiesListingModel? my_buddies ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_buddies  = await apiRepProvider?.getMyBuddiesListSearch(url!, 1);
    return my_buddies;
  }
}


