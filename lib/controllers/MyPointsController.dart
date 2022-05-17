
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class MyPointsController {

  ProjectscoidApplication application;
  MyPointsListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  MyPointsController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MyPointsListing(this.application, this.url!, this.isSearch, MyPointsListingUninitialized());}
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

  Future editMyPoints()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editMyPoints;
    editMyPoints = await apiRepProvider?.getMyPointsEdit(url!, id!, title!);
    return editMyPoints;
  }
  
    Future viewMyPoints()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var viewMyPoints;
    viewMyPoints = await apiRepProvider?.getMyPointsView(url!, id!, title!);
    return viewMyPoints;
  }

  Future postMyPoints() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postMyPoints;
    postMyPoints = await apiRepProvider?.sendMyPointsPost(url!,formData);
    return postMyPoints;
  }
  
    Future postMyPointsWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postMyPoints;
    postMyPoints = await apiRepProvider?.sendMyPointsPostWithID(url!,formData, id!, title!);
    return postMyPoints;
  }

  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MyPointsListing extends Bloc<MyPointsEvent, MyPointsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MyPointsListing(this.application, this.url, this.isSearch, MyPointsState initialState):
  super(initialState){
     on<MyPointsList>(_MyPointsListEvent);
	
	  on<MyPointsListingRefresh>(_MyPointsListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MyPointsEvent, MyPointsState>> transformEvents(
      Stream<MyPointsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MyPointsEvent> transform<MyPointsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MyPointsEvent, MyPointsState> transition) {
    print(transition);
  }

  @override
  get initialState => MyPointsListingUninitialized();

void _MyPointsListEvent(MyPointsList event, Emitter<MyPointsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MyPointsListingUninitialized){
			  if(isSearch!){
			     MyPointsListingModel? my_points = await listingSearchMyPoints(1);
				  int deltaPage;
				  if(my_points?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_points?.items.items.length ~/ (my_points?.tools.paging.total_rows/my_points?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_points?.items.items.isEmpty
					  ? MyPointsListingLoaded(my_points: my_points!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyPointsListingLoaded(my_points: my_points!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MyPointsListingModel? my_points = await listingMyPoints(1);
				   int deltaPage;
				  if(my_points?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_points?.items.items.length ~/ (my_points?.tools.paging.total_rows/my_points?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_points?.items.items.isEmpty
					  ? MyPointsListingLoaded(my_points: my_points!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyPointsListingLoaded(my_points: my_points!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MyPointsListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyPointsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyPointsListingLoaded).page! + 1;
			 if ((currentState as MyPointsListingLoaded).my_points?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MyPointsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MyPointsListingModel? my_points = await listingSearchMyPoints(page);
						  if(!my_points?.items.items.isEmpty){
							 (currentState as MyPointsListingLoaded).my_points?.items.items.addAll(my_points?.items.items);
						  }
						  return emit ( my_points?.items.items.isEmpty
							  ? (currentState as MyPointsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyPointsListingLoaded(  my_points:  (currentState as MyPointsListingLoaded).my_points! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MyPointsListingLoaded).page! + 1;
							  if ((currentState as MyPointsListingLoaded).my_points?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MyPointsListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MyPointsListingModel? my_points = await listingMyPoints(page);
							  return emit ( my_points?.items.items.isEmpty
								  ? (currentState as MyPointsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyPointsListingLoaded(  my_points:  my_points! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MyPointsListingError());
        
      }
    }
  }

void _MyPointsListingRefreshEvent(MyPointsListingRefresh event, Emitter<MyPointsState> emit)async{
  final currentState = state;
   try {
        if (currentState is MyPointsListingUninitialized) {
		   if(isSearch!){

			    MyPointsListingModel? my_points = await listingSearchMyPoints(1);
              return emit (  MyPointsListingLoaded( my_points: my_points!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MyPointsListingModel? my_points = await listingMyPoints(1);
				   return emit (  MyPointsListingLoaded( my_points: my_points!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MyPointsListingLoaded) {
		  if(isSearch!){
		     MyPointsListingModel? my_points = await listingSearchRefreshMyPoints();
              return emit (  my_points?.items.items.isEmpty
              ? (currentState as MyPointsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyPointsListingLoaded(  my_points: my_points! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MyPointsListingModel? my_points = await listingMyPoints(1);
				  int deltaPage = my_points?.items.items.length ~/ (my_points?.tools.paging.total_rows/my_points?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_points?.items.items.isEmpty
					  ? (currentState as MyPointsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyPointsListingLoaded(my_points: my_points!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MyPointsListingError());
      }
  }

  @override

  Stream<MyPointsState> mapEventToState(MyPointsEvent event) async* {
    final currentState = state;
    if (event is MyPointsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MyPointsListingUninitialized){
			  if(isSearch!){
			     MyPointsListingModel? my_points = await listingSearchMyPoints(1);
				  int deltaPage;
				  if(my_points?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_points?.items.items.length ~/ (my_points?.tools.paging.total_rows/my_points?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_points?.items.items.isEmpty
					  ? MyPointsListingLoaded(my_points: my_points!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyPointsListingLoaded(my_points: my_points!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MyPointsListingModel? my_points = await listingMyPoints(1);
				   int deltaPage;
				  if(my_points?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_points?.items.items.length ~/ (my_points?.tools.paging.total_rows/my_points?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_points?.items.items.isEmpty
					  ? MyPointsListingLoaded(my_points: my_points!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyPointsListingLoaded(my_points: my_points!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MyPointsListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyPointsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyPointsListingLoaded).page! + 1;
			 if ((currentState as MyPointsListingLoaded).my_points?.tools.paging.total_pages == oldpage) {
					yield (currentState as MyPointsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MyPointsListingModel? my_points = await listingSearchMyPoints(page);
						  if(!my_points?.items.items.isEmpty){
							 (currentState as MyPointsListingLoaded).my_points?.items.items.addAll(my_points?.items.items);
						  }
						  yield my_points?.items.items.isEmpty
							  ? (currentState as MyPointsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyPointsListingLoaded(  my_points:  (currentState as MyPointsListingLoaded).my_points! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MyPointsListingLoaded).page! + 1;
							  if ((currentState as MyPointsListingLoaded).my_points?.tools.paging.total_pages == oldpage) {
						yield (currentState as MyPointsListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MyPointsListingModel? my_points = await listingMyPoints(page);
							  yield my_points?.items.items.isEmpty
								  ? (currentState as MyPointsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyPointsListingLoaded(  my_points:  my_points! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MyPointsListingError();
        
      }
    } else if (event is MyPointsListingRefresh){
      try {
        if (currentState is MyPointsListingUninitialized) {
		   if(isSearch!){

			    MyPointsListingModel? my_points = await listingSearchMyPoints(1);
              yield MyPointsListingLoaded( my_points: my_points!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MyPointsListingModel? my_points = await listingMyPoints(1);
				   yield MyPointsListingLoaded( my_points: my_points!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MyPointsListingLoaded) {
		  if(isSearch!){
		     MyPointsListingModel? my_points = await listingSearchRefreshMyPoints();
              yield my_points?.items.items.isEmpty
              ? (currentState as MyPointsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyPointsListingLoaded(  my_points: my_points! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MyPointsListingModel? my_points = await listingMyPoints(1);
				  int deltaPage = my_points?.items.items.length ~/ (my_points?.tools.paging.total_rows/my_points?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_points?.items.items.isEmpty
					  ? (currentState as MyPointsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyPointsListingLoaded(my_points: my_points!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MyPointsListingError();
      }

    }
  }

  bool hasReachedMax(MyPointsState state) =>
      state is MyPointsListingLoaded && state.hasReachedMax!;

  Future<MyPointsListingModel?> listingMyPoints(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyPointsList(url!, page!);
  }

  Future<MyPointsListingModel?> listingRefreshMyPoints() async {
    MyPointsListingModel? my_points;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMyPointsList();
    my_points  = await apiRepProvider?.getMyPointsList(url!, 1);
    return my_points;
  }
  
  

  Future<MyPointsListingModel?> listingSearchMyPoints(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyPointsListSearch(url!, page!);
  }

  Future<MyPointsListingModel?> listingSearchRefreshMyPoints() async {
    MyPointsListingModel? my_points ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_points  = await apiRepProvider?.getMyPointsListSearch(url!, 1);
    return my_points;
  }
}


