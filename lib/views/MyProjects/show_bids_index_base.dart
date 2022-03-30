
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



class ShowBidsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ShowBidsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ShowBidsIndexBaseState createState() => ShowBidsIndexBaseState();
}

class  ShowBidsIndexBaseState extends State<ShowBidsIndexBase>{
  String title = 'ShowBids'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  ShowBidsListing? listing;

  ShowBidsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String bid_id = 'bid_id';
	 bid_id = bid_id.replaceAll('_id','');
     getPath = widget.url! + bid_id + 'page=%s';
	listing = new ShowBidsListing(AppProvider.getApplication(context), getPath, false, ShowBidsListingUninitialized());
    listing!.add(ShowBidsList());
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
    return BlocBuilder<ShowBidsListing, ShowBidsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is ShowBidsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is ShowBidsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is ShowBidsListingLoaded) {
          if (state.show_bids!.items.items.isEmpty) {
		  if (state.show_bids!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.show_bids!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.show_bids!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.show_bids!.items.items.length
									  ?  UserShowBidsListBottomLoader()
									  : state.show_bids!.viewItem (state.show_bids!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.show_bids!.items.items.length
									: state.show_bids!.items.items.length + 1,
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

								  return index >= state.show_bids!.items.items.length
									  ?  UserShowBidsListBottomLoader()
									  : state.show_bids!.viewItem (state.show_bids!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.show_bids!.items.items.length
									: state.show_bids!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.show_bids!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(ShowBidsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ShowBidsList());
    }

  }
}




abstract class ShowBidsEvent extends Equatable {
const ShowBidsEvent();
   @override
    List<Object> get props => [];
}

class ShowBidsList extends ShowBidsEvent {
  @override
  String toString() => 'ShowBidsList';
}

class ShowBidsListingRefresh extends ShowBidsEvent {
  @override
  String toString() => 'ShowBidsListingRefresh';
}

class ShowBidsListingChangeSearch extends ShowBidsEvent {
  @override
  String toString() => 'ShowBidsChangeSearch';
}


abstract class ShowBidsState extends Equatable {
  const ShowBidsState();
   @override
    List<Object> get props => [];
}

class ShowBidsListingUninitialized extends ShowBidsState {
  @override
  String toString() => 'ShowBidsListingUninitialized';
}

class ShowBidsListingError extends ShowBidsState {
  @override
  String toString() => 'ShowBidsListingError';
}

class ShowBidsListingLoaded extends ShowBidsState {
  final ShowBidsIndexModel? show_bids;
  final bool? hasReachedMax;
  final int?  page;

  ShowBidsListingLoaded({
    this.show_bids,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [show_bids!, hasReachedMax!, page!];
  
  ShowBidsListingLoaded copyWith({
    ShowBidsIndexModel? show_bids,
    bool? hasReachedMax,
    int? page,
  }) {
    return ShowBidsListingLoaded(
      show_bids: show_bids ?? this.show_bids,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ShowBidsListingLoaded  ShowBidsListing: ${ show_bids!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ShowBidsListing extends Bloc<ShowBidsEvent, ShowBidsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ShowBidsListing(this.application, this.url, this.isSearch, ShowBidsState initialState):
  super(initialState){
     on<ShowBidsList>(_ShowBidsListEvent);
	 on<ShowBidsListingRefresh>(_ShowBidsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ShowBidsEvent, ShowBidsState>> transformEvents(
      Stream<ShowBidsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<ShowBidsEvent> transform<ShowBidsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ShowBidsEvent, ShowBidsState> transition) {
    print(transition);
  }


  void _ShowBidsListEvent(ShowBidsList event, Emitter<ShowBidsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is ShowBidsListingUninitialized){
			  if(isSearch){
			     ShowBidsIndexModel show_bids = await listingSearchShowBids(1);
				  int deltaPage = show_bids.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (ShowBidsListingLoaded(show_bids: show_bids,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  ShowBidsIndexModel show_bids = await listingShowBids(1);
				  int deltaPage = show_bids.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (ShowBidsListingLoaded(show_bids: show_bids,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ShowBidsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ShowBidsListingLoaded).page! + 1;
				  ShowBidsIndexModel show_bids = await listingShowBids(page);
				  if(!show_bids.items.items.isEmpty){
				     (currentState as ShowBidsListingLoaded).show_bids!.items.items.addAll(show_bids.items.items);
				  }
				  return emit (show_bids.items.items.isEmpty
					  ? (currentState as ShowBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ShowBidsListingLoaded(  show_bids:  (currentState as ShowBidsListingLoaded).show_bids ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as ShowBidsListingLoaded).page! + 1;
				  ShowBidsIndexModel show_bids = await listingShowBids(page);
				  return emit ( show_bids.items.items.isEmpty
					  ? (currentState as ShowBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ShowBidsListingLoaded(  show_bids:  show_bids ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( ShowBidsListingError());
      }
    }
  }

  void _ShowBidsListingRefreshEvent(ShowBidsListingRefresh event, Emitter<ShowBidsState> emit)async{
  final currentState = state;
    try {
        if (currentState is ShowBidsListingUninitialized) {
		   if(isSearch){
		      ShowBidsIndexModel show_bids = await listingSearchShowBids(1);
              return emit (ShowBidsListingLoaded( show_bids: show_bids,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     ShowBidsIndexModel show_bids = await listingShowBids(1);
             return emit (ShowBidsListingLoaded( show_bids: show_bids,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is ShowBidsListingLoaded) {
		  if(isSearch){
		     ShowBidsIndexModel show_bids = await listingSearchRefreshShowBids();
              return emit ( show_bids.items.items.isEmpty
              ? (currentState as ShowBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowBidsListingLoaded(  show_bids: show_bids ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      ShowBidsIndexModel show_bids = await listingRefreshShowBids();
              return emit ( show_bids.items.items.isEmpty
              ? (currentState as ShowBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowBidsListingLoaded(  show_bids: show_bids ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ShowBidsListingError());
      }
  }

  @override
  get initialState => ShowBidsListingUninitialized();

  @override

  Stream<ShowBidsState> mapEventToState(ShowBidsEvent event) async* {
    final currentState = state;
    if (event is ShowBidsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ShowBidsListingUninitialized){
			  if(isSearch){
			     ShowBidsIndexModel show_bids = await listingSearchShowBids(1);
				  int deltaPage = show_bids.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ShowBidsListingLoaded(show_bids: show_bids,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ShowBidsIndexModel show_bids = await listingShowBids(1);
				  int deltaPage = show_bids.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ShowBidsListingLoaded(show_bids: show_bids,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ShowBidsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ShowBidsListingLoaded).page! + 1;
				  ShowBidsIndexModel show_bids = await listingShowBids(page);
				  if(!show_bids.items.items.isEmpty){
				     (currentState as ShowBidsListingLoaded).show_bids!.items.items.addAll(show_bids.items.items);
				  }
				  yield show_bids.items.items.isEmpty
					  ? (currentState as ShowBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ShowBidsListingLoaded(  show_bids:  (currentState as ShowBidsListingLoaded).show_bids ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as ShowBidsListingLoaded).page! + 1;
				  ShowBidsIndexModel show_bids = await listingShowBids(page);
				  yield show_bids.items.items.isEmpty
					  ? (currentState as ShowBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ShowBidsListingLoaded(  show_bids:  show_bids ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield ShowBidsListingError();
      }
    } else if (event is ShowBidsListingRefresh){
      try {
        if (currentState is ShowBidsListingUninitialized) {
		   if(isSearch){
		      ShowBidsIndexModel show_bids = await listingSearchShowBids(1);
              yield ShowBidsListingLoaded( show_bids: show_bids,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ShowBidsIndexModel show_bids = await listingShowBids(1);
             yield ShowBidsListingLoaded( show_bids: show_bids,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ShowBidsListingLoaded) {
		  if(isSearch){
		     ShowBidsIndexModel show_bids = await listingSearchRefreshShowBids();
              yield show_bids.items.items.isEmpty
              ? (currentState as ShowBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowBidsListingLoaded(  show_bids: show_bids ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ShowBidsIndexModel show_bids = await listingRefreshShowBids();
              yield show_bids.items.items.isEmpty
              ? (currentState as ShowBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowBidsListingLoaded(  show_bids: show_bids ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ShowBidsListingError();
      }

    }
  }



  bool hasReachedMax(ShowBidsState state) =>
      state is ShowBidsListingLoaded && state.hasReachedMax!;


  Future<ShowBidsIndexModel> listingShowBids(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ShowBidsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowBidsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ShowBidsIndexModel> listingRefreshShowBids() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ShowBidsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowBidsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ShowBidsIndexModel> listingSearchShowBids(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ShowBidsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowBidsListSearch(dt ,'',page);	
	return data;
  }

  Future<ShowBidsIndexModel> listingSearchRefreshShowBids() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ShowBidsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowBidsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ShowBidsIndexModel> _loadAndSaveShowBidsListSearch(ShowBidsIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.bid_id;
    }
    return list;
 }


class  UserShowBidsListBottomLoader extends StatelessWidget {
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








  

















  

