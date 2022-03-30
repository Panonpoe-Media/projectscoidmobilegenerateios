
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



class PointsPestaIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PointsPestaIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PointsPestaIndexBaseState createState() => PointsPestaIndexBaseState();
}

class  PointsPestaIndexBaseState extends State<PointsPestaIndexBase>{
  String title = 'PointsPesta'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  PointsPestaListing? listing;

  PointsPestaIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String point_id = 'point_id';
	 point_id = point_id.replaceAll('_id','');
     getPath = widget.url! + point_id + 'page=%s';
	listing = new PointsPestaListing(AppProvider.getApplication(context), getPath, false, PointsPestaListingUninitialized());
    listing!.add(PointsPestaList());
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
    return BlocBuilder<PointsPestaListing, PointsPestaState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is PointsPestaListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is PointsPestaListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is PointsPestaListingLoaded) {
          if (state.points_pesta!.items.items.isEmpty) {
		  if (state.points_pesta!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.points_pesta!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.points_pesta!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.points_pesta!.items.items.length
									  ?  UserPointsPestaListBottomLoader()
									  : state.points_pesta!.viewItem (state.points_pesta!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.points_pesta!.items.items.length
									: state.points_pesta!.items.items.length + 1,
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

								  return index >= state.points_pesta!.items.items.length
									  ?  UserPointsPestaListBottomLoader()
									  : state.points_pesta!.viewItem (state.points_pesta!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.points_pesta!.items.items.length
									: state.points_pesta!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.points_pesta!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(PointsPestaListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PointsPestaList());
    }

  }
}




abstract class PointsPestaEvent extends Equatable {
const PointsPestaEvent();
   @override
    List<Object> get props => [];
}

class PointsPestaList extends PointsPestaEvent {
  @override
  String toString() => 'PointsPestaList';
}

class PointsPestaListingRefresh extends PointsPestaEvent {
  @override
  String toString() => 'PointsPestaListingRefresh';
}

class PointsPestaListingChangeSearch extends PointsPestaEvent {
  @override
  String toString() => 'PointsPestaChangeSearch';
}


abstract class PointsPestaState extends Equatable {
  const PointsPestaState();
   @override
    List<Object> get props => [];
}

class PointsPestaListingUninitialized extends PointsPestaState {
  @override
  String toString() => 'PointsPestaListingUninitialized';
}

class PointsPestaListingError extends PointsPestaState {
  @override
  String toString() => 'PointsPestaListingError';
}

class PointsPestaListingLoaded extends PointsPestaState {
  final PointsPestaIndexModel? points_pesta;
  final bool? hasReachedMax;
  final int?  page;

  PointsPestaListingLoaded({
    this.points_pesta,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [points_pesta!, hasReachedMax!, page!];
  
  PointsPestaListingLoaded copyWith({
    PointsPestaIndexModel? points_pesta,
    bool? hasReachedMax,
    int? page,
  }) {
    return PointsPestaListingLoaded(
      points_pesta: points_pesta ?? this.points_pesta,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PointsPestaListingLoaded  PointsPestaListing: ${ points_pesta!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PointsPestaListing extends Bloc<PointsPestaEvent, PointsPestaState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PointsPestaListing(this.application, this.url, this.isSearch, PointsPestaState initialState):
  super(initialState){
     on<PointsPestaList>(_PointsPestaListEvent);
	 on<PointsPestaListingRefresh>(_PointsPestaListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PointsPestaEvent, PointsPestaState>> transformEvents(
      Stream<PointsPestaEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<PointsPestaEvent> transform<PointsPestaEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PointsPestaEvent, PointsPestaState> transition) {
    print(transition);
  }


  void _PointsPestaListEvent(PointsPestaList event, Emitter<PointsPestaState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsPestaListingUninitialized){
			  if(isSearch){
			     PointsPestaIndexModel points_pesta = await listingSearchPointsPesta(1);
				  int deltaPage = points_pesta.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (PointsPestaListingLoaded(points_pesta: points_pesta,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  PointsPestaIndexModel points_pesta = await listingPointsPesta(1);
				  int deltaPage = points_pesta.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (PointsPestaListingLoaded(points_pesta: points_pesta,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is PointsPestaListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PointsPestaListingLoaded).page! + 1;
				  PointsPestaIndexModel points_pesta = await listingPointsPesta(page);
				  if(!points_pesta.items.items.isEmpty){
				     (currentState as PointsPestaListingLoaded).points_pesta!.items.items.addAll(points_pesta.items.items);
				  }
				  return emit (points_pesta.items.items.isEmpty
					  ? (currentState as PointsPestaListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PointsPestaListingLoaded(  points_pesta:  (currentState as PointsPestaListingLoaded).points_pesta ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as PointsPestaListingLoaded).page! + 1;
				  PointsPestaIndexModel points_pesta = await listingPointsPesta(page);
				  return emit ( points_pesta.items.items.isEmpty
					  ? (currentState as PointsPestaListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PointsPestaListingLoaded(  points_pesta:  points_pesta ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( PointsPestaListingError());
      }
    }
  }

  void _PointsPestaListingRefreshEvent(PointsPestaListingRefresh event, Emitter<PointsPestaState> emit)async{
  final currentState = state;
    try {
        if (currentState is PointsPestaListingUninitialized) {
		   if(isSearch){
		      PointsPestaIndexModel points_pesta = await listingSearchPointsPesta(1);
              return emit (PointsPestaListingLoaded( points_pesta: points_pesta,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     PointsPestaIndexModel points_pesta = await listingPointsPesta(1);
             return emit (PointsPestaListingLoaded( points_pesta: points_pesta,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is PointsPestaListingLoaded) {
		  if(isSearch){
		     PointsPestaIndexModel points_pesta = await listingSearchRefreshPointsPesta();
              return emit ( points_pesta.items.items.isEmpty
              ? (currentState as PointsPestaListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsPestaListingLoaded(  points_pesta: points_pesta ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      PointsPestaIndexModel points_pesta = await listingRefreshPointsPesta();
              return emit ( points_pesta.items.items.isEmpty
              ? (currentState as PointsPestaListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsPestaListingLoaded(  points_pesta: points_pesta ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PointsPestaListingError());
      }
  }

  @override
  get initialState => PointsPestaListingUninitialized();

  @override

  Stream<PointsPestaState> mapEventToState(PointsPestaEvent event) async* {
    final currentState = state;
    if (event is PointsPestaList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsPestaListingUninitialized){
			  if(isSearch){
			     PointsPestaIndexModel points_pesta = await listingSearchPointsPesta(1);
				  int deltaPage = points_pesta.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PointsPestaListingLoaded(points_pesta: points_pesta,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  PointsPestaIndexModel points_pesta = await listingPointsPesta(1);
				  int deltaPage = points_pesta.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PointsPestaListingLoaded(points_pesta: points_pesta,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is PointsPestaListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PointsPestaListingLoaded).page! + 1;
				  PointsPestaIndexModel points_pesta = await listingPointsPesta(page);
				  if(!points_pesta.items.items.isEmpty){
				     (currentState as PointsPestaListingLoaded).points_pesta!.items.items.addAll(points_pesta.items.items);
				  }
				  yield points_pesta.items.items.isEmpty
					  ? (currentState as PointsPestaListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PointsPestaListingLoaded(  points_pesta:  (currentState as PointsPestaListingLoaded).points_pesta ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as PointsPestaListingLoaded).page! + 1;
				  PointsPestaIndexModel points_pesta = await listingPointsPesta(page);
				  yield points_pesta.items.items.isEmpty
					  ? (currentState as PointsPestaListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PointsPestaListingLoaded(  points_pesta:  points_pesta ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield PointsPestaListingError();
      }
    } else if (event is PointsPestaListingRefresh){
      try {
        if (currentState is PointsPestaListingUninitialized) {
		   if(isSearch){
		      PointsPestaIndexModel points_pesta = await listingSearchPointsPesta(1);
              yield PointsPestaListingLoaded( points_pesta: points_pesta,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     PointsPestaIndexModel points_pesta = await listingPointsPesta(1);
             yield PointsPestaListingLoaded( points_pesta: points_pesta,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is PointsPestaListingLoaded) {
		  if(isSearch){
		     PointsPestaIndexModel points_pesta = await listingSearchRefreshPointsPesta();
              yield points_pesta.items.items.isEmpty
              ? (currentState as PointsPestaListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsPestaListingLoaded(  points_pesta: points_pesta ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      PointsPestaIndexModel points_pesta = await listingRefreshPointsPesta();
              yield points_pesta.items.items.isEmpty
              ? (currentState as PointsPestaListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsPestaListingLoaded(  points_pesta: points_pesta ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PointsPestaListingError();
      }

    }
  }



  bool hasReachedMax(PointsPestaState state) =>
      state is PointsPestaListingLoaded && state.hasReachedMax!;


  Future<PointsPestaIndexModel> listingPointsPesta(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = PointsPestaIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsPestaListSearch(dt ,'',page);
	
	return data;
  }

  Future<PointsPestaIndexModel> listingRefreshPointsPesta() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PointsPestaIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsPestaListSearch(dt ,'',page);
	
	return data;
  }

  Future<PointsPestaIndexModel> listingSearchPointsPesta(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = PointsPestaIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsPestaListSearch(dt ,'',page);	
	return data;
  }

  Future<PointsPestaIndexModel> listingSearchRefreshPointsPesta() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PointsPestaIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsPestaListSearch(dt ,'',page);
	
	return data;
  }
}


Future<PointsPestaIndexModel> _loadAndSavePointsPestaListSearch(PointsPestaIndexModel list, String searchKey, int page) async{

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


class  UserPointsPestaListBottomLoader extends StatelessWidget {
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








  

















  

