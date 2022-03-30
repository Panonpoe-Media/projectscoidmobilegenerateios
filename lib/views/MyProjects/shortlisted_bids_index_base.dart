
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



class ShortlistedBidsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ShortlistedBidsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ShortlistedBidsIndexBaseState createState() => ShortlistedBidsIndexBaseState();
}

class  ShortlistedBidsIndexBaseState extends State<ShortlistedBidsIndexBase>{
  String title = 'ShortlistedBids'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  ShortlistedBidsListing? listing;

  ShortlistedBidsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String bid_id = 'bid_id';
	 bid_id = bid_id.replaceAll('_id','');
     getPath = widget.url! + bid_id + 'page=%s';
	listing = new ShortlistedBidsListing(AppProvider.getApplication(context), getPath, false, ShortlistedBidsListingUninitialized());
    listing!.add(ShortlistedBidsList());
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
    return BlocBuilder<ShortlistedBidsListing, ShortlistedBidsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is ShortlistedBidsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is ShortlistedBidsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is ShortlistedBidsListingLoaded) {
          if (state.shortlisted_bids!.items.items.isEmpty) {
		  if (state.shortlisted_bids!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.shortlisted_bids!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.shortlisted_bids!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.shortlisted_bids!.items.items.length
									  ?  UserShortlistedBidsListBottomLoader()
									  : state.shortlisted_bids!.viewItem (state.shortlisted_bids!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.shortlisted_bids!.items.items.length
									: state.shortlisted_bids!.items.items.length + 1,
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

								  return index >= state.shortlisted_bids!.items.items.length
									  ?  UserShortlistedBidsListBottomLoader()
									  : state.shortlisted_bids!.viewItem (state.shortlisted_bids!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.shortlisted_bids!.items.items.length
									: state.shortlisted_bids!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.shortlisted_bids!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(ShortlistedBidsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ShortlistedBidsList());
    }

  }
}




abstract class ShortlistedBidsEvent extends Equatable {
const ShortlistedBidsEvent();
   @override
    List<Object> get props => [];
}

class ShortlistedBidsList extends ShortlistedBidsEvent {
  @override
  String toString() => 'ShortlistedBidsList';
}

class ShortlistedBidsListingRefresh extends ShortlistedBidsEvent {
  @override
  String toString() => 'ShortlistedBidsListingRefresh';
}

class ShortlistedBidsListingChangeSearch extends ShortlistedBidsEvent {
  @override
  String toString() => 'ShortlistedBidsChangeSearch';
}


abstract class ShortlistedBidsState extends Equatable {
  const ShortlistedBidsState();
   @override
    List<Object> get props => [];
}

class ShortlistedBidsListingUninitialized extends ShortlistedBidsState {
  @override
  String toString() => 'ShortlistedBidsListingUninitialized';
}

class ShortlistedBidsListingError extends ShortlistedBidsState {
  @override
  String toString() => 'ShortlistedBidsListingError';
}

class ShortlistedBidsListingLoaded extends ShortlistedBidsState {
  final ShortlistedBidsIndexModel? shortlisted_bids;
  final bool? hasReachedMax;
  final int?  page;

  ShortlistedBidsListingLoaded({
    this.shortlisted_bids,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [shortlisted_bids!, hasReachedMax!, page!];
  
  ShortlistedBidsListingLoaded copyWith({
    ShortlistedBidsIndexModel? shortlisted_bids,
    bool? hasReachedMax,
    int? page,
  }) {
    return ShortlistedBidsListingLoaded(
      shortlisted_bids: shortlisted_bids ?? this.shortlisted_bids,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ShortlistedBidsListingLoaded  ShortlistedBidsListing: ${ shortlisted_bids!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ShortlistedBidsListing extends Bloc<ShortlistedBidsEvent, ShortlistedBidsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ShortlistedBidsListing(this.application, this.url, this.isSearch, ShortlistedBidsState initialState):
  super(initialState){
     on<ShortlistedBidsList>(_ShortlistedBidsListEvent);
	 on<ShortlistedBidsListingRefresh>(_ShortlistedBidsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ShortlistedBidsEvent, ShortlistedBidsState>> transformEvents(
      Stream<ShortlistedBidsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<ShortlistedBidsEvent> transform<ShortlistedBidsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ShortlistedBidsEvent, ShortlistedBidsState> transition) {
    print(transition);
  }


  void _ShortlistedBidsListEvent(ShortlistedBidsList event, Emitter<ShortlistedBidsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is ShortlistedBidsListingUninitialized){
			  if(isSearch){
			     ShortlistedBidsIndexModel shortlisted_bids = await listingSearchShortlistedBids(1);
				  int deltaPage = shortlisted_bids.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (ShortlistedBidsListingLoaded(shortlisted_bids: shortlisted_bids,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  ShortlistedBidsIndexModel shortlisted_bids = await listingShortlistedBids(1);
				  int deltaPage = shortlisted_bids.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (ShortlistedBidsListingLoaded(shortlisted_bids: shortlisted_bids,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ShortlistedBidsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ShortlistedBidsListingLoaded).page! + 1;
				  ShortlistedBidsIndexModel shortlisted_bids = await listingShortlistedBids(page);
				  if(!shortlisted_bids.items.items.isEmpty){
				     (currentState as ShortlistedBidsListingLoaded).shortlisted_bids!.items.items.addAll(shortlisted_bids.items.items);
				  }
				  return emit (shortlisted_bids.items.items.isEmpty
					  ? (currentState as ShortlistedBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ShortlistedBidsListingLoaded(  shortlisted_bids:  (currentState as ShortlistedBidsListingLoaded).shortlisted_bids ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as ShortlistedBidsListingLoaded).page! + 1;
				  ShortlistedBidsIndexModel shortlisted_bids = await listingShortlistedBids(page);
				  return emit ( shortlisted_bids.items.items.isEmpty
					  ? (currentState as ShortlistedBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ShortlistedBidsListingLoaded(  shortlisted_bids:  shortlisted_bids ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( ShortlistedBidsListingError());
      }
    }
  }

  void _ShortlistedBidsListingRefreshEvent(ShortlistedBidsListingRefresh event, Emitter<ShortlistedBidsState> emit)async{
  final currentState = state;
    try {
        if (currentState is ShortlistedBidsListingUninitialized) {
		   if(isSearch){
		      ShortlistedBidsIndexModel shortlisted_bids = await listingSearchShortlistedBids(1);
              return emit (ShortlistedBidsListingLoaded( shortlisted_bids: shortlisted_bids,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     ShortlistedBidsIndexModel shortlisted_bids = await listingShortlistedBids(1);
             return emit (ShortlistedBidsListingLoaded( shortlisted_bids: shortlisted_bids,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is ShortlistedBidsListingLoaded) {
		  if(isSearch){
		     ShortlistedBidsIndexModel shortlisted_bids = await listingSearchRefreshShortlistedBids();
              return emit ( shortlisted_bids.items.items.isEmpty
              ? (currentState as ShortlistedBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShortlistedBidsListingLoaded(  shortlisted_bids: shortlisted_bids ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      ShortlistedBidsIndexModel shortlisted_bids = await listingRefreshShortlistedBids();
              return emit ( shortlisted_bids.items.items.isEmpty
              ? (currentState as ShortlistedBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShortlistedBidsListingLoaded(  shortlisted_bids: shortlisted_bids ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ShortlistedBidsListingError());
      }
  }

  @override
  get initialState => ShortlistedBidsListingUninitialized();

  @override

  Stream<ShortlistedBidsState> mapEventToState(ShortlistedBidsEvent event) async* {
    final currentState = state;
    if (event is ShortlistedBidsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ShortlistedBidsListingUninitialized){
			  if(isSearch){
			     ShortlistedBidsIndexModel shortlisted_bids = await listingSearchShortlistedBids(1);
				  int deltaPage = shortlisted_bids.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ShortlistedBidsListingLoaded(shortlisted_bids: shortlisted_bids,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ShortlistedBidsIndexModel shortlisted_bids = await listingShortlistedBids(1);
				  int deltaPage = shortlisted_bids.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ShortlistedBidsListingLoaded(shortlisted_bids: shortlisted_bids,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ShortlistedBidsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ShortlistedBidsListingLoaded).page! + 1;
				  ShortlistedBidsIndexModel shortlisted_bids = await listingShortlistedBids(page);
				  if(!shortlisted_bids.items.items.isEmpty){
				     (currentState as ShortlistedBidsListingLoaded).shortlisted_bids!.items.items.addAll(shortlisted_bids.items.items);
				  }
				  yield shortlisted_bids.items.items.isEmpty
					  ? (currentState as ShortlistedBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ShortlistedBidsListingLoaded(  shortlisted_bids:  (currentState as ShortlistedBidsListingLoaded).shortlisted_bids ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as ShortlistedBidsListingLoaded).page! + 1;
				  ShortlistedBidsIndexModel shortlisted_bids = await listingShortlistedBids(page);
				  yield shortlisted_bids.items.items.isEmpty
					  ? (currentState as ShortlistedBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ShortlistedBidsListingLoaded(  shortlisted_bids:  shortlisted_bids ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield ShortlistedBidsListingError();
      }
    } else if (event is ShortlistedBidsListingRefresh){
      try {
        if (currentState is ShortlistedBidsListingUninitialized) {
		   if(isSearch){
		      ShortlistedBidsIndexModel shortlisted_bids = await listingSearchShortlistedBids(1);
              yield ShortlistedBidsListingLoaded( shortlisted_bids: shortlisted_bids,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ShortlistedBidsIndexModel shortlisted_bids = await listingShortlistedBids(1);
             yield ShortlistedBidsListingLoaded( shortlisted_bids: shortlisted_bids,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ShortlistedBidsListingLoaded) {
		  if(isSearch){
		     ShortlistedBidsIndexModel shortlisted_bids = await listingSearchRefreshShortlistedBids();
              yield shortlisted_bids.items.items.isEmpty
              ? (currentState as ShortlistedBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShortlistedBidsListingLoaded(  shortlisted_bids: shortlisted_bids ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ShortlistedBidsIndexModel shortlisted_bids = await listingRefreshShortlistedBids();
              yield shortlisted_bids.items.items.isEmpty
              ? (currentState as ShortlistedBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShortlistedBidsListingLoaded(  shortlisted_bids: shortlisted_bids ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ShortlistedBidsListingError();
      }

    }
  }



  bool hasReachedMax(ShortlistedBidsState state) =>
      state is ShortlistedBidsListingLoaded && state.hasReachedMax!;


  Future<ShortlistedBidsIndexModel> listingShortlistedBids(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ShortlistedBidsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShortlistedBidsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ShortlistedBidsIndexModel> listingRefreshShortlistedBids() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ShortlistedBidsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShortlistedBidsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ShortlistedBidsIndexModel> listingSearchShortlistedBids(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ShortlistedBidsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShortlistedBidsListSearch(dt ,'',page);	
	return data;
  }

  Future<ShortlistedBidsIndexModel> listingSearchRefreshShortlistedBids() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ShortlistedBidsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShortlistedBidsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ShortlistedBidsIndexModel> _loadAndSaveShortlistedBidsListSearch(ShortlistedBidsIndexModel list, String searchKey, int page) async{

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


class  UserShortlistedBidsListBottomLoader extends StatelessWidget {
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








  

















  

