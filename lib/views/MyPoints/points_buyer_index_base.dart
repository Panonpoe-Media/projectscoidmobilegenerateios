
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



class PointsBuyerIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PointsBuyerIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PointsBuyerIndexBaseState createState() => PointsBuyerIndexBaseState();
}

class  PointsBuyerIndexBaseState extends State<PointsBuyerIndexBase>{
  String title = 'PointsBuyer'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  PointsBuyerListing? listing;

  PointsBuyerIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String point_id = 'point_id';
	 point_id = point_id.replaceAll('_id','');
     getPath = widget.url! + point_id + 'page=%s';
	listing = new PointsBuyerListing(AppProvider.getApplication(context), getPath, false, PointsBuyerListingUninitialized());
    listing!.add(PointsBuyerList());
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
    return BlocBuilder<PointsBuyerListing, PointsBuyerState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is PointsBuyerListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is PointsBuyerListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is PointsBuyerListingLoaded) {
          if (state.points_buyer!.items.items.isEmpty) {
		  if (state.points_buyer!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.points_buyer!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.points_buyer!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.points_buyer!.items.items.length
									  ?  UserPointsBuyerListBottomLoader()
									  : state.points_buyer!.viewItem (state.points_buyer!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.points_buyer!.items.items.length
									: state.points_buyer!.items.items.length + 1,
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

								  return index >= state.points_buyer!.items.items.length
									  ?  UserPointsBuyerListBottomLoader()
									  : state.points_buyer!.viewItem (state.points_buyer!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.points_buyer!.items.items.length
									: state.points_buyer!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.points_buyer!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(PointsBuyerListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PointsBuyerList());
    }

  }
}




abstract class PointsBuyerEvent extends Equatable {
const PointsBuyerEvent();
   @override
    List<Object> get props => [];
}

class PointsBuyerList extends PointsBuyerEvent {
  @override
  String toString() => 'PointsBuyerList';
}

class PointsBuyerListingRefresh extends PointsBuyerEvent {
  @override
  String toString() => 'PointsBuyerListingRefresh';
}

class PointsBuyerListingChangeSearch extends PointsBuyerEvent {
  @override
  String toString() => 'PointsBuyerChangeSearch';
}


abstract class PointsBuyerState extends Equatable {
  const PointsBuyerState();
   @override
    List<Object> get props => [];
}

class PointsBuyerListingUninitialized extends PointsBuyerState {
  @override
  String toString() => 'PointsBuyerListingUninitialized';
}

class PointsBuyerListingError extends PointsBuyerState {
  @override
  String toString() => 'PointsBuyerListingError';
}

class PointsBuyerListingLoaded extends PointsBuyerState {
  final PointsBuyerIndexModel? points_buyer;
  final bool? hasReachedMax;
  final int?  page;

  PointsBuyerListingLoaded({
    this.points_buyer,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [points_buyer!, hasReachedMax!, page!];
  
  PointsBuyerListingLoaded copyWith({
    PointsBuyerIndexModel? points_buyer,
    bool? hasReachedMax,
    int? page,
  }) {
    return PointsBuyerListingLoaded(
      points_buyer: points_buyer ?? this.points_buyer,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PointsBuyerListingLoaded  PointsBuyerListing: ${ points_buyer!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PointsBuyerListing extends Bloc<PointsBuyerEvent, PointsBuyerState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PointsBuyerListing(this.application, this.url, this.isSearch, PointsBuyerState initialState):
  super(initialState){
     on<PointsBuyerList>(_PointsBuyerListEvent);
	 on<PointsBuyerListingRefresh>(_PointsBuyerListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PointsBuyerEvent, PointsBuyerState>> transformEvents(
      Stream<PointsBuyerEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<PointsBuyerEvent> transform<PointsBuyerEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PointsBuyerEvent, PointsBuyerState> transition) {
    print(transition);
  }


  void _PointsBuyerListEvent(PointsBuyerList event, Emitter<PointsBuyerState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsBuyerListingUninitialized){
			  if(isSearch){
			     PointsBuyerIndexModel points_buyer = await listingSearchPointsBuyer(1);
				  int deltaPage = points_buyer.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (PointsBuyerListingLoaded(points_buyer: points_buyer,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  PointsBuyerIndexModel points_buyer = await listingPointsBuyer(1);
				  int deltaPage = points_buyer.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (PointsBuyerListingLoaded(points_buyer: points_buyer,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is PointsBuyerListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PointsBuyerListingLoaded).page! + 1;
				  PointsBuyerIndexModel points_buyer = await listingPointsBuyer(page);
				  if(!points_buyer.items.items.isEmpty){
				     (currentState as PointsBuyerListingLoaded).points_buyer!.items.items.addAll(points_buyer.items.items);
				  }
				  return emit (points_buyer.items.items.isEmpty
					  ? (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PointsBuyerListingLoaded(  points_buyer:  (currentState as PointsBuyerListingLoaded).points_buyer ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as PointsBuyerListingLoaded).page! + 1;
				  PointsBuyerIndexModel points_buyer = await listingPointsBuyer(page);
				  return emit ( points_buyer.items.items.isEmpty
					  ? (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PointsBuyerListingLoaded(  points_buyer:  points_buyer ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( PointsBuyerListingError());
      }
    }
  }

  void _PointsBuyerListingRefreshEvent(PointsBuyerListingRefresh event, Emitter<PointsBuyerState> emit)async{
  final currentState = state;
    try {
        if (currentState is PointsBuyerListingUninitialized) {
		   if(isSearch){
		      PointsBuyerIndexModel points_buyer = await listingSearchPointsBuyer(1);
              return emit (PointsBuyerListingLoaded( points_buyer: points_buyer,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     PointsBuyerIndexModel points_buyer = await listingPointsBuyer(1);
             return emit (PointsBuyerListingLoaded( points_buyer: points_buyer,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is PointsBuyerListingLoaded) {
		  if(isSearch){
		     PointsBuyerIndexModel points_buyer = await listingSearchRefreshPointsBuyer();
              return emit ( points_buyer.items.items.isEmpty
              ? (currentState as PointsBuyerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsBuyerListingLoaded(  points_buyer: points_buyer ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      PointsBuyerIndexModel points_buyer = await listingRefreshPointsBuyer();
              return emit ( points_buyer.items.items.isEmpty
              ? (currentState as PointsBuyerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsBuyerListingLoaded(  points_buyer: points_buyer ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PointsBuyerListingError());
      }
  }

  @override
  get initialState => PointsBuyerListingUninitialized();

  @override

  Stream<PointsBuyerState> mapEventToState(PointsBuyerEvent event) async* {
    final currentState = state;
    if (event is PointsBuyerList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsBuyerListingUninitialized){
			  if(isSearch){
			     PointsBuyerIndexModel points_buyer = await listingSearchPointsBuyer(1);
				  int deltaPage = points_buyer.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PointsBuyerListingLoaded(points_buyer: points_buyer,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  PointsBuyerIndexModel points_buyer = await listingPointsBuyer(1);
				  int deltaPage = points_buyer.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PointsBuyerListingLoaded(points_buyer: points_buyer,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is PointsBuyerListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PointsBuyerListingLoaded).page! + 1;
				  PointsBuyerIndexModel points_buyer = await listingPointsBuyer(page);
				  if(!points_buyer.items.items.isEmpty){
				     (currentState as PointsBuyerListingLoaded).points_buyer!.items.items.addAll(points_buyer.items.items);
				  }
				  yield points_buyer.items.items.isEmpty
					  ? (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PointsBuyerListingLoaded(  points_buyer:  (currentState as PointsBuyerListingLoaded).points_buyer ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as PointsBuyerListingLoaded).page! + 1;
				  PointsBuyerIndexModel points_buyer = await listingPointsBuyer(page);
				  yield points_buyer.items.items.isEmpty
					  ? (currentState as PointsBuyerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PointsBuyerListingLoaded(  points_buyer:  points_buyer ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield PointsBuyerListingError();
      }
    } else if (event is PointsBuyerListingRefresh){
      try {
        if (currentState is PointsBuyerListingUninitialized) {
		   if(isSearch){
		      PointsBuyerIndexModel points_buyer = await listingSearchPointsBuyer(1);
              yield PointsBuyerListingLoaded( points_buyer: points_buyer,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     PointsBuyerIndexModel points_buyer = await listingPointsBuyer(1);
             yield PointsBuyerListingLoaded( points_buyer: points_buyer,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is PointsBuyerListingLoaded) {
		  if(isSearch){
		     PointsBuyerIndexModel points_buyer = await listingSearchRefreshPointsBuyer();
              yield points_buyer.items.items.isEmpty
              ? (currentState as PointsBuyerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsBuyerListingLoaded(  points_buyer: points_buyer ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      PointsBuyerIndexModel points_buyer = await listingRefreshPointsBuyer();
              yield points_buyer.items.items.isEmpty
              ? (currentState as PointsBuyerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsBuyerListingLoaded(  points_buyer: points_buyer ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PointsBuyerListingError();
      }

    }
  }



  bool hasReachedMax(PointsBuyerState state) =>
      state is PointsBuyerListingLoaded && state.hasReachedMax!;


  Future<PointsBuyerIndexModel> listingPointsBuyer(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = PointsBuyerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsBuyerListSearch(dt ,'',page);
	
	return data;
  }

  Future<PointsBuyerIndexModel> listingRefreshPointsBuyer() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PointsBuyerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsBuyerListSearch(dt ,'',page);
	
	return data;
  }

  Future<PointsBuyerIndexModel> listingSearchPointsBuyer(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = PointsBuyerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsBuyerListSearch(dt ,'',page);	
	return data;
  }

  Future<PointsBuyerIndexModel> listingSearchRefreshPointsBuyer() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PointsBuyerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsBuyerListSearch(dt ,'',page);
	
	return data;
  }
}


Future<PointsBuyerIndexModel> _loadAndSavePointsBuyerListSearch(PointsBuyerIndexModel list, String searchKey, int page) async{

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


class  UserPointsBuyerListBottomLoader extends StatelessWidget {
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








  

















  

