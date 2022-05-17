
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class MyBookmarksController {

  ProjectscoidApplication application;
  MyBookmarksListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  MyBookmarksController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MyBookmarksListing(this.application, this.url!, this.isSearch, MyBookmarksListingUninitialized());}
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

  Future editMyBookmarks()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editMyBookmarks;
    editMyBookmarks = await apiRepProvider?.getMyBookmarksEdit(url!, id!, title!);
    return editMyBookmarks;
  }
  
    Future viewMyBookmarks()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var viewMyBookmarks;
    viewMyBookmarks = await apiRepProvider?.getMyBookmarksView(url!, id!, title!);
    return viewMyBookmarks;
  }

  Future postMyBookmarks() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postMyBookmarks;
    postMyBookmarks = await apiRepProvider?.sendMyBookmarksPost(url!,formData);
    return postMyBookmarks;
  }
  
    Future postMyBookmarksWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postMyBookmarks;
    postMyBookmarks = await apiRepProvider?.sendMyBookmarksPostWithID(url!,formData, id!, title!);
    return postMyBookmarks;
  }

  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MyBookmarksListing extends Bloc<MyBookmarksEvent, MyBookmarksState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MyBookmarksListing(this.application, this.url, this.isSearch, MyBookmarksState initialState):
  super(initialState){
     on<MyBookmarksList>(_MyBookmarksListEvent);
	
	  on<MyBookmarksListingRefresh>(_MyBookmarksListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MyBookmarksEvent, MyBookmarksState>> transformEvents(
      Stream<MyBookmarksEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MyBookmarksEvent> transform<MyBookmarksEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MyBookmarksEvent, MyBookmarksState> transition) {
    print(transition);
  }

  @override
  get initialState => MyBookmarksListingUninitialized();

void _MyBookmarksListEvent(MyBookmarksList event, Emitter<MyBookmarksState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MyBookmarksListingUninitialized){
			  if(isSearch!){
			     MyBookmarksListingModel? my_bookmarks = await listingSearchMyBookmarks(1);
				  int deltaPage;
				  if(my_bookmarks?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_bookmarks?.items.items.length ~/ (my_bookmarks?.tools.paging.total_rows/my_bookmarks?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_bookmarks?.items.items.isEmpty
					  ? MyBookmarksListingLoaded(my_bookmarks: my_bookmarks!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyBookmarksListingLoaded(my_bookmarks: my_bookmarks!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MyBookmarksListingModel? my_bookmarks = await listingMyBookmarks(1);
				   int deltaPage;
				  if(my_bookmarks?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_bookmarks?.items.items.length ~/ (my_bookmarks?.tools.paging.total_rows/my_bookmarks?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_bookmarks?.items.items.isEmpty
					  ? MyBookmarksListingLoaded(my_bookmarks: my_bookmarks!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyBookmarksListingLoaded(my_bookmarks: my_bookmarks!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MyBookmarksListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyBookmarksListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyBookmarksListingLoaded).page! + 1;
			 if ((currentState as MyBookmarksListingLoaded).my_bookmarks?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MyBookmarksListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MyBookmarksListingModel? my_bookmarks = await listingSearchMyBookmarks(page);
						  if(!my_bookmarks?.items.items.isEmpty){
							 (currentState as MyBookmarksListingLoaded).my_bookmarks?.items.items.addAll(my_bookmarks?.items.items);
						  }
						  return emit ( my_bookmarks?.items.items.isEmpty
							  ? (currentState as MyBookmarksListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyBookmarksListingLoaded(  my_bookmarks:  (currentState as MyBookmarksListingLoaded).my_bookmarks! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MyBookmarksListingLoaded).page! + 1;
							  if ((currentState as MyBookmarksListingLoaded).my_bookmarks?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MyBookmarksListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MyBookmarksListingModel? my_bookmarks = await listingMyBookmarks(page);
							  return emit ( my_bookmarks?.items.items.isEmpty
								  ? (currentState as MyBookmarksListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyBookmarksListingLoaded(  my_bookmarks:  my_bookmarks! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MyBookmarksListingError());
        
      }
    }
  }

void _MyBookmarksListingRefreshEvent(MyBookmarksListingRefresh event, Emitter<MyBookmarksState> emit)async{
  final currentState = state;
   try {
        if (currentState is MyBookmarksListingUninitialized) {
		   if(isSearch!){

			    MyBookmarksListingModel? my_bookmarks = await listingSearchMyBookmarks(1);
              return emit (  MyBookmarksListingLoaded( my_bookmarks: my_bookmarks!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MyBookmarksListingModel? my_bookmarks = await listingMyBookmarks(1);
				   return emit (  MyBookmarksListingLoaded( my_bookmarks: my_bookmarks!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MyBookmarksListingLoaded) {
		  if(isSearch!){
		     MyBookmarksListingModel? my_bookmarks = await listingSearchRefreshMyBookmarks();
              return emit (  my_bookmarks?.items.items.isEmpty
              ? (currentState as MyBookmarksListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyBookmarksListingLoaded(  my_bookmarks: my_bookmarks! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MyBookmarksListingModel? my_bookmarks = await listingMyBookmarks(1);
				  int deltaPage = my_bookmarks?.items.items.length ~/ (my_bookmarks?.tools.paging.total_rows/my_bookmarks?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_bookmarks?.items.items.isEmpty
					  ? (currentState as MyBookmarksListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyBookmarksListingLoaded(my_bookmarks: my_bookmarks!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MyBookmarksListingError());
      }
  }

  @override

  Stream<MyBookmarksState> mapEventToState(MyBookmarksEvent event) async* {
    final currentState = state;
    if (event is MyBookmarksList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MyBookmarksListingUninitialized){
			  if(isSearch!){
			     MyBookmarksListingModel? my_bookmarks = await listingSearchMyBookmarks(1);
				  int deltaPage;
				  if(my_bookmarks?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_bookmarks?.items.items.length ~/ (my_bookmarks?.tools.paging.total_rows/my_bookmarks?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_bookmarks?.items.items.isEmpty
					  ? MyBookmarksListingLoaded(my_bookmarks: my_bookmarks!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyBookmarksListingLoaded(my_bookmarks: my_bookmarks!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MyBookmarksListingModel? my_bookmarks = await listingMyBookmarks(1);
				   int deltaPage;
				  if(my_bookmarks?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_bookmarks?.items.items.length ~/ (my_bookmarks?.tools.paging.total_rows/my_bookmarks?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_bookmarks?.items.items.isEmpty
					  ? MyBookmarksListingLoaded(my_bookmarks: my_bookmarks!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyBookmarksListingLoaded(my_bookmarks: my_bookmarks!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MyBookmarksListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyBookmarksListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyBookmarksListingLoaded).page! + 1;
			 if ((currentState as MyBookmarksListingLoaded).my_bookmarks?.tools.paging.total_pages == oldpage) {
					yield (currentState as MyBookmarksListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MyBookmarksListingModel? my_bookmarks = await listingSearchMyBookmarks(page);
						  if(!my_bookmarks?.items.items.isEmpty){
							 (currentState as MyBookmarksListingLoaded).my_bookmarks?.items.items.addAll(my_bookmarks?.items.items);
						  }
						  yield my_bookmarks?.items.items.isEmpty
							  ? (currentState as MyBookmarksListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyBookmarksListingLoaded(  my_bookmarks:  (currentState as MyBookmarksListingLoaded).my_bookmarks! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MyBookmarksListingLoaded).page! + 1;
							  if ((currentState as MyBookmarksListingLoaded).my_bookmarks?.tools.paging.total_pages == oldpage) {
						yield (currentState as MyBookmarksListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MyBookmarksListingModel? my_bookmarks = await listingMyBookmarks(page);
							  yield my_bookmarks?.items.items.isEmpty
								  ? (currentState as MyBookmarksListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyBookmarksListingLoaded(  my_bookmarks:  my_bookmarks! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MyBookmarksListingError();
        
      }
    } else if (event is MyBookmarksListingRefresh){
      try {
        if (currentState is MyBookmarksListingUninitialized) {
		   if(isSearch!){

			    MyBookmarksListingModel? my_bookmarks = await listingSearchMyBookmarks(1);
              yield MyBookmarksListingLoaded( my_bookmarks: my_bookmarks!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MyBookmarksListingModel? my_bookmarks = await listingMyBookmarks(1);
				   yield MyBookmarksListingLoaded( my_bookmarks: my_bookmarks!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MyBookmarksListingLoaded) {
		  if(isSearch!){
		     MyBookmarksListingModel? my_bookmarks = await listingSearchRefreshMyBookmarks();
              yield my_bookmarks?.items.items.isEmpty
              ? (currentState as MyBookmarksListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyBookmarksListingLoaded(  my_bookmarks: my_bookmarks! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MyBookmarksListingModel? my_bookmarks = await listingMyBookmarks(1);
				  int deltaPage = my_bookmarks?.items.items.length ~/ (my_bookmarks?.tools.paging.total_rows/my_bookmarks?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_bookmarks?.items.items.isEmpty
					  ? (currentState as MyBookmarksListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyBookmarksListingLoaded(my_bookmarks: my_bookmarks!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MyBookmarksListingError();
      }

    }
  }

  bool hasReachedMax(MyBookmarksState state) =>
      state is MyBookmarksListingLoaded && state.hasReachedMax!;

  Future<MyBookmarksListingModel?> listingMyBookmarks(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyBookmarksList(url!, page!);
  }

  Future<MyBookmarksListingModel?> listingRefreshMyBookmarks() async {
    MyBookmarksListingModel? my_bookmarks;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMyBookmarksList();
    my_bookmarks  = await apiRepProvider?.getMyBookmarksList(url!, 1);
    return my_bookmarks;
  }
  
  

  Future<MyBookmarksListingModel?> listingSearchMyBookmarks(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyBookmarksListSearch(url!, page!);
  }

  Future<MyBookmarksListingModel?> listingSearchRefreshMyBookmarks() async {
    MyBookmarksListingModel? my_bookmarks ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_bookmarks  = await apiRepProvider?.getMyBookmarksListSearch(url!, 1);
    return my_bookmarks;
  }
}


