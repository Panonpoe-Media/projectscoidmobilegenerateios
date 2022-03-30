
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



class PointsSellerIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PointsSellerIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PointsSellerIndexBaseState createState() => PointsSellerIndexBaseState();
}

class  PointsSellerIndexBaseState extends State<PointsSellerIndexBase>{
  String title = 'PointsSeller'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  PointsSellerListing? listing;

  PointsSellerIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String point_id = 'point_id';
	 point_id = point_id.replaceAll('_id','');
     getPath = widget.url! + point_id + 'page=%s';
	listing = new PointsSellerListing(AppProvider.getApplication(context), getPath, false, PointsSellerListingUninitialized());
    listing!.add(PointsSellerList());
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
    return BlocBuilder<PointsSellerListing, PointsSellerState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is PointsSellerListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is PointsSellerListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is PointsSellerListingLoaded) {
          if (state.points_seller!.items.items.isEmpty) {
		  if (state.points_seller!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.points_seller!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.points_seller!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.points_seller!.items.items.length
									  ?  UserPointsSellerListBottomLoader()
									  : state.points_seller!.viewItem (state.points_seller!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.points_seller!.items.items.length
									: state.points_seller!.items.items.length + 1,
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

								  return index >= state.points_seller!.items.items.length
									  ?  UserPointsSellerListBottomLoader()
									  : state.points_seller!.viewItem (state.points_seller!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.points_seller!.items.items.length
									: state.points_seller!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.points_seller!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(PointsSellerListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PointsSellerList());
    }

  }
}




abstract class PointsSellerEvent extends Equatable {
const PointsSellerEvent();
   @override
    List<Object> get props => [];
}

class PointsSellerList extends PointsSellerEvent {
  @override
  String toString() => 'PointsSellerList';
}

class PointsSellerListingRefresh extends PointsSellerEvent {
  @override
  String toString() => 'PointsSellerListingRefresh';
}

class PointsSellerListingChangeSearch extends PointsSellerEvent {
  @override
  String toString() => 'PointsSellerChangeSearch';
}


abstract class PointsSellerState extends Equatable {
  const PointsSellerState();
   @override
    List<Object> get props => [];
}

class PointsSellerListingUninitialized extends PointsSellerState {
  @override
  String toString() => 'PointsSellerListingUninitialized';
}

class PointsSellerListingError extends PointsSellerState {
  @override
  String toString() => 'PointsSellerListingError';
}

class PointsSellerListingLoaded extends PointsSellerState {
  final PointsSellerIndexModel? points_seller;
  final bool? hasReachedMax;
  final int?  page;

  PointsSellerListingLoaded({
    this.points_seller,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [points_seller!, hasReachedMax!, page!];
  
  PointsSellerListingLoaded copyWith({
    PointsSellerIndexModel? points_seller,
    bool? hasReachedMax,
    int? page,
  }) {
    return PointsSellerListingLoaded(
      points_seller: points_seller ?? this.points_seller,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PointsSellerListingLoaded  PointsSellerListing: ${ points_seller!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PointsSellerListing extends Bloc<PointsSellerEvent, PointsSellerState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PointsSellerListing(this.application, this.url, this.isSearch, PointsSellerState initialState):
  super(initialState){
     on<PointsSellerList>(_PointsSellerListEvent);
	 on<PointsSellerListingRefresh>(_PointsSellerListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PointsSellerEvent, PointsSellerState>> transformEvents(
      Stream<PointsSellerEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<PointsSellerEvent> transform<PointsSellerEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PointsSellerEvent, PointsSellerState> transition) {
    print(transition);
  }


  void _PointsSellerListEvent(PointsSellerList event, Emitter<PointsSellerState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsSellerListingUninitialized){
			  if(isSearch){
			     PointsSellerIndexModel points_seller = await listingSearchPointsSeller(1);
				  int deltaPage = points_seller.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (PointsSellerListingLoaded(points_seller: points_seller,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  PointsSellerIndexModel points_seller = await listingPointsSeller(1);
				  int deltaPage = points_seller.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (PointsSellerListingLoaded(points_seller: points_seller,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is PointsSellerListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PointsSellerListingLoaded).page! + 1;
				  PointsSellerIndexModel points_seller = await listingPointsSeller(page);
				  if(!points_seller.items.items.isEmpty){
				     (currentState as PointsSellerListingLoaded).points_seller!.items.items.addAll(points_seller.items.items);
				  }
				  return emit (points_seller.items.items.isEmpty
					  ? (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PointsSellerListingLoaded(  points_seller:  (currentState as PointsSellerListingLoaded).points_seller ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as PointsSellerListingLoaded).page! + 1;
				  PointsSellerIndexModel points_seller = await listingPointsSeller(page);
				  return emit ( points_seller.items.items.isEmpty
					  ? (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PointsSellerListingLoaded(  points_seller:  points_seller ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( PointsSellerListingError());
      }
    }
  }

  void _PointsSellerListingRefreshEvent(PointsSellerListingRefresh event, Emitter<PointsSellerState> emit)async{
  final currentState = state;
    try {
        if (currentState is PointsSellerListingUninitialized) {
		   if(isSearch){
		      PointsSellerIndexModel points_seller = await listingSearchPointsSeller(1);
              return emit (PointsSellerListingLoaded( points_seller: points_seller,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     PointsSellerIndexModel points_seller = await listingPointsSeller(1);
             return emit (PointsSellerListingLoaded( points_seller: points_seller,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is PointsSellerListingLoaded) {
		  if(isSearch){
		     PointsSellerIndexModel points_seller = await listingSearchRefreshPointsSeller();
              return emit ( points_seller.items.items.isEmpty
              ? (currentState as PointsSellerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsSellerListingLoaded(  points_seller: points_seller ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      PointsSellerIndexModel points_seller = await listingRefreshPointsSeller();
              return emit ( points_seller.items.items.isEmpty
              ? (currentState as PointsSellerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsSellerListingLoaded(  points_seller: points_seller ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PointsSellerListingError());
      }
  }

  @override
  get initialState => PointsSellerListingUninitialized();

  @override

  Stream<PointsSellerState> mapEventToState(PointsSellerEvent event) async* {
    final currentState = state;
    if (event is PointsSellerList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsSellerListingUninitialized){
			  if(isSearch){
			     PointsSellerIndexModel points_seller = await listingSearchPointsSeller(1);
				  int deltaPage = points_seller.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PointsSellerListingLoaded(points_seller: points_seller,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  PointsSellerIndexModel points_seller = await listingPointsSeller(1);
				  int deltaPage = points_seller.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PointsSellerListingLoaded(points_seller: points_seller,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is PointsSellerListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PointsSellerListingLoaded).page! + 1;
				  PointsSellerIndexModel points_seller = await listingPointsSeller(page);
				  if(!points_seller.items.items.isEmpty){
				     (currentState as PointsSellerListingLoaded).points_seller!.items.items.addAll(points_seller.items.items);
				  }
				  yield points_seller.items.items.isEmpty
					  ? (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PointsSellerListingLoaded(  points_seller:  (currentState as PointsSellerListingLoaded).points_seller ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as PointsSellerListingLoaded).page! + 1;
				  PointsSellerIndexModel points_seller = await listingPointsSeller(page);
				  yield points_seller.items.items.isEmpty
					  ? (currentState as PointsSellerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PointsSellerListingLoaded(  points_seller:  points_seller ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield PointsSellerListingError();
      }
    } else if (event is PointsSellerListingRefresh){
      try {
        if (currentState is PointsSellerListingUninitialized) {
		   if(isSearch){
		      PointsSellerIndexModel points_seller = await listingSearchPointsSeller(1);
              yield PointsSellerListingLoaded( points_seller: points_seller,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     PointsSellerIndexModel points_seller = await listingPointsSeller(1);
             yield PointsSellerListingLoaded( points_seller: points_seller,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is PointsSellerListingLoaded) {
		  if(isSearch){
		     PointsSellerIndexModel points_seller = await listingSearchRefreshPointsSeller();
              yield points_seller.items.items.isEmpty
              ? (currentState as PointsSellerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsSellerListingLoaded(  points_seller: points_seller ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      PointsSellerIndexModel points_seller = await listingRefreshPointsSeller();
              yield points_seller.items.items.isEmpty
              ? (currentState as PointsSellerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsSellerListingLoaded(  points_seller: points_seller ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PointsSellerListingError();
      }

    }
  }



  bool hasReachedMax(PointsSellerState state) =>
      state is PointsSellerListingLoaded && state.hasReachedMax!;


  Future<PointsSellerIndexModel> listingPointsSeller(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = PointsSellerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsSellerListSearch(dt ,'',page);
	
	return data;
  }

  Future<PointsSellerIndexModel> listingRefreshPointsSeller() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PointsSellerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsSellerListSearch(dt ,'',page);
	
	return data;
  }

  Future<PointsSellerIndexModel> listingSearchPointsSeller(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = PointsSellerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsSellerListSearch(dt ,'',page);	
	return data;
  }

  Future<PointsSellerIndexModel> listingSearchRefreshPointsSeller() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PointsSellerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsSellerListSearch(dt ,'',page);
	
	return data;
  }
}


Future<PointsSellerIndexModel> _loadAndSavePointsSellerListSearch(PointsSellerIndexModel list, String searchKey, int page) async{

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


class  UserPointsSellerListBottomLoader extends StatelessWidget {
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








  

















  

