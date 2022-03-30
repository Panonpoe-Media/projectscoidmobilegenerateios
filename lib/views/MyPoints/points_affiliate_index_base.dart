
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



class PointsAffiliateIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PointsAffiliateIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PointsAffiliateIndexBaseState createState() => PointsAffiliateIndexBaseState();
}

class  PointsAffiliateIndexBaseState extends State<PointsAffiliateIndexBase>{
  String title = 'PointsAffiliate'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  PointsAffiliateListing? listing;

  PointsAffiliateIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String point_id = 'point_id';
	 point_id = point_id.replaceAll('_id','');
     getPath = widget.url! + point_id + 'page=%s';
	listing = new PointsAffiliateListing(AppProvider.getApplication(context), getPath, false, PointsAffiliateListingUninitialized());
    listing!.add(PointsAffiliateList());
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
    return BlocBuilder<PointsAffiliateListing, PointsAffiliateState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is PointsAffiliateListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is PointsAffiliateListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is PointsAffiliateListingLoaded) {
          if (state.points_affiliate!.items.items.isEmpty) {
		  if (state.points_affiliate!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.points_affiliate!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.points_affiliate!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.points_affiliate!.items.items.length
									  ?  UserPointsAffiliateListBottomLoader()
									  : state.points_affiliate!.viewItem (state.points_affiliate!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.points_affiliate!.items.items.length
									: state.points_affiliate!.items.items.length + 1,
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

								  return index >= state.points_affiliate!.items.items.length
									  ?  UserPointsAffiliateListBottomLoader()
									  : state.points_affiliate!.viewItem (state.points_affiliate!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.points_affiliate!.items.items.length
									: state.points_affiliate!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.points_affiliate!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(PointsAffiliateListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PointsAffiliateList());
    }

  }
}




abstract class PointsAffiliateEvent extends Equatable {
const PointsAffiliateEvent();
   @override
    List<Object> get props => [];
}

class PointsAffiliateList extends PointsAffiliateEvent {
  @override
  String toString() => 'PointsAffiliateList';
}

class PointsAffiliateListingRefresh extends PointsAffiliateEvent {
  @override
  String toString() => 'PointsAffiliateListingRefresh';
}

class PointsAffiliateListingChangeSearch extends PointsAffiliateEvent {
  @override
  String toString() => 'PointsAffiliateChangeSearch';
}


abstract class PointsAffiliateState extends Equatable {
  const PointsAffiliateState();
   @override
    List<Object> get props => [];
}

class PointsAffiliateListingUninitialized extends PointsAffiliateState {
  @override
  String toString() => 'PointsAffiliateListingUninitialized';
}

class PointsAffiliateListingError extends PointsAffiliateState {
  @override
  String toString() => 'PointsAffiliateListingError';
}

class PointsAffiliateListingLoaded extends PointsAffiliateState {
  final PointsAffiliateIndexModel? points_affiliate;
  final bool? hasReachedMax;
  final int?  page;

  PointsAffiliateListingLoaded({
    this.points_affiliate,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [points_affiliate!, hasReachedMax!, page!];
  
  PointsAffiliateListingLoaded copyWith({
    PointsAffiliateIndexModel? points_affiliate,
    bool? hasReachedMax,
    int? page,
  }) {
    return PointsAffiliateListingLoaded(
      points_affiliate: points_affiliate ?? this.points_affiliate,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PointsAffiliateListingLoaded  PointsAffiliateListing: ${ points_affiliate!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PointsAffiliateListing extends Bloc<PointsAffiliateEvent, PointsAffiliateState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PointsAffiliateListing(this.application, this.url, this.isSearch, PointsAffiliateState initialState):
  super(initialState){
     on<PointsAffiliateList>(_PointsAffiliateListEvent);
	 on<PointsAffiliateListingRefresh>(_PointsAffiliateListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PointsAffiliateEvent, PointsAffiliateState>> transformEvents(
      Stream<PointsAffiliateEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<PointsAffiliateEvent> transform<PointsAffiliateEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PointsAffiliateEvent, PointsAffiliateState> transition) {
    print(transition);
  }


  void _PointsAffiliateListEvent(PointsAffiliateList event, Emitter<PointsAffiliateState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsAffiliateListingUninitialized){
			  if(isSearch){
			     PointsAffiliateIndexModel points_affiliate = await listingSearchPointsAffiliate(1);
				  int deltaPage = points_affiliate.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (PointsAffiliateListingLoaded(points_affiliate: points_affiliate,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  PointsAffiliateIndexModel points_affiliate = await listingPointsAffiliate(1);
				  int deltaPage = points_affiliate.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (PointsAffiliateListingLoaded(points_affiliate: points_affiliate,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is PointsAffiliateListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PointsAffiliateListingLoaded).page! + 1;
				  PointsAffiliateIndexModel points_affiliate = await listingPointsAffiliate(page);
				  if(!points_affiliate.items.items.isEmpty){
				     (currentState as PointsAffiliateListingLoaded).points_affiliate!.items.items.addAll(points_affiliate.items.items);
				  }
				  return emit (points_affiliate.items.items.isEmpty
					  ? (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PointsAffiliateListingLoaded(  points_affiliate:  (currentState as PointsAffiliateListingLoaded).points_affiliate ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as PointsAffiliateListingLoaded).page! + 1;
				  PointsAffiliateIndexModel points_affiliate = await listingPointsAffiliate(page);
				  return emit ( points_affiliate.items.items.isEmpty
					  ? (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PointsAffiliateListingLoaded(  points_affiliate:  points_affiliate ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( PointsAffiliateListingError());
      }
    }
  }

  void _PointsAffiliateListingRefreshEvent(PointsAffiliateListingRefresh event, Emitter<PointsAffiliateState> emit)async{
  final currentState = state;
    try {
        if (currentState is PointsAffiliateListingUninitialized) {
		   if(isSearch){
		      PointsAffiliateIndexModel points_affiliate = await listingSearchPointsAffiliate(1);
              return emit (PointsAffiliateListingLoaded( points_affiliate: points_affiliate,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     PointsAffiliateIndexModel points_affiliate = await listingPointsAffiliate(1);
             return emit (PointsAffiliateListingLoaded( points_affiliate: points_affiliate,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is PointsAffiliateListingLoaded) {
		  if(isSearch){
		     PointsAffiliateIndexModel points_affiliate = await listingSearchRefreshPointsAffiliate();
              return emit ( points_affiliate.items.items.isEmpty
              ? (currentState as PointsAffiliateListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsAffiliateListingLoaded(  points_affiliate: points_affiliate ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      PointsAffiliateIndexModel points_affiliate = await listingRefreshPointsAffiliate();
              return emit ( points_affiliate.items.items.isEmpty
              ? (currentState as PointsAffiliateListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsAffiliateListingLoaded(  points_affiliate: points_affiliate ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PointsAffiliateListingError());
      }
  }

  @override
  get initialState => PointsAffiliateListingUninitialized();

  @override

  Stream<PointsAffiliateState> mapEventToState(PointsAffiliateEvent event) async* {
    final currentState = state;
    if (event is PointsAffiliateList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PointsAffiliateListingUninitialized){
			  if(isSearch){
			     PointsAffiliateIndexModel points_affiliate = await listingSearchPointsAffiliate(1);
				  int deltaPage = points_affiliate.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PointsAffiliateListingLoaded(points_affiliate: points_affiliate,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  PointsAffiliateIndexModel points_affiliate = await listingPointsAffiliate(1);
				  int deltaPage = points_affiliate.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PointsAffiliateListingLoaded(points_affiliate: points_affiliate,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is PointsAffiliateListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PointsAffiliateListingLoaded).page! + 1;
				  PointsAffiliateIndexModel points_affiliate = await listingPointsAffiliate(page);
				  if(!points_affiliate.items.items.isEmpty){
				     (currentState as PointsAffiliateListingLoaded).points_affiliate!.items.items.addAll(points_affiliate.items.items);
				  }
				  yield points_affiliate.items.items.isEmpty
					  ? (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PointsAffiliateListingLoaded(  points_affiliate:  (currentState as PointsAffiliateListingLoaded).points_affiliate ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as PointsAffiliateListingLoaded).page! + 1;
				  PointsAffiliateIndexModel points_affiliate = await listingPointsAffiliate(page);
				  yield points_affiliate.items.items.isEmpty
					  ? (currentState as PointsAffiliateListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PointsAffiliateListingLoaded(  points_affiliate:  points_affiliate ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield PointsAffiliateListingError();
      }
    } else if (event is PointsAffiliateListingRefresh){
      try {
        if (currentState is PointsAffiliateListingUninitialized) {
		   if(isSearch){
		      PointsAffiliateIndexModel points_affiliate = await listingSearchPointsAffiliate(1);
              yield PointsAffiliateListingLoaded( points_affiliate: points_affiliate,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     PointsAffiliateIndexModel points_affiliate = await listingPointsAffiliate(1);
             yield PointsAffiliateListingLoaded( points_affiliate: points_affiliate,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is PointsAffiliateListingLoaded) {
		  if(isSearch){
		     PointsAffiliateIndexModel points_affiliate = await listingSearchRefreshPointsAffiliate();
              yield points_affiliate.items.items.isEmpty
              ? (currentState as PointsAffiliateListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsAffiliateListingLoaded(  points_affiliate: points_affiliate ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      PointsAffiliateIndexModel points_affiliate = await listingRefreshPointsAffiliate();
              yield points_affiliate.items.items.isEmpty
              ? (currentState as PointsAffiliateListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PointsAffiliateListingLoaded(  points_affiliate: points_affiliate ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PointsAffiliateListingError();
      }

    }
  }



  bool hasReachedMax(PointsAffiliateState state) =>
      state is PointsAffiliateListingLoaded && state.hasReachedMax!;


  Future<PointsAffiliateIndexModel> listingPointsAffiliate(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = PointsAffiliateIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsAffiliateListSearch(dt ,'',page);
	
	return data;
  }

  Future<PointsAffiliateIndexModel> listingRefreshPointsAffiliate() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PointsAffiliateIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsAffiliateListSearch(dt ,'',page);
	
	return data;
  }

  Future<PointsAffiliateIndexModel> listingSearchPointsAffiliate(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = PointsAffiliateIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsAffiliateListSearch(dt ,'',page);	
	return data;
  }

  Future<PointsAffiliateIndexModel> listingSearchRefreshPointsAffiliate() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PointsAffiliateIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePointsAffiliateListSearch(dt ,'',page);
	
	return data;
  }
}


Future<PointsAffiliateIndexModel> _loadAndSavePointsAffiliateListSearch(PointsAffiliateIndexModel list, String searchKey, int page) async{

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


class  UserPointsAffiliateListBottomLoader extends StatelessWidget {
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








  

















  

