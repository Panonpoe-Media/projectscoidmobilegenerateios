
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class TestController {

  ProjectscoidApplication application;
  TestListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  TestController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new TestListing(this.application, this.url!, this.isSearch, TestListingUninitialized());}
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

  Future editTest()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editTest;
    editTest = await apiRepProvider?.getTestEdit(url!, id!, title!);
    return editTest;
  }
  
    Future viewTest()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var viewTest;
    viewTest = await apiRepProvider?.getTestView(url!, id!, title!);
    return viewTest;
  }

  Future postTest() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postTest;
    postTest = await apiRepProvider?.sendTestPost(url!,formData);
    return postTest;
  }
  
    Future postTestWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postTest;
    postTest = await apiRepProvider?.sendTestPostWithID(url!,formData, id!, title!);
    return postTest;
  }

  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class TestListing extends Bloc<TestEvent, TestState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  TestListing(this.application, this.url, this.isSearch, TestState initialState):
  super(initialState){
     on<TestList>(_TestListEvent);
	
	  on<TestListingRefresh>(_TestListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<TestEvent, TestState>> transformEvents(
      Stream<TestEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<TestEvent> transform<TestEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<TestEvent, TestState> transition) {
    print(transition);
  }

  @override
  get initialState => TestListingUninitialized();

void _TestListEvent(TestList event, Emitter<TestState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is TestListingUninitialized){
			  if(isSearch!){
			     TestListingModel? test = await listingSearchTest(1);
				  int deltaPage;
				  if(test?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  test?.items.items.length ~/ (test?.tools.paging.total_rows/test?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( test?.items.items.isEmpty
					  ? TestListingLoaded(test: test!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : TestListingLoaded(test: test!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  TestListingModel? test = await listingTest(1);
				   int deltaPage;
				  if(test?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  test?.items.items.length ~/ (test?.tools.paging.total_rows/test?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( test?.items.items.isEmpty
					  ? TestListingLoaded(test: test!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :TestListingLoaded(test: test!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is TestListingLoaded) {
          //page++;
		    final oldpage = (currentState as TestListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as TestListingLoaded).page! + 1;
			 if ((currentState as TestListingLoaded).test?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as TestListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      TestListingModel? test = await listingSearchTest(page);
						  if(!test?.items.items.isEmpty){
							 (currentState as TestListingLoaded).test?.items.items.addAll(test?.items.items);
						  }
						  return emit ( test?.items.items.isEmpty
							  ? (currentState as TestListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : TestListingLoaded(  test:  (currentState as TestListingLoaded).test! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as TestListingLoaded).page! + 1;
							  if ((currentState as TestListingLoaded).test?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as TestListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  TestListingModel? test = await listingTest(page);
							  return emit ( test?.items.items.isEmpty
								  ? (currentState as TestListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : TestListingLoaded(  test:  test! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( TestListingError());
        
      }
    }
  }

void _TestListingRefreshEvent(TestListingRefresh event, Emitter<TestState> emit)async{
  final currentState = state;
   try {
        if (currentState is TestListingUninitialized) {
		   if(isSearch!){

			    TestListingModel? test = await listingSearchTest(1);
              return emit (  TestListingLoaded( test: test!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    TestListingModel? test = await listingTest(1);
				   return emit (  TestListingLoaded( test: test!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is TestListingLoaded) {
		  if(isSearch!){
		     TestListingModel? test = await listingSearchRefreshTest();
              return emit (  test?.items.items.isEmpty
              ? (currentState as TestListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : TestListingLoaded(  test: test! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  TestListingModel? test = await listingTest(1);
				  int deltaPage = test?.items.items.length ~/ (test?.tools.paging.total_rows/test?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  test?.items.items.isEmpty
					  ? (currentState as TestListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :TestListingLoaded(test: test!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  TestListingError());
      }
  }

  @override

  Stream<TestState> mapEventToState(TestEvent event) async* {
    final currentState = state;
    if (event is TestList && !hasReachedMax(currentState)) {
      try {
        if (currentState is TestListingUninitialized){
			  if(isSearch!){
			     TestListingModel? test = await listingSearchTest(1);
				  int deltaPage;
				  if(test?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  test?.items.items.length ~/ (test?.tools.paging.total_rows/test?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield test?.items.items.isEmpty
					  ? TestListingLoaded(test: test!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : TestListingLoaded(test: test!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  TestListingModel? test = await listingTest(1);
				   int deltaPage;
				  if(test?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  test?.items.items.length ~/ (test?.tools.paging.total_rows/test?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield test?.items.items.isEmpty
					  ? TestListingLoaded(test: test!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :TestListingLoaded(test: test!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is TestListingLoaded) {
          //page++;
		    final oldpage = (currentState as TestListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as TestListingLoaded).page! + 1;
			 if ((currentState as TestListingLoaded).test?.tools.paging.total_pages == oldpage) {
					yield (currentState as TestListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      TestListingModel? test = await listingSearchTest(page);
						  if(!test?.items.items.isEmpty){
							 (currentState as TestListingLoaded).test?.items.items.addAll(test?.items.items);
						  }
						  yield test?.items.items.isEmpty
							  ? (currentState as TestListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : TestListingLoaded(  test:  (currentState as TestListingLoaded).test! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as TestListingLoaded).page! + 1;
							  if ((currentState as TestListingLoaded).test?.tools.paging.total_pages == oldpage) {
						yield (currentState as TestListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  TestListingModel? test = await listingTest(page);
							  yield test?.items.items.isEmpty
								  ? (currentState as TestListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : TestListingLoaded(  test:  test! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield TestListingError();
        
      }
    } else if (event is TestListingRefresh){
      try {
        if (currentState is TestListingUninitialized) {
		   if(isSearch!){

			    TestListingModel? test = await listingSearchTest(1);
              yield TestListingLoaded( test: test!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    TestListingModel? test = await listingTest(1);
				   yield TestListingLoaded( test: test!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is TestListingLoaded) {
		  if(isSearch!){
		     TestListingModel? test = await listingSearchRefreshTest();
              yield test?.items.items.isEmpty
              ? (currentState as TestListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : TestListingLoaded(  test: test! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  TestListingModel? test = await listingTest(1);
				  int deltaPage = test?.items.items.length ~/ (test?.tools.paging.total_rows/test?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield test?.items.items.isEmpty
					  ? (currentState as TestListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :TestListingLoaded(test: test!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield TestListingError();
      }

    }
  }

  bool hasReachedMax(TestState state) =>
      state is TestListingLoaded && state.hasReachedMax!;

  Future<TestListingModel?> listingTest(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getTestList(url!, page!);
  }

  Future<TestListingModel?> listingRefreshTest() async {
    TestListingModel? test;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllTestList();
    test  = await apiRepProvider?.getTestList(url!, 1);
    return test;
  }
  
  

  Future<TestListingModel?> listingSearchTest(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getTestListSearch(url!, page!);
  }

  Future<TestListingModel?> listingSearchRefreshTest() async {
    TestListingModel? test ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    test  = await apiRepProvider?.getTestListSearch(url!, 1);
    return test;
  }
}


