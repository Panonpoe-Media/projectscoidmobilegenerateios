
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



class ServiceReviewsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ServiceReviewsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ServiceReviewsIndexBaseState createState() => ServiceReviewsIndexBaseState();
}

class  ServiceReviewsIndexBaseState extends State<ServiceReviewsIndexBase>{
  String title = 'ServiceReviews'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  ServiceReviewsListing? listing;

  ServiceReviewsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String project_id = 'project_id';
	 project_id = project_id.replaceAll('_id','');
     getPath = widget.url! + project_id + 'page=%s';
	listing = new ServiceReviewsListing(AppProvider.getApplication(context), getPath, false, ServiceReviewsListingUninitialized());
    listing!.add(ServiceReviewsList());
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
    return BlocBuilder<ServiceReviewsListing, ServiceReviewsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is ServiceReviewsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is ServiceReviewsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is ServiceReviewsListingLoaded) {
          if (state.service_reviews!.items.items.isEmpty) {
		  if (state.service_reviews!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.service_reviews!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.service_reviews!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.service_reviews!.items.items.length
									  ?  UserServiceReviewsListBottomLoader()
									  : state.service_reviews!.viewItem (state.service_reviews!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.service_reviews!.items.items.length
									: state.service_reviews!.items.items.length + 1,
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

								  return index >= state.service_reviews!.items.items.length
									  ?  UserServiceReviewsListBottomLoader()
									  : state.service_reviews!.viewItem (state.service_reviews!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.service_reviews!.items.items.length
									: state.service_reviews!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.service_reviews!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(ServiceReviewsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ServiceReviewsList());
    }

  }
}




abstract class ServiceReviewsEvent extends Equatable {
const ServiceReviewsEvent();
   @override
    List<Object> get props => [];
}

class ServiceReviewsList extends ServiceReviewsEvent {
  @override
  String toString() => 'ServiceReviewsList';
}

class ServiceReviewsListingRefresh extends ServiceReviewsEvent {
  @override
  String toString() => 'ServiceReviewsListingRefresh';
}

class ServiceReviewsListingChangeSearch extends ServiceReviewsEvent {
  @override
  String toString() => 'ServiceReviewsChangeSearch';
}


abstract class ServiceReviewsState extends Equatable {
  const ServiceReviewsState();
   @override
    List<Object> get props => [];
}

class ServiceReviewsListingUninitialized extends ServiceReviewsState {
  @override
  String toString() => 'ServiceReviewsListingUninitialized';
}

class ServiceReviewsListingError extends ServiceReviewsState {
  @override
  String toString() => 'ServiceReviewsListingError';
}

class ServiceReviewsListingLoaded extends ServiceReviewsState {
  final ServiceReviewsIndexModel? service_reviews;
  final bool? hasReachedMax;
  final int?  page;

  ServiceReviewsListingLoaded({
    this.service_reviews,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [service_reviews!, hasReachedMax!, page!];
  
  ServiceReviewsListingLoaded copyWith({
    ServiceReviewsIndexModel? service_reviews,
    bool? hasReachedMax,
    int? page,
  }) {
    return ServiceReviewsListingLoaded(
      service_reviews: service_reviews ?? this.service_reviews,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ServiceReviewsListingLoaded  ServiceReviewsListing: ${ service_reviews!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ServiceReviewsListing extends Bloc<ServiceReviewsEvent, ServiceReviewsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ServiceReviewsListing(this.application, this.url, this.isSearch, ServiceReviewsState initialState):
  super(initialState){
     on<ServiceReviewsList>(_ServiceReviewsListEvent);
	 on<ServiceReviewsListingRefresh>(_ServiceReviewsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ServiceReviewsEvent, ServiceReviewsState>> transformEvents(
      Stream<ServiceReviewsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<ServiceReviewsEvent> transform<ServiceReviewsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ServiceReviewsEvent, ServiceReviewsState> transition) {
    print(transition);
  }


  void _ServiceReviewsListEvent(ServiceReviewsList event, Emitter<ServiceReviewsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is ServiceReviewsListingUninitialized){
			  if(isSearch){
			     ServiceReviewsIndexModel service_reviews = await listingSearchServiceReviews(1);
				  int deltaPage = service_reviews.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (ServiceReviewsListingLoaded(service_reviews: service_reviews,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  ServiceReviewsIndexModel service_reviews = await listingServiceReviews(1);
				  int deltaPage = service_reviews.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (ServiceReviewsListingLoaded(service_reviews: service_reviews,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ServiceReviewsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ServiceReviewsListingLoaded).page! + 1;
				  ServiceReviewsIndexModel service_reviews = await listingServiceReviews(page);
				  if(!service_reviews.items.items.isEmpty){
				     (currentState as ServiceReviewsListingLoaded).service_reviews!.items.items.addAll(service_reviews.items.items);
				  }
				  return emit (service_reviews.items.items.isEmpty
					  ? (currentState as ServiceReviewsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ServiceReviewsListingLoaded(  service_reviews:  (currentState as ServiceReviewsListingLoaded).service_reviews ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as ServiceReviewsListingLoaded).page! + 1;
				  ServiceReviewsIndexModel service_reviews = await listingServiceReviews(page);
				  return emit ( service_reviews.items.items.isEmpty
					  ? (currentState as ServiceReviewsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ServiceReviewsListingLoaded(  service_reviews:  service_reviews ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( ServiceReviewsListingError());
      }
    }
  }

  void _ServiceReviewsListingRefreshEvent(ServiceReviewsListingRefresh event, Emitter<ServiceReviewsState> emit)async{
  final currentState = state;
    try {
        if (currentState is ServiceReviewsListingUninitialized) {
		   if(isSearch){
		      ServiceReviewsIndexModel service_reviews = await listingSearchServiceReviews(1);
              return emit (ServiceReviewsListingLoaded( service_reviews: service_reviews,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     ServiceReviewsIndexModel service_reviews = await listingServiceReviews(1);
             return emit (ServiceReviewsListingLoaded( service_reviews: service_reviews,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is ServiceReviewsListingLoaded) {
		  if(isSearch){
		     ServiceReviewsIndexModel service_reviews = await listingSearchRefreshServiceReviews();
              return emit ( service_reviews.items.items.isEmpty
              ? (currentState as ServiceReviewsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServiceReviewsListingLoaded(  service_reviews: service_reviews ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      ServiceReviewsIndexModel service_reviews = await listingRefreshServiceReviews();
              return emit ( service_reviews.items.items.isEmpty
              ? (currentState as ServiceReviewsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServiceReviewsListingLoaded(  service_reviews: service_reviews ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ServiceReviewsListingError());
      }
  }

  @override
  get initialState => ServiceReviewsListingUninitialized();

  @override

  Stream<ServiceReviewsState> mapEventToState(ServiceReviewsEvent event) async* {
    final currentState = state;
    if (event is ServiceReviewsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ServiceReviewsListingUninitialized){
			  if(isSearch){
			     ServiceReviewsIndexModel service_reviews = await listingSearchServiceReviews(1);
				  int deltaPage = service_reviews.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ServiceReviewsListingLoaded(service_reviews: service_reviews,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ServiceReviewsIndexModel service_reviews = await listingServiceReviews(1);
				  int deltaPage = service_reviews.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ServiceReviewsListingLoaded(service_reviews: service_reviews,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ServiceReviewsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ServiceReviewsListingLoaded).page! + 1;
				  ServiceReviewsIndexModel service_reviews = await listingServiceReviews(page);
				  if(!service_reviews.items.items.isEmpty){
				     (currentState as ServiceReviewsListingLoaded).service_reviews!.items.items.addAll(service_reviews.items.items);
				  }
				  yield service_reviews.items.items.isEmpty
					  ? (currentState as ServiceReviewsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ServiceReviewsListingLoaded(  service_reviews:  (currentState as ServiceReviewsListingLoaded).service_reviews ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as ServiceReviewsListingLoaded).page! + 1;
				  ServiceReviewsIndexModel service_reviews = await listingServiceReviews(page);
				  yield service_reviews.items.items.isEmpty
					  ? (currentState as ServiceReviewsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ServiceReviewsListingLoaded(  service_reviews:  service_reviews ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield ServiceReviewsListingError();
      }
    } else if (event is ServiceReviewsListingRefresh){
      try {
        if (currentState is ServiceReviewsListingUninitialized) {
		   if(isSearch){
		      ServiceReviewsIndexModel service_reviews = await listingSearchServiceReviews(1);
              yield ServiceReviewsListingLoaded( service_reviews: service_reviews,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ServiceReviewsIndexModel service_reviews = await listingServiceReviews(1);
             yield ServiceReviewsListingLoaded( service_reviews: service_reviews,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ServiceReviewsListingLoaded) {
		  if(isSearch){
		     ServiceReviewsIndexModel service_reviews = await listingSearchRefreshServiceReviews();
              yield service_reviews.items.items.isEmpty
              ? (currentState as ServiceReviewsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServiceReviewsListingLoaded(  service_reviews: service_reviews ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ServiceReviewsIndexModel service_reviews = await listingRefreshServiceReviews();
              yield service_reviews.items.items.isEmpty
              ? (currentState as ServiceReviewsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServiceReviewsListingLoaded(  service_reviews: service_reviews ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ServiceReviewsListingError();
      }

    }
  }



  bool hasReachedMax(ServiceReviewsState state) =>
      state is ServiceReviewsListingLoaded && state.hasReachedMax!;


  Future<ServiceReviewsIndexModel> listingServiceReviews(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ServiceReviewsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServiceReviewsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ServiceReviewsIndexModel> listingRefreshServiceReviews() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ServiceReviewsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServiceReviewsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ServiceReviewsIndexModel> listingSearchServiceReviews(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ServiceReviewsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServiceReviewsListSearch(dt ,'',page);	
	return data;
  }

  Future<ServiceReviewsIndexModel> listingSearchRefreshServiceReviews() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ServiceReviewsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServiceReviewsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ServiceReviewsIndexModel> _loadAndSaveServiceReviewsListSearch(ServiceReviewsIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.project_id;
	  list.items.items[i].item.sbttl = list.items.items[i].item.worker_feedback;
    }
    return list;
 }


class  UserServiceReviewsListBottomLoader extends StatelessWidget {
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








  

















  

