
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class ProgramController {

  ProjectscoidApplication application;
  ProgramListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  ProgramController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new ProgramListing(this.application, this.url!, this.isSearch, ProgramListingUninitialized());}
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

  Future editProgram()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editProgram;
    editProgram = await apiRepProvider?.getProgramEdit(url!, id!, title!);
    return editProgram;
  }
  
    Future viewProgram()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var viewProgram;
    viewProgram = await apiRepProvider?.getProgramView(url!, id!, title!);
    return viewProgram;
  }

  Future postProgram() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postProgram;
    postProgram = await apiRepProvider?.sendProgramPost(url!,formData);
    return postProgram;
  }
  
    Future postProgramWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postProgram;
    postProgram = await apiRepProvider?.sendProgramPostWithID(url!,formData, id!, title!);
    return postProgram;
  }

  
  
    Future editPromoProgram()async{
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var editPromo;
    editPromo = await apiRepProvider?.getPromoProgramEdit(url!, id!, title!);
    return editPromo;
  }

  Future postPromoProgram() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postPromo;
    postPromo = await apiRepProvider?.sendPromoProgramPost(url!,formData);
    return postPromo;
  }
  
    Future postPromoProgramWithID() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
    var postPromo;
    postPromo = await apiRepProvider?.sendPromoProgramPostWithID(url!,formData, id!, title!);
    return postPromo;
  }
  
      Future getPromoProgram(String spKey)async{
  
        APIRepository? apiRepProvider = application.projectsAPIRepository;
        var getPromo;
        getPromo = await apiRepProvider?.getPromoProgram(url!, id!, title!, spKey);
	    return getPromo ;
	 }
   Future<PromoProgramModel> loadPromoProgram() async{
   APIRepository? apiRepProvider = application.projectsAPIRepository;
        var loadPromo;
        loadPromo = await apiRepProvider?.loadPromoProgram('');
	    return loadPromo ;  
   }
  
   Future savePromoProgram(PromoProgramModel? program, String? spKey) async{  
       APIRepository? apiRepProvider = application.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePromoProgram(program!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPromoProgram(String? spKey) async{
	 APIRepository? apiRepProvider = application.projectsAPIRepository;
       await apiRepProvider?.deleteAllPromoProgram(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class ProgramListing extends Bloc<ProgramEvent, ProgramState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  ProgramListing(this.application, this.url, this.isSearch, ProgramState initialState):
  super(initialState){
     on<ProgramList>(_ProgramListEvent);
	
	  on<ProgramListingRefresh>(_ProgramListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<ProgramEvent, ProgramState>> transformEvents(
      Stream<ProgramEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<ProgramEvent> transform<ProgramEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<ProgramEvent, ProgramState> transition) {
    print(transition);
  }

  @override
  get initialState => ProgramListingUninitialized();

void _ProgramListEvent(ProgramList event, Emitter<ProgramState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is ProgramListingUninitialized){
			  if(isSearch!){
			     ProgramListingModel? program = await listingSearchProgram(1);
				  int deltaPage;
				  if(program?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  program?.items.items.length ~/ (program?.tools.paging.total_rows/program?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( program?.items.items.isEmpty
					  ? ProgramListingLoaded(program: program!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : ProgramListingLoaded(program: program!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  ProgramListingModel? program = await listingProgram(1);
				   int deltaPage;
				  if(program?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  program?.items.items.length ~/ (program?.tools.paging.total_rows/program?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( program?.items.items.isEmpty
					  ? ProgramListingLoaded(program: program!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :ProgramListingLoaded(program: program!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ProgramListingLoaded) {
          //page++;
		    final oldpage = (currentState as ProgramListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as ProgramListingLoaded).page! + 1;
			 if ((currentState as ProgramListingLoaded).program?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as ProgramListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      ProgramListingModel? program = await listingSearchProgram(page);
						  if(!program?.items.items.isEmpty){
							 (currentState as ProgramListingLoaded).program?.items.items.addAll(program?.items.items);
						  }
						  return emit ( program?.items.items.isEmpty
							  ? (currentState as ProgramListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : ProgramListingLoaded(  program:  (currentState as ProgramListingLoaded).program! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as ProgramListingLoaded).page! + 1;
							  if ((currentState as ProgramListingLoaded).program?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as ProgramListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  ProgramListingModel? program = await listingProgram(page);
							  return emit ( program?.items.items.isEmpty
								  ? (currentState as ProgramListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : ProgramListingLoaded(  program:  program! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( ProgramListingError());
        
      }
    }
  }

void _ProgramListingRefreshEvent(ProgramListingRefresh event, Emitter<ProgramState> emit)async{
  final currentState = state;
   try {
        if (currentState is ProgramListingUninitialized) {
		   if(isSearch!){

			    ProgramListingModel? program = await listingSearchProgram(1);
              return emit (  ProgramListingLoaded( program: program!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    ProgramListingModel? program = await listingProgram(1);
				   return emit (  ProgramListingLoaded( program: program!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is ProgramListingLoaded) {
		  if(isSearch!){
		     ProgramListingModel? program = await listingSearchRefreshProgram();
              return emit (  program?.items.items.isEmpty
              ? (currentState as ProgramListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProgramListingLoaded(  program: program! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  ProgramListingModel? program = await listingProgram(1);
				  int deltaPage = program?.items.items.length ~/ (program?.tools.paging.total_rows/program?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  program?.items.items.isEmpty
					  ? (currentState as ProgramListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ProgramListingLoaded(program: program!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  ProgramListingError());
      }
  }

  @override

  Stream<ProgramState> mapEventToState(ProgramEvent event) async* {
    final currentState = state;
    if (event is ProgramList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ProgramListingUninitialized){
			  if(isSearch!){
			     ProgramListingModel? program = await listingSearchProgram(1);
				  int deltaPage;
				  if(program?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  program?.items.items.length ~/ (program?.tools.paging.total_rows/program?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield program?.items.items.isEmpty
					  ? ProgramListingLoaded(program: program!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : ProgramListingLoaded(program: program!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  ProgramListingModel? program = await listingProgram(1);
				   int deltaPage;
				  if(program?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  program?.items.items.length ~/ (program?.tools.paging.total_rows/program?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield program?.items.items.isEmpty
					  ? ProgramListingLoaded(program: program!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :ProgramListingLoaded(program: program!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ProgramListingLoaded) {
          //page++;
		    final oldpage = (currentState as ProgramListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as ProgramListingLoaded).page! + 1;
			 if ((currentState as ProgramListingLoaded).program?.tools.paging.total_pages == oldpage) {
					yield (currentState as ProgramListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      ProgramListingModel? program = await listingSearchProgram(page);
						  if(!program?.items.items.isEmpty){
							 (currentState as ProgramListingLoaded).program?.items.items.addAll(program?.items.items);
						  }
						  yield program?.items.items.isEmpty
							  ? (currentState as ProgramListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : ProgramListingLoaded(  program:  (currentState as ProgramListingLoaded).program! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as ProgramListingLoaded).page! + 1;
							  if ((currentState as ProgramListingLoaded).program?.tools.paging.total_pages == oldpage) {
						yield (currentState as ProgramListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  ProgramListingModel? program = await listingProgram(page);
							  yield program?.items.items.isEmpty
								  ? (currentState as ProgramListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : ProgramListingLoaded(  program:  program! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield ProgramListingError();
        
      }
    } else if (event is ProgramListingRefresh){
      try {
        if (currentState is ProgramListingUninitialized) {
		   if(isSearch!){

			    ProgramListingModel? program = await listingSearchProgram(1);
              yield ProgramListingLoaded( program: program!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    ProgramListingModel? program = await listingProgram(1);
				   yield ProgramListingLoaded( program: program!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is ProgramListingLoaded) {
		  if(isSearch!){
		     ProgramListingModel? program = await listingSearchRefreshProgram();
              yield program?.items.items.isEmpty
              ? (currentState as ProgramListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ProgramListingLoaded(  program: program! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  ProgramListingModel? program = await listingProgram(1);
				  int deltaPage = program?.items.items.length ~/ (program?.tools.paging.total_rows/program?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield program?.items.items.isEmpty
					  ? (currentState as ProgramListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :ProgramListingLoaded(program: program!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield ProgramListingError();
      }

    }
  }

  bool hasReachedMax(ProgramState state) =>
      state is ProgramListingLoaded && state.hasReachedMax!;

  Future<ProgramListingModel?> listingProgram(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getProgramList(url!, page!);
  }

  Future<ProgramListingModel?> listingRefreshProgram() async {
    ProgramListingModel? program;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllProgramList();
    program  = await apiRepProvider?.getProgramList(url!, 1);
    return program;
  }
  
  

  Future<ProgramListingModel?> listingSearchProgram(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getProgramListSearch(url!, page!);
  }

  Future<ProgramListingModel?> listingSearchRefreshProgram() async {
    ProgramListingModel? program ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    program  = await apiRepProvider?.getProgramListSearch(url!, 1);
    return program;
  }
}


