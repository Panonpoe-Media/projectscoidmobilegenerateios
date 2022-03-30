
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



class ReferalsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ReferalsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ReferalsIndexBaseState createState() => ReferalsIndexBaseState();
}

class  ReferalsIndexBaseState extends State<ReferalsIndexBase>{
  String title = 'Referals'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  ReferalsListing? listing;

  ReferalsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String user_id = 'user_id';
	 user_id = user_id.replaceAll('_id','');
     getPath = widget.url! + user_id + 'page=%s';
	listing = new ReferalsListing(AppProvider.getApplication(context), getPath, false, ReferalsListingUninitialized());
    listing!.add(ReferalsList());
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
    return BlocBuilder<ReferalsListing, ReferalsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is ReferalsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is ReferalsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is ReferalsListingLoaded) {
          if (state.referals!.items.items.isEmpty) {
		  if (state.referals!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.referals!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.referals!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.referals!.items.items.length
									  ?  UserReferalsListBottomLoader()
									  : state.referals!.viewItem (state.referals!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.referals!.items.items.length
									: state.referals!.items.items.length + 1,
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

								  return index >= state.referals!.items.items.length
									  ?  UserReferalsListBottomLoader()
									  : state.referals!.viewItem (state.referals!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.referals!.items.items.length
									: state.referals!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.referals!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(ReferalsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ReferalsList());
    }

  }
}




abstract class ReferalsEvent extends Equatable {
const ReferalsEvent();
   @override
    List<Object> get props => [];
}

class ReferalsList extends ReferalsEvent {
  @override
  String toString() => 'ReferalsList';
}

class ReferalsListingRefresh extends ReferalsEvent {
  @override
  String toString() => 'ReferalsListingRefresh';
}

class ReferalsListingChangeSearch extends ReferalsEvent {
  @override
  String toString() => 'ReferalsChangeSearch';
}


abstract class ReferalsState extends Equatable {
  const ReferalsState();
   @override
    List<Object> get props => [];
}

class ReferalsListingUninitialized extends ReferalsState {
  @override
  String toString() => 'ReferalsListingUninitialized';
}

class ReferalsListingError extends ReferalsState {
  @override
  String toString() => 'ReferalsListingError';
}

class ReferalsListingLoaded extends ReferalsState {
  final ReferalsIndexModel? referals;
  final bool? hasReachedMax;
  final int?  page;

  ReferalsListingLoaded({
    this.referals,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [referals!, hasReachedMax!, page!];
  
  ReferalsListingLoaded copyWith({
    ReferalsIndexModel? referals,
    bool? hasReachedMax,
    int? page,
  }) {
    return ReferalsListingLoaded(
      referals: referals ?? this.referals,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ReferalsListingLoaded  ReferalsListing: ${ referals!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ReferalsListing extends Bloc<ReferalsEvent, ReferalsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ReferalsListing(this.application, this.url, this.isSearch, ReferalsState initialState):
  super(initialState){
     on<ReferalsList>(_ReferalsListEvent);
	 on<ReferalsListingRefresh>(_ReferalsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ReferalsEvent, ReferalsState>> transformEvents(
      Stream<ReferalsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<ReferalsEvent> transform<ReferalsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ReferalsEvent, ReferalsState> transition) {
    print(transition);
  }


  void _ReferalsListEvent(ReferalsList event, Emitter<ReferalsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is ReferalsListingUninitialized){
			  if(isSearch){
			     ReferalsIndexModel referals = await listingSearchReferals(1);
				  int deltaPage = referals.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (ReferalsListingLoaded(referals: referals,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  ReferalsIndexModel referals = await listingReferals(1);
				  int deltaPage = referals.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (ReferalsListingLoaded(referals: referals,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ReferalsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ReferalsListingLoaded).page! + 1;
				  ReferalsIndexModel referals = await listingReferals(page);
				  if(!referals.items.items.isEmpty){
				     (currentState as ReferalsListingLoaded).referals!.items.items.addAll(referals.items.items);
				  }
				  return emit (referals.items.items.isEmpty
					  ? (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ReferalsListingLoaded(  referals:  (currentState as ReferalsListingLoaded).referals ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as ReferalsListingLoaded).page! + 1;
				  ReferalsIndexModel referals = await listingReferals(page);
				  return emit ( referals.items.items.isEmpty
					  ? (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ReferalsListingLoaded(  referals:  referals ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( ReferalsListingError());
      }
    }
  }

  void _ReferalsListingRefreshEvent(ReferalsListingRefresh event, Emitter<ReferalsState> emit)async{
  final currentState = state;
    try {
        if (currentState is ReferalsListingUninitialized) {
		   if(isSearch){
		      ReferalsIndexModel referals = await listingSearchReferals(1);
              return emit (ReferalsListingLoaded( referals: referals,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     ReferalsIndexModel referals = await listingReferals(1);
             return emit (ReferalsListingLoaded( referals: referals,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is ReferalsListingLoaded) {
		  if(isSearch){
		     ReferalsIndexModel referals = await listingSearchRefreshReferals();
              return emit ( referals.items.items.isEmpty
              ? (currentState as ReferalsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ReferalsListingLoaded(  referals: referals ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      ReferalsIndexModel referals = await listingRefreshReferals();
              return emit ( referals.items.items.isEmpty
              ? (currentState as ReferalsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ReferalsListingLoaded(  referals: referals ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ReferalsListingError());
      }
  }

  @override
  get initialState => ReferalsListingUninitialized();

  @override

  Stream<ReferalsState> mapEventToState(ReferalsEvent event) async* {
    final currentState = state;
    if (event is ReferalsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ReferalsListingUninitialized){
			  if(isSearch){
			     ReferalsIndexModel referals = await listingSearchReferals(1);
				  int deltaPage = referals.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ReferalsListingLoaded(referals: referals,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ReferalsIndexModel referals = await listingReferals(1);
				  int deltaPage = referals.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ReferalsListingLoaded(referals: referals,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ReferalsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ReferalsListingLoaded).page! + 1;
				  ReferalsIndexModel referals = await listingReferals(page);
				  if(!referals.items.items.isEmpty){
				     (currentState as ReferalsListingLoaded).referals!.items.items.addAll(referals.items.items);
				  }
				  yield referals.items.items.isEmpty
					  ? (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ReferalsListingLoaded(  referals:  (currentState as ReferalsListingLoaded).referals ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as ReferalsListingLoaded).page! + 1;
				  ReferalsIndexModel referals = await listingReferals(page);
				  yield referals.items.items.isEmpty
					  ? (currentState as ReferalsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ReferalsListingLoaded(  referals:  referals ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield ReferalsListingError();
      }
    } else if (event is ReferalsListingRefresh){
      try {
        if (currentState is ReferalsListingUninitialized) {
		   if(isSearch){
		      ReferalsIndexModel referals = await listingSearchReferals(1);
              yield ReferalsListingLoaded( referals: referals,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ReferalsIndexModel referals = await listingReferals(1);
             yield ReferalsListingLoaded( referals: referals,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ReferalsListingLoaded) {
		  if(isSearch){
		     ReferalsIndexModel referals = await listingSearchRefreshReferals();
              yield referals.items.items.isEmpty
              ? (currentState as ReferalsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ReferalsListingLoaded(  referals: referals ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ReferalsIndexModel referals = await listingRefreshReferals();
              yield referals.items.items.isEmpty
              ? (currentState as ReferalsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ReferalsListingLoaded(  referals: referals ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ReferalsListingError();
      }

    }
  }



  bool hasReachedMax(ReferalsState state) =>
      state is ReferalsListingLoaded && state.hasReachedMax!;


  Future<ReferalsIndexModel> listingReferals(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ReferalsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveReferalsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ReferalsIndexModel> listingRefreshReferals() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ReferalsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveReferalsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ReferalsIndexModel> listingSearchReferals(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ReferalsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveReferalsListSearch(dt ,'',page);	
	return data;
  }

  Future<ReferalsIndexModel> listingSearchRefreshReferals() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ReferalsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveReferalsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ReferalsIndexModel> _loadAndSaveReferalsListSearch(ReferalsIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.user_id;
	  list.items.items[i].item.ttl = list.items.items[i].item.user_name;
    }
    return list;
 }


class  UserReferalsListBottomLoader extends StatelessWidget {
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








  

















  

