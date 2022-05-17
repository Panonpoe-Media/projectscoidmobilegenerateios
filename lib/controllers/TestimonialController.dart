
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class TestimonialController {

  ProjectscoidApplication application;
  TestimonialListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  TestimonialController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new TestimonialListing(this.application, this.url!, this.isSearch, TestimonialListingUninitialized());}
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

  Future editTestimonial()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editTestimonial;
    editTestimonial = await apiRepProvider?.getTestimonialEdit(url!, id!, title!);
    return editTestimonial;
  }
  
    Future viewTestimonial()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var viewTestimonial;
    viewTestimonial = await apiRepProvider?.getTestimonialView(url!, id!, title!);
    return viewTestimonial;
  }

  Future postTestimonial() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postTestimonial;
    postTestimonial = await apiRepProvider?.sendTestimonialPost(url!,formData);
    return postTestimonial;
  }
  
    Future postTestimonialWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postTestimonial;
    postTestimonial = await apiRepProvider?.sendTestimonialPostWithID(url!,formData, id!, title!);
    return postTestimonial;
  }

  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class TestimonialListing extends Bloc<TestimonialEvent, TestimonialState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  TestimonialListing(this.application, this.url, this.isSearch, TestimonialState initialState):
  super(initialState){
     on<TestimonialList>(_TestimonialListEvent);
	
	  on<TestimonialListingRefresh>(_TestimonialListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<TestimonialEvent, TestimonialState>> transformEvents(
      Stream<TestimonialEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<TestimonialEvent> transform<TestimonialEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<TestimonialEvent, TestimonialState> transition) {
    print(transition);
  }

  @override
  get initialState => TestimonialListingUninitialized();

void _TestimonialListEvent(TestimonialList event, Emitter<TestimonialState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is TestimonialListingUninitialized){
			  if(isSearch!){
			     TestimonialListingModel? testimonial = await listingSearchTestimonial(1);
				  int deltaPage;
				  if(testimonial?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  testimonial?.items.items.length ~/ (testimonial?.tools.paging.total_rows/testimonial?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( testimonial?.items.items.isEmpty
					  ? TestimonialListingLoaded(testimonial: testimonial!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : TestimonialListingLoaded(testimonial: testimonial!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  TestimonialListingModel? testimonial = await listingTestimonial(1);
				   int deltaPage;
				  if(testimonial?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  testimonial?.items.items.length ~/ (testimonial?.tools.paging.total_rows/testimonial?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( testimonial?.items.items.isEmpty
					  ? TestimonialListingLoaded(testimonial: testimonial!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :TestimonialListingLoaded(testimonial: testimonial!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is TestimonialListingLoaded) {
          //page++;
		    final oldpage = (currentState as TestimonialListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as TestimonialListingLoaded).page! + 1;
			 if ((currentState as TestimonialListingLoaded).testimonial?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as TestimonialListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      TestimonialListingModel? testimonial = await listingSearchTestimonial(page);
						  if(!testimonial?.items.items.isEmpty){
							 (currentState as TestimonialListingLoaded).testimonial?.items.items.addAll(testimonial?.items.items);
						  }
						  return emit ( testimonial?.items.items.isEmpty
							  ? (currentState as TestimonialListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : TestimonialListingLoaded(  testimonial:  (currentState as TestimonialListingLoaded).testimonial! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as TestimonialListingLoaded).page! + 1;
							  if ((currentState as TestimonialListingLoaded).testimonial?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as TestimonialListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  TestimonialListingModel? testimonial = await listingTestimonial(page);
							  return emit ( testimonial?.items.items.isEmpty
								  ? (currentState as TestimonialListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : TestimonialListingLoaded(  testimonial:  testimonial! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( TestimonialListingError());
        
      }
    }
  }

void _TestimonialListingRefreshEvent(TestimonialListingRefresh event, Emitter<TestimonialState> emit)async{
  final currentState = state;
   try {
        if (currentState is TestimonialListingUninitialized) {
		   if(isSearch!){

			    TestimonialListingModel? testimonial = await listingSearchTestimonial(1);
              return emit (  TestimonialListingLoaded( testimonial: testimonial!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    TestimonialListingModel? testimonial = await listingTestimonial(1);
				   return emit (  TestimonialListingLoaded( testimonial: testimonial!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is TestimonialListingLoaded) {
		  if(isSearch!){
		     TestimonialListingModel? testimonial = await listingSearchRefreshTestimonial();
              return emit (  testimonial?.items.items.isEmpty
              ? (currentState as TestimonialListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : TestimonialListingLoaded(  testimonial: testimonial! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  TestimonialListingModel? testimonial = await listingTestimonial(1);
				  int deltaPage = testimonial?.items.items.length ~/ (testimonial?.tools.paging.total_rows/testimonial?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  testimonial?.items.items.isEmpty
					  ? (currentState as TestimonialListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :TestimonialListingLoaded(testimonial: testimonial!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  TestimonialListingError());
      }
  }

  @override

  Stream<TestimonialState> mapEventToState(TestimonialEvent event) async* {
    final currentState = state;
    if (event is TestimonialList && !hasReachedMax(currentState)) {
      try {
        if (currentState is TestimonialListingUninitialized){
			  if(isSearch!){
			     TestimonialListingModel? testimonial = await listingSearchTestimonial(1);
				  int deltaPage;
				  if(testimonial?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  testimonial?.items.items.length ~/ (testimonial?.tools.paging.total_rows/testimonial?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield testimonial?.items.items.isEmpty
					  ? TestimonialListingLoaded(testimonial: testimonial!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : TestimonialListingLoaded(testimonial: testimonial!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  TestimonialListingModel? testimonial = await listingTestimonial(1);
				   int deltaPage;
				  if(testimonial?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  testimonial?.items.items.length ~/ (testimonial?.tools.paging.total_rows/testimonial?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield testimonial?.items.items.isEmpty
					  ? TestimonialListingLoaded(testimonial: testimonial!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :TestimonialListingLoaded(testimonial: testimonial!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is TestimonialListingLoaded) {
          //page++;
		    final oldpage = (currentState as TestimonialListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as TestimonialListingLoaded).page! + 1;
			 if ((currentState as TestimonialListingLoaded).testimonial?.tools.paging.total_pages == oldpage) {
					yield (currentState as TestimonialListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      TestimonialListingModel? testimonial = await listingSearchTestimonial(page);
						  if(!testimonial?.items.items.isEmpty){
							 (currentState as TestimonialListingLoaded).testimonial?.items.items.addAll(testimonial?.items.items);
						  }
						  yield testimonial?.items.items.isEmpty
							  ? (currentState as TestimonialListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : TestimonialListingLoaded(  testimonial:  (currentState as TestimonialListingLoaded).testimonial! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as TestimonialListingLoaded).page! + 1;
							  if ((currentState as TestimonialListingLoaded).testimonial?.tools.paging.total_pages == oldpage) {
						yield (currentState as TestimonialListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  TestimonialListingModel? testimonial = await listingTestimonial(page);
							  yield testimonial?.items.items.isEmpty
								  ? (currentState as TestimonialListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : TestimonialListingLoaded(  testimonial:  testimonial! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield TestimonialListingError();
        
      }
    } else if (event is TestimonialListingRefresh){
      try {
        if (currentState is TestimonialListingUninitialized) {
		   if(isSearch!){

			    TestimonialListingModel? testimonial = await listingSearchTestimonial(1);
              yield TestimonialListingLoaded( testimonial: testimonial!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    TestimonialListingModel? testimonial = await listingTestimonial(1);
				   yield TestimonialListingLoaded( testimonial: testimonial!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is TestimonialListingLoaded) {
		  if(isSearch!){
		     TestimonialListingModel? testimonial = await listingSearchRefreshTestimonial();
              yield testimonial?.items.items.isEmpty
              ? (currentState as TestimonialListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : TestimonialListingLoaded(  testimonial: testimonial! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  TestimonialListingModel? testimonial = await listingTestimonial(1);
				  int deltaPage = testimonial?.items.items.length ~/ (testimonial?.tools.paging.total_rows/testimonial?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield testimonial?.items.items.isEmpty
					  ? (currentState as TestimonialListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :TestimonialListingLoaded(testimonial: testimonial!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield TestimonialListingError();
      }

    }
  }

  bool hasReachedMax(TestimonialState state) =>
      state is TestimonialListingLoaded && state.hasReachedMax!;

  Future<TestimonialListingModel?> listingTestimonial(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getTestimonialList(url!, page!);
  }

  Future<TestimonialListingModel?> listingRefreshTestimonial() async {
    TestimonialListingModel? testimonial;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllTestimonialList();
    testimonial  = await apiRepProvider?.getTestimonialList(url!, 1);
    return testimonial;
  }
  
  

  Future<TestimonialListingModel?> listingSearchTestimonial(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getTestimonialListSearch(url!, page!);
  }

  Future<TestimonialListingModel?> listingSearchRefreshTestimonial() async {
    TestimonialListingModel? testimonial ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    testimonial  = await apiRepProvider?.getTestimonialListSearch(url!, 1);
    return testimonial;
  }
}


