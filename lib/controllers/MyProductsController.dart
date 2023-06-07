
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';
//////
class MyProductsController {

  ProjectscoidApplication application;
  MyProductsListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;
  SalesMyProductsListing? listingSales;
  CommentsMyProductsListing? listingComments;
  ScreenshotsMyProductsListing? listingScreenshots;

  MyProductsController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MyProductsListing(this.application, this.url!, this.isSearch, MyProductsListingUninitialized());}
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

  Future editMyProducts()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editMyProducts;
    editMyProducts = await apiRepProvider?.getMyProductsEdit(url!, id!, title!);
    return editMyProducts;
  }
  
    Future viewMyProducts()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewMyProducts;
    viewMyProducts = await apiRepProvider?.getMyProductsView(url!, id!, title!);
    return viewMyProducts;
  }

  Future postMyProducts() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyProducts;
    postMyProducts = await apiRepProvider?.sendMyProductsPost(url!,formData);
    return postMyProducts;
  }
  
    Future postMyProductsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyProducts;
    postMyProducts = await apiRepProvider?.sendMyProductsPostWithID(url!,formData, id!, title!);
    return postMyProducts;
  }

  
  void listMyProductsSales() async {
   listingSales = new SalesMyProductsListing(this.application!, this.url!, this.isSearch, SalesMyProductsListingUninitialized());
  }
  void listMyProductsComments() async {
   listingComments = new CommentsMyProductsListing(this.application!, this.url!, this.isSearch, CommentsMyProductsListingUninitialized());
  }
  
    Future editAddNewProductMyProducts()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editAddNewProduct;
    editAddNewProduct = await apiRepProvider?.getAddNewProductMyProductsEdit(url!, id!, title!);
    return editAddNewProduct;
  }

  Future postAddNewProductMyProducts() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAddNewProduct;
    postAddNewProduct = await apiRepProvider?.sendAddNewProductMyProductsPost(url!,formData);
    return postAddNewProduct;
  }
  
    Future postAddNewProductMyProductsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postAddNewProduct;
    postAddNewProduct = await apiRepProvider?.sendAddNewProductMyProductsPostWithID(url!,formData, id!, title!);
    return postAddNewProduct;
  }
  
      Future getAddNewProductMyProducts(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getAddNewProduct;
        getAddNewProduct = await apiRepProvider?.getAddNewProductMyProducts(url!, id!, title!, spKey!);
	    return getAddNewProduct ;
	 }
   Future<AddNewProductMyProductsModel> loadAddNewProductMyProducts() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadAddNewProduct;
        loadAddNewProduct = await apiRepProvider?.loadAddNewProductMyProducts('');
	    return loadAddNewProduct ;  
   }
  
   Future saveAddNewProductMyProducts(AddNewProductMyProductsModel? my_products, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateAddNewProductMyProducts(my_products!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllAddNewProductMyProducts(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllAddNewProductMyProducts(spKey!);   
   }
  
  
  
    Future editPublishProductMyProducts()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editPublishProduct;
    editPublishProduct = await apiRepProvider?.getPublishProductMyProductsEdit(url!, id!, title!);
    return editPublishProduct;
  }

  Future postPublishProductMyProducts() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPublishProduct;
    postPublishProduct = await apiRepProvider?.sendPublishProductMyProductsPost(url!,formData);
    return postPublishProduct;
  }
  
    Future postPublishProductMyProductsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postPublishProduct;
    postPublishProduct = await apiRepProvider?.sendPublishProductMyProductsPostWithID(url!,formData, id!, title!);
    return postPublishProduct;
  }
  
      Future getPublishProductMyProducts(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getPublishProduct;
        getPublishProduct = await apiRepProvider?.getPublishProductMyProducts(url!, id!, title!, spKey!);
	    return getPublishProduct ;
	 }
   Future<PublishProductMyProductsModel> loadPublishProductMyProducts() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadPublishProduct;
        loadPublishProduct = await apiRepProvider?.loadPublishProductMyProducts('');
	    return loadPublishProduct ;  
   }
  
   Future savePublishProductMyProducts(PublishProductMyProductsModel? my_products, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdatePublishProductMyProducts(my_products!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllPublishProductMyProducts(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllPublishProductMyProducts(spKey!);   
   }
  
  
  
    Future editEditProductMyProducts()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editEditProduct;
    editEditProduct = await apiRepProvider?.getEditProductMyProductsEdit(url!, id!, title!);
    return editEditProduct;
  }

  Future postEditProductMyProducts() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postEditProduct;
    postEditProduct = await apiRepProvider?.sendEditProductMyProductsPost(url!,formData);
    return postEditProduct;
  }
  
    Future postEditProductMyProductsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postEditProduct;
    postEditProduct = await apiRepProvider?.sendEditProductMyProductsPostWithID(url!,formData, id!, title!);
    return postEditProduct;
  }
  
      Future getEditProductMyProducts(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getEditProduct;
        getEditProduct = await apiRepProvider?.getEditProductMyProducts(url!, id!, title!, spKey!);
	    return getEditProduct ;
	 }
   Future<EditProductMyProductsModel> loadEditProductMyProducts() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadEditProduct;
        loadEditProduct = await apiRepProvider?.loadEditProductMyProducts('');
	    return loadEditProduct ;  
   }
  
   Future saveEditProductMyProducts(EditProductMyProductsModel? my_products, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateEditProductMyProducts(my_products!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllEditProductMyProducts(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllEditProductMyProducts(spKey!);   
   }
  
  
  
    Future editBumpUpMyProducts()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editBumpUp;
    editBumpUp = await apiRepProvider?.getBumpUpMyProductsEdit(url!, id!, title!);
    return editBumpUp;
  }

  Future postBumpUpMyProducts() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBumpUp;
    postBumpUp = await apiRepProvider?.sendBumpUpMyProductsPost(url!,formData);
    return postBumpUp;
  }
  
    Future postBumpUpMyProductsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBumpUp;
    postBumpUp = await apiRepProvider?.sendBumpUpMyProductsPostWithID(url!,formData, id!, title!);
    return postBumpUp;
  }
  
      Future getBumpUpMyProducts(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getBumpUp;
        getBumpUp = await apiRepProvider?.getBumpUpMyProducts(url!, id!, title!, spKey!);
	    return getBumpUp ;
	 }
   Future<BumpUpMyProductsModel> loadBumpUpMyProducts() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadBumpUp;
        loadBumpUp = await apiRepProvider?.loadBumpUpMyProducts('');
	    return loadBumpUp ;  
   }
  
   Future saveBumpUpMyProducts(BumpUpMyProductsModel? my_products, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateBumpUpMyProducts(my_products!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllBumpUpMyProducts(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllBumpUpMyProducts(spKey!);   
   }
  
  
  void listMyProductsScreenshots() async {
   listingScreenshots = new ScreenshotsMyProductsListing(this.application!, this.url!, this.isSearch, ScreenshotsMyProductsListingUninitialized());
  }
  
    Future editUnlistMyProducts()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editUnlist;
    editUnlist = await apiRepProvider?.getUnlistMyProductsEdit(url!, id!, title!);
    return editUnlist;
  }

  Future postUnlistMyProducts() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postUnlist;
    postUnlist = await apiRepProvider?.sendUnlistMyProductsPost(url!,formData);
    return postUnlist;
  }
  
    Future postUnlistMyProductsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postUnlist;
    postUnlist = await apiRepProvider?.sendUnlistMyProductsPostWithID(url!,formData, id!, title!);
    return postUnlist;
  }
  
      Future getUnlistMyProducts(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getUnlist;
        getUnlist = await apiRepProvider?.getUnlistMyProducts(url!, id!, title!, spKey!);
	    return getUnlist ;
	 }
   Future<UnlistMyProductsModel> loadUnlistMyProducts() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadUnlist;
        loadUnlist = await apiRepProvider?.loadUnlistMyProducts('');
	    return loadUnlist ;  
   }
  
   Future saveUnlistMyProducts(UnlistMyProductsModel? my_products, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateUnlistMyProducts(my_products!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllUnlistMyProducts(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllUnlistMyProducts(spKey!);   
   }
  
  
  
    Future editReactivateProductMyProducts()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editReactivateProduct;
    editReactivateProduct = await apiRepProvider?.getReactivateProductMyProductsEdit(url!, id!, title!);
    return editReactivateProduct;
  }

  Future postReactivateProductMyProducts() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postReactivateProduct;
    postReactivateProduct = await apiRepProvider?.sendReactivateProductMyProductsPost(url!,formData);
    return postReactivateProduct;
  }
  
    Future postReactivateProductMyProductsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postReactivateProduct;
    postReactivateProduct = await apiRepProvider?.sendReactivateProductMyProductsPostWithID(url!,formData, id!, title!);
    return postReactivateProduct;
  }
  
      Future getReactivateProductMyProducts(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getReactivateProduct;
        getReactivateProduct = await apiRepProvider?.getReactivateProductMyProducts(url!, id!, title!, spKey!);
	    return getReactivateProduct ;
	 }
   Future<ReactivateProductMyProductsModel> loadReactivateProductMyProducts() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadReactivateProduct;
        loadReactivateProduct = await apiRepProvider?.loadReactivateProductMyProducts('');
	    return loadReactivateProduct ;  
   }
  
   Future saveReactivateProductMyProducts(ReactivateProductMyProductsModel? my_products, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateReactivateProductMyProducts(my_products!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllReactivateProductMyProducts(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllReactivateProductMyProducts(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MyProductsListing extends Bloc<MyProductsEvent, MyProductsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MyProductsListing(this.application, this.url, this.isSearch, MyProductsState initialState):
  super(initialState){
     on<MyProductsList>(_MyProductsListEvent);
	
	  on<MyProductsListingRefresh>(_MyProductsListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MyProductsEvent, MyProductsState>> transformEvents(
      Stream<MyProductsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MyProductsEvent> transform<MyProductsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MyProductsEvent, MyProductsState> transition) {
    print(transition);
  }

  @override
  get initialState => MyProductsListingUninitialized();

void _MyProductsListEvent(MyProductsList event, Emitter<MyProductsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MyProductsListingUninitialized){
			  if(isSearch!){
			     MyProductsListingModel? my_products = await listingSearchMyProducts(1);
				  int deltaPage;
				  if(my_products?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_products?.items.items.length ~/ (my_products?.tools.paging.total_rows/my_products?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_products?.items.items.isEmpty
					  ? MyProductsListingLoaded(my_products: my_products!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyProductsListingLoaded(my_products: my_products!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MyProductsListingModel? my_products = await listingMyProducts(1);
				   int deltaPage;
				  if(my_products?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_products?.items.items.length ~/ (my_products?.tools.paging.total_rows/my_products?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_products?.items.items.isEmpty
					  ? MyProductsListingLoaded(my_products: my_products!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyProductsListingLoaded(my_products: my_products!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MyProductsListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyProductsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyProductsListingLoaded).page! + 1;
			 if ((currentState as MyProductsListingLoaded).my_products?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MyProductsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MyProductsListingModel? my_products = await listingSearchMyProducts(page);
						  if(!my_products?.items.items.isEmpty){
							 (currentState as MyProductsListingLoaded).my_products?.items.items.addAll(my_products?.items.items);
						  }
						  return emit ( my_products?.items.items.isEmpty
							  ? (currentState as MyProductsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyProductsListingLoaded(  my_products:  (currentState as MyProductsListingLoaded).my_products! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MyProductsListingLoaded).page! + 1;
							  if ((currentState as MyProductsListingLoaded).my_products?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MyProductsListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MyProductsListingModel? my_products = await listingMyProducts(page);
							  return emit ( my_products?.items.items.isEmpty
								  ? (currentState as MyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyProductsListingLoaded(  my_products:  my_products! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MyProductsListingError());
        
      }
    }
  }

void _MyProductsListingRefreshEvent(MyProductsListingRefresh event, Emitter<MyProductsState> emit)async{
  final currentState = state;
   try {
        if (currentState is MyProductsListingUninitialized) {
		   if(isSearch!){

			    MyProductsListingModel? my_products = await listingSearchMyProducts(1);
              return emit (  MyProductsListingLoaded( my_products: my_products!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MyProductsListingModel? my_products = await listingMyProducts(1);
				   return emit (  MyProductsListingLoaded( my_products: my_products!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MyProductsListingLoaded) {
		  if(isSearch!){
		     MyProductsListingModel? my_products = await listingSearchRefreshMyProducts();
              return emit (  my_products?.items.items.isEmpty
              ? (currentState as MyProductsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyProductsListingLoaded(  my_products: my_products! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MyProductsListingModel? my_products = await listingMyProducts(1);
				  int deltaPage = my_products?.items.items.length ~/ (my_products?.tools.paging.total_rows/my_products?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_products?.items.items.isEmpty
					  ? (currentState as MyProductsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyProductsListingLoaded(my_products: my_products!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MyProductsListingError());
      }
  }

  @override

  Stream<MyProductsState> mapEventToState(MyProductsEvent event) async* {
    final currentState = state;
    if (event is MyProductsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MyProductsListingUninitialized){
			  if(isSearch!){
			     MyProductsListingModel? my_products = await listingSearchMyProducts(1);
				  int deltaPage;
				  if(my_products?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_products?.items.items.length ~/ (my_products?.tools.paging.total_rows/my_products?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_products?.items.items.isEmpty
					  ? MyProductsListingLoaded(my_products: my_products!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyProductsListingLoaded(my_products: my_products!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MyProductsListingModel? my_products = await listingMyProducts(1);
				   int deltaPage;
				  if(my_products?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_products?.items.items.length ~/ (my_products?.tools.paging.total_rows/my_products?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_products?.items.items.isEmpty
					  ? MyProductsListingLoaded(my_products: my_products!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyProductsListingLoaded(my_products: my_products!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MyProductsListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyProductsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyProductsListingLoaded).page! + 1;
			 if ((currentState as MyProductsListingLoaded).my_products?.tools.paging.total_pages == oldpage) {
					yield (currentState as MyProductsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MyProductsListingModel? my_products = await listingSearchMyProducts(page);
						  if(!my_products?.items.items.isEmpty){
							 (currentState as MyProductsListingLoaded).my_products?.items.items.addAll(my_products?.items.items);
						  }
						  yield my_products?.items.items.isEmpty
							  ? (currentState as MyProductsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyProductsListingLoaded(  my_products:  (currentState as MyProductsListingLoaded).my_products! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MyProductsListingLoaded).page! + 1;
							  if ((currentState as MyProductsListingLoaded).my_products?.tools.paging.total_pages == oldpage) {
						yield (currentState as MyProductsListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MyProductsListingModel? my_products = await listingMyProducts(page);
							  yield my_products?.items.items.isEmpty
								  ? (currentState as MyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyProductsListingLoaded(  my_products:  my_products! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MyProductsListingError();
        
      }
    } else if (event is MyProductsListingRefresh){
      try {
        if (currentState is MyProductsListingUninitialized) {
		   if(isSearch!){

			    MyProductsListingModel? my_products = await listingSearchMyProducts(1);
              yield MyProductsListingLoaded( my_products: my_products!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MyProductsListingModel? my_products = await listingMyProducts(1);
				   yield MyProductsListingLoaded( my_products: my_products!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MyProductsListingLoaded) {
		  if(isSearch!){
		     MyProductsListingModel? my_products = await listingSearchRefreshMyProducts();
              yield my_products?.items.items.isEmpty
              ? (currentState as MyProductsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyProductsListingLoaded(  my_products: my_products! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MyProductsListingModel? my_products = await listingMyProducts(1);
				  int deltaPage = my_products?.items.items.length ~/ (my_products?.tools.paging.total_rows/my_products?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_products?.items.items.isEmpty
					  ? (currentState as MyProductsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyProductsListingLoaded(my_products: my_products!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MyProductsListingError();
      }

    }
  }

  bool hasReachedMax(MyProductsState state) =>
      state is MyProductsListingLoaded && state.hasReachedMax!;

  Future<MyProductsListingModel?> listingMyProducts(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyProductsList(url!, page!);
  }

  Future<MyProductsListingModel?> listingRefreshMyProducts() async {
    MyProductsListingModel? my_products;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMyProductsList();
    my_products  = await apiRepProvider?.getMyProductsList(url!, 1);
    return my_products;
  }
  
  

  Future<MyProductsListingModel?> listingSearchMyProducts(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyProductsListSearch(url!, page!);
  }

  Future<MyProductsListingModel?> listingSearchRefreshMyProducts() async {
    MyProductsListingModel? my_products ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_products  = await apiRepProvider?.getMyProductsListSearch(url!, 1);
    return my_products;
  }
}


class SalesMyProductsListing extends Bloc<SalesMyProductsEvent, SalesMyProductsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  SalesMyProductsListing(this.application, this.url, this.isSearch, SalesMyProductsState initialState):
  super(initialState){
     on<SalesMyProductsList>(_SalesMyProductsListEvent);
	 on<SalesMyProductsListingRefresh>(_SalesMyProductsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<SalesMyProductsEvent, SalesMyProductsState>> transformEvents(
      Stream<SalesMyProductsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
 */ 
     EventTransformer<SalesMyProductsEvent> transform<SalesMyProductsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<SalesMyProductsEvent, SalesMyProductsState> transition) {
    print(transition);
  }

  @override
  get initialState => SalesMyProductsListingUninitialized();
  
  
  void _SalesMyProductsListEvent(SalesMyProductsList event, Emitter<SalesMyProductsState> emit)async{
  final currentState = state;
    if (!hasReachedMax(currentState)) {
      try {
					if (currentState is SalesMyProductsListingUninitialized){
						  if(isSearch!){
							 SalesListingModel? sales = await listingSearchSalesMyProducts(-1);
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
							  SalesMyProductsListingLoaded(sales: sales!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : SalesMyProductsListingLoaded(sales: sales!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }else{
							  SalesListingModel? sales = await listingSalesMyProducts(1);
							  int deltaPage = sales?.items.items.length ~/ (sales?.tools.paging.total_rows/sales?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( SalesMyProductsListingLoaded(sales: sales!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }
					}

					if (currentState is SalesMyProductsListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as SalesMyProductsListingLoaded).page! + 1;
							  bool max = false;
							  SalesListingModel? sales = await listingSalesMyProducts(page);
							  if(sales?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!sales?.items.items.isEmpty && !max){
								 (currentState as SalesMyProductsListingLoaded).sales?.items.items.addAll(sales?.items.items);
							  }
							  return emit ( sales?.items.items.isEmpty || max
								  ? (currentState as SalesMyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : SalesMyProductsListingLoaded(  sales:  (currentState as SalesMyProductsListingLoaded).sales! ,
														  hasReachedMax: false,
														  page: page,));
						}else{
					  
							  final page = (currentState as SalesMyProductsListingLoaded).page! + 1;
							  SalesListingModel? sales = await listingSalesMyProducts(page);
							  return emit ( sales?.items.items.isEmpty
								  ? (currentState as SalesMyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : SalesMyProductsListingLoaded(  sales:  sales! ,
														  hasReachedMax: false,
														  page: page,));
						}	  
					}
					
      } catch (_) {
        return emit ( SalesMyProductsListingError());
      }
    }
  }
  
  void _SalesMyProductsListingRefreshEvent(SalesMyProductsListingRefresh event, Emitter<SalesMyProductsState> emit)async{
  final currentState = state;
   try {
					if (currentState is SalesMyProductsListingUninitialized) {
					   if(isSearch!){
						  SalesListingModel? sales = await listingSearchSalesMyProducts(1);
						  return emit (  SalesMyProductsListingLoaded( sales: sales!,
							   hasReachedMax: false,
							   page: 1 ));
					   }else{
						 SalesListingModel? sales = await listingSalesMyProducts(1);
						 return emit ( SalesMyProductsListingLoaded( sales: sales!,
							   hasReachedMax: false,
							   page: 1 ));
					   }

					}

					if (currentState is SalesMyProductsListingLoaded) {
					  if(isSearch!){
						 SalesListingModel? sales = await listingSearchRefreshSalesMyProducts();
						  return emit (  sales?.items.items.isEmpty
						  ? (currentState as SalesMyProductsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : SalesMyProductsListingLoaded(  sales: sales! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }else{
						  SalesListingModel? sales = await listingRefreshSalesMyProducts();
						  return emit (  sales?.items.items.isEmpty
						  ? (currentState as SalesMyProductsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : SalesMyProductsListingLoaded(  sales: sales! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }

					}
			
      } catch (_) {
        return emit ( SalesMyProductsListingError());
      }

  }

  @override

  Stream<SalesMyProductsState> mapEventToState(SalesMyProductsEvent event) async* {
  final currentState = state;
    if (event is SalesMyProductsList && !hasReachedMax(currentState)) {
      try {
					if (currentState is SalesMyProductsListingUninitialized){
						  if(isSearch!){
							 SalesListingModel? sales = await listingSearchSalesMyProducts(-1);
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
							  SalesMyProductsListingLoaded(sales: sales!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : SalesMyProductsListingLoaded(sales: sales!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }else{
							  SalesListingModel? sales = await listingSalesMyProducts(1);
							  int deltaPage = sales?.items.items.length ~/ (sales?.tools.paging.total_rows/sales?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield SalesMyProductsListingLoaded(sales: sales!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }
					}

					if (currentState is SalesMyProductsListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as SalesMyProductsListingLoaded).page! + 1;
							  bool max = false;
							  SalesListingModel? sales = await listingSalesMyProducts(page);
							  if(sales?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!sales?.items.items.isEmpty && !max){
								 (currentState as SalesMyProductsListingLoaded).sales?.items.items.addAll(sales?.items.items);
							  }
							  yield sales?.items.items.isEmpty || max
								  ? (currentState as SalesMyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : SalesMyProductsListingLoaded(  sales:  (currentState as SalesMyProductsListingLoaded).sales! ,
														  hasReachedMax: false,
														  page: page,);
						}else{
					  
							  final page = (currentState as SalesMyProductsListingLoaded).page! + 1;
							  SalesListingModel? sales = await listingSalesMyProducts(page);
							  yield sales?.items.items.isEmpty
								  ? (currentState as SalesMyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : SalesMyProductsListingLoaded(  sales:  sales! ,
														  hasReachedMax: false,
														  page: page,);
						}	  
					}
					
      } catch (_) {
        yield SalesMyProductsListingError();
      }
    } else if (event is SalesMyProductsListingRefresh){
      try {
					if (currentState is SalesMyProductsListingUninitialized) {
					   if(isSearch!){
						  SalesListingModel? sales = await listingSearchSalesMyProducts(1);
						  yield SalesMyProductsListingLoaded( sales: sales!,
							   hasReachedMax: false,
							   page: 1 );
					   }else{
						 SalesListingModel? sales = await listingSalesMyProducts(1);
						 yield SalesMyProductsListingLoaded( sales: sales!,
							   hasReachedMax: false,
							   page: 1 );
					   }

					}

					if (currentState is SalesMyProductsListingLoaded) {
					  if(isSearch!){
						 SalesListingModel? sales = await listingSearchRefreshSalesMyProducts();
						  yield sales?.items.items.isEmpty
						  ? (currentState as SalesMyProductsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : SalesMyProductsListingLoaded(  sales: sales! ,
						  hasReachedMax: false,
						  page: 1 );
					  }else{
						  SalesListingModel? sales = await listingRefreshSalesMyProducts();
						  yield sales?.items.items.isEmpty
						  ? (currentState as SalesMyProductsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : SalesMyProductsListingLoaded(  sales: sales! ,
						  hasReachedMax: false,
						  page: 1 );
					  }

					}
			
      } catch (_) {
        yield SalesMyProductsListingError();
      }

    }
  }

  bool hasReachedMax(SalesMyProductsState state) =>
      state is SalesMyProductsListingLoaded && state.hasReachedMax!;

  Future<SalesListingModel?> listingSalesMyProducts(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getSalesMyProductsListSearch(url!, page!);
  }
    Future<SalesListingModel?> listingRefreshSalesMyProducts() async {
    SalesListingModel? sales ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    sales  = await apiRepProvider?.getSalesMyProductsListSearch(url!, 1);
    return sales;
  }
  Future<SalesListingModel?> listingSearchSalesMyProducts(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getSalesMyProductsListSearch(url!, page!);
  }

  Future<SalesListingModel?> listingSearchRefreshSalesMyProducts() async {
    SalesListingModel? sales ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    sales  = await apiRepProvider?.getSalesMyProductsListSearch(url!, 1);
    return sales;
  }
  
  
  
}




class CommentsMyProductsListing extends Bloc<CommentsMyProductsEvent, CommentsMyProductsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  CommentsMyProductsListing(this.application, this.url, this.isSearch, CommentsMyProductsState initialState):
  super(initialState){
     on<CommentsMyProductsList>(_CommentsMyProductsListEvent);
	 on<CommentsMyProductsListingRefresh>(_CommentsMyProductsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<CommentsMyProductsEvent, CommentsMyProductsState>> transformEvents(
      Stream<CommentsMyProductsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
 */ 
     EventTransformer<CommentsMyProductsEvent> transform<CommentsMyProductsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<CommentsMyProductsEvent, CommentsMyProductsState> transition) {
    print(transition);
  }

  @override
  get initialState => CommentsMyProductsListingUninitialized();
  
  
  void _CommentsMyProductsListEvent(CommentsMyProductsList event, Emitter<CommentsMyProductsState> emit)async{
  final currentState = state;
    if (!hasReachedMax(currentState)) {
      try {
					if (currentState is CommentsMyProductsListingUninitialized){
						  if(isSearch!){
							 CommentsListingModel? comments = await listingSearchCommentsMyProducts(-1);
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
							  CommentsMyProductsListingLoaded(comments: comments!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : CommentsMyProductsListingLoaded(comments: comments!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }else{
							  CommentsListingModel? comments = await listingCommentsMyProducts(1);
							  int deltaPage = comments?.items.items.length ~/ (comments?.tools.paging.total_rows/comments?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( CommentsMyProductsListingLoaded(comments: comments!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }
					}

					if (currentState is CommentsMyProductsListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as CommentsMyProductsListingLoaded).page! + 1;
							  bool max = false;
							  CommentsListingModel? comments = await listingCommentsMyProducts(page);
							  if(comments?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!comments?.items.items.isEmpty && !max){
								 (currentState as CommentsMyProductsListingLoaded).comments?.items.items.addAll(comments?.items.items);
							  }
							  return emit ( comments?.items.items.isEmpty || max
								  ? (currentState as CommentsMyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : CommentsMyProductsListingLoaded(  comments:  (currentState as CommentsMyProductsListingLoaded).comments! ,
														  hasReachedMax: false,
														  page: page,));
						}else{
					  
							  final page = (currentState as CommentsMyProductsListingLoaded).page! + 1;
							  CommentsListingModel? comments = await listingCommentsMyProducts(page);
							  return emit ( comments?.items.items.isEmpty
								  ? (currentState as CommentsMyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : CommentsMyProductsListingLoaded(  comments:  comments! ,
														  hasReachedMax: false,
														  page: page,));
						}	  
					}
					
      } catch (_) {
        return emit ( CommentsMyProductsListingError());
      }
    }
  }
  
  void _CommentsMyProductsListingRefreshEvent(CommentsMyProductsListingRefresh event, Emitter<CommentsMyProductsState> emit)async{
  final currentState = state;
   try {
					if (currentState is CommentsMyProductsListingUninitialized) {
					   if(isSearch!){
						  CommentsListingModel? comments = await listingSearchCommentsMyProducts(1);
						  return emit (  CommentsMyProductsListingLoaded( comments: comments!,
							   hasReachedMax: false,
							   page: 1 ));
					   }else{
						 CommentsListingModel? comments = await listingCommentsMyProducts(1);
						 return emit ( CommentsMyProductsListingLoaded( comments: comments!,
							   hasReachedMax: false,
							   page: 1 ));
					   }

					}

					if (currentState is CommentsMyProductsListingLoaded) {
					  if(isSearch!){
						 CommentsListingModel? comments = await listingSearchRefreshCommentsMyProducts();
						  return emit (  comments?.items.items.isEmpty
						  ? (currentState as CommentsMyProductsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : CommentsMyProductsListingLoaded(  comments: comments! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }else{
						  CommentsListingModel? comments = await listingRefreshCommentsMyProducts();
						  return emit (  comments?.items.items.isEmpty
						  ? (currentState as CommentsMyProductsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : CommentsMyProductsListingLoaded(  comments: comments! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }

					}
			
      } catch (_) {
        return emit ( CommentsMyProductsListingError());
      }

  }

  @override

  Stream<CommentsMyProductsState> mapEventToState(CommentsMyProductsEvent event) async* {
  final currentState = state;
    if (event is CommentsMyProductsList && !hasReachedMax(currentState)) {
      try {
					if (currentState is CommentsMyProductsListingUninitialized){
						  if(isSearch!){
							 CommentsListingModel? comments = await listingSearchCommentsMyProducts(-1);
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
							  CommentsMyProductsListingLoaded(comments: comments!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : CommentsMyProductsListingLoaded(comments: comments!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }else{
							  CommentsListingModel? comments = await listingCommentsMyProducts(1);
							  int deltaPage = comments?.items.items.length ~/ (comments?.tools.paging.total_rows/comments?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield CommentsMyProductsListingLoaded(comments: comments!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }
					}

					if (currentState is CommentsMyProductsListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as CommentsMyProductsListingLoaded).page! + 1;
							  bool max = false;
							  CommentsListingModel? comments = await listingCommentsMyProducts(page);
							  if(comments?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!comments?.items.items.isEmpty && !max){
								 (currentState as CommentsMyProductsListingLoaded).comments?.items.items.addAll(comments?.items.items);
							  }
							  yield comments?.items.items.isEmpty || max
								  ? (currentState as CommentsMyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : CommentsMyProductsListingLoaded(  comments:  (currentState as CommentsMyProductsListingLoaded).comments! ,
														  hasReachedMax: false,
														  page: page,);
						}else{
					  
							  final page = (currentState as CommentsMyProductsListingLoaded).page! + 1;
							  CommentsListingModel? comments = await listingCommentsMyProducts(page);
							  yield comments?.items.items.isEmpty
								  ? (currentState as CommentsMyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : CommentsMyProductsListingLoaded(  comments:  comments! ,
														  hasReachedMax: false,
														  page: page,);
						}	  
					}
					
      } catch (_) {
        yield CommentsMyProductsListingError();
      }
    } else if (event is CommentsMyProductsListingRefresh){
      try {
					if (currentState is CommentsMyProductsListingUninitialized) {
					   if(isSearch!){
						  CommentsListingModel? comments = await listingSearchCommentsMyProducts(1);
						  yield CommentsMyProductsListingLoaded( comments: comments!,
							   hasReachedMax: false,
							   page: 1 );
					   }else{
						 CommentsListingModel? comments = await listingCommentsMyProducts(1);
						 yield CommentsMyProductsListingLoaded( comments: comments!,
							   hasReachedMax: false,
							   page: 1 );
					   }

					}

					if (currentState is CommentsMyProductsListingLoaded) {
					  if(isSearch!){
						 CommentsListingModel? comments = await listingSearchRefreshCommentsMyProducts();
						  yield comments?.items.items.isEmpty
						  ? (currentState as CommentsMyProductsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : CommentsMyProductsListingLoaded(  comments: comments! ,
						  hasReachedMax: false,
						  page: 1 );
					  }else{
						  CommentsListingModel? comments = await listingRefreshCommentsMyProducts();
						  yield comments?.items.items.isEmpty
						  ? (currentState as CommentsMyProductsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : CommentsMyProductsListingLoaded(  comments: comments! ,
						  hasReachedMax: false,
						  page: 1 );
					  }

					}
			
      } catch (_) {
        yield CommentsMyProductsListingError();
      }

    }
  }

  bool hasReachedMax(CommentsMyProductsState state) =>
      state is CommentsMyProductsListingLoaded && state.hasReachedMax!;

  Future<CommentsListingModel?> listingCommentsMyProducts(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getCommentsMyProductsListSearch(url!, page!);
  }
    Future<CommentsListingModel?> listingRefreshCommentsMyProducts() async {
    CommentsListingModel? comments ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    comments  = await apiRepProvider?.getCommentsMyProductsListSearch(url!, 1);
    return comments;
  }
  Future<CommentsListingModel?> listingSearchCommentsMyProducts(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getCommentsMyProductsListSearch(url!, page!);
  }

  Future<CommentsListingModel?> listingSearchRefreshCommentsMyProducts() async {
    CommentsListingModel? comments ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    comments  = await apiRepProvider?.getCommentsMyProductsListSearch(url!, 1);
    return comments;
  }
  
  
  
}




class ScreenshotsMyProductsListing extends Bloc<ScreenshotsMyProductsEvent, ScreenshotsMyProductsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  ScreenshotsMyProductsListing(this.application, this.url, this.isSearch, ScreenshotsMyProductsState initialState):
  super(initialState){
     on<ScreenshotsMyProductsList>(_ScreenshotsMyProductsListEvent);
	 on<ScreenshotsMyProductsListingRefresh>(_ScreenshotsMyProductsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<ScreenshotsMyProductsEvent, ScreenshotsMyProductsState>> transformEvents(
      Stream<ScreenshotsMyProductsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
 */ 
     EventTransformer<ScreenshotsMyProductsEvent> transform<ScreenshotsMyProductsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<ScreenshotsMyProductsEvent, ScreenshotsMyProductsState> transition) {
    print(transition);
  }

  @override
  get initialState => ScreenshotsMyProductsListingUninitialized();
  
  
  void _ScreenshotsMyProductsListEvent(ScreenshotsMyProductsList event, Emitter<ScreenshotsMyProductsState> emit)async{
  final currentState = state;
    if (!hasReachedMax(currentState)) {
      try {
					if (currentState is ScreenshotsMyProductsListingUninitialized){
						  if(isSearch!){
							 ScreenshotsListingModel? screenshots = await listingSearchScreenshotsMyProducts(-1);
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
							  ScreenshotsMyProductsListingLoaded(screenshots: screenshots!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : ScreenshotsMyProductsListingLoaded(screenshots: screenshots!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }else{
							  ScreenshotsListingModel? screenshots = await listingScreenshotsMyProducts(1);
							  int deltaPage = screenshots?.items.items.length ~/ (screenshots?.tools.paging.total_rows/screenshots?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  return emit ( ScreenshotsMyProductsListingLoaded(screenshots: screenshots!,
								  hasReachedMax: false,
								  page: deltaPage));
						  }
					}

					if (currentState is ScreenshotsMyProductsListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as ScreenshotsMyProductsListingLoaded).page! + 1;
							  bool max = false;
							  ScreenshotsListingModel? screenshots = await listingScreenshotsMyProducts(page);
							  if(screenshots?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!screenshots?.items.items.isEmpty && !max){
								 (currentState as ScreenshotsMyProductsListingLoaded).screenshots?.items.items.addAll(screenshots?.items.items);
							  }
							  return emit ( screenshots?.items.items.isEmpty || max
								  ? (currentState as ScreenshotsMyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ScreenshotsMyProductsListingLoaded(  screenshots:  (currentState as ScreenshotsMyProductsListingLoaded).screenshots! ,
														  hasReachedMax: false,
														  page: page,));
						}else{
					  
							  final page = (currentState as ScreenshotsMyProductsListingLoaded).page! + 1;
							  ScreenshotsListingModel? screenshots = await listingScreenshotsMyProducts(page);
							  return emit ( screenshots?.items.items.isEmpty
								  ? (currentState as ScreenshotsMyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : ScreenshotsMyProductsListingLoaded(  screenshots:  screenshots! ,
														  hasReachedMax: false,
														  page: page,));
						}	  
					}
					
      } catch (_) {
        return emit ( ScreenshotsMyProductsListingError());
      }
    }
  }
  
  void _ScreenshotsMyProductsListingRefreshEvent(ScreenshotsMyProductsListingRefresh event, Emitter<ScreenshotsMyProductsState> emit)async{
  final currentState = state;
   try {
					if (currentState is ScreenshotsMyProductsListingUninitialized) {
					   if(isSearch!){
						  ScreenshotsListingModel? screenshots = await listingSearchScreenshotsMyProducts(1);
						  return emit (  ScreenshotsMyProductsListingLoaded( screenshots: screenshots!,
							   hasReachedMax: false,
							   page: 1 ));
					   }else{
						 ScreenshotsListingModel? screenshots = await listingScreenshotsMyProducts(1);
						 return emit ( ScreenshotsMyProductsListingLoaded( screenshots: screenshots!,
							   hasReachedMax: false,
							   page: 1 ));
					   }

					}

					if (currentState is ScreenshotsMyProductsListingLoaded) {
					  if(isSearch!){
						 ScreenshotsListingModel? screenshots = await listingSearchRefreshScreenshotsMyProducts();
						  return emit (  screenshots?.items.items.isEmpty
						  ? (currentState as ScreenshotsMyProductsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ScreenshotsMyProductsListingLoaded(  screenshots: screenshots! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }else{
						  ScreenshotsListingModel? screenshots = await listingRefreshScreenshotsMyProducts();
						  return emit (  screenshots?.items.items.isEmpty
						  ? (currentState as ScreenshotsMyProductsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ScreenshotsMyProductsListingLoaded(  screenshots: screenshots! ,
						  hasReachedMax: false,
						  page: 1 ));
					  }

					}
			
      } catch (_) {
        return emit ( ScreenshotsMyProductsListingError());
      }

  }

  @override

  Stream<ScreenshotsMyProductsState> mapEventToState(ScreenshotsMyProductsEvent event) async* {
  final currentState = state;
    if (event is ScreenshotsMyProductsList && !hasReachedMax(currentState)) {
      try {
					if (currentState is ScreenshotsMyProductsListingUninitialized){
						  if(isSearch!){
							 ScreenshotsListingModel? screenshots = await listingSearchScreenshotsMyProducts(-1);
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
							  ScreenshotsMyProductsListingLoaded(screenshots: screenshots!,
								  hasReachedMax: true,
								  page: deltaPage)
							  : ScreenshotsMyProductsListingLoaded(screenshots: screenshots!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }else{
							  ScreenshotsListingModel? screenshots = await listingScreenshotsMyProducts(1);
							  int deltaPage = screenshots?.items.items.length ~/ (screenshots?.tools.paging.total_rows/screenshots?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							  yield ScreenshotsMyProductsListingLoaded(screenshots: screenshots!,
								  hasReachedMax: false,
								  page: deltaPage);
						  }
					}

					if (currentState is ScreenshotsMyProductsListingLoaded) {
					  //page++;
						if(isSearch!){
							  final page = (currentState as ScreenshotsMyProductsListingLoaded).page! + 1;
							  bool max = false;
							  ScreenshotsListingModel? screenshots = await listingScreenshotsMyProducts(page);
							  if(screenshots?.tools.paging.total_pages < page){
							  max = true;
							  }
							  if(!screenshots?.items.items.isEmpty && !max){
								 (currentState as ScreenshotsMyProductsListingLoaded).screenshots?.items.items.addAll(screenshots?.items.items);
							  }
							  yield screenshots?.items.items.isEmpty || max
								  ? (currentState as ScreenshotsMyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ScreenshotsMyProductsListingLoaded(  screenshots:  (currentState as ScreenshotsMyProductsListingLoaded).screenshots! ,
														  hasReachedMax: false,
														  page: page,);
						}else{
					  
							  final page = (currentState as ScreenshotsMyProductsListingLoaded).page! + 1;
							  ScreenshotsListingModel? screenshots = await listingScreenshotsMyProducts(page);
							  yield screenshots?.items.items.isEmpty
								  ? (currentState as ScreenshotsMyProductsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : ScreenshotsMyProductsListingLoaded(  screenshots:  screenshots! ,
														  hasReachedMax: false,
														  page: page,);
						}	  
					}
					
      } catch (_) {
        yield ScreenshotsMyProductsListingError();
      }
    } else if (event is ScreenshotsMyProductsListingRefresh){
      try {
					if (currentState is ScreenshotsMyProductsListingUninitialized) {
					   if(isSearch!){
						  ScreenshotsListingModel? screenshots = await listingSearchScreenshotsMyProducts(1);
						  yield ScreenshotsMyProductsListingLoaded( screenshots: screenshots!,
							   hasReachedMax: false,
							   page: 1 );
					   }else{
						 ScreenshotsListingModel? screenshots = await listingScreenshotsMyProducts(1);
						 yield ScreenshotsMyProductsListingLoaded( screenshots: screenshots!,
							   hasReachedMax: false,
							   page: 1 );
					   }

					}

					if (currentState is ScreenshotsMyProductsListingLoaded) {
					  if(isSearch!){
						 ScreenshotsListingModel? screenshots = await listingSearchRefreshScreenshotsMyProducts();
						  yield screenshots?.items.items.isEmpty
						  ? (currentState as ScreenshotsMyProductsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ScreenshotsMyProductsListingLoaded(  screenshots: screenshots! ,
						  hasReachedMax: false,
						  page: 1 );
					  }else{
						  ScreenshotsListingModel? screenshots = await listingRefreshScreenshotsMyProducts();
						  yield screenshots?.items.items.isEmpty
						  ? (currentState as ScreenshotsMyProductsListingLoaded).copyWith( hasReachedMax: false,
						  page: 1)
						  : ScreenshotsMyProductsListingLoaded(  screenshots: screenshots! ,
						  hasReachedMax: false,
						  page: 1 );
					  }

					}
			
      } catch (_) {
        yield ScreenshotsMyProductsListingError();
      }

    }
  }

  bool hasReachedMax(ScreenshotsMyProductsState state) =>
      state is ScreenshotsMyProductsListingLoaded && state.hasReachedMax!;

  Future<ScreenshotsListingModel?> listingScreenshotsMyProducts(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getScreenshotsMyProductsListSearch(url!, page!);
  }
    Future<ScreenshotsListingModel?> listingRefreshScreenshotsMyProducts() async {
    ScreenshotsListingModel? screenshots ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    screenshots  = await apiRepProvider?.getScreenshotsMyProductsListSearch(url!, 1);
    return screenshots;
  }
  Future<ScreenshotsListingModel?> listingSearchScreenshotsMyProducts(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getScreenshotsMyProductsListSearch(url!, page!);
  }

  Future<ScreenshotsListingModel?> listingSearchRefreshScreenshotsMyProducts() async {
    ScreenshotsListingModel? screenshots ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    screenshots  = await apiRepProvider?.getScreenshotsMyProductsListSearch(url!, 1);
    return screenshots;
  }
  
  
  
}




