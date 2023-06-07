
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';
//////
class MyFinanceController {

  ProjectscoidApplication application;
  MyFinanceListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;

  MyFinanceController(this.application, this.url, this.action, this.id, this.title, this.formData, this.isSearch){
    switch (this.action?.index){
      case 0 : {listing = new MyFinanceListing(this.application, this.url!, this.isSearch, MyFinanceListingUninitialized());}
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

  Future editMyFinance()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editMyFinance;
    editMyFinance = await apiRepProvider?.getMyFinanceEdit(url!, id!, title!);
    return editMyFinance;
  }
  
    Future viewMyFinance()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var viewMyFinance;
    viewMyFinance = await apiRepProvider?.getMyFinanceView(url!, id!, title!);
    return viewMyFinance;
  }

  Future postMyFinance() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyFinance;
    postMyFinance = await apiRepProvider?.sendMyFinancePost(url!,formData);
    return postMyFinance;
  }
  
    Future postMyFinanceWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postMyFinance;
    postMyFinance = await apiRepProvider?.sendMyFinancePostWithID(url!,formData, id!, title!);
    return postMyFinance;
  }

  
  
    Future editChangePaymentSettingsMyFinance()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editChangePaymentSettings;
    editChangePaymentSettings = await apiRepProvider?.getChangePaymentSettingsMyFinanceEdit(url!, id!, title!);
    return editChangePaymentSettings;
  }

  Future postChangePaymentSettingsMyFinance() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postChangePaymentSettings;
    postChangePaymentSettings = await apiRepProvider?.sendChangePaymentSettingsMyFinancePost(url!,formData);
    return postChangePaymentSettings;
  }
  
    Future postChangePaymentSettingsMyFinanceWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postChangePaymentSettings;
    postChangePaymentSettings = await apiRepProvider?.sendChangePaymentSettingsMyFinancePostWithID(url!,formData, id!, title!);
    return postChangePaymentSettings;
  }
  
      Future getChangePaymentSettingsMyFinance(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getChangePaymentSettings;
        getChangePaymentSettings = await apiRepProvider?.getChangePaymentSettingsMyFinance(url!, id!, title!, spKey!);
	    return getChangePaymentSettings ;
	 }
   Future<ChangePaymentSettingsMyFinanceModel> loadChangePaymentSettingsMyFinance() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadChangePaymentSettings;
        loadChangePaymentSettings = await apiRepProvider?.loadChangePaymentSettingsMyFinance('');
	    return loadChangePaymentSettings ;  
   }
  
   Future saveChangePaymentSettingsMyFinance(ChangePaymentSettingsMyFinanceModel? my_finance, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateChangePaymentSettingsMyFinance(my_finance!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllChangePaymentSettingsMyFinance(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllChangePaymentSettingsMyFinance(spKey!);   
   }
  
  
  
    Future editWithdrawPaymentMyFinance()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editWithdrawPayment;
    editWithdrawPayment = await apiRepProvider?.getWithdrawPaymentMyFinanceEdit(url!, id!, title!);
    return editWithdrawPayment;
  }

  Future postWithdrawPaymentMyFinance() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postWithdrawPayment;
    postWithdrawPayment = await apiRepProvider?.sendWithdrawPaymentMyFinancePost(url!,formData);
    return postWithdrawPayment;
  }
  
    Future postWithdrawPaymentMyFinanceWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postWithdrawPayment;
    postWithdrawPayment = await apiRepProvider?.sendWithdrawPaymentMyFinancePostWithID(url!,formData, id!, title!);
    return postWithdrawPayment;
  }
  
      Future getWithdrawPaymentMyFinance(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getWithdrawPayment;
        getWithdrawPayment = await apiRepProvider?.getWithdrawPaymentMyFinance(url!, id!, title!, spKey!);
	    return getWithdrawPayment ;
	 }
   Future<WithdrawPaymentMyFinanceModel> loadWithdrawPaymentMyFinance() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadWithdrawPayment;
        loadWithdrawPayment = await apiRepProvider?.loadWithdrawPaymentMyFinance('');
	    return loadWithdrawPayment ;  
   }
  
   Future saveWithdrawPaymentMyFinance(WithdrawPaymentMyFinanceModel? my_finance, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateWithdrawPaymentMyFinance(my_finance!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllWithdrawPaymentMyFinance(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllWithdrawPaymentMyFinance(spKey!);   
   }
  
  
  
    Future editDepositBalanceMyFinance()async{
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var editDepositBalance;
    editDepositBalance = await apiRepProvider?.getDepositBalanceMyFinanceEdit(url!, id!, title!);
    return editDepositBalance;
  }

  Future postDepositBalanceMyFinance() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postDepositBalance;
    postDepositBalance = await apiRepProvider?.sendDepositBalanceMyFinancePost(url!,formData);
    return postDepositBalance;
  }
  
    Future postDepositBalanceMyFinanceWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postDepositBalance;
    postDepositBalance = await apiRepProvider?.sendDepositBalanceMyFinancePostWithID(url!,formData, id!, title!);
    return postDepositBalance;
  }
  
      Future getDepositBalanceMyFinance(String spKey)async{
  
        APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var getDepositBalance;
        getDepositBalance = await apiRepProvider?.getDepositBalanceMyFinance(url!, id!, title!, spKey!);
	    return getDepositBalance ;
	 }
   Future<DepositBalanceMyFinanceModel> loadDepositBalanceMyFinance() async{
   APIRepository? apiRepProvider = application?.projectsAPIRepository;
        var loadDepositBalance;
        loadDepositBalance = await apiRepProvider?.loadDepositBalanceMyFinance('');
	    return loadDepositBalance ;  
   }
  
   Future saveDepositBalanceMyFinance(DepositBalanceMyFinanceModel? my_finance, String? spKey) async{  
       APIRepository? apiRepProvider = application?.projectsAPIRepository;
      
       await apiRepProvider?.saveOrUpdateDepositBalanceMyFinance(my_finance!, spKey!, 1);
       
  }	
  
    Future<void> deleteAllDepositBalanceMyFinance(String? spKey) async{
	 APIRepository? apiRepProvider = application?.projectsAPIRepository;
       await apiRepProvider?.deleteAllDepositBalanceMyFinance(spKey!);   
   }
  
  

	Future <String> getHash()async{
	APIRepository? apiRepProvider = application?.projectsAPIRepository;
	var hash;
	hash = await  apiRepProvider?.getUserHash();  
	return hash;
	}

}

class MyFinanceListing extends Bloc<MyFinanceEvent, MyFinanceState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  MyFinanceListing(this.application, this.url, this.isSearch, MyFinanceState initialState):
  super(initialState){
     on<MyFinanceList>(_MyFinanceListEvent);
	
	  on<MyFinanceListingRefresh>(_MyFinanceListingRefreshEvent);
  }
  @override
  void dispose() {
   // super.dispose();
  }

  @override
  /*
  Stream<Transition<MyFinanceEvent, MyFinanceState>> transformEvents(
      Stream<MyFinanceEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
    EventTransformer<MyFinanceEvent> transform<MyFinanceEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  @override
  void onTransition(Transition<MyFinanceEvent, MyFinanceState> transition) {
    print(transition);
  }

  @override
  get initialState => MyFinanceListingUninitialized();

void _MyFinanceListEvent(MyFinanceList event, Emitter<MyFinanceState> emit)async{
  final currentState = state;
   if (!hasReachedMax(currentState)) {
      try {
        if (currentState is MyFinanceListingUninitialized){
			  if(isSearch!){
			     MyFinanceListingModel? my_finance = await listingSearchMyFinance(1);
				  int deltaPage;
				  if(my_finance?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_finance?.items.items.length ~/ (my_finance?.tools.paging.total_rows/my_finance?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_finance?.items.items.isEmpty
					  ? MyFinanceListingLoaded(my_finance: my_finance!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyFinanceListingLoaded(my_finance: my_finance!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  
				  MyFinanceListingModel? my_finance = await listingMyFinance(1);
				   int deltaPage;
				  if(my_finance?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_finance?.items.items.length ~/ (my_finance?.tools.paging.total_rows/my_finance?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit ( my_finance?.items.items.isEmpty
					  ? MyFinanceListingLoaded(my_finance: my_finance!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyFinanceListingLoaded(my_finance: my_finance!,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is MyFinanceListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyFinanceListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyFinanceListingLoaded).page! + 1;
			 if ((currentState as MyFinanceListingLoaded).my_finance?.tools.paging.total_pages == oldpage) {
					return emit ( (currentState as MyFinanceListingLoaded).copyWith(hasReachedMax: true,
						page: page));
                  }	else{  
				          
						      MyFinanceListingModel? my_finance = await listingSearchMyFinance(page);
						  if(!my_finance?.items.items.isEmpty){
							 (currentState as MyFinanceListingLoaded).my_finance?.items.items.addAll(my_finance?.items.items);
						  }
						  return emit ( my_finance?.items.items.isEmpty
							  ? (currentState as MyFinanceListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyFinanceListingLoaded(  my_finance:  (currentState as MyFinanceListingLoaded).my_finance! ,
													  hasReachedMax: false,
													  page: page,));
		        }									  
			}else{
					  final page = (currentState as MyFinanceListingLoaded).page! + 1;
							  if ((currentState as MyFinanceListingLoaded).my_finance?.tools.paging.total_pages == oldpage) {
						return emit ( (currentState as MyFinanceListingLoaded).copyWith(hasReachedMax: true,
							page: page));
					  }	else{  
							  MyFinanceListingModel? my_finance = await listingMyFinance(page);
							  return emit ( my_finance?.items.items.isEmpty
								  ? (currentState as MyFinanceListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyFinanceListingLoaded(  my_finance:  my_finance! ,
														  hasReachedMax: false,
														  page: page,));
					  }
									  
			}	  
        }
      } catch (_) {
				return emit ( MyFinanceListingError());
        
      }
    }
  }

void _MyFinanceListingRefreshEvent(MyFinanceListingRefresh event, Emitter<MyFinanceState> emit)async{
  final currentState = state;
   try {
        if (currentState is MyFinanceListingUninitialized) {
		   if(isSearch!){

			    MyFinanceListingModel? my_finance = await listingSearchMyFinance(1);
              return emit (  MyFinanceListingLoaded( my_finance: my_finance!,
                   hasReachedMax: false,
                   page: 1 ));
			 
		     
				   
		   }else{
				 
				    MyFinanceListingModel? my_finance = await listingMyFinance(1);
				   return emit (  MyFinanceListingLoaded( my_finance: my_finance!,
                   hasReachedMax: false,
                   page: 1 ));
				  
				 

		   }

        }

        if (currentState is MyFinanceListingLoaded) {
		  if(isSearch!){
		     MyFinanceListingModel? my_finance = await listingSearchRefreshMyFinance();
              return emit (  my_finance?.items.items.isEmpty
              ? (currentState as MyFinanceListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyFinanceListingLoaded(  my_finance: my_finance! ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
				  MyFinanceListingModel? my_finance = await listingMyFinance(1);
				  int deltaPage = my_finance?.items.items.length ~/ (my_finance?.tools.paging.total_rows/my_finance?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  return emit (  my_finance?.items.items.isEmpty
					  ? (currentState as MyFinanceListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyFinanceListingLoaded(my_finance: my_finance!,
					  hasReachedMax: false,
					  page: deltaPage));
			 
		  }

        }
      } catch (_) {
        return emit (  MyFinanceListingError());
      }
  }

  @override

  Stream<MyFinanceState> mapEventToState(MyFinanceEvent event) async* {
    final currentState = state;
    if (event is MyFinanceList && !hasReachedMax(currentState)) {
      try {
        if (currentState is MyFinanceListingUninitialized){
			  if(isSearch!){
			     MyFinanceListingModel? my_finance = await listingSearchMyFinance(1);
				  int deltaPage;
				  if(my_finance?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_finance?.items.items.length ~/ (my_finance?.tools.paging.total_rows/my_finance?.tools.paging.total_pages).round();
				  }
				  				
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_finance?.items.items.isEmpty
					  ? MyFinanceListingLoaded(my_finance: my_finance!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  : MyFinanceListingLoaded(my_finance: my_finance!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  
				  MyFinanceListingModel? my_finance = await listingMyFinance(1);
				   int deltaPage;
				  if(my_finance?.tools.paging.total_pages == 0){
				  deltaPage = 0;
				  }else
				  {
				   deltaPage =  my_finance?.items.items.length ~/ (my_finance?.tools.paging.total_rows/my_finance?.tools.paging.total_pages).round();
				  }
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_finance?.items.items.isEmpty
					  ? MyFinanceListingLoaded(my_finance: my_finance!,
					  hasReachedMax: true,
					  page: deltaPage)                           
					  :MyFinanceListingLoaded(my_finance: my_finance!,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is MyFinanceListingLoaded) {
          //page++;
		    final oldpage = (currentState as MyFinanceListingLoaded).page;
		  	if(isSearch!){
			  	  final page = (currentState as MyFinanceListingLoaded).page! + 1;
			 if ((currentState as MyFinanceListingLoaded).my_finance?.tools.paging.total_pages == oldpage) {
					yield (currentState as MyFinanceListingLoaded).copyWith(hasReachedMax: true,
						page: page);
                  }	else{  
				          
						      MyFinanceListingModel? my_finance = await listingSearchMyFinance(page);
						  if(!my_finance?.items.items.isEmpty){
							 (currentState as MyFinanceListingLoaded).my_finance?.items.items.addAll(my_finance?.items.items);
						  }
						  yield my_finance?.items.items.isEmpty
							  ? (currentState as MyFinanceListingLoaded).copyWith(hasReachedMax: true,
							  page: page)                           
							  : MyFinanceListingLoaded(  my_finance:  (currentState as MyFinanceListingLoaded).my_finance! ,
													  hasReachedMax: false,
													  page: page,);
		        }									  
			}else{
					  final page = (currentState as MyFinanceListingLoaded).page! + 1;
							  if ((currentState as MyFinanceListingLoaded).my_finance?.tools.paging.total_pages == oldpage) {
						yield (currentState as MyFinanceListingLoaded).copyWith(hasReachedMax: true,
							page: page);
					  }	else{  
							  MyFinanceListingModel? my_finance = await listingMyFinance(page);
							  yield my_finance?.items.items.isEmpty
								  ? (currentState as MyFinanceListingLoaded).copyWith(hasReachedMax: true,
								  page: page)
								  : MyFinanceListingLoaded(  my_finance:  my_finance! ,
														  hasReachedMax: false,
														  page: page,);
					  }
									  
			}	  
        }
      } catch (_) {
				yield MyFinanceListingError();
        
      }
    } else if (event is MyFinanceListingRefresh){
      try {
        if (currentState is MyFinanceListingUninitialized) {
		   if(isSearch!){

			    MyFinanceListingModel? my_finance = await listingSearchMyFinance(1);
              yield MyFinanceListingLoaded( my_finance: my_finance!,
                   hasReachedMax: false,
                   page: 1 );
			 
		     
				   
		   }else{
				 
				    MyFinanceListingModel? my_finance = await listingMyFinance(1);
				   yield MyFinanceListingLoaded( my_finance: my_finance!,
                   hasReachedMax: false,
                   page: 1 );
				  
				 

		   }

        }

        if (currentState is MyFinanceListingLoaded) {
		  if(isSearch!){
		     MyFinanceListingModel? my_finance = await listingSearchRefreshMyFinance();
              yield my_finance?.items.items.isEmpty
              ? (currentState as MyFinanceListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : MyFinanceListingLoaded(  my_finance: my_finance! ,
              hasReachedMax: false,
              page: 1 );
		  }else{
				  MyFinanceListingModel? my_finance = await listingMyFinance(1);
				  int deltaPage = my_finance?.items.items.length ~/ (my_finance?.tools.paging.total_rows/my_finance?.tools.paging.total_pages).round();
				  if (deltaPage < 1){
					deltaPage = 1;
				  }else{
				    deltaPage = 1;
				  }
				  yield my_finance?.items.items.isEmpty
					  ? (currentState as MyFinanceListingLoaded).copyWith(hasReachedMax: true,
					  page: deltaPage)                           
					  :MyFinanceListingLoaded(my_finance: my_finance!,
					  hasReachedMax: false,
					  page: deltaPage);
			 
		  }

        }
      } catch (_) {
        yield MyFinanceListingError();
      }

    }
  }

  bool hasReachedMax(MyFinanceState state) =>
      state is MyFinanceListingLoaded && state.hasReachedMax!;

  Future<MyFinanceListingModel?> listingMyFinance(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyFinanceList(url!, page!);
  }

  Future<MyFinanceListingModel?> listingRefreshMyFinance() async {
    MyFinanceListingModel? my_finance;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllMyFinanceList();
    my_finance  = await apiRepProvider?.getMyFinanceList(url!, 1);
    return my_finance;
  }
  
  

  Future<MyFinanceListingModel?> listingSearchMyFinance(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getMyFinanceListSearch(url!, page!);
  }

  Future<MyFinanceListingModel?> listingSearchRefreshMyFinance() async {
    MyFinanceListingModel? my_finance ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    my_finance  = await apiRepProvider?.getMyFinanceListSearch(url!, 1);
    return my_finance;
  }
}


