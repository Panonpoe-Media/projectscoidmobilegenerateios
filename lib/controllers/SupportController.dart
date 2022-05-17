
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class SupportController {

  ProjectscoidApplication application;
  SupportListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  SupportController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new SupportListing(this.application, this.url!, this.isSearch, SupportListingUninitialized());}
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

  Future editSupport()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editSupport;
    editSupport = await apiRepProvider?.getSupportEdit(url!, id!, title!);
    return editSupport;
  }
  
    Future viewSupport()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var viewSupport;
    viewSupport = await apiRepProvider?.getSupportView(url!, id!, title!);
    return viewSupport;
  }

  Future postSupport() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postSupport;
    postSupport = await apiRepProvider?.sendSupportPost(url!,formData);
    return postSupport;
  }
  
    Future postSupportWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postSupport;
    postSupport = await apiRepProvider?.sendSupportPostWithID(url!,formData, id!, title!);
    return postSupport;
  }

  
  
    Future editContactFormSupport()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editContactForm;
    editContactForm = await apiRepProvider?.getContactFormSupportEdit(url!, id!, title!);
    return editContactForm;
  }

  Future postContactFormSupport() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postContactForm;
    postContactForm = await apiRepProvider?.sendContactFormSupportPost(url!,formData);
    return postContactForm;
  }
  
    Future postContactFormSupportWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postContactForm;
    postContactForm = await apiRepProvider?.sendContactFormSupportPostWithID(url!,formData, id!, title!);
    return postContactForm;
  }
  
      Future getContactFormSupport(String spKey)async{
  
        APIRepository? apiRepProvider = application.projectsAPIRepository;
        var getContactForm;
        getContactForm = await apiRepProvider?.getContactFormSupport(url!, id!, title!, spKey);
	    return getContactForm ;
	 }
   Future<ContactFormSupportModel> loadContactFormSupport() async{
   APIRepository? apiRepProvider = application.projectsAPIRepository;
        var loadContactForm;
        loadContactForm = await apiRepProvider?.loadContactFormSupport('');
	    return loadContactForm ;  
   }
  
   Future saveContactFormSupport(ContactFormSupportModel? support, String? spKey) async{  
       APIRepository? apiRepProvider = application.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateContactFormSupport(support!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllContactFormSupport(String? spKey) async{
	 APIRepository? apiRepProvider = application.projectsAPIRepository;
       await apiRepProvider?.deleteAllContactFormSupport(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class SupportListing extends Bloc<SupportEvent, SupportState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  SupportListing(this.application, this.url, this.isSearch, SupportState initialState):
  super(initialState){
     on<SupportList>(_SupportListEvent);
	
	  on<SupportListingRefresh>(_SupportListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<SupportEvent, SupportState>> transformEvents(
      Stream<SupportEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<SupportEvent> transform<SupportEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<SupportEvent, SupportState> transition) {
    print(transition);
  }

  @override
  get initialState => SupportListingUninitialized();

void _SupportListEvent(SupportList event, Emitter<SupportState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is SupportListingUninitialized){
			  if(isSearch!){
			     SupportListingModel? support = await listingSearchSupport(1);
				  int deltaPage;
				  if(support?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  support?.items.items.length ~/ (support?.tools.paging.total_rows/support?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( support?.items.items.isEmpty
					  ? SupportListingLoaded(support: support!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : SupportListingLoaded(support: support!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  SupportListingModel? support = await listingSupport(1);
				   int deltaPage;
				  if(support?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  support?.items.items.length ~/ (support?.tools.paging.total_rows/support?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( support?.items.items.isEmpty
					  ? SupportListingLoaded(support: support!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :SupportListingLoaded(support: support!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is SupportListingLoaded) {
          //page++;
		    final oldpage = (currentState as SupportListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as SupportListingLoaded).page! + 1;
			 if ((currentState as SupportListingLoaded).support?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as SupportListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      SupportListingModel? support = await listingSearchSupport(page);
						  if(!support?.items.items.isEmpty){
							 (currentState as SupportListingLoaded).support?.items.items.addAll(support?.items.items);
						  }
						  return emit ( support?.items.items.isEmpty
							  ? (currentState as SupportListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : SupportListingLoaded(  support:  (currentState as SupportListingLoaded).support! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as SupportListingLoaded).page! + 1;
							  if ((currentState as SupportListingLoaded).support?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as SupportListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  SupportListingModel? support = await listingSupport(page);
							  return emit ( support?.items.items.isEmpty
								  ? (currentState as SupportListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : SupportListingLoaded(  support:  support! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( SupportListingError());
        
      }
    }
  }

void _SupportListingRefreshEvent(SupportListingRefresh event, Emitter<SupportState> emit)async{
  final currentState = state;
   try {
        if (currentState is SupportListingUninitialized) {
		   if(isSearch!){

			    SupportListingModel? support = await listingSearchSupport(1);
              return emit (  SupportListingLoaded( support: support!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    SupportListingModel? support = await listingSupport(1);
				   return emit (  SupportListingLoaded( support: support!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is SupportListingLoaded) {
		  if(isSearch!){
		     SupportListingModel? support = await listingSearchRefreshSupport();
              return emit (  support?.items.items.isEmpty
              ? (currentState as SupportListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : SupportListingLoaded(  support: support! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  SupportListingModel? support = await listingSupport(1);
				  int deltaPage = support?.items.items.length ~/ (support?.tools.paging.total_rows/support?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  support?.items.items.isEmpty
					  ? (currentState as SupportListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :SupportListingLoaded(support: support!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  SupportListingError());
      }
  }

  @override

  Stream<SupportState> mapEventToState(SupportEvent event) async* {
    final currentState = state;
    if (event is SupportList && !hasReachedMax(currentState)) {
      try {
        if (currentState is SupportListingUninitialized){
			  if(isSearch!){
			     SupportListingModel? support = await listingSearchSupport(1);
				  int deltaPage;
				  if(support?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  support?.items.items.length ~/ (support?.tools.paging.total_rows/support?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield support?.items.items.isEmpty
					  ? SupportListingLoaded(support: support!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : SupportListingLoaded(support: support!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  SupportListingModel? support = await listingSupport(1);
				   int deltaPage;
				  if(support?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  support?.items.items.length ~/ (support?.tools.paging.total_rows/support?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield support?.items.items.isEmpty
					  ? SupportListingLoaded(support: support!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :SupportListingLoaded(support: support!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is SupportListingLoaded) {
          //page++;
		    final oldpage = (currentState as SupportListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as SupportListingLoaded).page! + 1;
			 if ((currentState as SupportListingLoaded).support?.tools.paging.total_pages == oldpage) {
					yield (currentState as SupportListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      SupportListingModel? support = await listingSearchSupport(page);
						  if(!support?.items.items.isEmpty){
							 (currentState as SupportListingLoaded).support?.items.items.addAll(support?.items.items);
						  }
						  yield support?.items.items.isEmpty
							  ? (currentState as SupportListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : SupportListingLoaded(  support:  (currentState as SupportListingLoaded).support! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as SupportListingLoaded).page! + 1;
							  if ((currentState as SupportListingLoaded).support?.tools.paging.total_pages == oldpage) {
						yield (currentState as SupportListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  SupportListingModel? support = await listingSupport(page);
							  yield support?.items.items.isEmpty
								  ? (currentState as SupportListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : SupportListingLoaded(  support:  support! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield SupportListingError();
        
      }
    } else if (event is SupportListingRefresh){
      try {
        if (currentState is SupportListingUninitialized) {
		   if(isSearch!){

			    SupportListingModel? support = await listingSearchSupport(1);
              yield SupportListingLoaded( support: support!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    SupportListingModel? support = await listingSupport(1);
				   yield SupportListingLoaded( support: support!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is SupportListingLoaded) {
		  if(isSearch!){
		     SupportListingModel? support = await listingSearchRefreshSupport();
              yield support?.items.items.isEmpty
              ? (currentState as SupportListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : SupportListingLoaded(  support: support! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  SupportListingModel? support = await listingSupport(1);
				  int deltaPage = support?.items.items.length ~/ (support?.tools.paging.total_rows/support?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield support?.items.items.isEmpty
					  ? (currentState as SupportListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :SupportListingLoaded(support: support!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield SupportListingError();
      }

    }
  }

  bool hasReachedMax(SupportState state) =>
      state is SupportListingLoaded && state.hasReachedMax!;

  Future<SupportListingModel?> listingSupport(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getSupportList(url!, page!);
  }

  Future<SupportListingModel?> listingRefreshSupport() async {
    SupportListingModel? support;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllSupportList();
    support  = await apiRepProvider?.getSupportList(url!, 1);
    return support;
  }
  
  

  Future<SupportListingModel?> listingSearchSupport(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getSupportListSearch(url!, page!);
  }

  Future<SupportListingModel?> listingSearchRefreshSupport() async {
    SupportListingModel? support ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    support  = await apiRepProvider?.getSupportListSearch(url!, 1);
    return support;
  }
}


