
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



class CreditHistoryIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  CreditHistoryIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  CreditHistoryIndexBaseState createState() => CreditHistoryIndexBaseState();
}

class  CreditHistoryIndexBaseState extends State<CreditHistoryIndexBase>{
  String title = 'CreditHistory'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  CreditHistoryListing? listing;

  CreditHistoryIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String credit_id = 'credit_id';
	 credit_id = credit_id.replaceAll('_id','');
     getPath = widget.url! + credit_id + 'page=%s';
	listing = new CreditHistoryListing(AppProvider.getApplication(context), getPath, false, CreditHistoryListingUninitialized());
    listing!.add(CreditHistoryList());
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
    return BlocBuilder<CreditHistoryListing, CreditHistoryState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is CreditHistoryListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is CreditHistoryListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is CreditHistoryListingLoaded) {
          if (state.credit_history!.items.items.isEmpty) {
		  if (state.credit_history!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.credit_history!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.credit_history!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.credit_history!.items.items.length
									  ?  UserCreditHistoryListBottomLoader()
									  : state.credit_history!.viewItem (state.credit_history!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.credit_history!.items.items.length
									: state.credit_history!.items.items.length + 1,
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

								  return index >= state.credit_history!.items.items.length
									  ?  UserCreditHistoryListBottomLoader()
									  : state.credit_history!.viewItem (state.credit_history!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.credit_history!.items.items.length
									: state.credit_history!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.credit_history!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(CreditHistoryListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(CreditHistoryList());
    }

  }
}




abstract class CreditHistoryEvent extends Equatable {
const CreditHistoryEvent();
   @override
    List<Object> get props => [];
}

class CreditHistoryList extends CreditHistoryEvent {
  @override
  String toString() => 'CreditHistoryList';
}

class CreditHistoryListingRefresh extends CreditHistoryEvent {
  @override
  String toString() => 'CreditHistoryListingRefresh';
}

class CreditHistoryListingChangeSearch extends CreditHistoryEvent {
  @override
  String toString() => 'CreditHistoryChangeSearch';
}


abstract class CreditHistoryState extends Equatable {
  const CreditHistoryState();
   @override
    List<Object> get props => [];
}

class CreditHistoryListingUninitialized extends CreditHistoryState {
  @override
  String toString() => 'CreditHistoryListingUninitialized';
}

class CreditHistoryListingError extends CreditHistoryState {
  @override
  String toString() => 'CreditHistoryListingError';
}

class CreditHistoryListingLoaded extends CreditHistoryState {
  final CreditHistoryIndexModel? credit_history;
  final bool? hasReachedMax;
  final int?  page;

  CreditHistoryListingLoaded({
    this.credit_history,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [credit_history!, hasReachedMax!, page!];
  
  CreditHistoryListingLoaded copyWith({
    CreditHistoryIndexModel? credit_history,
    bool? hasReachedMax,
    int? page,
  }) {
    return CreditHistoryListingLoaded(
      credit_history: credit_history ?? this.credit_history,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'CreditHistoryListingLoaded  CreditHistoryListing: ${ credit_history!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class CreditHistoryListing extends Bloc<CreditHistoryEvent, CreditHistoryState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  CreditHistoryListing(this.application, this.url, this.isSearch, CreditHistoryState initialState):
  super(initialState){
     on<CreditHistoryList>(_CreditHistoryListEvent);
	 on<CreditHistoryListingRefresh>(_CreditHistoryListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<CreditHistoryEvent, CreditHistoryState>> transformEvents(
      Stream<CreditHistoryEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<CreditHistoryEvent> transform<CreditHistoryEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<CreditHistoryEvent, CreditHistoryState> transition) {
    print(transition);
  }


  void _CreditHistoryListEvent(CreditHistoryList event, Emitter<CreditHistoryState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is CreditHistoryListingUninitialized){
			  if(isSearch){
			     CreditHistoryIndexModel credit_history = await listingSearchCreditHistory(1);
				  int deltaPage = credit_history.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (CreditHistoryListingLoaded(credit_history: credit_history,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  CreditHistoryIndexModel credit_history = await listingCreditHistory(1);
				  int deltaPage = credit_history.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (CreditHistoryListingLoaded(credit_history: credit_history,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is CreditHistoryListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as CreditHistoryListingLoaded).page! + 1;
				  CreditHistoryIndexModel credit_history = await listingCreditHistory(page);
				  if(!credit_history.items.items.isEmpty){
				     (currentState as CreditHistoryListingLoaded).credit_history!.items.items.addAll(credit_history.items.items);
				  }
				  return emit (credit_history.items.items.isEmpty
					  ? (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : CreditHistoryListingLoaded(  credit_history:  (currentState as CreditHistoryListingLoaded).credit_history ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as CreditHistoryListingLoaded).page! + 1;
				  CreditHistoryIndexModel credit_history = await listingCreditHistory(page);
				  return emit ( credit_history.items.items.isEmpty
					  ? (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : CreditHistoryListingLoaded(  credit_history:  credit_history ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( CreditHistoryListingError());
      }
    }
  }

  void _CreditHistoryListingRefreshEvent(CreditHistoryListingRefresh event, Emitter<CreditHistoryState> emit)async{
  final currentState = state;
    try {
        if (currentState is CreditHistoryListingUninitialized) {
		   if(isSearch){
		      CreditHistoryIndexModel credit_history = await listingSearchCreditHistory(1);
              return emit (CreditHistoryListingLoaded( credit_history: credit_history,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     CreditHistoryIndexModel credit_history = await listingCreditHistory(1);
             return emit (CreditHistoryListingLoaded( credit_history: credit_history,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is CreditHistoryListingLoaded) {
		  if(isSearch){
		     CreditHistoryIndexModel credit_history = await listingSearchRefreshCreditHistory();
              return emit ( credit_history.items.items.isEmpty
              ? (currentState as CreditHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CreditHistoryListingLoaded(  credit_history: credit_history ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      CreditHistoryIndexModel credit_history = await listingRefreshCreditHistory();
              return emit ( credit_history.items.items.isEmpty
              ? (currentState as CreditHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CreditHistoryListingLoaded(  credit_history: credit_history ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (CreditHistoryListingError());
      }
  }

  @override
  get initialState => CreditHistoryListingUninitialized();

  @override

  Stream<CreditHistoryState> mapEventToState(CreditHistoryEvent event) async* {
    final currentState = state;
    if (event is CreditHistoryList && !hasReachedMax(currentState)) {
      try {
        if (currentState is CreditHistoryListingUninitialized){
			  if(isSearch){
			     CreditHistoryIndexModel credit_history = await listingSearchCreditHistory(1);
				  int deltaPage = credit_history.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield CreditHistoryListingLoaded(credit_history: credit_history,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  CreditHistoryIndexModel credit_history = await listingCreditHistory(1);
				  int deltaPage = credit_history.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield CreditHistoryListingLoaded(credit_history: credit_history,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is CreditHistoryListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as CreditHistoryListingLoaded).page! + 1;
				  CreditHistoryIndexModel credit_history = await listingCreditHistory(page);
				  if(!credit_history.items.items.isEmpty){
				     (currentState as CreditHistoryListingLoaded).credit_history!.items.items.addAll(credit_history.items.items);
				  }
				  yield credit_history.items.items.isEmpty
					  ? (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : CreditHistoryListingLoaded(  credit_history:  (currentState as CreditHistoryListingLoaded).credit_history ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as CreditHistoryListingLoaded).page! + 1;
				  CreditHistoryIndexModel credit_history = await listingCreditHistory(page);
				  yield credit_history.items.items.isEmpty
					  ? (currentState as CreditHistoryListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : CreditHistoryListingLoaded(  credit_history:  credit_history ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield CreditHistoryListingError();
      }
    } else if (event is CreditHistoryListingRefresh){
      try {
        if (currentState is CreditHistoryListingUninitialized) {
		   if(isSearch){
		      CreditHistoryIndexModel credit_history = await listingSearchCreditHistory(1);
              yield CreditHistoryListingLoaded( credit_history: credit_history,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     CreditHistoryIndexModel credit_history = await listingCreditHistory(1);
             yield CreditHistoryListingLoaded( credit_history: credit_history,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is CreditHistoryListingLoaded) {
		  if(isSearch){
		     CreditHistoryIndexModel credit_history = await listingSearchRefreshCreditHistory();
              yield credit_history.items.items.isEmpty
              ? (currentState as CreditHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CreditHistoryListingLoaded(  credit_history: credit_history ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      CreditHistoryIndexModel credit_history = await listingRefreshCreditHistory();
              yield credit_history.items.items.isEmpty
              ? (currentState as CreditHistoryListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CreditHistoryListingLoaded(  credit_history: credit_history ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield CreditHistoryListingError();
      }

    }
  }



  bool hasReachedMax(CreditHistoryState state) =>
      state is CreditHistoryListingLoaded && state.hasReachedMax!;


  Future<CreditHistoryIndexModel> listingCreditHistory(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = CreditHistoryIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCreditHistoryListSearch(dt ,'',page);
	
	return data;
  }

  Future<CreditHistoryIndexModel> listingRefreshCreditHistory() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = CreditHistoryIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCreditHistoryListSearch(dt ,'',page);
	
	return data;
  }

  Future<CreditHistoryIndexModel> listingSearchCreditHistory(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = CreditHistoryIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCreditHistoryListSearch(dt ,'',page);	
	return data;
  }

  Future<CreditHistoryIndexModel> listingSearchRefreshCreditHistory() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = CreditHistoryIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCreditHistoryListSearch(dt ,'',page);
	
	return data;
  }
}


Future<CreditHistoryIndexModel> _loadAndSaveCreditHistoryListSearch(CreditHistoryIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.credit_id;
    }
    return list;
 }


class  UserCreditHistoryListBottomLoader extends StatelessWidget {
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








  

















  

