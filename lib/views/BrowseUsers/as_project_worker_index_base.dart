
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



class AsProjectWorkerIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  AsProjectWorkerIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  AsProjectWorkerIndexBaseState createState() => AsProjectWorkerIndexBaseState();
}

class  AsProjectWorkerIndexBaseState extends State<AsProjectWorkerIndexBase>{
  String title = 'AsProjectWorker'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  AsProjectWorkerListing? listing;

  AsProjectWorkerIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String project_id = 'project_id';
	 project_id = project_id.replaceAll('_id','');
     getPath = widget.url! + project_id + 'page=%s';
	listing = new AsProjectWorkerListing(AppProvider.getApplication(context), getPath, false, AsProjectWorkerListingUninitialized());
    listing!.add(AsProjectWorkerList());
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
    return BlocBuilder<AsProjectWorkerListing, AsProjectWorkerState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is AsProjectWorkerListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is AsProjectWorkerListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is AsProjectWorkerListingLoaded) {
          if (state.as_project_worker!.items.items.isEmpty) {
		  if (state.as_project_worker!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.as_project_worker!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.as_project_worker!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.as_project_worker!.items.items.length
									  ?  PublicAsProjectWorkerListBottomLoader()
									  : state.as_project_worker!.viewItem (state.as_project_worker!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.as_project_worker!.items.items.length
									: state.as_project_worker!.items.items.length + 1,
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

								  return index >= state.as_project_worker!.items.items.length
									  ?  PublicAsProjectWorkerListBottomLoader()
									  : state.as_project_worker!.viewItem (state.as_project_worker!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.as_project_worker!.items.items.length
									: state.as_project_worker!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.as_project_worker!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(AsProjectWorkerListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(AsProjectWorkerList());
    }

  }
}




abstract class AsProjectWorkerEvent extends Equatable {
const AsProjectWorkerEvent();
   @override
    List<Object> get props => [];
}

class AsProjectWorkerList extends AsProjectWorkerEvent {
  @override
  String toString() => 'AsProjectWorkerList';
}

class AsProjectWorkerListingRefresh extends AsProjectWorkerEvent {
  @override
  String toString() => 'AsProjectWorkerListingRefresh';
}

class AsProjectWorkerListingChangeSearch extends AsProjectWorkerEvent {
  @override
  String toString() => 'AsProjectWorkerChangeSearch';
}


abstract class AsProjectWorkerState extends Equatable {
  const AsProjectWorkerState();
   @override
    List<Object> get props => [];
}

class AsProjectWorkerListingUninitialized extends AsProjectWorkerState {
  @override
  String toString() => 'AsProjectWorkerListingUninitialized';
}

class AsProjectWorkerListingError extends AsProjectWorkerState {
  @override
  String toString() => 'AsProjectWorkerListingError';
}

class AsProjectWorkerListingLoaded extends AsProjectWorkerState {
  final AsProjectWorkerIndexModel? as_project_worker;
  final bool? hasReachedMax;
  final int?  page;

  AsProjectWorkerListingLoaded({
    this.as_project_worker,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [as_project_worker!, hasReachedMax!, page!];
  
  AsProjectWorkerListingLoaded copyWith({
    AsProjectWorkerIndexModel? as_project_worker,
    bool? hasReachedMax,
    int? page,
  }) {
    return AsProjectWorkerListingLoaded(
      as_project_worker: as_project_worker ?? this.as_project_worker,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'AsProjectWorkerListingLoaded  AsProjectWorkerListing: ${ as_project_worker!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class AsProjectWorkerListing extends Bloc<AsProjectWorkerEvent, AsProjectWorkerState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  AsProjectWorkerListing(this.application, this.url, this.isSearch, AsProjectWorkerState initialState):
  super(initialState){
     on<AsProjectWorkerList>(_AsProjectWorkerListEvent);
	 on<AsProjectWorkerListingRefresh>(_AsProjectWorkerListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<AsProjectWorkerEvent, AsProjectWorkerState>> transformEvents(
      Stream<AsProjectWorkerEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<AsProjectWorkerEvent> transform<AsProjectWorkerEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<AsProjectWorkerEvent, AsProjectWorkerState> transition) {
    print(transition);
  }


  void _AsProjectWorkerListEvent(AsProjectWorkerList event, Emitter<AsProjectWorkerState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is AsProjectWorkerListingUninitialized){
			  if(isSearch){
			     AsProjectWorkerIndexModel as_project_worker = await listingSearchAsProjectWorker(1);
				  int deltaPage = as_project_worker.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (AsProjectWorkerListingLoaded(as_project_worker: as_project_worker,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  AsProjectWorkerIndexModel as_project_worker = await listingAsProjectWorker(1);
				  int deltaPage = as_project_worker.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (AsProjectWorkerListingLoaded(as_project_worker: as_project_worker,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is AsProjectWorkerListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as AsProjectWorkerListingLoaded).page! + 1;
				  AsProjectWorkerIndexModel as_project_worker = await listingAsProjectWorker(page);
				  if(!as_project_worker.items.items.isEmpty){
				     (currentState as AsProjectWorkerListingLoaded).as_project_worker!.items.items.addAll(as_project_worker.items.items);
				  }
				  return emit (as_project_worker.items.items.isEmpty
					  ? (currentState as AsProjectWorkerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : AsProjectWorkerListingLoaded(  as_project_worker:  (currentState as AsProjectWorkerListingLoaded).as_project_worker ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as AsProjectWorkerListingLoaded).page! + 1;
				  AsProjectWorkerIndexModel as_project_worker = await listingAsProjectWorker(page);
				  return emit ( as_project_worker.items.items.isEmpty
					  ? (currentState as AsProjectWorkerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : AsProjectWorkerListingLoaded(  as_project_worker:  as_project_worker ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( AsProjectWorkerListingError());
      }
    }
  }

  void _AsProjectWorkerListingRefreshEvent(AsProjectWorkerListingRefresh event, Emitter<AsProjectWorkerState> emit)async{
  final currentState = state;
    try {
        if (currentState is AsProjectWorkerListingUninitialized) {
		   if(isSearch){
		      AsProjectWorkerIndexModel as_project_worker = await listingSearchAsProjectWorker(1);
              return emit (AsProjectWorkerListingLoaded( as_project_worker: as_project_worker,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     AsProjectWorkerIndexModel as_project_worker = await listingAsProjectWorker(1);
             return emit (AsProjectWorkerListingLoaded( as_project_worker: as_project_worker,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is AsProjectWorkerListingLoaded) {
		  if(isSearch){
		     AsProjectWorkerIndexModel as_project_worker = await listingSearchRefreshAsProjectWorker();
              return emit ( as_project_worker.items.items.isEmpty
              ? (currentState as AsProjectWorkerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : AsProjectWorkerListingLoaded(  as_project_worker: as_project_worker ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      AsProjectWorkerIndexModel as_project_worker = await listingRefreshAsProjectWorker();
              return emit ( as_project_worker.items.items.isEmpty
              ? (currentState as AsProjectWorkerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : AsProjectWorkerListingLoaded(  as_project_worker: as_project_worker ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (AsProjectWorkerListingError());
      }
  }

  @override
  get initialState => AsProjectWorkerListingUninitialized();

  @override

  Stream<AsProjectWorkerState> mapEventToState(AsProjectWorkerEvent event) async* {
    final currentState = state;
    if (event is AsProjectWorkerList && !hasReachedMax(currentState)) {
      try {
        if (currentState is AsProjectWorkerListingUninitialized){
			  if(isSearch){
			     AsProjectWorkerIndexModel as_project_worker = await listingSearchAsProjectWorker(1);
				  int deltaPage = as_project_worker.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield AsProjectWorkerListingLoaded(as_project_worker: as_project_worker,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  AsProjectWorkerIndexModel as_project_worker = await listingAsProjectWorker(1);
				  int deltaPage = as_project_worker.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield AsProjectWorkerListingLoaded(as_project_worker: as_project_worker,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is AsProjectWorkerListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as AsProjectWorkerListingLoaded).page! + 1;
				  AsProjectWorkerIndexModel as_project_worker = await listingAsProjectWorker(page);
				  if(!as_project_worker.items.items.isEmpty){
				     (currentState as AsProjectWorkerListingLoaded).as_project_worker!.items.items.addAll(as_project_worker.items.items);
				  }
				  yield as_project_worker.items.items.isEmpty
					  ? (currentState as AsProjectWorkerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : AsProjectWorkerListingLoaded(  as_project_worker:  (currentState as AsProjectWorkerListingLoaded).as_project_worker ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as AsProjectWorkerListingLoaded).page! + 1;
				  AsProjectWorkerIndexModel as_project_worker = await listingAsProjectWorker(page);
				  yield as_project_worker.items.items.isEmpty
					  ? (currentState as AsProjectWorkerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : AsProjectWorkerListingLoaded(  as_project_worker:  as_project_worker ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield AsProjectWorkerListingError();
      }
    } else if (event is AsProjectWorkerListingRefresh){
      try {
        if (currentState is AsProjectWorkerListingUninitialized) {
		   if(isSearch){
		      AsProjectWorkerIndexModel as_project_worker = await listingSearchAsProjectWorker(1);
              yield AsProjectWorkerListingLoaded( as_project_worker: as_project_worker,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     AsProjectWorkerIndexModel as_project_worker = await listingAsProjectWorker(1);
             yield AsProjectWorkerListingLoaded( as_project_worker: as_project_worker,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is AsProjectWorkerListingLoaded) {
		  if(isSearch){
		     AsProjectWorkerIndexModel as_project_worker = await listingSearchRefreshAsProjectWorker();
              yield as_project_worker.items.items.isEmpty
              ? (currentState as AsProjectWorkerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : AsProjectWorkerListingLoaded(  as_project_worker: as_project_worker ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      AsProjectWorkerIndexModel as_project_worker = await listingRefreshAsProjectWorker();
              yield as_project_worker.items.items.isEmpty
              ? (currentState as AsProjectWorkerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : AsProjectWorkerListingLoaded(  as_project_worker: as_project_worker ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield AsProjectWorkerListingError();
      }

    }
  }



  bool hasReachedMax(AsProjectWorkerState state) =>
      state is AsProjectWorkerListingLoaded && state.hasReachedMax!;


  Future<AsProjectWorkerIndexModel> listingAsProjectWorker(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = AsProjectWorkerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveAsProjectWorkerListSearch(dt ,'',page);
	
	return data;
  }

  Future<AsProjectWorkerIndexModel> listingRefreshAsProjectWorker() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = AsProjectWorkerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveAsProjectWorkerListSearch(dt ,'',page);
	
	return data;
  }

  Future<AsProjectWorkerIndexModel> listingSearchAsProjectWorker(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = AsProjectWorkerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveAsProjectWorkerListSearch(dt ,'',page);	
	return data;
  }

  Future<AsProjectWorkerIndexModel> listingSearchRefreshAsProjectWorker() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = AsProjectWorkerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveAsProjectWorkerListSearch(dt ,'',page);
	
	return data;
  }
}


Future<AsProjectWorkerIndexModel> _loadAndSaveAsProjectWorkerListSearch(AsProjectWorkerIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.project_id;
	  list.items.items[i].item.ttl = list.items.items[i].item.title;
    }
    return list;
 }


class  PublicAsProjectWorkerListBottomLoader extends StatelessWidget {
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








  

















  

