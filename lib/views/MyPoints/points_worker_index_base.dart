
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



class PointsWorkerIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PointsWorkerIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PointsWorkerIndexBaseState createState() => PointsWorkerIndexBaseState();
}

class  PointsWorkerIndexBaseState extends State<PointsWorkerIndexBase>{
  String title = 'PointsWorker'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  PointsWorkerListing? listing;

  PointsWorkerIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String point_id = 'point_id';
	 point_id = point_id.replaceAll('_id','');
     getPath = widget.url! + point_id + 'page=%s';
	listing = new PointsWorkerListing(AppProvider.getApplication(context), getPath, false, PointsWorkerListingUninitialized());
    listing!.add(PointsWorkerList());
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
    return BlocBuilder<PointsWorkerListing, PointsWorkerState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is PointsWorkerListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is PointsWorkerListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is PointsWorkerListingLoaded) {
          if (state.points_worker!.items.items.isEmpty) {
		  if (state.points_worker!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.points_worker!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.points_worker!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.points_worker!.items.items.length
									  ?  UserPointsWorkerListBottomLoader()
									  : state.points_worker!.viewItem (state.points_worker!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.points_worker!.items.items.length
									: state.points_worker!.items.items.length + 1,
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

								  return index >= state.points_worker!.items.items.length
									  ?  UserPointsWorkerListBottomLoader()
									  : state.points_worker!.viewItem (state.points_worker!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.points_worker!.items.items.length
									: state.points_worker!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.points_worker!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(PointsWorkerListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PointsWorkerList());
    }

  }
}




abstract class PointsWorkerEvent extends Equatable {
const PointsWorkerEvent();
   @override
    List<Object> get props => [];
}

class PointsWorkerList extends PointsWorkerEvent {
  @override
  String toString() => 'PointsWorkerList';
}

class PointsWorkerListingRefresh extends PointsWorkerEvent {
  @override
  String toString() => 'PointsWorkerListingRefresh';
}

class PointsWorkerListingChangeSearch extends PointsWorkerEvent {
  @override
  String toString() => 'PointsWorkerChangeSearch';
}


abstract class PointsWorkerState extends Equatable {
  const PointsWorkerState();
   @override
    List<Object> get props => [];
}

class PointsWorkerListingUninitialized extends PointsWorkerState {
  @override
  String toString() => 'PointsWorkerListingUninitialized';
}

class PointsWorkerListingError extends PointsWorkerState {
  @override
  String toString() => 'PointsWorkerListingError';
}

class PointsWorkerListingLoaded extends PointsWorkerState {
  final PointsWorkerIndexModel? points_worker;
  final bool? hasReachedMax;
  final int?  page;

  PointsWorkerListingLoaded({
    this.points_worker,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [points_worker!, hasReachedMax!, page!];
  
  PointsWorkerListingLoaded copyWith({
    PointsWorkerIndexModel? points_worker,
    bool? hasReachedMax,
    int? page,
  }) {
    return PointsWorkerListingLoaded(
      points_worker: points_worker ?? this.points_worker,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PointsWorkerListingLoaded  PointsWorkerListing: ${ points_worker!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PointsWorkerListing extends Bloc<PointsWorkerEvent, PointsWorkerState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PointsWorkerListing(this.application, this.url, this.isSearch, PointsWorkerState initialState):
  super(initialState){
     on<PointsWorkerList>(_PointsWorkerListEvent);
	 on<PointsWorkerListingRefresh>(_PointsWorkerListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PointsWorkerEvent, PointsWorkerState>> transformEvents(
      Stream<PointsWorkerEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<PointsWorkerEvent> transform<PointsWorkerEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PointsWorkerEvent, PointsWorkerState> transition) {
    print(transition);
  }


  void _PointsWorkerListEvent(PointsWorkerList event, Emitter<PointsWorkerState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsWorkerListingUninitialized){
			  if(isSearch){
			     PointsWorkerIndexModel points_worker = await listingSearchPointsWorker(1);
				  int deltaPage = points_worker.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (PointsWorkerListingLoaded(points_worker: points_worker,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  PointsWorkerIndexModel points_worker = await listingPointsWorker(1);
				  int deltaPage = points_worker.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (PointsWorkerListingLoaded(points_worker: points_worker,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is PointsWorkerListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PointsWorkerListingLoaded).page! + 1;
				  PointsWorkerIndexModel points_worker = await listingPointsWorker(page);
				  if(!points_worker.items.items.isEmpty){
				     (currentState as PointsWorkerListingLoaded).points_worker!.items.items.addAll(points_worker.items.items);
				  }
				  return emit (points_worker.items.items.isEmpty
					  ? (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PointsWorkerListingLoaded(  points_worker:  (currentState as PointsWorkerListingLoaded).points_worker ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as PointsWorkerListingLoaded).page! + 1;
				  PointsWorkerIndexModel points_worker = await listingPointsWorker(page);
				  return emit ( points_worker.items.items.isEmpty
					  ? (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PointsWorkerListingLoaded(  points_worker:  points_worker ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( PointsWorkerListingError());
      }
    }
  }

  void _PointsWorkerListingRefreshEvent(PointsWorkerListingRefresh event, Emitter<PointsWorkerState> emit)async{
  final currentState = state;
    try {
        if (currentState is PointsWorkerListingUninitialized) {
		   if(isSearch){
		      PointsWorkerIndexModel points_worker = await listingSearchPointsWorker(1);
              return emit (PointsWorkerListingLoaded( points_worker: points_worker,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     PointsWorkerIndexModel points_worker = await listingPointsWorker(1);
             return emit (PointsWorkerListingLoaded( points_worker: points_worker,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is PointsWorkerListingLoaded) {
		  if(isSearch){
		     PointsWorkerIndexModel points_worker = await listingSearchRefreshPointsWorker();
              return emit ( points_worker.items.items.isEmpty
              ? (currentState as PointsWorkerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsWorkerListingLoaded(  points_worker: points_worker ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      PointsWorkerIndexModel points_worker = await listingRefreshPointsWorker();
              return emit ( points_worker.items.items.isEmpty
              ? (currentState as PointsWorkerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsWorkerListingLoaded(  points_worker: points_worker ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PointsWorkerListingError());
      }
  }

  @override
  get initialState => PointsWorkerListingUninitialized();

  @override

  Stream<PointsWorkerState> mapEventToState(PointsWorkerEvent event) async* {
    final currentState = state;
    if (event is PointsWorkerList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsWorkerListingUninitialized){
			  if(isSearch){
			     PointsWorkerIndexModel points_worker = await listingSearchPointsWorker(1);
				  int deltaPage = points_worker.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PointsWorkerListingLoaded(points_worker: points_worker,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  PointsWorkerIndexModel points_worker = await listingPointsWorker(1);
				  int deltaPage = points_worker.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PointsWorkerListingLoaded(points_worker: points_worker,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is PointsWorkerListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PointsWorkerListingLoaded).page! + 1;
				  PointsWorkerIndexModel points_worker = await listingPointsWorker(page);
				  if(!points_worker.items.items.isEmpty){
				     (currentState as PointsWorkerListingLoaded).points_worker!.items.items.addAll(points_worker.items.items);
				  }
				  yield points_worker.items.items.isEmpty
					  ? (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PointsWorkerListingLoaded(  points_worker:  (currentState as PointsWorkerListingLoaded).points_worker ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as PointsWorkerListingLoaded).page! + 1;
				  PointsWorkerIndexModel points_worker = await listingPointsWorker(page);
				  yield points_worker.items.items.isEmpty
					  ? (currentState as PointsWorkerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PointsWorkerListingLoaded(  points_worker:  points_worker ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield PointsWorkerListingError();
      }
    } else if (event is PointsWorkerListingRefresh){
      try {
        if (currentState is PointsWorkerListingUninitialized) {
		   if(isSearch){
		      PointsWorkerIndexModel points_worker = await listingSearchPointsWorker(1);
              yield PointsWorkerListingLoaded( points_worker: points_worker,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     PointsWorkerIndexModel points_worker = await listingPointsWorker(1);
             yield PointsWorkerListingLoaded( points_worker: points_worker,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is PointsWorkerListingLoaded) {
		  if(isSearch){
		     PointsWorkerIndexModel points_worker = await listingSearchRefreshPointsWorker();
              yield points_worker.items.items.isEmpty
              ? (currentState as PointsWorkerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsWorkerListingLoaded(  points_worker: points_worker ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      PointsWorkerIndexModel points_worker = await listingRefreshPointsWorker();
              yield points_worker.items.items.isEmpty
              ? (currentState as PointsWorkerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsWorkerListingLoaded(  points_worker: points_worker ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PointsWorkerListingError();
      }

    }
  }



  bool hasReachedMax(PointsWorkerState state) =>
      state is PointsWorkerListingLoaded && state.hasReachedMax!;


  Future<PointsWorkerIndexModel> listingPointsWorker(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = PointsWorkerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsWorkerListSearch(dt ,'',page);
	
	return data;
  }

  Future<PointsWorkerIndexModel> listingRefreshPointsWorker() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PointsWorkerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsWorkerListSearch(dt ,'',page);
	
	return data;
  }

  Future<PointsWorkerIndexModel> listingSearchPointsWorker(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = PointsWorkerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsWorkerListSearch(dt ,'',page);	
	return data;
  }

  Future<PointsWorkerIndexModel> listingSearchRefreshPointsWorker() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PointsWorkerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsWorkerListSearch(dt ,'',page);
	
	return data;
  }
}


Future<PointsWorkerIndexModel> _loadAndSavePointsWorkerListSearch(PointsWorkerIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.point_id;
    }
    return list;
 }


class  UserPointsWorkerListBottomLoader extends StatelessWidget {
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








  

















  

