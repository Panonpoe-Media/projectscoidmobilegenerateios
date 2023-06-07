
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';
//////
class BlogController {

  ProjectscoidApplication application;
  BlogListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  BlogController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new BlogListing(this.application, this.url!, this.isSearch, BlogListingUninitialized());}
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

  Future editBlog()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editBlog;
    editBlog = await apiRepProvider?.getBlogEdit(url!, id!, title!);
    return editBlog;
  }
  
    Future viewBlog()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewBlog;
    viewBlog = await apiRepProvider?.getBlogView(url!, id!, title!);
    return viewBlog;
  }

  Future postBlog() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBlog;
    postBlog = await apiRepProvider?.sendBlogPost(url!,formData);
    return postBlog;
  }
  
    Future postBlogWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postBlog;
    postBlog = await apiRepProvider?.sendBlogPostWithID(url!,formData, id!, title!);
    return postBlog;
  }

  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class BlogListing extends Bloc<BlogEvent, BlogState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  BlogListing(this.application, this.url, this.isSearch, BlogState initialState):
  super(initialState){
     on<BlogList>(_BlogListEvent);
	
	  on<BlogListingRefresh>(_BlogListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<BlogEvent, BlogState>> transformEvents(
      Stream<BlogEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<BlogEvent> transform<BlogEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<BlogEvent, BlogState> transition) {
    print(transition);
  }

  @override
  get initialState => BlogListingUninitialized();

void _BlogListEvent(BlogList event, Emitter<BlogState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is BlogListingUninitialized){
			  if(isSearch!){
			     BlogListingModel? blog = await listingSearchBlog(1);
				  int deltaPage;
				  if(blog?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  blog?.items.items.length ~/ (blog?.tools.paging.total_rows/blog?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( blog?.items.items.isEmpty
					  ? BlogListingLoaded(blog: blog!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : BlogListingLoaded(blog: blog!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  BlogListingModel? blog = await listingBlog(1);
				   int deltaPage;
				  if(blog?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  blog?.items.items.length ~/ (blog?.tools.paging.total_rows/blog?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( blog?.items.items.isEmpty
					  ? BlogListingLoaded(blog: blog!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :BlogListingLoaded(blog: blog!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is BlogListingLoaded) {
          //page++;
		    final oldpage = (currentState as BlogListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as BlogListingLoaded).page! + 1;
			 if ((currentState as BlogListingLoaded).blog?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as BlogListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      BlogListingModel? blog = await listingSearchBlog(page);
						  if(!blog?.items.items.isEmpty){
							 (currentState as BlogListingLoaded).blog?.items.items.addAll(blog?.items.items);
						  }
						  return emit ( blog?.items.items.isEmpty
							  ? (currentState as BlogListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : BlogListingLoaded(  blog:  (currentState as BlogListingLoaded).blog! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as BlogListingLoaded).page! + 1;
							  if ((currentState as BlogListingLoaded).blog?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as BlogListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  BlogListingModel? blog = await listingBlog(page);
							  return emit ( blog?.items.items.isEmpty
								  ? (currentState as BlogListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : BlogListingLoaded(  blog:  blog! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( BlogListingError());
        
      }
    }
  }

void _BlogListingRefreshEvent(BlogListingRefresh event, Emitter<BlogState> emit)async{
  final currentState = state;
   try {
        if (currentState is BlogListingUninitialized) {
		   if(isSearch!){

			    BlogListingModel? blog = await listingSearchBlog(1);
              return emit (  BlogListingLoaded( blog: blog!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    BlogListingModel? blog = await listingBlog(1);
				   return emit (  BlogListingLoaded( blog: blog!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is BlogListingLoaded) {
		  if(isSearch!){
		     BlogListingModel? blog = await listingSearchRefreshBlog();
              return emit (  blog?.items.items.isEmpty
              ? (currentState as BlogListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : BlogListingLoaded(  blog: blog! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  BlogListingModel? blog = await listingBlog(1);
				  int deltaPage = blog?.items.items.length ~/ (blog?.tools.paging.total_rows/blog?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  blog?.items.items.isEmpty
					  ? (currentState as BlogListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :BlogListingLoaded(blog: blog!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  BlogListingError());
      }
  }

  @override

  Stream<BlogState> mapEventToState(BlogEvent event) async* {
    final currentState = state;
    if (event is BlogList && !hasReachedMax(currentState)) {
      try {
        if (currentState is BlogListingUninitialized){
			  if(isSearch!){
			     BlogListingModel? blog = await listingSearchBlog(1);
				  int deltaPage;
				  if(blog?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  blog?.items.items.length ~/ (blog?.tools.paging.total_rows/blog?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield blog?.items.items.isEmpty
					  ? BlogListingLoaded(blog: blog!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : BlogListingLoaded(blog: blog!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  BlogListingModel? blog = await listingBlog(1);
				   int deltaPage;
				  if(blog?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  blog?.items.items.length ~/ (blog?.tools.paging.total_rows/blog?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield blog?.items.items.isEmpty
					  ? BlogListingLoaded(blog: blog!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :BlogListingLoaded(blog: blog!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is BlogListingLoaded) {
          //page++;
		    final oldpage = (currentState as BlogListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as BlogListingLoaded).page! + 1;
			 if ((currentState as BlogListingLoaded).blog?.tools.paging.total_pages == oldpage) {
					yield (currentState as BlogListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      BlogListingModel? blog = await listingSearchBlog(page);
						  if(!blog?.items.items.isEmpty){
							 (currentState as BlogListingLoaded).blog?.items.items.addAll(blog?.items.items);
						  }
						  yield blog?.items.items.isEmpty
							  ? (currentState as BlogListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : BlogListingLoaded(  blog:  (currentState as BlogListingLoaded).blog! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as BlogListingLoaded).page! + 1;
							  if ((currentState as BlogListingLoaded).blog?.tools.paging.total_pages == oldpage) {
						yield (currentState as BlogListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  BlogListingModel? blog = await listingBlog(page);
							  yield blog?.items.items.isEmpty
								  ? (currentState as BlogListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : BlogListingLoaded(  blog:  blog! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield BlogListingError();
        
      }
    } else if (event is BlogListingRefresh){
      try {
        if (currentState is BlogListingUninitialized) {
		   if(isSearch!){

			    BlogListingModel? blog = await listingSearchBlog(1);
              yield BlogListingLoaded( blog: blog!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    BlogListingModel? blog = await listingBlog(1);
				   yield BlogListingLoaded( blog: blog!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is BlogListingLoaded) {
		  if(isSearch!){
		     BlogListingModel? blog = await listingSearchRefreshBlog();
              yield blog?.items.items.isEmpty
              ? (currentState as BlogListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : BlogListingLoaded(  blog: blog! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  BlogListingModel? blog = await listingBlog(1);
				  int deltaPage = blog?.items.items.length ~/ (blog?.tools.paging.total_rows/blog?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield blog?.items.items.isEmpty
					  ? (currentState as BlogListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :BlogListingLoaded(blog: blog!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield BlogListingError();
      }

    }
  }

  bool hasReachedMax(BlogState state) =>
      state is BlogListingLoaded && state.hasReachedMax!;

  Future<BlogListingModel?> listingBlog(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getBlogList(url!, page!);
  }

  Future<BlogListingModel?> listingRefreshBlog() async {
    BlogListingModel? blog;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllBlogList();
    blog  = await apiRepProvider?.getBlogList(url!, 1);
    return blog;
  }
  
  

  Future<BlogListingModel?> listingSearchBlog(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getBlogListSearch(url!, page!);
  }

  Future<BlogListingModel?> listingSearchRefreshBlog() async {
    BlogListingModel? blog ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    blog  = await apiRepProvider?.getBlogListSearch(url!, 1);
    return blog;
  }
}


