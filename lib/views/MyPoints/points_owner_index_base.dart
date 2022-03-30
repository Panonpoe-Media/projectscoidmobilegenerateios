
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



class PointsOwnerIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PointsOwnerIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PointsOwnerIndexBaseState createState() => PointsOwnerIndexBaseState();
}

class  PointsOwnerIndexBaseState extends State<PointsOwnerIndexBase>{
  String title = 'PointsOwner'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  PointsOwnerListing? listing;

  PointsOwnerIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String point_id = 'point_id';
	 point_id = point_id.replaceAll('_id','');
     getPath = widget.url! + point_id + 'page=%s';
	listing = new PointsOwnerListing(AppProvider.getApplication(context), getPath, false, PointsOwnerListingUninitialized());
    listing!.add(PointsOwnerList());
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
    return BlocBuilder<PointsOwnerListing, PointsOwnerState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is PointsOwnerListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is PointsOwnerListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is PointsOwnerListingLoaded) {
          if (state.points_owner!.items.items.isEmpty) {
		  if (state.points_owner!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.points_owner!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.points_owner!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.points_owner!.items.items.length
									  ?  UserPointsOwnerListBottomLoader()
									  : state.points_owner!.viewItem (state.points_owner!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.points_owner!.items.items.length
									: state.points_owner!.items.items.length + 1,
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

								  return index >= state.points_owner!.items.items.length
									  ?  UserPointsOwnerListBottomLoader()
									  : state.points_owner!.viewItem (state.points_owner!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.points_owner!.items.items.length
									: state.points_owner!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.points_owner!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(PointsOwnerListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PointsOwnerList());
    }

  }
}




abstract class PointsOwnerEvent extends Equatable {
const PointsOwnerEvent();
   @override
    List<Object> get props => [];
}

class PointsOwnerList extends PointsOwnerEvent {
  @override
  String toString() => 'PointsOwnerList';
}

class PointsOwnerListingRefresh extends PointsOwnerEvent {
  @override
  String toString() => 'PointsOwnerListingRefresh';
}

class PointsOwnerListingChangeSearch extends PointsOwnerEvent {
  @override
  String toString() => 'PointsOwnerChangeSearch';
}


abstract class PointsOwnerState extends Equatable {
  const PointsOwnerState();
   @override
    List<Object> get props => [];
}

class PointsOwnerListingUninitialized extends PointsOwnerState {
  @override
  String toString() => 'PointsOwnerListingUninitialized';
}

class PointsOwnerListingError extends PointsOwnerState {
  @override
  String toString() => 'PointsOwnerListingError';
}

class PointsOwnerListingLoaded extends PointsOwnerState {
  final PointsOwnerIndexModel? points_owner;
  final bool? hasReachedMax;
  final int?  page;

  PointsOwnerListingLoaded({
    this.points_owner,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [points_owner!, hasReachedMax!, page!];
  
  PointsOwnerListingLoaded copyWith({
    PointsOwnerIndexModel? points_owner,
    bool? hasReachedMax,
    int? page,
  }) {
    return PointsOwnerListingLoaded(
      points_owner: points_owner ?? this.points_owner,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PointsOwnerListingLoaded  PointsOwnerListing: ${ points_owner!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PointsOwnerListing extends Bloc<PointsOwnerEvent, PointsOwnerState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PointsOwnerListing(this.application, this.url, this.isSearch, PointsOwnerState initialState):
  super(initialState){
     on<PointsOwnerList>(_PointsOwnerListEvent);
	 on<PointsOwnerListingRefresh>(_PointsOwnerListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PointsOwnerEvent, PointsOwnerState>> transformEvents(
      Stream<PointsOwnerEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<PointsOwnerEvent> transform<PointsOwnerEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PointsOwnerEvent, PointsOwnerState> transition) {
    print(transition);
  }


  void _PointsOwnerListEvent(PointsOwnerList event, Emitter<PointsOwnerState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsOwnerListingUninitialized){
			  if(isSearch){
			     PointsOwnerIndexModel points_owner = await listingSearchPointsOwner(1);
				  int deltaPage = points_owner.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (PointsOwnerListingLoaded(points_owner: points_owner,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  PointsOwnerIndexModel points_owner = await listingPointsOwner(1);
				  int deltaPage = points_owner.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (PointsOwnerListingLoaded(points_owner: points_owner,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is PointsOwnerListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PointsOwnerListingLoaded).page! + 1;
				  PointsOwnerIndexModel points_owner = await listingPointsOwner(page);
				  if(!points_owner.items.items.isEmpty){
				     (currentState as PointsOwnerListingLoaded).points_owner!.items.items.addAll(points_owner.items.items);
				  }
				  return emit (points_owner.items.items.isEmpty
					  ? (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PointsOwnerListingLoaded(  points_owner:  (currentState as PointsOwnerListingLoaded).points_owner ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as PointsOwnerListingLoaded).page! + 1;
				  PointsOwnerIndexModel points_owner = await listingPointsOwner(page);
				  return emit ( points_owner.items.items.isEmpty
					  ? (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PointsOwnerListingLoaded(  points_owner:  points_owner ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( PointsOwnerListingError());
      }
    }
  }

  void _PointsOwnerListingRefreshEvent(PointsOwnerListingRefresh event, Emitter<PointsOwnerState> emit)async{
  final currentState = state;
    try {
        if (currentState is PointsOwnerListingUninitialized) {
		   if(isSearch){
		      PointsOwnerIndexModel points_owner = await listingSearchPointsOwner(1);
              return emit (PointsOwnerListingLoaded( points_owner: points_owner,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     PointsOwnerIndexModel points_owner = await listingPointsOwner(1);
             return emit (PointsOwnerListingLoaded( points_owner: points_owner,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is PointsOwnerListingLoaded) {
		  if(isSearch){
		     PointsOwnerIndexModel points_owner = await listingSearchRefreshPointsOwner();
              return emit ( points_owner.items.items.isEmpty
              ? (currentState as PointsOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsOwnerListingLoaded(  points_owner: points_owner ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      PointsOwnerIndexModel points_owner = await listingRefreshPointsOwner();
              return emit ( points_owner.items.items.isEmpty
              ? (currentState as PointsOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsOwnerListingLoaded(  points_owner: points_owner ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PointsOwnerListingError());
      }
  }

  @override
  get initialState => PointsOwnerListingUninitialized();

  @override

  Stream<PointsOwnerState> mapEventToState(PointsOwnerEvent event) async* {
    final currentState = state;
    if (event is PointsOwnerList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsOwnerListingUninitialized){
			  if(isSearch){
			     PointsOwnerIndexModel points_owner = await listingSearchPointsOwner(1);
				  int deltaPage = points_owner.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PointsOwnerListingLoaded(points_owner: points_owner,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  PointsOwnerIndexModel points_owner = await listingPointsOwner(1);
				  int deltaPage = points_owner.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PointsOwnerListingLoaded(points_owner: points_owner,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is PointsOwnerListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PointsOwnerListingLoaded).page! + 1;
				  PointsOwnerIndexModel points_owner = await listingPointsOwner(page);
				  if(!points_owner.items.items.isEmpty){
				     (currentState as PointsOwnerListingLoaded).points_owner!.items.items.addAll(points_owner.items.items);
				  }
				  yield points_owner.items.items.isEmpty
					  ? (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PointsOwnerListingLoaded(  points_owner:  (currentState as PointsOwnerListingLoaded).points_owner ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as PointsOwnerListingLoaded).page! + 1;
				  PointsOwnerIndexModel points_owner = await listingPointsOwner(page);
				  yield points_owner.items.items.isEmpty
					  ? (currentState as PointsOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PointsOwnerListingLoaded(  points_owner:  points_owner ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield PointsOwnerListingError();
      }
    } else if (event is PointsOwnerListingRefresh){
      try {
        if (currentState is PointsOwnerListingUninitialized) {
		   if(isSearch){
		      PointsOwnerIndexModel points_owner = await listingSearchPointsOwner(1);
              yield PointsOwnerListingLoaded( points_owner: points_owner,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     PointsOwnerIndexModel points_owner = await listingPointsOwner(1);
             yield PointsOwnerListingLoaded( points_owner: points_owner,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is PointsOwnerListingLoaded) {
		  if(isSearch){
		     PointsOwnerIndexModel points_owner = await listingSearchRefreshPointsOwner();
              yield points_owner.items.items.isEmpty
              ? (currentState as PointsOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsOwnerListingLoaded(  points_owner: points_owner ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      PointsOwnerIndexModel points_owner = await listingRefreshPointsOwner();
              yield points_owner.items.items.isEmpty
              ? (currentState as PointsOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsOwnerListingLoaded(  points_owner: points_owner ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PointsOwnerListingError();
      }

    }
  }



  bool hasReachedMax(PointsOwnerState state) =>
      state is PointsOwnerListingLoaded && state.hasReachedMax!;


  Future<PointsOwnerIndexModel> listingPointsOwner(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = PointsOwnerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsOwnerListSearch(dt ,'',page);
	
	return data;
  }

  Future<PointsOwnerIndexModel> listingRefreshPointsOwner() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PointsOwnerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsOwnerListSearch(dt ,'',page);
	
	return data;
  }

  Future<PointsOwnerIndexModel> listingSearchPointsOwner(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = PointsOwnerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsOwnerListSearch(dt ,'',page);	
	return data;
  }

  Future<PointsOwnerIndexModel> listingSearchRefreshPointsOwner() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PointsOwnerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsOwnerListSearch(dt ,'',page);
	
	return data;
  }
}


Future<PointsOwnerIndexModel> _loadAndSavePointsOwnerListSearch(PointsOwnerIndexModel list, String searchKey, int page) async{

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


class  UserPointsOwnerListBottomLoader extends StatelessWidget {
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








  

















  

