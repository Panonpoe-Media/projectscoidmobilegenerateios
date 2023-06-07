
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';
//////
class MyBidsController {

  ProjectscoidApplication application;
  MyBidsListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;
  ShowConversationMyBidsListing? listingShowConversation;

  MyBidsController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MyBidsListing(this.application, this.url!, this.isSearch, MyBidsListingUninitialized());}
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

  Future editMyBids()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editMyBids;
    editMyBids = await apiRepProvider?.getMyBidsEdit(url!, id!, title!);
    return editMyBids;
  }
  
    Future viewMyBids()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewMyBids;
    viewMyBids = await apiRepProvider?.getMyBidsView(url!, id!, title!);
    return viewMyBids;
  }

  Future postMyBids() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyBids;
    postMyBids = await apiRepProvider?.sendMyBidsPost(url!,formData);
    return postMyBids;
  }
  
    Future postMyBidsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyBids;
    postMyBids = await apiRepProvider?.sendMyBidsPostWithID(url!,formData, id!, title!);
    return postMyBids;
  }

  
  void listMyBidsShowConversation() async {
   listingShowConversation = new ShowConversationMyBidsListing(this.application!, this.url!, this.isSearch, ShowConversationMyBidsListingUninitialized());
  }
  
    Future editCancelBidMyBids()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editCancelBid;
    editCancelBid = await apiRepProvider?.getCancelBidMyBidsEdit(url!, id!, title!);
    return editCancelBid;
  }

  Future postCancelBidMyBids() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCancelBid;
    postCancelBid = await apiRepProvider?.sendCancelBidMyBidsPost(url!,formData);
    return postCancelBid;
  }
  
    Future postCancelBidMyBidsWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postCancelBid;
    postCancelBid = await apiRepProvider?.sendCancelBidMyBidsPostWithID(url!,formData, id!, title!);
    return postCancelBid;
  }
  
      Future getCancelBidMyBids(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getCancelBid;
        getCancelBid = await apiRepProvider?.getCancelBidMyBids(url!, id!, title!, spKey!);
	    return getCancelBid ;
	 }
   Future<CancelBidMyBidsModel> loadCancelBidMyBids() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadCancelBid;
        loadCancelBid = await apiRepProvider?.loadCancelBidMyBids('');
	    return loadCancelBid ;  
   }
  
   Future saveCancelBidMyBids(CancelBidMyBidsModel? my_bids, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateCancelBidMyBids(my_bids!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllCancelBidMyBids(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllCancelBidMyBids(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MyBidsListing extends Bloc<MyBidsEvent, MyBidsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MyBidsListing(this.application, this.url, this.isSearch, MyBidsState initialState):
  super(initialState){
     on<MyBidsList>(_MyBidsListEvent);
	
	  on<MyBidsListingRefresh>(_MyBidsListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MyBidsEvent, MyBidsState>> transformEvents(
      Stream<MyBidsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MyBidsEvent> transform<MyBidsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MyBidsEvent, MyBidsState> transition) {
    print(transition);
  }

  @override
  get initialState => MyBidsListingUninitialized();

void _MyBidsListEvent(MyBidsList event, Emitter<MyBidsState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MyBidsListingUninitialized){
			  if(isSearch!){
			     MyBidsListingModel? my_bids = await listingSearchMyBids(1);
				  int deltaPage;
				  if(my_bids?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_bids?.items.items.length ~/ (my_bids?.tools.paging.total_rows/my_bids?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_bids?.items.items.isEmpty
					  ? MyBidsListingLoaded(my_bids: my_bids!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyBidsListingLoaded(my_bids: my_bids!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MyBidsListingModel? my_bids = await listingMyBids(1);
				   int deltaPage;
				  if(my_bids?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_bids?.items.items.length ~/ (my_bids?.tools.paging.total_rows/my_bids?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_bids?.items.items.isEmpty
					  ? MyBidsListingLoaded(my_bids: my_bids!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyBidsListingLoaded(my_bids: my_bids!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MyBidsListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyBidsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyBidsListingLoaded).page! + 1;
			 if ((currentState as MyBidsListingLoaded).my_bids?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MyBidsListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MyBidsListingModel? my_bids = await listingSearchMyBids(page);
						  if(!my_bids?.items.items.isEmpty){
							 (currentState as MyBidsListingLoaded).my_bids?.items.items.addAll(my_bids?.items.items);
						  }
						  return emit ( my_bids?.items.items.isEmpty
							  ? (currentState as MyBidsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyBidsListingLoaded(  my_bids:  (currentState as MyBidsListingLoaded).my_bids! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MyBidsListingLoaded).page! + 1;
							  if ((currentState as MyBidsListingLoaded).my_bids?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MyBidsListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MyBidsListingModel? my_bids = await listingMyBids(page);
							  return emit ( my_bids?.items.items.isEmpty
								  ? (currentState as MyBidsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyBidsListingLoaded(  my_bids:  my_bids! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MyBidsListingError());
        
      }
    }
  }

void _MyBidsListingRefreshEvent(MyBidsListingRefresh event, Emitter<MyBidsState> emit)async{
  final currentState = state;
   try {
        if (currentState is MyBidsListingUninitialized) {
		   if(isSearch!){

			    MyBidsListingModel? my_bids = await listingSearchMyBids(1);
              return emit (  MyBidsListingLoaded( my_bids: my_bids!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MyBidsListingModel? my_bids = await listingMyBids(1);
				   return emit (  MyBidsListingLoaded( my_bids: my_bids!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MyBidsListingLoaded) {
		  if(isSearch!){
		     MyBidsListingModel? my_bids = await listingSearchRefreshMyBids();
              return emit (  my_bids?.items.items.isEmpty
              ? (currentState as MyBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyBidsListingLoaded(  my_bids: my_bids! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MyBidsListingModel? my_bids = await listingMyBids(1);
				  int deltaPage = my_bids?.items.items.length ~/ (my_bids?.tools.paging.total_rows/my_bids?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_bids?.items.items.isEmpty
					  ? (currentState as MyBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyBidsListingLoaded(my_bids: my_bids!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MyBidsListingError());
      }
  }

  @override

  Stream<MyBidsState> mapEventToState(MyBidsEvent event) async* {
    final currentState = state;
    if (event is MyBidsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MyBidsListingUninitialized){
			  if(isSearch!){
			     MyBidsListingModel? my_bids = await listingSearchMyBids(1);
				  int deltaPage;
				  if(my_bids?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_bids?.items.items.length ~/ (my_bids?.tools.paging.total_rows/my_bids?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_bids?.items.items.isEmpty
					  ? MyBidsListingLoaded(my_bids: my_bids!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyBidsListingLoaded(my_bids: my_bids!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MyBidsListingModel? my_bids = await listingMyBids(1);
				   int deltaPage;
				  if(my_bids?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_bids?.items.items.length ~/ (my_bids?.tools.paging.total_rows/my_bids?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_bids?.items.items.isEmpty
					  ? MyBidsListingLoaded(my_bids: my_bids!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyBidsListingLoaded(my_bids: my_bids!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MyBidsListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyBidsListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyBidsListingLoaded).page! + 1;
			 if ((currentState as MyBidsListingLoaded).my_bids?.tools.paging.total_pages == oldpage) {
					yield (currentState as MyBidsListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MyBidsListingModel? my_bids = await listingSearchMyBids(page);
						  if(!my_bids?.items.items.isEmpty){
							 (currentState as MyBidsListingLoaded).my_bids?.items.items.addAll(my_bids?.items.items);
						  }
						  yield my_bids?.items.items.isEmpty
							  ? (currentState as MyBidsListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyBidsListingLoaded(  my_bids:  (currentState as MyBidsListingLoaded).my_bids! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MyBidsListingLoaded).page! + 1;
							  if ((currentState as MyBidsListingLoaded).my_bids?.tools.paging.total_pages == oldpage) {
						yield (currentState as MyBidsListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MyBidsListingModel? my_bids = await listingMyBids(page);
							  yield my_bids?.items.items.isEmpty
								  ? (currentState as MyBidsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyBidsListingLoaded(  my_bids:  my_bids! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MyBidsListingError();
        
      }
    } else if (event is MyBidsListingRefresh){
      try {
        if (currentState is MyBidsListingUninitialized) {
		   if(isSearch!){

			    MyBidsListingModel? my_bids = await listingSearchMyBids(1);
              yield MyBidsListingLoaded( my_bids: my_bids!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MyBidsListingModel? my_bids = await listingMyBids(1);
				   yield MyBidsListingLoaded( my_bids: my_bids!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MyBidsListingLoaded) {
		  if(isSearch!){
		     MyBidsListingModel? my_bids = await listingSearchRefreshMyBids();
              yield my_bids?.items.items.isEmpty
              ? (currentState as MyBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyBidsListingLoaded(  my_bids: my_bids! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MyBidsListingModel? my_bids = await listingMyBids(1);
				  int deltaPage = my_bids?.items.items.length ~/ (my_bids?.tools.paging.total_rows/my_bids?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_bids?.items.items.isEmpty
					  ? (currentState as MyBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyBidsListingLoaded(my_bids: my_bids!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MyBidsListingError();
      }

    }
  }

  bool hasReachedMax(MyBidsState state) =>
      state is MyBidsListingLoaded && state.hasReachedMax!;

  Future<MyBidsListingModel?> listingMyBids(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyBidsList(url!, page!);
  }

  Future<MyBidsListingModel?> listingRefreshMyBids() async {
    MyBidsListingModel? my_bids;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMyBidsList();
    my_bids  = await apiRepProvider?.getMyBidsList(url!, 1);
    return my_bids;
  }
  
  

  Future<MyBidsListingModel?> listingSearchMyBids(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyBidsListSearch(url!, page!);
  }

  Future<MyBidsListingModel?> listingSearchRefreshMyBids() async {
    MyBidsListingModel? my_bids ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_bids  = await apiRepProvider?.getMyBidsListSearch(url!, 1);
    return my_bids;
  }
}


class ShowConversationMyBidsListing extends Bloc<ShowConversationMyBidsEvent, ShowConversationMyBidsState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  ShowConversationMyBidsListing(this.application, this.url, this.isSearch, ShowConversationMyBidsState initialState):
  super(initialState){
     on<ShowConversationMyBidsList>(_ShowConversationMyBidsListEvent);
	 on<ShowConversationMyBidsListingRefresh>(_ShowConversationMyBidsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<ShowConversationMyBidsEvent, ShowConversationMyBidsState>> transformEvents(
      Stream<ShowConversationMyBidsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
 */ 
     EventTransformer<ShowConversationMyBidsEvent> transform<ShowConversationMyBidsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<ShowConversationMyBidsEvent, ShowConversationMyBidsState> transition) {
    print(transition);
  }

  @override
  get initialState => ShowConversationMyBidsListingUninitialized();
  
  
  void _ShowConversationMyBidsListEvent(ShowConversationMyBidsList event, Emitter<ShowConversationMyBidsState> emit)async{
  final currentState = state;
    if (!hasReachedMax(currentState)) {
      try {
			 					if (currentState is ShowConversationMyBidsListingUninitialized){
						  if(isSearch!){
							 ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyBids(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									return emit ( show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage ));
                                  }else if(show_conversation?.tools.paging.total_pages > 1) {
								    if(show_conversation?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
											show_conversation1?.items.items.addAll(show_conversation?.items.items);
											var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
											return emit (  show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
												hasReachedMax: false,
												page: deltaPage ));
									  }else{
									
									       ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									      show_conversation1?.items.items.addAll(show_conversation?.items.items);
									      ShowConversationListingModel? show_conversation2 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 2);
											show_conversation2?.items.items.addAll(show_conversation1?.items.items);
											var deltaPage = show_conversation2?.tools.paging.total_pages - 2;
											return emit ( show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation2! ,
												hasReachedMax: false,
												page: deltaPage ));
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  return emit (  ShowConversationMyBidsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
						  }else{
							  ShowConversationListingModel? show_conversation = await listingShowConversationMyBids(1);
							  int deltaPage = show_conversation?.items.items.length ~/ (show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							        if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
								//	print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									return emit ( show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage ));

								  }else{
									var deltaPage = show_conversation?.tools.paging.total_pages;


									return emit (  show_conversation?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation! ,
										hasReachedMax: false,
										page: deltaPage ));
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  return emit (  ShowConversationMyBidsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
						  }
					}

					if (currentState is ShowConversationMyBidsListingLoaded) {
					  //page++;
					  final oldpage = (currentState as ShowConversationMyBidsListingLoaded).page;
						if(isSearch!){
							  final page = (currentState as ShowConversationMyBidsListingLoaded).page! - 1;
							  bool max = false;
							  if(oldpage == 1){
							  ShowConversationListingModel? show_conversation = await listingShowConversationMyBids(1);							
							  return emit ( show_conversation?.items.items.isEmpty 
								  ? (currentState as ShowConversationMyBidsListingLoaded).copyWith(hasReachedMax: true,
								  page: 1)                           
								  : ShowConversationMyBidsListingLoaded(  show_conversation:  (currentState as ShowConversationMyBidsListingLoaded).show_conversation! ,
														  hasReachedMax: false,
														  page: 1,));
							  }else{
							    ShowConversationListingModel? show_conversation = await listingShowConversationMyBids(page);
							 
							  if(!show_conversation?.items.items.isEmpty){
								 show_conversation?.items.items.addAll((currentState as ShowConversationMyBidsListingLoaded).show_conversation?.items.items);
							  }
							  return emit ( show_conversation?.items.items.isEmpty 
								  ? (currentState as ShowConversationMyBidsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ShowConversationMyBidsListingLoaded(  show_conversation:  show_conversation! ,
														  hasReachedMax: false,
														  page: page,));
							  }
							  
							
						}else{
					  
							  final page = (currentState as ShowConversationMyBidsListingLoaded).page! - 1;
							  if(oldpage == 1){
								  ShowConversationListingModel? show_conversation = await listingShowConversationMyBids(1);							
								  return emit ( show_conversation?.items.items.isEmpty 
									  ? (currentState as ShowConversationMyBidsListingLoaded).copyWith(hasReachedMax: true,
									  page: 1)                           
									  : ShowConversationMyBidsListingLoaded(  show_conversation:  (currentState as ShowConversationMyBidsListingLoaded).show_conversation! ,
															  hasReachedMax: false,
															  page: 1,));
								  }else{
									ShowConversationListingModel? show_conversation = await listingShowConversationMyBids(page);
								 
								  if(!show_conversation?.items.items.isEmpty){
									 show_conversation?.items.items.addAll((currentState as ShowConversationMyBidsListingLoaded).show_conversation?.items.items);
								  }
								  return emit ( show_conversation?.items.items.isEmpty 
									  ? (currentState as ShowConversationMyBidsListingLoaded).copyWith(hasReachedMax: true,
									  page: page)                           
									  : ShowConversationMyBidsListingLoaded(  show_conversation:  show_conversation! ,
															  hasReachedMax: false,
															  page: page,));
								  }
						}	  
					}
      } catch (_) {
        return emit ( ShowConversationMyBidsListingError());
      }
    }
  }
  
  void _ShowConversationMyBidsListingRefreshEvent(ShowConversationMyBidsListingRefresh event, Emitter<ShowConversationMyBidsState> emit)async{
  final currentState = state;
   try {
			       if (currentState is ShowConversationMyBidsListingUninitialized) {
					   if(isSearch!){
						  ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyBids(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								   if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									return emit ( show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage ));
                                  }else if(show_conversation?.tools.paging.total_pages > 1) {
								    if(show_conversation?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
											show_conversation1?.items.items.addAll(show_conversation?.items.items);
											var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
											return emit (  show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
												hasReachedMax: false,
												page: deltaPage ));
									  }else{
									
									       ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									      show_conversation1?.items.items.addAll(show_conversation?.items.items);
									      ShowConversationListingModel? show_conversation2 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 2);
											show_conversation2?.items.items.addAll(show_conversation1?.items.items);
											var deltaPage = show_conversation2?.tools.paging.total_pages - 2;
											return emit (  show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation2! ,
												hasReachedMax: false,
												page: deltaPage ));
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  return emit ( ShowConversationMyBidsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
					   }else{
						 ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyBids(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									return emit ( show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage ));

								  }else{
									var deltaPage = show_conversation?.tools.paging.total_pages;


									return emit ( show_conversation?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation! ,
										hasReachedMax: false,
										page: deltaPage ));
								  }
								}else{
								  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  return emit ( ShowConversationMyBidsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
					   }

					}

					if (currentState is ShowConversationMyBidsListingLoaded) {
					  if(isSearch!){
						
						  ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyBids(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								    if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									return emit ( show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage ));
                                  }else if(show_conversation?.tools.paging.total_pages > 1) {
								    if(show_conversation?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
											show_conversation1?.items.items.addAll(show_conversation?.items.items);
											var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
											return emit ( show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
												hasReachedMax: false,
												page: deltaPage ));
									  }else{
									
									       ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									      show_conversation1?.items.items.addAll(show_conversation?.items.items);
									      ShowConversationListingModel? show_conversation2 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 2);
											show_conversation2?.items.items.addAll(show_conversation1?.items.items);
											var deltaPage = show_conversation2?.tools.paging.total_pages - 2;
											return emit (  show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation2! ,
												hasReachedMax: false,
												page: deltaPage ));
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  return emit ( ShowConversationMyBidsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
					  }else{
						   ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyBids(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									return emit ( show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage ));

								  }else{
									var deltaPage = show_conversation?.tools.paging.total_pages;


									return emit ( show_conversation?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation! ,
										hasReachedMax: false,
										page: deltaPage ));
								  }
								}else{
								  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  return emit (  ShowConversationMyBidsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage));
                            }
					  }

					}
			  
      } catch (_) {
        return emit ( ShowConversationMyBidsListingError());
      }

  }

  @override

  Stream<ShowConversationMyBidsState> mapEventToState(ShowConversationMyBidsEvent event) async* {
  final currentState = state;
    if (event is ShowConversationMyBidsList && !hasReachedMax(currentState)) {
      try {
			 					if (currentState is ShowConversationMyBidsListingUninitialized){
						  if(isSearch!){
							 ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyBids(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									yield show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage );
                                  }else if(show_conversation?.tools.paging.total_pages > 1) {
								    if(show_conversation?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
											show_conversation1?.items.items.addAll(show_conversation?.items.items);
											var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
											yield show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
												hasReachedMax: false,
												page: deltaPage );
									  }else{
									
									       ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									      show_conversation1?.items.items.addAll(show_conversation?.items.items);
									      ShowConversationListingModel? show_conversation2 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 2);
											show_conversation2?.items.items.addAll(show_conversation1?.items.items);
											var deltaPage = show_conversation2?.tools.paging.total_pages - 2;
											yield show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation2! ,
												hasReachedMax: false,
												page: deltaPage );
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  yield ShowConversationMyBidsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
						  }else{
							  ShowConversationListingModel? show_conversation = await listingShowConversationMyBids(1);
							  int deltaPage = show_conversation?.items.items.length ~/ (show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							        if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
								//	print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									yield show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage );

								  }else{
									var deltaPage = show_conversation?.tools.paging.total_pages;


									yield show_conversation?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation! ,
										hasReachedMax: false,
										page: deltaPage );
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  yield ShowConversationMyBidsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
						  }
					}

					if (currentState is ShowConversationMyBidsListingLoaded) {
					  //page++;
					  final oldpage = (currentState as ShowConversationMyBidsListingLoaded).page;
						if(isSearch!){
							  final page = (currentState as ShowConversationMyBidsListingLoaded).page! - 1;
							  bool max = false;
							  if(oldpage == 1){
							  ShowConversationListingModel? show_conversation = await listingShowConversationMyBids(1);							
							  yield show_conversation?.items.items.isEmpty 
								  ? (currentState as ShowConversationMyBidsListingLoaded).copyWith(hasReachedMax: true,
								  page: 1)                           
								  : ShowConversationMyBidsListingLoaded(  show_conversation:  (currentState as ShowConversationMyBidsListingLoaded).show_conversation! ,
														  hasReachedMax: false,
														  page: 1,);
							  }else{
							    ShowConversationListingModel? show_conversation = await listingShowConversationMyBids(page);
							 
							  if(!show_conversation?.items.items.isEmpty){
								 show_conversation?.items.items.addAll((currentState as ShowConversationMyBidsListingLoaded).show_conversation?.items.items);
							  }
							  yield show_conversation?.items.items.isEmpty 
								  ? (currentState as ShowConversationMyBidsListingLoaded).copyWith(hasReachedMax: true,
								  page: page)                           
								  : ShowConversationMyBidsListingLoaded(  show_conversation:  show_conversation! ,
														  hasReachedMax: false,
														  page: page,);
							  }
							  
							
						}else{
					  
							  final page = (currentState as ShowConversationMyBidsListingLoaded).page! - 1;
							  if(oldpage == 1){
								  ShowConversationListingModel? show_conversation = await listingShowConversationMyBids(1);							
								  yield show_conversation?.items.items.isEmpty 
									  ? (currentState as ShowConversationMyBidsListingLoaded).copyWith(hasReachedMax: true,
									  page: 1)                           
									  : ShowConversationMyBidsListingLoaded(  show_conversation:  (currentState as ShowConversationMyBidsListingLoaded).show_conversation! ,
															  hasReachedMax: false,
															  page: 1,);
								  }else{
									ShowConversationListingModel? show_conversation = await listingShowConversationMyBids(page);
								 
								  if(!show_conversation?.items.items.isEmpty){
									 show_conversation?.items.items.addAll((currentState as ShowConversationMyBidsListingLoaded).show_conversation?.items.items);
								  }
								  yield show_conversation?.items.items.isEmpty 
									  ? (currentState as ShowConversationMyBidsListingLoaded).copyWith(hasReachedMax: true,
									  page: page)                           
									  : ShowConversationMyBidsListingLoaded(  show_conversation:  show_conversation! ,
															  hasReachedMax: false,
															  page: page,);
								  }
						}	  
					}
      } catch (_) {
        yield ShowConversationMyBidsListingError();
      }
    } else if (event is ShowConversationMyBidsListingRefresh){
      try {
			       if (currentState is ShowConversationMyBidsListingUninitialized) {
					   if(isSearch!){
						  ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyBids(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								   if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									yield show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage );
                                  }else if(show_conversation?.tools.paging.total_pages > 1) {
								    if(show_conversation?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
											show_conversation1?.items.items.addAll(show_conversation?.items.items);
											var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
											yield show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
												hasReachedMax: false,
												page: deltaPage );
									  }else{
									
									       ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									      show_conversation1?.items.items.addAll(show_conversation?.items.items);
									      ShowConversationListingModel? show_conversation2 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 2);
											show_conversation2?.items.items.addAll(show_conversation1?.items.items);
											var deltaPage = show_conversation2?.tools.paging.total_pages - 2;
											yield show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation2! ,
												hasReachedMax: false,
												page: deltaPage );
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  yield ShowConversationMyBidsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
					   }else{
						 ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyBids(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									yield show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage );

								  }else{
									var deltaPage = show_conversation?.tools.paging.total_pages;


									yield show_conversation?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation! ,
										hasReachedMax: false,
										page: deltaPage );
								  }
								}else{
								  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  yield ShowConversationMyBidsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
					   }

					}

					if (currentState is ShowConversationMyBidsListingLoaded) {
					  if(isSearch!){
						
						  ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyBids(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								    if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									//print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									yield show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage );
                                  }else if(show_conversation?.tools.paging.total_pages > 1) {
								    if(show_conversation?.tools.paging.total_pages == 2){
											//print('ampunnnnnnn');
											ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
											show_conversation1?.items.items.addAll(show_conversation?.items.items);
											var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
											yield show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
												hasReachedMax: false,
												page: deltaPage );
									  }else{
									
									       ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									      show_conversation1?.items.items.addAll(show_conversation?.items.items);
									      ShowConversationListingModel? show_conversation2 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 2);
											show_conversation2?.items.items.addAll(show_conversation1?.items.items);
											var deltaPage = show_conversation2?.tools.paging.total_pages - 2;
											yield show_conversation1?.items.items.isEmpty
												? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
												page: deltaPage)
												: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation2! ,
												hasReachedMax: false,
												page: deltaPage );
												
									
									
								       }
								  }
								}else{
								//  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  yield ShowConversationMyBidsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
					  }else{
						   ShowConversationListingModel? show_conversation = await listingSearchShowConversationMyBids(-1);
							  int deltaPage;
							  
							  if(show_conversation?.tools.paging.total_pages == 0){
								deltaPage = 0;
							  }else{
							   deltaPage = show_conversation?.items.items.length ~/(show_conversation?.tools.paging.total_rows/show_conversation?.tools.paging.total_pages).round();
							  }
							 
							  if (deltaPage < 1){
								deltaPage = 1;
							  }else{
								deltaPage = 1;
							  }
							     // print('ampunnnnnnn 123');
								  if(show_conversation?.tools.paging.total_pages != 1){
								  if(show_conversation?.tools.items.length < 7){
									print('ampunnnnnnn');
									ShowConversationListingModel? show_conversation1 = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages - 1);
									show_conversation1?.items.items.addAll(show_conversation?.items.items);
									var deltaPage = show_conversation1?.tools.paging.total_pages - 1;
									yield show_conversation1?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation1! ,
										hasReachedMax: false,
										page: deltaPage );

								  }else{
									var deltaPage = show_conversation?.tools.paging.total_pages;


									yield show_conversation?.items.items.isEmpty
										? (currentState as ShowConversationMyBidsListingLoaded).copyWith( hasReachedMax: false,
										page: deltaPage)
										: ShowConversationMyBidsListingLoaded(  show_conversation: show_conversation! ,
										hasReachedMax: false,
										page: deltaPage );
								  }
								}else{
								  print('ampunnnnnnn 123456');
								  if(show_conversation?.tools.paging.total_pages > 1){
									// show_conversation = await listingSearchShowConversationMyBids(show_conversation?.tools.paging.total_pages);
									deltaPage = show_conversation?.tools.paging.total_pages;
								  }
								  yield ShowConversationMyBidsListingLoaded(show_conversation: show_conversation!,
									  hasReachedMax: false,
									  page: deltaPage);
                            }
					  }

					}
			  
      } catch (_) {
        yield ShowConversationMyBidsListingError();
      }

    }
  }

  bool hasReachedMax(ShowConversationMyBidsState state) =>
      state is ShowConversationMyBidsListingLoaded && state.hasReachedMax!;

  Future<ShowConversationListingModel?> listingShowConversationMyBids(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getShowConversationMyBidsListSearch(url!, page!);
  }
  Future<ShowConversationListingModel?> listingRefreshShowConversationMyBids(int? page) async {
    ShowConversationListingModel? show_conversation;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    show_conversation  = await apiRepProvider?.getShowConversationMyBidsListSearch(url!, page!);
    return show_conversation;
  }
  Future<ShowConversationListingModel?> listingSearchShowConversationMyBids(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getShowConversationMyBidsListSearch(url!, page!);
  }

  Future<ShowConversationListingModel?> listingSearchRefreshShowConversationMyBids() async {
    ShowConversationListingModel? show_conversation ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    show_conversation  = await apiRepProvider?.getShowConversationMyBidsListSearch(url!, 1);
    return show_conversation;
  }
  
  
  
}




