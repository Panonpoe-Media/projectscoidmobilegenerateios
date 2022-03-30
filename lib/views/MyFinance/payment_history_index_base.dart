
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectscoid/core/AppProvider.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'package:projectscoid/core/components/helpers/color_helpers.dart';
import 'package:projectscoid/controllers/controllers.dart';
import 'package:projectscoid/views/components/index.dart';
//import 'package:projectscoid/i18n/projectscoid_strings.dart';
import 'package:projectscoid/app/Env.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:projectscoid/models/model.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sprintf/sprintf.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/repository/repository.dart';



class PaymentHistoryIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PaymentHistoryIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PaymentHistoryIndexBaseState createState() => PaymentHistoryIndexBaseState();
}

class  PaymentHistoryIndexBaseState extends State<PaymentHistoryIndexBase>{
  String title = 'PaymentHistory'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  PaymentHistoryListing? listing;

  PaymentHistoryIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String payment_id = 'payment_id';
	 payment_id = payment_id.replaceAll('_id','');
     getPath = widget.url! + payment_id + 'page=%s';
	listing = new PaymentHistoryListing(AppProvider.getApplication(context), getPath, false, PaymentHistoryListingUninitialized());
    listing!.add(PaymentHistoryList());
    return Scaffold(
        appBar: null,
        body: buildListingBar()
    );
  }

  void _onChanged(String value) {
    setState(() {
      searchText = value;
    });
  }


  Widget buildSearchBar(String tiltle){
    return Container(
      // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0),
        //alignment: Alignment.topCenter,
        height: 40.0,
        child: TextField(
          controller: searchBoxController,
            style: new TextStyle(
                fontSize: 14.0,
                height: 0.2,
                color: Colors.black
            ),
          onChanged: (String value) {
            _onChanged(value);
          },
          decoration: InputDecoration(
            fillColor: CurrentTheme.BackgroundColor,
            filled: true,

          //  hasFloatingPlaceholder: false,
            suffixIcon:
            IconButton(
              icon:Icon(Icons.clear),
              onPressed: () {
                searchBoxController.clear();
                setState(() {
                  searchText = '';
                  selected = false;
                });
              },
            ) ,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)) , gapPadding: 20.0),
          ),
        )
    );
  }


   // @override
  Widget buildListingBar(){
    return BlocBuilder<PaymentHistoryListing, PaymentHistoryState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is PaymentHistoryListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is PaymentHistoryListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is PaymentHistoryListingLoaded) {
          if (state.payment_history!.items.items.isEmpty) {
		  if (state.payment_history!.tools.buttons.length == 0){ 
            return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title),
                  ),
              );
			  }else{
			  return
              Scaffold(
                  body:
                  Center(
                    child: Text('no ' + title),
                  ),
                 floatingActionButton: state.payment_history!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.payment_history!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.payment_history!.items.items.length
									  ?  UserPaymentHistoryListBottomLoader()
									  : state.payment_history!.viewItem (state.payment_history!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.payment_history!.items.items.length
									: state.payment_history!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							)
				);					
			}
          return
		  Scaffold(
                    body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.payment_history!.items.items.length
									  ?  UserPaymentHistoryListBottomLoader()
									  : state.payment_history!.viewItem (state.payment_history!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.payment_history!.items.items.length
									: state.payment_history!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.payment_history!.Buttons(context, _dialVisible)
							
                   
			 );
        }
		
		return new Container(width: 0.0, height: 0.0);
      },
    );
  }

  @override
  void dispose() {
    listing!.dispose();
    super.dispose();
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer<Null>();
    listing!.add(PaymentHistoryListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PaymentHistoryList());
    }

  }
}




abstract class PaymentHistoryEvent extends Equatable {
const PaymentHistoryEvent();
   @override
    List<Object> get props => [];
}

class PaymentHistoryList extends PaymentHistoryEvent {
  @override
  String toString() => 'PaymentHistoryList';
}

class PaymentHistoryListingRefresh extends PaymentHistoryEvent {
  @override
  String toString() => 'PaymentHistoryListingRefresh';
}

class PaymentHistoryListingChangeSearch extends PaymentHistoryEvent {
  @override
  String toString() => 'PaymentHistoryChangeSearch';
}


abstract class PaymentHistoryState extends Equatable {
  const PaymentHistoryState();
   @override
    List<Object> get props => [];
}

class PaymentHistoryListingUninitialized extends PaymentHistoryState {
  @override
  String toString() => 'PaymentHistoryListingUninitialized';
}

class PaymentHistoryListingError extends PaymentHistoryState {
  @override
  String toString() => 'PaymentHistoryListingError';
}

class PaymentHistoryListingLoaded extends PaymentHistoryState {
  final PaymentHistoryIndexModel? payment_history;
  final bool? hasReachedMax;
  final int?  page;

  PaymentHistoryListingLoaded({
    this.payment_history,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [payment_history!, hasReachedMax!, page!];
  
  PaymentHistoryListingLoaded copyWith({
    PaymentHistoryIndexModel? payment_history,
    bool? hasReachedMax,
    int? page,
  }) {
    return PaymentHistoryListingLoaded(
      payment_history: payment_history ?? this.payment_history,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PaymentHistoryListingLoaded  PaymentHistoryListing: ${ payment_history!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PaymentHistoryListing extends Bloc<PaymentHistoryEvent, PaymentHistoryState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PaymentHistoryListing(this.application, this.url, this.isSearch, PaymentHistoryState initialState):
  super(initialState){
     on<PaymentHistoryList>(_PaymentHistoryListEvent);
	 on<PaymentHistoryListingRefresh>(_PaymentHistoryListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PaymentHistoryEvent, PaymentHistoryState>> transformEvents(
      Stream<PaymentHistoryEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<PaymentHistoryEvent> transform<PaymentHistoryEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PaymentHistoryEvent, PaymentHistoryState> transition) {
    print(transition);
  }


  void _PaymentHistoryListEvent(PaymentHistoryList event, Emitter<PaymentHistoryState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is PaymentHistoryListingUninitialized){
			  if(isSearch){
			     PaymentHistoryIndexModel payment_history = await listingSearchPaymentHistory(1);
				  int deltaPage = payment_history.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (PaymentHistoryListingLoaded(payment_history: payment_history,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  PaymentHistoryIndexModel payment_history = await listingPaymentHistory(1);
				  int deltaPage = payment_history.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (PaymentHistoryListingLoaded(payment_history: payment_history,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is PaymentHistoryListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PaymentHistoryListingLoaded).page! + 1;
				  PaymentHistoryIndexModel payment_history = await listingPaymentHistory(page);
				  if(!payment_history.items.items.isEmpty){
				     (currentState as PaymentHistoryListingLoaded).payment_history!.items.items.addAll(payment_history.items.items);
				  }
				  return emit (payment_history.items.items.isEmpty
					  ? (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PaymentHistoryListingLoaded(  payment_history:  (currentState as PaymentHistoryListingLoaded).payment_history ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as PaymentHistoryListingLoaded).page! + 1;
				  PaymentHistoryIndexModel payment_history = await listingPaymentHistory(page);
				  return emit ( payment_history.items.items.isEmpty
					  ? (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PaymentHistoryListingLoaded(  payment_history:  payment_history ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( PaymentHistoryListingError());
      }
    }
  }

  void _PaymentHistoryListingRefreshEvent(PaymentHistoryListingRefresh event, Emitter<PaymentHistoryState> emit)async{
  final currentState = state;
    try {
        if (currentState is PaymentHistoryListingUninitialized) {
		   if(isSearch){
		      PaymentHistoryIndexModel payment_history = await listingSearchPaymentHistory(1);
              return emit (PaymentHistoryListingLoaded( payment_history: payment_history,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     PaymentHistoryIndexModel payment_history = await listingPaymentHistory(1);
             return emit (PaymentHistoryListingLoaded( payment_history: payment_history,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is PaymentHistoryListingLoaded) {
		  if(isSearch){
		     PaymentHistoryIndexModel payment_history = await listingSearchRefreshPaymentHistory();
              return emit ( payment_history.items.items.isEmpty
              ? (currentState as PaymentHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PaymentHistoryListingLoaded(  payment_history: payment_history ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      PaymentHistoryIndexModel payment_history = await listingRefreshPaymentHistory();
              return emit ( payment_history.items.items.isEmpty
              ? (currentState as PaymentHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PaymentHistoryListingLoaded(  payment_history: payment_history ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PaymentHistoryListingError());
      }
  }

  @override
  get initialState => PaymentHistoryListingUninitialized();

  @override

  Stream<PaymentHistoryState> mapEventToState(PaymentHistoryEvent event) async* {
    final currentState = state;
    if (event is PaymentHistoryList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PaymentHistoryListingUninitialized){
			  if(isSearch){
			     PaymentHistoryIndexModel payment_history = await listingSearchPaymentHistory(1);
				  int deltaPage = payment_history.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PaymentHistoryListingLoaded(payment_history: payment_history,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  PaymentHistoryIndexModel payment_history = await listingPaymentHistory(1);
				  int deltaPage = payment_history.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PaymentHistoryListingLoaded(payment_history: payment_history,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is PaymentHistoryListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PaymentHistoryListingLoaded).page! + 1;
				  PaymentHistoryIndexModel payment_history = await listingPaymentHistory(page);
				  if(!payment_history.items.items.isEmpty){
				     (currentState as PaymentHistoryListingLoaded).payment_history!.items.items.addAll(payment_history.items.items);
				  }
				  yield payment_history.items.items.isEmpty
					  ? (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PaymentHistoryListingLoaded(  payment_history:  (currentState as PaymentHistoryListingLoaded).payment_history ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as PaymentHistoryListingLoaded).page! + 1;
				  PaymentHistoryIndexModel payment_history = await listingPaymentHistory(page);
				  yield payment_history.items.items.isEmpty
					  ? (currentState as PaymentHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PaymentHistoryListingLoaded(  payment_history:  payment_history ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield PaymentHistoryListingError();
      }
    } else if (event is PaymentHistoryListingRefresh){
      try {
        if (currentState is PaymentHistoryListingUninitialized) {
		   if(isSearch){
		      PaymentHistoryIndexModel payment_history = await listingSearchPaymentHistory(1);
              yield PaymentHistoryListingLoaded( payment_history: payment_history,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     PaymentHistoryIndexModel payment_history = await listingPaymentHistory(1);
             yield PaymentHistoryListingLoaded( payment_history: payment_history,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is PaymentHistoryListingLoaded) {
		  if(isSearch){
		     PaymentHistoryIndexModel payment_history = await listingSearchRefreshPaymentHistory();
              yield payment_history.items.items.isEmpty
              ? (currentState as PaymentHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PaymentHistoryListingLoaded(  payment_history: payment_history ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      PaymentHistoryIndexModel payment_history = await listingRefreshPaymentHistory();
              yield payment_history.items.items.isEmpty
              ? (currentState as PaymentHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PaymentHistoryListingLoaded(  payment_history: payment_history ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PaymentHistoryListingError();
      }

    }
  }



  bool hasReachedMax(PaymentHistoryState state) =>
      state is PaymentHistoryListingLoaded && state.hasReachedMax!;


  Future<PaymentHistoryIndexModel> listingPaymentHistory(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = PaymentHistoryIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePaymentHistoryListSearch(dt ,'',page);
	
	return data;
  }

  Future<PaymentHistoryIndexModel> listingRefreshPaymentHistory() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PaymentHistoryIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePaymentHistoryListSearch(dt ,'',page);
	
	return data;
  }

  Future<PaymentHistoryIndexModel> listingSearchPaymentHistory(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = PaymentHistoryIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePaymentHistoryListSearch(dt ,'',page);	
	return data;
  }

  Future<PaymentHistoryIndexModel> listingSearchRefreshPaymentHistory() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PaymentHistoryIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePaymentHistoryListSearch(dt ,'',page);
	
	return data;
  }
}


Future<PaymentHistoryIndexModel> _loadAndSavePaymentHistoryListSearch(PaymentHistoryIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.payment_id;
    }
    return list;
 }


class  UserPaymentHistoryListBottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}








  

















  

