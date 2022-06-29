
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class MyServicesController {

  ProjectscoidApplication application;
  MyServicesListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;
  SalesMyServicesListing? listingSales;
  CommentsMyServicesListing? listingComments;
  ScreenshotsMyServicesListing? listingScreenshots;

  MyServicesController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MyServicesListing(this.application, this.url!, this.isSearch, MyServicesListingUninitialized());}
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

  Future editMyServices()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editMyServices;
    editMyServices = await apiRepProvider?.getMyServicesEdit(url!, id!, title!);
    return editMyServices;
  }
  
    Future viewMyServices()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewMyServices;
    viewMyServices = await apiRepProvider?.getMyServicesView(url!, id!, title!);
    return viewMyServices;
  }

  Future postMyServices() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyServices;
    postMyServices = await apiRepProvider?.sendMyServicesPost(url!,formData);
    return postMyServices;
  }
  
    Future postMyServicesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyServices;
    postMyServices = await apiRepProvider?.sendMyServicesPostWithID(url!,formData, id!, title!);
    return postMyServices;
  }

  
  void listMyServicesSales() async {
   listingSales = new SalesMyServicesListing(this.application!, this.url!, this.isSearch, SalesMyServicesListingUninitialized());
  }
  void listMyServicesComments() async {
   listingComments = new CommentsMyServicesListing(this.application!, this.url!, this.isSearch, CommentsMyServicesListingUninitialized());
  }
  
    Future editAddNewServiceMyServices()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editAddNewService;
    editAddNewService = await apiRepProvider?.getAddNewServiceMyServicesEdit(url!, id!, title!);
    return editAddNewService;
  }

  Future postAddNewServiceMyServices() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAddNewService;
    postAddNewService = await apiRepProvider?.sendAddNewServiceMyServicesPost(url!,formData);
    return postAddNewService;
  }
  
    Future postAddNewServiceMyServicesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAddNewService;
    postAddNewService = await apiRepProvider?.sendAddNewServiceMyServicesPostWithID(url!,formData, id!, title!);
    return postAddNewService;
  }
  
      Future getAddNewServiceMyServices(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getAddNewService;
        getAddNewService = await apiRepProvider?.getAddNewServiceMyServices(url!, id!, title!, spKey!);
	    return getAddNewService ;
	 }
   Future<AddNewServiceMyServicesModel> loadAddNewServiceMyServices() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadAddNewService;
        loadAddNewService = await apiRepProvider?.loadAddNewServiceMyServices('');
	    return loadAddNewService ;  
   }
  
   Future saveAddNewServiceMyServices(AddNewServiceMyServicesModel? my_services, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateAddNewServiceMyServices(my_services!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllAddNewServiceMyServices(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllAddNewServiceMyServices(spKey!);   
   }
  
  
  
    Future editPublishServiceMyServices()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editPublishService;
    editPublishService = await apiRepProvider?.getPublishServiceMyServicesEdit(url!, id!, title!);
    return editPublishService;
  }

  Future postPublishServiceMyServices() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPublishService;
    postPublishService = await apiRepProvider?.sendPublishServiceMyServicesPost(url!,formData);
    return postPublishService;
  }
  
    Future postPublishServiceMyServicesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPublishService;
    postPublishService = await apiRepProvider?.sendPublishServiceMyServicesPostWithID(url!,formData, id!, title!);
    return postPublishService;
  }
  
      Future getPublishServiceMyServices(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getPublishService;
        getPublishService = await apiRepProvider?.getPublishServiceMyServices(url!, id!, title!, spKey!);
	    return getPublishService ;
	 }
   Future<PublishServiceMyServicesModel> loadPublishServiceMyServices() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadPublishService;
        loadPublishService = await apiRepProvider?.loadPublishServiceMyServices('');
	    return loadPublishService ;  
   }
  
   Future savePublishServiceMyServices(PublishServiceMyServicesModel? my_services, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePublishServiceMyServices(my_services!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPublishServiceMyServices(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllPublishServiceMyServices(spKey!);   
   }
  
  
  
    Future editBumpUpMyServices()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editBumpUp;
    editBumpUp = await apiRepProvider?.getBumpUpMyServicesEdit(url!, id!, title!);
    return editBumpUp;
  }

  Future postBumpUpMyServices() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBumpUp;
    postBumpUp = await apiRepProvider?.sendBumpUpMyServicesPost(url!,formData);
    return postBumpUp;
  }
  
    Future postBumpUpMyServicesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBumpUp;
    postBumpUp = await apiRepProvider?.sendBumpUpMyServicesPostWithID(url!,formData, id!, title!);
    return postBumpUp;
  }
  
      Future getBumpUpMyServices(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getBumpUp;
        getBumpUp = await apiRepProvider?.getBumpUpMyServices(url!, id!, title!, spKey!);
	    return getBumpUp ;
	 }
   Future<BumpUpMyServicesModel> loadBumpUpMyServices() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadBumpUp;
        loadBumpUp = await apiRepProvider?.loadBumpUpMyServices('');
	    return loadBumpUp ;  
   }
  
   Future saveBumpUpMyServices(BumpUpMyServicesModel? my_services, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateBumpUpMyServices(my_services!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllBumpUpMyServices(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllBumpUpMyServices(spKey!);   
   }
  
  
  
    Future editEditServiceMyServices()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editEditService;
    editEditService = await apiRepProvider?.getEditServiceMyServicesEdit(url!, id!, title!);
    return editEditService;
  }

  Future postEditServiceMyServices() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postEditService;
    postEditService = await apiRepProvider?.sendEditServiceMyServicesPost(url!,formData);
    return postEditService;
  }
  
    Future postEditServiceMyServicesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postEditService;
    postEditService = await apiRepProvider?.sendEditServiceMyServicesPostWithID(url!,formData, id!, title!);
    return postEditService;
  }
  
      Future getEditServiceMyServices(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getEditService;
        getEditService = await apiRepProvider?.getEditServiceMyServices(url!, id!, title!, spKey!);
	    return getEditService ;
	 }
   Future<EditServiceMyServicesModel> loadEditServiceMyServices() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadEditService;
        loadEditService = await apiRepProvider?.loadEditServiceMyServices('');
	    return loadEditService ;  
   }
  
   Future saveEditServiceMyServices(EditServiceMyServicesModel? my_services, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateEditServiceMyServices(my_services!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllEditServiceMyServices(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllEditServiceMyServices(spKey!);   
   }
  
  
  void listMyServicesScreenshots() async {
   listingScreenshots = new ScreenshotsMyServicesListing(this.application!, this.url!, this.isSearch, ScreenshotsMyServicesListingUninitialized());
  }
  
    Future editUnlistMyServices()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editUnlist;
    editUnlist = await apiRepProvider?.getUnlistMyServicesEdit(url!, id!, title!);
    return editUnlist;
  }

  Future postUnlistMyServices() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postUnlist;
    postUnlist = await apiRepProvider?.sendUnlistMyServicesPost(url!,formData);
    return postUnlist;
  }
  
    Future postUnlistMyServicesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postUnlist;
    postUnlist = await apiRepProvider?.sendUnlistMyServicesPostWithID(url!,formData, id!, title!);
    return postUnlist;
  }
  
      Future getUnlistMyServices(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getUnlist;
        getUnlist = await apiRepProvider?.getUnlistMyServices(url!, id!, title!, spKey!);
	    return getUnlist ;
	 }
   Future<UnlistMyServicesModel> loadUnlistMyServices() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadUnlist;
        loadUnlist = await apiRepProvider?.loadUnlistMyServices('');
	    return loadUnlist ;  
   }
  
   Future saveUnlistMyServices(UnlistMyServicesModel? my_services, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateUnlistMyServices(my_services!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllUnlistMyServices(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllUnlistMyServices(spKey!);   
   }
  
  
  
    Future editReactivateServiceMyServices()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editReactivateService;
    editReactivateService = await apiRepProvider?.getReactivateServiceMyServicesEdit(url!, id!, title!);
    return editReactivateService;
  }

  Future postReactivateServiceMyServices() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postReactivateService;
    postReactivateService = await apiRepProvider?.sendReactivateServiceMyServicesPost(url!,formData);
    return postReactivateService;
  }
  
    Future postReactivateServiceMyServicesWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postReactivateService;
    postReactivateService = await apiRepProvider?.sendReactivateServiceMyServicesPostWithID(url!,formData, id!, title!);
    return postReactivateService;
  }
  
      Future getReactivateServiceMyServices(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getReactivateService;
        getReactivateService = await apiRepProvider?.getReactivateServiceMyServices(url!, id!, title!, spKey!);
	    return getReactivateService ;
	 }
   Future<ReactivateServiceMyServicesModel> loadReactivateServiceMyServices() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadReactivateService;
        loadReactivateService = await apiRepProvider?.loadReactivateServiceMyServices('');
	    return loadReactivateService ;  
   }
  
   Future saveReactivateServiceMyServices(ReactivateServiceMyServicesModel? my_services, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateReactivateServiceMyServices(my_services!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllReactivateServiceMyServices(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllReactivateServiceMyServices(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MyServicesListing extends Bloc<MyServicesEvent, MyServicesState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MyServicesListing(this.application, this.url, this.isSearch, MyServicesState initialState):
  super(initialState){
     on<MyServicesList>(_MyServicesListEvent);
	
	  on<MyServicesListingRefresh>(_MyServicesListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MyServicesEvent, MyServicesState>> transformEvents(
      Stream<MyServicesEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MyServicesEvent> transform<MyServicesEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MyServicesEvent, MyServicesState> transition) {
    print(transition);
  }

  @override
  get initialState => MyServicesListingUninitialized();

void _MyServicesListEvent(MyServicesList event, Emitter<MyServicesState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MyServicesListingUninitialized){
			  if(isSearch!){
			     MyServicesListingModel? my_services = await listingSearchMyServices(1);
				  int deltaPage;
				  if(my_services?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_services?.items.items.length ~/ (my_services?.tools.paging.total_rows/my_services?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_services?.items.items.isEmpty
					  ? MyServicesListingLoaded(my_services: my_services!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyServicesListingLoaded(my_services: my_services!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MyServicesListingModel? my_services = await listingMyServices(1);
				   int deltaPage;
				  if(my_services?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_services?.items.items.length ~/ (my_services?.tools.paging.total_rows/my_services?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_services?.items.items.isEmpty
					  ? MyServicesListingLoaded(my_services: my_services!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyServicesListingLoaded(my_services: my_services!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MyServicesListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyServicesListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyServicesListingLoaded).page! + 1;
			 if ((currentState as MyServicesListingLoaded).my_services?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MyServicesListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MyServicesListingModel? my_services = await listingSearchMyServices(page);
						  if(!my_services?.items.items.isEmpty){
							 (currentState as MyServicesListingLoaded).my_services?.items.items.addAll(my_services?.items.items);
						  }
						  return emit ( my_services?.items.items.isEmpty
							  ? (currentState as MyServicesListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyServicesListingLoaded(  my_services:  (currentState as MyServicesListingLoaded).my_services! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MyServicesListingLoaded).page! + 1;
							  if ((currentState as MyServicesListingLoaded).my_services?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MyServicesListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MyServicesListingModel? my_services = await listingMyServices(page);
							  return emit ( my_services?.items.items.isEmpty
								  ? (currentState as MyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyServicesListingLoaded(  my_services:  my_services! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MyServicesListingError());
        
      }
    }
  }

void _MyServicesListingRefreshEvent(MyServicesListingRefresh event, Emitter<MyServicesState> emit)async{
  final currentState = state;
   try {
        if (currentState is MyServicesListingUninitialized) {
		   if(isSearch!){

			    MyServicesListingModel? my_services = await listingSearchMyServices(1);
              return emit (  MyServicesListingLoaded( my_services: my_services!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MyServicesListingModel? my_services = await listingMyServices(1);
				   return emit (  MyServicesListingLoaded( my_services: my_services!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MyServicesListingLoaded) {
		  if(isSearch!){
		     MyServicesListingModel? my_services = await listingSearchRefreshMyServices();
              return emit (  my_services?.items.items.isEmpty
              ? (currentState as MyServicesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyServicesListingLoaded(  my_services: my_services! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MyServicesListingModel? my_services = await listingMyServices(1);
				  int deltaPage = my_services?.items.items.length ~/ (my_services?.tools.paging.total_rows/my_services?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_services?.items.items.isEmpty
					  ? (currentState as MyServicesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyServicesListingLoaded(my_services: my_services!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MyServicesListingError());
      }
  }

  @override

  Stream<MyServicesState> mapEventToState(MyServicesEvent event) async* {
    final currentState = state;
    if (event is MyServicesList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MyServicesListingUninitialized){
			  if(isSearch!){
			     MyServicesListingModel? my_services = await listingSearchMyServices(1);
				  int deltaPage;
				  if(my_services?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_services?.items.items.length ~/ (my_services?.tools.paging.total_rows/my_services?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_services?.items.items.isEmpty
					  ? MyServicesListingLoaded(my_services: my_services!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyServicesListingLoaded(my_services: my_services!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MyServicesListingModel? my_services = await listingMyServices(1);
				   int deltaPage;
				  if(my_services?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_services?.items.items.length ~/ (my_services?.tools.paging.total_rows/my_services?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_services?.items.items.isEmpty
					  ? MyServicesListingLoaded(my_services: my_services!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyServicesListingLoaded(my_services: my_services!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MyServicesListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyServicesListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyServicesListingLoaded).page! + 1;
			 if ((currentState as MyServicesListingLoaded).my_services?.tools.paging.total_pages == oldpage) {
					yield (currentState as MyServicesListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MyServicesListingModel? my_services = await listingSearchMyServices(page);
						  if(!my_services?.items.items.isEmpty){
							 (currentState as MyServicesListingLoaded).my_services?.items.items.addAll(my_services?.items.items);
						  }
						  yield my_services?.items.items.isEmpty
							  ? (currentState as MyServicesListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyServicesListingLoaded(  my_services:  (currentState as MyServicesListingLoaded).my_services! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MyServicesListingLoaded).page! + 1;
							  if ((currentState as MyServicesListingLoaded).my_services?.tools.paging.total_pages == oldpage) {
						yield (currentState as MyServicesListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MyServicesListingModel? my_services = await listingMyServices(page);
							  yield my_services?.items.items.isEmpty
								  ? (currentState as MyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyServicesListingLoaded(  my_services:  my_services! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MyServicesListingError();
        
      }
    } else if (event is MyServicesListingRefresh){
      try {
        if (currentState is MyServicesListingUninitialized) {
		   if(isSearch!){

			    MyServicesListingModel? my_services = await listingSearchMyServices(1);
              yield MyServicesListingLoaded( my_services: my_services!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MyServicesListingModel? my_services = await listingMyServices(1);
				   yield MyServicesListingLoaded( my_services: my_services!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MyServicesListingLoaded) {
		  if(isSearch!){
		     MyServicesListingModel? my_services = await listingSearchRefreshMyServices();
              yield my_services?.items.items.isEmpty
              ? (currentState as MyServicesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyServicesListingLoaded(  my_services: my_services! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MyServicesListingModel? my_services = await listingMyServices(1);
				  int deltaPage = my_services?.items.items.length ~/ (my_services?.tools.paging.total_rows/my_services?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_services?.items.items.isEmpty
					  ? (currentState as MyServicesListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyServicesListingLoaded(my_services: my_services!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MyServicesListingError();
      }

    }
  }

  bool hasReachedMax(MyServicesState state) =>
      state is MyServicesListingLoaded && state.hasReachedMax!;

  Future<MyServicesListingModel?> listingMyServices(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyServicesList(url!, page!);
  }

  Future<MyServicesListingModel?> listingRefreshMyServices() async {
    MyServicesListingModel? my_services;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMyServicesList();
    my_services  = await apiRepProvider?.getMyServicesList(url!, 1);
    return my_services;
  }
  
  

  Future<MyServicesListingModel?> listingSearchMyServices(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyServicesListSearch(url!, page!);
  }

  Future<MyServicesListingModel?> listingSearchRefreshMyServices() async {
    MyServicesListingModel? my_services ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_services  = await apiRepProvider?.getMyServicesListSearch(url!, 1);
    return my_services;
  }
}


class SalesMyServicesListing extends Bloc<SalesMyServicesEvent, SalesMyServicesState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  SalesMyServicesListing(this.application, this.url, this.isSearch, SalesMyServicesState initialState):
  super(initialState){
     on<SalesMyServicesList>(_SalesMyServicesListEvent);
	 on<SalesMyServicesListingRefresh>(_SalesMyServicesListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<SalesMyServicesEvent, SalesMyServicesState>> transformEvents(
      Stream<SalesMyServicesEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
 */ 
     EventTransformer<SalesMyServicesEvent> transform<SalesMyServicesEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<SalesMyServicesEvent, SalesMyServicesState> transition) {
    print(transition);
  }

  @override
  get initialState => SalesMyServicesListingUninitialized();
  
  
  void _SalesMyServicesListEvent(SalesMyServicesList event, Emitter<SalesMyServicesState> emit)async{
  final currentState = state;
    if (!hasReachedMax(currentState)) {
      try {
					if (currentState is SalesMyServicesListingUninitialized){
						  if(isSearch!){
							 SalesListingModel? sales = await listingSearchSalesMyServices(-1);
							  int deltaPage;
							  
							  if(sales?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = sales?.items.items.length ~/(sales?.tools.paging.total_rows/sales?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( sales?.items.items.isEmpty ?
							  SalesMyServicesListingLoaded(sales: sales!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : SalesMyServicesListingLoaded(sales: sales!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }else{
							  SalesListingModel? sales = await listingSalesMyServices(1);
							  int deltaPage = sales?.items.items.length ~/ (sales?.tools.paging.total_rows/sales?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( SalesMyServicesListingLoaded(sales: sales!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }
					}

					if (currentState is SalesMyServicesListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as SalesMyServicesListingLoaded).page! + 1;
							  bool max = false;
							  SalesListingModel? sales = await listingSalesMyServices(page);
							  if(sales?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!sales?.items.items.isEmpty && !max){
								 (currentState as SalesMyServicesListingLoaded).sales?.items.items.addAll(sales?.items.items);
							  }
							  return emit ( sales?.items.items.isEmpty || max
								  ? (currentState as SalesMyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : SalesMyServicesListingLoaded(  sales:  (currentState as SalesMyServicesListingLoaded).sales! ,
														  hasReachedMax: false,
														  page: page,));
						}else{
					  
							  final page = (currentState as SalesMyServicesListingLoaded).page! + 1;
							  SalesListingModel? sales = await listingSalesMyServices(page);
							  return emit ( sales?.items.items.isEmpty
								  ? (currentState as SalesMyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : SalesMyServicesListingLoaded(  sales:  sales! ,
														  hasReachedMax: false,
														  page: page,));
						}	  
					}
					
      } catch (_) {
        return emit ( SalesMyServicesListingError());
      }
    }
  }
  
  void _SalesMyServicesListingRefreshEvent(SalesMyServicesListingRefresh event, Emitter<SalesMyServicesState> emit)async{
  final currentState = state;
   try {
					if (currentState is SalesMyServicesListingUninitialized) {
					   if(isSearch!){
						  SalesListingModel? sales = await listingSearchSalesMyServices(1);
						  return emit (  SalesMyServicesListingLoaded( sales: sales!,
							   hasReachedMax: false,
							   page: 1 ));
					   }else{
						 SalesListingModel? sales = await listingSalesMyServices(1);
						 return emit ( SalesMyServicesListingLoaded( sales: sales!,
							   hasReachedMax: false,
							   page: 1 ));
					   }

					}

					if (currentState is SalesMyServicesListingLoaded) {
					  if(isSearch!){
						 SalesListingModel? sales = await listingSearchRefreshSalesMyServices();
						  return emit (  sales?.items.items.isEmpty
						  ? (currentState as SalesMyServicesListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : SalesMyServicesListingLoaded(  sales: sales! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }else{
						  SalesListingModel? sales = await listingRefreshSalesMyServices();
						  return emit (  sales?.items.items.isEmpty
						  ? (currentState as SalesMyServicesListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : SalesMyServicesListingLoaded(  sales: sales! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }

					}
			
      } catch (_) {
        return emit ( SalesMyServicesListingError());
      }

  }

  @override

  Stream<SalesMyServicesState> mapEventToState(SalesMyServicesEvent event) async* {
  final currentState = state;
    if (event is SalesMyServicesList && !hasReachedMax(currentState)) {
      try {
					if (currentState is SalesMyServicesListingUninitialized){
						  if(isSearch!){
							 SalesListingModel? sales = await listingSearchSalesMyServices(-1);
							  int deltaPage;
							  
							  if(sales?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = sales?.items.items.length ~/(sales?.tools.paging.total_rows/sales?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield sales?.items.items.isEmpty ?
							  SalesMyServicesListingLoaded(sales: sales!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : SalesMyServicesListingLoaded(sales: sales!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }else{
							  SalesListingModel? sales = await listingSalesMyServices(1);
							  int deltaPage = sales?.items.items.length ~/ (sales?.tools.paging.total_rows/sales?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield SalesMyServicesListingLoaded(sales: sales!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }
					}

					if (currentState is SalesMyServicesListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as SalesMyServicesListingLoaded).page! + 1;
							  bool max = false;
							  SalesListingModel? sales = await listingSalesMyServices(page);
							  if(sales?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!sales?.items.items.isEmpty && !max){
								 (currentState as SalesMyServicesListingLoaded).sales?.items.items.addAll(sales?.items.items);
							  }
							  yield sales?.items.items.isEmpty || max
								  ? (currentState as SalesMyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : SalesMyServicesListingLoaded(  sales:  (currentState as SalesMyServicesListingLoaded).sales! ,
														  hasReachedMax: false,
														  page: page,);
						}else{
					  
							  final page = (currentState as SalesMyServicesListingLoaded).page! + 1;
							  SalesListingModel? sales = await listingSalesMyServices(page);
							  yield sales?.items.items.isEmpty
								  ? (currentState as SalesMyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : SalesMyServicesListingLoaded(  sales:  sales! ,
														  hasReachedMax: false,
														  page: page,);
						}	  
					}
					
      } catch (_) {
        yield SalesMyServicesListingError();
      }
    } else if (event is SalesMyServicesListingRefresh){
      try {
					if (currentState is SalesMyServicesListingUninitialized) {
					   if(isSearch!){
						  SalesListingModel? sales = await listingSearchSalesMyServices(1);
						  yield SalesMyServicesListingLoaded( sales: sales!,
							   hasReachedMax: false,
							   page: 1 );
					   }else{
						 SalesListingModel? sales = await listingSalesMyServices(1);
						 yield SalesMyServicesListingLoaded( sales: sales!,
							   hasReachedMax: false,
							   page: 1 );
					   }

					}

					if (currentState is SalesMyServicesListingLoaded) {
					  if(isSearch!){
						 SalesListingModel? sales = await listingSearchRefreshSalesMyServices();
						  yield sales?.items.items.isEmpty
						  ? (currentState as SalesMyServicesListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : SalesMyServicesListingLoaded(  sales: sales! ,
						  hasReachedMax: false,
						  page: 1 );
					  }else{
						  SalesListingModel? sales = await listingRefreshSalesMyServices();
						  yield sales?.items.items.isEmpty
						  ? (currentState as SalesMyServicesListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : SalesMyServicesListingLoaded(  sales: sales! ,
						  hasReachedMax: false,
						  page: 1 );
					  }

					}
			
      } catch (_) {
        yield SalesMyServicesListingError();
      }

    }
  }

  bool hasReachedMax(SalesMyServicesState state) =>
      state is SalesMyServicesListingLoaded && state.hasReachedMax!;

  Future<SalesListingModel?> listingSalesMyServices(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getSalesMyServicesListSearch(url!, page!);
  }
    Future<SalesListingModel?> listingRefreshSalesMyServices() async {
    SalesListingModel? sales ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    sales  = await apiRepProvider?.getSalesMyServicesListSearch(url!, 1);
    return sales;
  }
  Future<SalesListingModel?> listingSearchSalesMyServices(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getSalesMyServicesListSearch(url!, page!);
  }

  Future<SalesListingModel?> listingSearchRefreshSalesMyServices() async {
    SalesListingModel? sales ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    sales  = await apiRepProvider?.getSalesMyServicesListSearch(url!, 1);
    return sales;
  }
  
  
  
}




class CommentsMyServicesListing extends Bloc<CommentsMyServicesEvent, CommentsMyServicesState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  CommentsMyServicesListing(this.application, this.url, this.isSearch, CommentsMyServicesState initialState):
  super(initialState){
     on<CommentsMyServicesList>(_CommentsMyServicesListEvent);
	 on<CommentsMyServicesListingRefresh>(_CommentsMyServicesListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<CommentsMyServicesEvent, CommentsMyServicesState>> transformEvents(
      Stream<CommentsMyServicesEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
 */ 
     EventTransformer<CommentsMyServicesEvent> transform<CommentsMyServicesEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<CommentsMyServicesEvent, CommentsMyServicesState> transition) {
    print(transition);
  }

  @override
  get initialState => CommentsMyServicesListingUninitialized();
  
  
  void _CommentsMyServicesListEvent(CommentsMyServicesList event, Emitter<CommentsMyServicesState> emit)async{
  final currentState = state;
    if (!hasReachedMax(currentState)) {
      try {
					if (currentState is CommentsMyServicesListingUninitialized){
						  if(isSearch!){
							 CommentsListingModel? comments = await listingSearchCommentsMyServices(-1);
							  int deltaPage;
							  
							  if(comments?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = comments?.items.items.length ~/(comments?.tools.paging.total_rows/comments?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( comments?.items.items.isEmpty ?
							  CommentsMyServicesListingLoaded(comments: comments!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : CommentsMyServicesListingLoaded(comments: comments!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }else{
							  CommentsListingModel? comments = await listingCommentsMyServices(1);
							  int deltaPage = comments?.items.items.length ~/ (comments?.tools.paging.total_rows/comments?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( CommentsMyServicesListingLoaded(comments: comments!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }
					}

					if (currentState is CommentsMyServicesListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as CommentsMyServicesListingLoaded).page! + 1;
							  bool max = false;
							  CommentsListingModel? comments = await listingCommentsMyServices(page);
							  if(comments?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!comments?.items.items.isEmpty && !max){
								 (currentState as CommentsMyServicesListingLoaded).comments?.items.items.addAll(comments?.items.items);
							  }
							  return emit ( comments?.items.items.isEmpty || max
								  ? (currentState as CommentsMyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : CommentsMyServicesListingLoaded(  comments:  (currentState as CommentsMyServicesListingLoaded).comments! ,
														  hasReachedMax: false,
														  page: page,));
						}else{
					  
							  final page = (currentState as CommentsMyServicesListingLoaded).page! + 1;
							  CommentsListingModel? comments = await listingCommentsMyServices(page);
							  return emit ( comments?.items.items.isEmpty
								  ? (currentState as CommentsMyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : CommentsMyServicesListingLoaded(  comments:  comments! ,
														  hasReachedMax: false,
														  page: page,));
						}	  
					}
					
      } catch (_) {
        return emit ( CommentsMyServicesListingError());
      }
    }
  }
  
  void _CommentsMyServicesListingRefreshEvent(CommentsMyServicesListingRefresh event, Emitter<CommentsMyServicesState> emit)async{
  final currentState = state;
   try {
					if (currentState is CommentsMyServicesListingUninitialized) {
					   if(isSearch!){
						  CommentsListingModel? comments = await listingSearchCommentsMyServices(1);
						  return emit (  CommentsMyServicesListingLoaded( comments: comments!,
							   hasReachedMax: false,
							   page: 1 ));
					   }else{
						 CommentsListingModel? comments = await listingCommentsMyServices(1);
						 return emit ( CommentsMyServicesListingLoaded( comments: comments!,
							   hasReachedMax: false,
							   page: 1 ));
					   }

					}

					if (currentState is CommentsMyServicesListingLoaded) {
					  if(isSearch!){
						 CommentsListingModel? comments = await listingSearchRefreshCommentsMyServices();
						  return emit (  comments?.items.items.isEmpty
						  ? (currentState as CommentsMyServicesListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : CommentsMyServicesListingLoaded(  comments: comments! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }else{
						  CommentsListingModel? comments = await listingRefreshCommentsMyServices();
						  return emit (  comments?.items.items.isEmpty
						  ? (currentState as CommentsMyServicesListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : CommentsMyServicesListingLoaded(  comments: comments! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }

					}
			
      } catch (_) {
        return emit ( CommentsMyServicesListingError());
      }

  }

  @override

  Stream<CommentsMyServicesState> mapEventToState(CommentsMyServicesEvent event) async* {
  final currentState = state;
    if (event is CommentsMyServicesList && !hasReachedMax(currentState)) {
      try {
					if (currentState is CommentsMyServicesListingUninitialized){
						  if(isSearch!){
							 CommentsListingModel? comments = await listingSearchCommentsMyServices(-1);
							  int deltaPage;
							  
							  if(comments?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = comments?.items.items.length ~/(comments?.tools.paging.total_rows/comments?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield comments?.items.items.isEmpty ?
							  CommentsMyServicesListingLoaded(comments: comments!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : CommentsMyServicesListingLoaded(comments: comments!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }else{
							  CommentsListingModel? comments = await listingCommentsMyServices(1);
							  int deltaPage = comments?.items.items.length ~/ (comments?.tools.paging.total_rows/comments?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield CommentsMyServicesListingLoaded(comments: comments!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }
					}

					if (currentState is CommentsMyServicesListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as CommentsMyServicesListingLoaded).page! + 1;
							  bool max = false;
							  CommentsListingModel? comments = await listingCommentsMyServices(page);
							  if(comments?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!comments?.items.items.isEmpty && !max){
								 (currentState as CommentsMyServicesListingLoaded).comments?.items.items.addAll(comments?.items.items);
							  }
							  yield comments?.items.items.isEmpty || max
								  ? (currentState as CommentsMyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : CommentsMyServicesListingLoaded(  comments:  (currentState as CommentsMyServicesListingLoaded).comments! ,
														  hasReachedMax: false,
														  page: page,);
						}else{
					  
							  final page = (currentState as CommentsMyServicesListingLoaded).page! + 1;
							  CommentsListingModel? comments = await listingCommentsMyServices(page);
							  yield comments?.items.items.isEmpty
								  ? (currentState as CommentsMyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : CommentsMyServicesListingLoaded(  comments:  comments! ,
														  hasReachedMax: false,
														  page: page,);
						}	  
					}
					
      } catch (_) {
        yield CommentsMyServicesListingError();
      }
    } else if (event is CommentsMyServicesListingRefresh){
      try {
					if (currentState is CommentsMyServicesListingUninitialized) {
					   if(isSearch!){
						  CommentsListingModel? comments = await listingSearchCommentsMyServices(1);
						  yield CommentsMyServicesListingLoaded( comments: comments!,
							   hasReachedMax: false,
							   page: 1 );
					   }else{
						 CommentsListingModel? comments = await listingCommentsMyServices(1);
						 yield CommentsMyServicesListingLoaded( comments: comments!,
							   hasReachedMax: false,
							   page: 1 );
					   }

					}

					if (currentState is CommentsMyServicesListingLoaded) {
					  if(isSearch!){
						 CommentsListingModel? comments = await listingSearchRefreshCommentsMyServices();
						  yield comments?.items.items.isEmpty
						  ? (currentState as CommentsMyServicesListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : CommentsMyServicesListingLoaded(  comments: comments! ,
						  hasReachedMax: false,
						  page: 1 );
					  }else{
						  CommentsListingModel? comments = await listingRefreshCommentsMyServices();
						  yield comments?.items.items.isEmpty
						  ? (currentState as CommentsMyServicesListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : CommentsMyServicesListingLoaded(  comments: comments! ,
						  hasReachedMax: false,
						  page: 1 );
					  }

					}
			
      } catch (_) {
        yield CommentsMyServicesListingError();
      }

    }
  }

  bool hasReachedMax(CommentsMyServicesState state) =>
      state is CommentsMyServicesListingLoaded && state.hasReachedMax!;

  Future<CommentsListingModel?> listingCommentsMyServices(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getCommentsMyServicesListSearch(url!, page!);
  }
    Future<CommentsListingModel?> listingRefreshCommentsMyServices() async {
    CommentsListingModel? comments ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    comments  = await apiRepProvider?.getCommentsMyServicesListSearch(url!, 1);
    return comments;
  }
  Future<CommentsListingModel?> listingSearchCommentsMyServices(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getCommentsMyServicesListSearch(url!, page!);
  }

  Future<CommentsListingModel?> listingSearchRefreshCommentsMyServices() async {
    CommentsListingModel? comments ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    comments  = await apiRepProvider?.getCommentsMyServicesListSearch(url!, 1);
    return comments;
  }
  
  
  
}




class ScreenshotsMyServicesListing extends Bloc<ScreenshotsMyServicesEvent, ScreenshotsMyServicesState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  ScreenshotsMyServicesListing(this.application, this.url, this.isSearch, ScreenshotsMyServicesState initialState):
  super(initialState){
     on<ScreenshotsMyServicesList>(_ScreenshotsMyServicesListEvent);
	 on<ScreenshotsMyServicesListingRefresh>(_ScreenshotsMyServicesListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<ScreenshotsMyServicesEvent, ScreenshotsMyServicesState>> transformEvents(
      Stream<ScreenshotsMyServicesEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
 */ 
     EventTransformer<ScreenshotsMyServicesEvent> transform<ScreenshotsMyServicesEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<ScreenshotsMyServicesEvent, ScreenshotsMyServicesState> transition) {
    print(transition);
  }

  @override
  get initialState => ScreenshotsMyServicesListingUninitialized();
  
  
  void _ScreenshotsMyServicesListEvent(ScreenshotsMyServicesList event, Emitter<ScreenshotsMyServicesState> emit)async{
  final currentState = state;
    if (!hasReachedMax(currentState)) {
      try {
					if (currentState is ScreenshotsMyServicesListingUninitialized){
						  if(isSearch!){
							 ScreenshotsListingModel? screenshots = await listingSearchScreenshotsMyServices(-1);
							  int deltaPage;
							  
							  if(screenshots?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = screenshots?.items.items.length ~/(screenshots?.tools.paging.total_rows/screenshots?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( screenshots?.items.items.isEmpty ?
							  ScreenshotsMyServicesListingLoaded(screenshots: screenshots!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : ScreenshotsMyServicesListingLoaded(screenshots: screenshots!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }else{
							  ScreenshotsListingModel? screenshots = await listingScreenshotsMyServices(1);
							  int deltaPage = screenshots?.items.items.length ~/ (screenshots?.tools.paging.total_rows/screenshots?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( ScreenshotsMyServicesListingLoaded(screenshots: screenshots!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }
					}

					if (currentState is ScreenshotsMyServicesListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as ScreenshotsMyServicesListingLoaded).page! + 1;
							  bool max = false;
							  ScreenshotsListingModel? screenshots = await listingScreenshotsMyServices(page);
							  if(screenshots?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!screenshots?.items.items.isEmpty && !max){
								 (currentState as ScreenshotsMyServicesListingLoaded).screenshots?.items.items.addAll(screenshots?.items.items);
							  }
							  return emit ( screenshots?.items.items.isEmpty || max
								  ? (currentState as ScreenshotsMyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ScreenshotsMyServicesListingLoaded(  screenshots:  (currentState as ScreenshotsMyServicesListingLoaded).screenshots! ,
														  hasReachedMax: false,
														  page: page,));
						}else{
					  
							  final page = (currentState as ScreenshotsMyServicesListingLoaded).page! + 1;
							  ScreenshotsListingModel? screenshots = await listingScreenshotsMyServices(page);
							  return emit ( screenshots?.items.items.isEmpty
								  ? (currentState as ScreenshotsMyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : ScreenshotsMyServicesListingLoaded(  screenshots:  screenshots! ,
														  hasReachedMax: false,
														  page: page,));
						}	  
					}
					
      } catch (_) {
        return emit ( ScreenshotsMyServicesListingError());
      }
    }
  }
  
  void _ScreenshotsMyServicesListingRefreshEvent(ScreenshotsMyServicesListingRefresh event, Emitter<ScreenshotsMyServicesState> emit)async{
  final currentState = state;
   try {
					if (currentState is ScreenshotsMyServicesListingUninitialized) {
					   if(isSearch!){
						  ScreenshotsListingModel? screenshots = await listingSearchScreenshotsMyServices(1);
						  return emit (  ScreenshotsMyServicesListingLoaded( screenshots: screenshots!,
							   hasReachedMax: false,
							   page: 1 ));
					   }else{
						 ScreenshotsListingModel? screenshots = await listingScreenshotsMyServices(1);
						 return emit ( ScreenshotsMyServicesListingLoaded( screenshots: screenshots!,
							   hasReachedMax: false,
							   page: 1 ));
					   }

					}

					if (currentState is ScreenshotsMyServicesListingLoaded) {
					  if(isSearch!){
						 ScreenshotsListingModel? screenshots = await listingSearchRefreshScreenshotsMyServices();
						  return emit (  screenshots?.items.items.isEmpty
						  ? (currentState as ScreenshotsMyServicesListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ScreenshotsMyServicesListingLoaded(  screenshots: screenshots! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }else{
						  ScreenshotsListingModel? screenshots = await listingRefreshScreenshotsMyServices();
						  return emit (  screenshots?.items.items.isEmpty
						  ? (currentState as ScreenshotsMyServicesListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ScreenshotsMyServicesListingLoaded(  screenshots: screenshots! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }

					}
			
      } catch (_) {
        return emit ( ScreenshotsMyServicesListingError());
      }

  }

  @override

  Stream<ScreenshotsMyServicesState> mapEventToState(ScreenshotsMyServicesEvent event) async* {
  final currentState = state;
    if (event is ScreenshotsMyServicesList && !hasReachedMax(currentState)) {
      try {
					if (currentState is ScreenshotsMyServicesListingUninitialized){
						  if(isSearch!){
							 ScreenshotsListingModel? screenshots = await listingSearchScreenshotsMyServices(-1);
							  int deltaPage;
							  
							  if(screenshots?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = screenshots?.items.items.length ~/(screenshots?.tools.paging.total_rows/screenshots?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield screenshots?.items.items.isEmpty ?
							  ScreenshotsMyServicesListingLoaded(screenshots: screenshots!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : ScreenshotsMyServicesListingLoaded(screenshots: screenshots!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }else{
							  ScreenshotsListingModel? screenshots = await listingScreenshotsMyServices(1);
							  int deltaPage = screenshots?.items.items.length ~/ (screenshots?.tools.paging.total_rows/screenshots?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield ScreenshotsMyServicesListingLoaded(screenshots: screenshots!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }
					}

					if (currentState is ScreenshotsMyServicesListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as ScreenshotsMyServicesListingLoaded).page! + 1;
							  bool max = false;
							  ScreenshotsListingModel? screenshots = await listingScreenshotsMyServices(page);
							  if(screenshots?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!screenshots?.items.items.isEmpty && !max){
								 (currentState as ScreenshotsMyServicesListingLoaded).screenshots?.items.items.addAll(screenshots?.items.items);
							  }
							  yield screenshots?.items.items.isEmpty || max
								  ? (currentState as ScreenshotsMyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ScreenshotsMyServicesListingLoaded(  screenshots:  (currentState as ScreenshotsMyServicesListingLoaded).screenshots! ,
														  hasReachedMax: false,
														  page: page,);
						}else{
					  
							  final page = (currentState as ScreenshotsMyServicesListingLoaded).page! + 1;
							  ScreenshotsListingModel? screenshots = await listingScreenshotsMyServices(page);
							  yield screenshots?.items.items.isEmpty
								  ? (currentState as ScreenshotsMyServicesListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : ScreenshotsMyServicesListingLoaded(  screenshots:  screenshots! ,
														  hasReachedMax: false,
														  page: page,);
						}	  
					}
					
      } catch (_) {
        yield ScreenshotsMyServicesListingError();
      }
    } else if (event is ScreenshotsMyServicesListingRefresh){
      try {
					if (currentState is ScreenshotsMyServicesListingUninitialized) {
					   if(isSearch!){
						  ScreenshotsListingModel? screenshots = await listingSearchScreenshotsMyServices(1);
						  yield ScreenshotsMyServicesListingLoaded( screenshots: screenshots!,
							   hasReachedMax: false,
							   page: 1 );
					   }else{
						 ScreenshotsListingModel? screenshots = await listingScreenshotsMyServices(1);
						 yield ScreenshotsMyServicesListingLoaded( screenshots: screenshots!,
							   hasReachedMax: false,
							   page: 1 );
					   }

					}

					if (currentState is ScreenshotsMyServicesListingLoaded) {
					  if(isSearch!){
						 ScreenshotsListingModel? screenshots = await listingSearchRefreshScreenshotsMyServices();
						  yield screenshots?.items.items.isEmpty
						  ? (currentState as ScreenshotsMyServicesListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ScreenshotsMyServicesListingLoaded(  screenshots: screenshots! ,
						  hasReachedMax: false,
						  page: 1 );
					  }else{
						  ScreenshotsListingModel? screenshots = await listingRefreshScreenshotsMyServices();
						  yield screenshots?.items.items.isEmpty
						  ? (currentState as ScreenshotsMyServicesListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ScreenshotsMyServicesListingLoaded(  screenshots: screenshots! ,
						  hasReachedMax: false,
						  page: 1 );
					  }

					}
			
      } catch (_) {
        yield ScreenshotsMyServicesListingError();
      }

    }
  }

  bool hasReachedMax(ScreenshotsMyServicesState state) =>
      state is ScreenshotsMyServicesListingLoaded && state.hasReachedMax!;

  Future<ScreenshotsListingModel?> listingScreenshotsMyServices(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getScreenshotsMyServicesListSearch(url!, page!);
  }
    Future<ScreenshotsListingModel?> listingRefreshScreenshotsMyServices() async {
    ScreenshotsListingModel? screenshots ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    screenshots  = await apiRepProvider?.getScreenshotsMyServicesListSearch(url!, 1);
    return screenshots;
  }
  Future<ScreenshotsListingModel?> listingSearchScreenshotsMyServices(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getScreenshotsMyServicesListSearch(url!, page!);
  }

  Future<ScreenshotsListingModel?> listingSearchRefreshScreenshotsMyServices() async {
    ScreenshotsListingModel? screenshots ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    screenshots  = await apiRepProvider?.getScreenshotsMyServicesListSearch(url!, 1);
    return screenshots;
  }
  
  
  
}




