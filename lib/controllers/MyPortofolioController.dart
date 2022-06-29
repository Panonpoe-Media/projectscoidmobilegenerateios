
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class MyPortofolioController {

  ProjectscoidApplication application;
  MyPortofolioListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  MyPortofolioController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MyPortofolioListing(this.application, this.url!, this.isSearch, MyPortofolioListingUninitialized());}
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

  Future editMyPortofolio()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editMyPortofolio;
    editMyPortofolio = await apiRepProvider?.getMyPortofolioEdit(url!, id!, title!);
    return editMyPortofolio;
  }
  
    Future viewMyPortofolio()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewMyPortofolio;
    viewMyPortofolio = await apiRepProvider?.getMyPortofolioView(url!, id!, title!);
    return viewMyPortofolio;
  }

  Future postMyPortofolio() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyPortofolio;
    postMyPortofolio = await apiRepProvider?.sendMyPortofolioPost(url!,formData);
    return postMyPortofolio;
  }
  
    Future postMyPortofolioWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyPortofolio;
    postMyPortofolio = await apiRepProvider?.sendMyPortofolioPostWithID(url!,formData, id!, title!);
    return postMyPortofolio;
  }

  
  
    Future editAddPortofolioMyPortofolio()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editAddPortofolio;
    editAddPortofolio = await apiRepProvider?.getAddPortofolioMyPortofolioEdit(url!, id!, title!);
    return editAddPortofolio;
  }

  Future postAddPortofolioMyPortofolio() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAddPortofolio;
    postAddPortofolio = await apiRepProvider?.sendAddPortofolioMyPortofolioPost(url!,formData);
    return postAddPortofolio;
  }
  
    Future postAddPortofolioMyPortofolioWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAddPortofolio;
    postAddPortofolio = await apiRepProvider?.sendAddPortofolioMyPortofolioPostWithID(url!,formData, id!, title!);
    return postAddPortofolio;
  }
  
      Future getAddPortofolioMyPortofolio(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getAddPortofolio;
        getAddPortofolio = await apiRepProvider?.getAddPortofolioMyPortofolio(url!, id!, title!, spKey!);
	    return getAddPortofolio ;
	 }
   Future<AddPortofolioMyPortofolioModel> loadAddPortofolioMyPortofolio() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadAddPortofolio;
        loadAddPortofolio = await apiRepProvider?.loadAddPortofolioMyPortofolio('');
	    return loadAddPortofolio ;  
   }
  
   Future saveAddPortofolioMyPortofolio(AddPortofolioMyPortofolioModel? my_portofolio, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateAddPortofolioMyPortofolio(my_portofolio!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllAddPortofolioMyPortofolio(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllAddPortofolioMyPortofolio(spKey!);   
   }
  
  
  
    Future editEditMyPortofolio()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editEdit;
    editEdit = await apiRepProvider?.getEditMyPortofolioEdit(url!, id!, title!);
    return editEdit;
  }

  Future postEditMyPortofolio() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postEdit;
    postEdit = await apiRepProvider?.sendEditMyPortofolioPost(url!,formData);
    return postEdit;
  }
  
    Future postEditMyPortofolioWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postEdit;
    postEdit = await apiRepProvider?.sendEditMyPortofolioPostWithID(url!,formData, id!, title!);
    return postEdit;
  }
  
      Future getEditMyPortofolio(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getEdit;
        getEdit = await apiRepProvider?.getEditMyPortofolio(url!, id!, title!, spKey!);
	    return getEdit ;
	 }
   Future<EditMyPortofolioModel> loadEditMyPortofolio() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadEdit;
        loadEdit = await apiRepProvider?.loadEditMyPortofolio('');
	    return loadEdit ;  
   }
  
   Future saveEditMyPortofolio(EditMyPortofolioModel? my_portofolio, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateEditMyPortofolio(my_portofolio!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllEditMyPortofolio(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllEditMyPortofolio(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MyPortofolioListing extends Bloc<MyPortofolioEvent, MyPortofolioState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MyPortofolioListing(this.application, this.url, this.isSearch, MyPortofolioState initialState):
  super(initialState){
     on<MyPortofolioList>(_MyPortofolioListEvent);
	
	  on<MyPortofolioListingRefresh>(_MyPortofolioListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MyPortofolioEvent, MyPortofolioState>> transformEvents(
      Stream<MyPortofolioEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MyPortofolioEvent> transform<MyPortofolioEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MyPortofolioEvent, MyPortofolioState> transition) {
    print(transition);
  }

  @override
  get initialState => MyPortofolioListingUninitialized();

void _MyPortofolioListEvent(MyPortofolioList event, Emitter<MyPortofolioState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MyPortofolioListingUninitialized){
			  if(isSearch!){
			     MyPortofolioListingModel? my_portofolio = await listingSearchMyPortofolio(1);
				  int deltaPage;
				  if(my_portofolio?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_portofolio?.items.items.length ~/ (my_portofolio?.tools.paging.total_rows/my_portofolio?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_portofolio?.items.items.isEmpty
					  ? MyPortofolioListingLoaded(my_portofolio: my_portofolio!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyPortofolioListingLoaded(my_portofolio: my_portofolio!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MyPortofolioListingModel? my_portofolio = await listingMyPortofolio(1);
				   int deltaPage;
				  if(my_portofolio?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_portofolio?.items.items.length ~/ (my_portofolio?.tools.paging.total_rows/my_portofolio?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_portofolio?.items.items.isEmpty
					  ? MyPortofolioListingLoaded(my_portofolio: my_portofolio!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyPortofolioListingLoaded(my_portofolio: my_portofolio!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MyPortofolioListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyPortofolioListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyPortofolioListingLoaded).page! + 1;
			 if ((currentState as MyPortofolioListingLoaded).my_portofolio?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MyPortofolioListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MyPortofolioListingModel? my_portofolio = await listingSearchMyPortofolio(page);
						  if(!my_portofolio?.items.items.isEmpty){
							 (currentState as MyPortofolioListingLoaded).my_portofolio?.items.items.addAll(my_portofolio?.items.items);
						  }
						  return emit ( my_portofolio?.items.items.isEmpty
							  ? (currentState as MyPortofolioListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyPortofolioListingLoaded(  my_portofolio:  (currentState as MyPortofolioListingLoaded).my_portofolio! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MyPortofolioListingLoaded).page! + 1;
							  if ((currentState as MyPortofolioListingLoaded).my_portofolio?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MyPortofolioListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MyPortofolioListingModel? my_portofolio = await listingMyPortofolio(page);
							  return emit ( my_portofolio?.items.items.isEmpty
								  ? (currentState as MyPortofolioListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyPortofolioListingLoaded(  my_portofolio:  my_portofolio! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MyPortofolioListingError());
        
      }
    }
  }

void _MyPortofolioListingRefreshEvent(MyPortofolioListingRefresh event, Emitter<MyPortofolioState> emit)async{
  final currentState = state;
   try {
        if (currentState is MyPortofolioListingUninitialized) {
		   if(isSearch!){

			    MyPortofolioListingModel? my_portofolio = await listingSearchMyPortofolio(1);
              return emit (  MyPortofolioListingLoaded( my_portofolio: my_portofolio!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MyPortofolioListingModel? my_portofolio = await listingMyPortofolio(1);
				   return emit (  MyPortofolioListingLoaded( my_portofolio: my_portofolio!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MyPortofolioListingLoaded) {
		  if(isSearch!){
		     MyPortofolioListingModel? my_portofolio = await listingSearchRefreshMyPortofolio();
              return emit (  my_portofolio?.items.items.isEmpty
              ? (currentState as MyPortofolioListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyPortofolioListingLoaded(  my_portofolio: my_portofolio! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MyPortofolioListingModel? my_portofolio = await listingMyPortofolio(1);
				  int deltaPage = my_portofolio?.items.items.length ~/ (my_portofolio?.tools.paging.total_rows/my_portofolio?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_portofolio?.items.items.isEmpty
					  ? (currentState as MyPortofolioListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyPortofolioListingLoaded(my_portofolio: my_portofolio!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MyPortofolioListingError());
      }
  }

  @override

  Stream<MyPortofolioState> mapEventToState(MyPortofolioEvent event) async* {
    final currentState = state;
    if (event is MyPortofolioList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MyPortofolioListingUninitialized){
			  if(isSearch!){
			     MyPortofolioListingModel? my_portofolio = await listingSearchMyPortofolio(1);
				  int deltaPage;
				  if(my_portofolio?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_portofolio?.items.items.length ~/ (my_portofolio?.tools.paging.total_rows/my_portofolio?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_portofolio?.items.items.isEmpty
					  ? MyPortofolioListingLoaded(my_portofolio: my_portofolio!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyPortofolioListingLoaded(my_portofolio: my_portofolio!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MyPortofolioListingModel? my_portofolio = await listingMyPortofolio(1);
				   int deltaPage;
				  if(my_portofolio?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_portofolio?.items.items.length ~/ (my_portofolio?.tools.paging.total_rows/my_portofolio?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_portofolio?.items.items.isEmpty
					  ? MyPortofolioListingLoaded(my_portofolio: my_portofolio!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyPortofolioListingLoaded(my_portofolio: my_portofolio!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MyPortofolioListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyPortofolioListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyPortofolioListingLoaded).page! + 1;
			 if ((currentState as MyPortofolioListingLoaded).my_portofolio?.tools.paging.total_pages == oldpage) {
					yield (currentState as MyPortofolioListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MyPortofolioListingModel? my_portofolio = await listingSearchMyPortofolio(page);
						  if(!my_portofolio?.items.items.isEmpty){
							 (currentState as MyPortofolioListingLoaded).my_portofolio?.items.items.addAll(my_portofolio?.items.items);
						  }
						  yield my_portofolio?.items.items.isEmpty
							  ? (currentState as MyPortofolioListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyPortofolioListingLoaded(  my_portofolio:  (currentState as MyPortofolioListingLoaded).my_portofolio! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MyPortofolioListingLoaded).page! + 1;
							  if ((currentState as MyPortofolioListingLoaded).my_portofolio?.tools.paging.total_pages == oldpage) {
						yield (currentState as MyPortofolioListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MyPortofolioListingModel? my_portofolio = await listingMyPortofolio(page);
							  yield my_portofolio?.items.items.isEmpty
								  ? (currentState as MyPortofolioListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyPortofolioListingLoaded(  my_portofolio:  my_portofolio! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MyPortofolioListingError();
        
      }
    } else if (event is MyPortofolioListingRefresh){
      try {
        if (currentState is MyPortofolioListingUninitialized) {
		   if(isSearch!){

			    MyPortofolioListingModel? my_portofolio = await listingSearchMyPortofolio(1);
              yield MyPortofolioListingLoaded( my_portofolio: my_portofolio!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MyPortofolioListingModel? my_portofolio = await listingMyPortofolio(1);
				   yield MyPortofolioListingLoaded( my_portofolio: my_portofolio!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MyPortofolioListingLoaded) {
		  if(isSearch!){
		     MyPortofolioListingModel? my_portofolio = await listingSearchRefreshMyPortofolio();
              yield my_portofolio?.items.items.isEmpty
              ? (currentState as MyPortofolioListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyPortofolioListingLoaded(  my_portofolio: my_portofolio! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MyPortofolioListingModel? my_portofolio = await listingMyPortofolio(1);
				  int deltaPage = my_portofolio?.items.items.length ~/ (my_portofolio?.tools.paging.total_rows/my_portofolio?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_portofolio?.items.items.isEmpty
					  ? (currentState as MyPortofolioListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyPortofolioListingLoaded(my_portofolio: my_portofolio!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MyPortofolioListingError();
      }

    }
  }

  bool hasReachedMax(MyPortofolioState state) =>
      state is MyPortofolioListingLoaded && state.hasReachedMax!;

  Future<MyPortofolioListingModel?> listingMyPortofolio(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyPortofolioList(url!, page!);
  }

  Future<MyPortofolioListingModel?> listingRefreshMyPortofolio() async {
    MyPortofolioListingModel? my_portofolio;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMyPortofolioList();
    my_portofolio  = await apiRepProvider?.getMyPortofolioList(url!, 1);
    return my_portofolio;
  }
  
  

  Future<MyPortofolioListingModel?> listingSearchMyPortofolio(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyPortofolioListSearch(url!, page!);
  }

  Future<MyPortofolioListingModel?> listingSearchRefreshMyPortofolio() async {
    MyPortofolioListingModel? my_portofolio ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_portofolio  = await apiRepProvider?.getMyPortofolioListSearch(url!, 1);
    return my_portofolio;
  }
}


