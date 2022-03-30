
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class MyReferalsController {

  ProjectscoidApplication application;
  MyReferalsListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  MyReferalsController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MyReferalsListing(this.application, this.url!, this.isSearch, MyReferalsListingUninitialized());}
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

  Future editMyReferals()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editMyReferals;
    editMyReferals = await apiRepProvider?.getMyReferalsEdit(url!, id!, title!);
    return editMyReferals;
  }
  
    Future viewMyReferals()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewMyReferals;
    viewMyReferals = await apiRepProvider?.getMyReferalsView(url!, id!, title!);
    return viewMyReferals;
  }

  Future postMyReferals() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyReferals;
    postMyReferals = await apiRepProvider?.sendMyReferalsPost(url!,formData);
    return postMyReferals;
  }
  
    Future postMyReferalsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyReferals;
    postMyReferals = await apiRepProvider?.sendMyReferalsPostWithID(url!,formData, id!, title!);
    return postMyReferals;
  }

  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MyReferalsListing extends Bloc<MyReferalsEvent, MyReferalsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MyReferalsListing(this.application, this.url, this.isSearch, MyReferalsState initialState):
  super(initialState){
     on<MyReferalsList>(_MyReferalsListEvent);
	
	  on<MyReferalsListingRefresh>(_MyReferalsListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MyReferalsEvent, MyReferalsState>> transformEvents(
      Stream<MyReferalsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MyReferalsEvent> transform<MyReferalsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MyReferalsEvent, MyReferalsState> transition) {
    print(transition);
  }

  @override
  get initialState => MyReferalsListingUninitialized();

void _MyReferalsListEvent(MyReferalsList event, Emitter<MyReferalsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MyReferalsListingUninitialized){
			  if(isSearch!){
			     MyReferalsListingModel? my_referals = await listingSearchMyReferals(1);
				  int deltaPage;
				  if(my_referals?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_referals?.items.items.length ~/ (my_referals?.tools.paging.total_rows/my_referals?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_referals?.items.items.isEmpty
					  ? MyReferalsListingLoaded(my_referals: my_referals!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyReferalsListingLoaded(my_referals: my_referals!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MyReferalsListingModel? my_referals = await listingMyReferals(1);
				   int deltaPage;
				  if(my_referals?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_referals?.items.items.length ~/ (my_referals?.tools.paging.total_rows/my_referals?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_referals?.items.items.isEmpty
					  ? MyReferalsListingLoaded(my_referals: my_referals!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyReferalsListingLoaded(my_referals: my_referals!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MyReferalsListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyReferalsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyReferalsListingLoaded).page! + 1;
			 if ((currentState as MyReferalsListingLoaded).my_referals?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MyReferalsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MyReferalsListingModel? my_referals = await listingSearchMyReferals(page);
						  if(!my_referals?.items.items.isEmpty){
							 (currentState as MyReferalsListingLoaded).my_referals?.items.items.addAll(my_referals?.items.items);
						  }
						  return emit ( my_referals?.items.items.isEmpty
							  ? (currentState as MyReferalsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyReferalsListingLoaded(  my_referals:  (currentState as MyReferalsListingLoaded).my_referals! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MyReferalsListingLoaded).page! + 1;
							  if ((currentState as MyReferalsListingLoaded).my_referals?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MyReferalsListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MyReferalsListingModel? my_referals = await listingMyReferals(page);
							  return emit ( my_referals?.items.items.isEmpty
								  ? (currentState as MyReferalsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyReferalsListingLoaded(  my_referals:  my_referals! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MyReferalsListingError());
        
      }
    }
  }

void _MyReferalsListingRefreshEvent(MyReferalsListingRefresh event, Emitter<MyReferalsState> emit)async{
  final currentState = state;
   try {
        if (currentState is MyReferalsListingUninitialized) {
		   if(isSearch!){

			    MyReferalsListingModel? my_referals = await listingSearchMyReferals(1);
              return emit (  MyReferalsListingLoaded( my_referals: my_referals!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MyReferalsListingModel? my_referals = await listingMyReferals(1);
				   return emit (  MyReferalsListingLoaded( my_referals: my_referals!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MyReferalsListingLoaded) {
		  if(isSearch!){
		     MyReferalsListingModel? my_referals = await listingSearchRefreshMyReferals();
              return emit (  my_referals?.items.items.isEmpty
              ? (currentState as MyReferalsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyReferalsListingLoaded(  my_referals: my_referals! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MyReferalsListingModel? my_referals = await listingMyReferals(1);
				  int deltaPage = my_referals?.items.items.length ~/ (my_referals?.tools.paging.total_rows/my_referals?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_referals?.items.items.isEmpty
					  ? (currentState as MyReferalsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyReferalsListingLoaded(my_referals: my_referals!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MyReferalsListingError());
      }
  }

  @override

  Stream<MyReferalsState> mapEventToState(MyReferalsEvent event) async* {
    final currentState = state;
    if (event is MyReferalsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MyReferalsListingUninitialized){
			  if(isSearch!){
			     MyReferalsListingModel? my_referals = await listingSearchMyReferals(1);
				  int deltaPage;
				  if(my_referals?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_referals?.items.items.length ~/ (my_referals?.tools.paging.total_rows/my_referals?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_referals?.items.items.isEmpty
					  ? MyReferalsListingLoaded(my_referals: my_referals!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyReferalsListingLoaded(my_referals: my_referals!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MyReferalsListingModel? my_referals = await listingMyReferals(1);
				   int deltaPage;
				  if(my_referals?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_referals?.items.items.length ~/ (my_referals?.tools.paging.total_rows/my_referals?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_referals?.items.items.isEmpty
					  ? MyReferalsListingLoaded(my_referals: my_referals!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyReferalsListingLoaded(my_referals: my_referals!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MyReferalsListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyReferalsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyReferalsListingLoaded).page! + 1;
			 if ((currentState as MyReferalsListingLoaded).my_referals?.tools.paging.total_pages == oldpage) {
					yield (currentState as MyReferalsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MyReferalsListingModel? my_referals = await listingSearchMyReferals(page);
						  if(!my_referals?.items.items.isEmpty){
							 (currentState as MyReferalsListingLoaded).my_referals?.items.items.addAll(my_referals?.items.items);
						  }
						  yield my_referals?.items.items.isEmpty
							  ? (currentState as MyReferalsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyReferalsListingLoaded(  my_referals:  (currentState as MyReferalsListingLoaded).my_referals! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MyReferalsListingLoaded).page! + 1;
							  if ((currentState as MyReferalsListingLoaded).my_referals?.tools.paging.total_pages == oldpage) {
						yield (currentState as MyReferalsListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MyReferalsListingModel? my_referals = await listingMyReferals(page);
							  yield my_referals?.items.items.isEmpty
								  ? (currentState as MyReferalsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyReferalsListingLoaded(  my_referals:  my_referals! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MyReferalsListingError();
        
      }
    } else if (event is MyReferalsListingRefresh){
      try {
        if (currentState is MyReferalsListingUninitialized) {
		   if(isSearch!){

			    MyReferalsListingModel? my_referals = await listingSearchMyReferals(1);
              yield MyReferalsListingLoaded( my_referals: my_referals!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MyReferalsListingModel? my_referals = await listingMyReferals(1);
				   yield MyReferalsListingLoaded( my_referals: my_referals!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MyReferalsListingLoaded) {
		  if(isSearch!){
		     MyReferalsListingModel? my_referals = await listingSearchRefreshMyReferals();
              yield my_referals?.items.items.isEmpty
              ? (currentState as MyReferalsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyReferalsListingLoaded(  my_referals: my_referals! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MyReferalsListingModel? my_referals = await listingMyReferals(1);
				  int deltaPage = my_referals?.items.items.length ~/ (my_referals?.tools.paging.total_rows/my_referals?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_referals?.items.items.isEmpty
					  ? (currentState as MyReferalsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyReferalsListingLoaded(my_referals: my_referals!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MyReferalsListingError();
      }

    }
  }

  bool hasReachedMax(MyReferalsState state) =>
      state is MyReferalsListingLoaded && state.hasReachedMax!;

  Future<MyReferalsListingModel?> listingMyReferals(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyReferalsList(url!, page!);
  }

  Future<MyReferalsListingModel?> listingRefreshMyReferals() async {
    MyReferalsListingModel? my_referals;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMyReferalsList();
    my_referals  = await apiRepProvider?.getMyReferalsList(url!, 1);
    return my_referals;
  }
  
  

  Future<MyReferalsListingModel?> listingSearchMyReferals(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyReferalsListSearch(url!, page!);
  }

  Future<MyReferalsListingModel?> listingSearchRefreshMyReferals() async {
    MyReferalsListingModel? my_referals ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_referals  = await apiRepProvider?.getMyReferalsListSearch(url!, 1);
    return my_referals;
  }
}


