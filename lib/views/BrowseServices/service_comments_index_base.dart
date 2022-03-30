
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



class ServiceCommentsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ServiceCommentsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ServiceCommentsIndexBaseState createState() => ServiceCommentsIndexBaseState();
}

class  ServiceCommentsIndexBaseState extends State<ServiceCommentsIndexBase>{
  String title = 'ServiceComments'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  ServiceCommentsListing? listing;

  ServiceCommentsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String service_post_id = 'service_post_id';
	 service_post_id = service_post_id.replaceAll('_id','');
     getPath = widget.url! + service_post_id + 'page=%s';
	listing = new ServiceCommentsListing(AppProvider.getApplication(context), getPath, false, ServiceCommentsListingUninitialized());
    listing!.add(ServiceCommentsList());
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
    return BlocBuilder<ServiceCommentsListing, ServiceCommentsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is ServiceCommentsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is ServiceCommentsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is ServiceCommentsListingLoaded) {
          if (state.service_comments!.items.items.isEmpty) {
		  if (state.service_comments!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.service_comments!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.service_comments!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.service_comments!.items.items.length
									  ?  UserServiceCommentsListBottomLoader()
									  : state.service_comments!.viewItem (state.service_comments!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.service_comments!.items.items.length
									: state.service_comments!.items.items.length + 1,
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

								  return index >= state.service_comments!.items.items.length
									  ?  UserServiceCommentsListBottomLoader()
									  : state.service_comments!.viewItem (state.service_comments!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.service_comments!.items.items.length
									: state.service_comments!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.service_comments!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(ServiceCommentsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ServiceCommentsList());
    }

  }
}




abstract class ServiceCommentsEvent extends Equatable {
const ServiceCommentsEvent();
   @override
    List<Object> get props => [];
}

class ServiceCommentsList extends ServiceCommentsEvent {
  @override
  String toString() => 'ServiceCommentsList';
}

class ServiceCommentsListingRefresh extends ServiceCommentsEvent {
  @override
  String toString() => 'ServiceCommentsListingRefresh';
}

class ServiceCommentsListingChangeSearch extends ServiceCommentsEvent {
  @override
  String toString() => 'ServiceCommentsChangeSearch';
}


abstract class ServiceCommentsState extends Equatable {
  const ServiceCommentsState();
   @override
    List<Object> get props => [];
}

class ServiceCommentsListingUninitialized extends ServiceCommentsState {
  @override
  String toString() => 'ServiceCommentsListingUninitialized';
}

class ServiceCommentsListingError extends ServiceCommentsState {
  @override
  String toString() => 'ServiceCommentsListingError';
}

class ServiceCommentsListingLoaded extends ServiceCommentsState {
  final ServiceCommentsIndexModel? service_comments;
  final bool? hasReachedMax;
  final int?  page;

  ServiceCommentsListingLoaded({
    this.service_comments,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [service_comments!, hasReachedMax!, page!];
  
  ServiceCommentsListingLoaded copyWith({
    ServiceCommentsIndexModel? service_comments,
    bool? hasReachedMax,
    int? page,
  }) {
    return ServiceCommentsListingLoaded(
      service_comments: service_comments ?? this.service_comments,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ServiceCommentsListingLoaded  ServiceCommentsListing: ${ service_comments!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ServiceCommentsListing extends Bloc<ServiceCommentsEvent, ServiceCommentsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ServiceCommentsListing(this.application, this.url, this.isSearch, ServiceCommentsState initialState):
  super(initialState){
     on<ServiceCommentsList>(_ServiceCommentsListEvent);
	 on<ServiceCommentsListingRefresh>(_ServiceCommentsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ServiceCommentsEvent, ServiceCommentsState>> transformEvents(
      Stream<ServiceCommentsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<ServiceCommentsEvent> transform<ServiceCommentsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ServiceCommentsEvent, ServiceCommentsState> transition) {
    print(transition);
  }


  void _ServiceCommentsListEvent(ServiceCommentsList event, Emitter<ServiceCommentsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is ServiceCommentsListingUninitialized){
			  if(isSearch){
			     ServiceCommentsIndexModel service_comments = await listingSearchServiceComments(1);
				  int deltaPage = service_comments.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (ServiceCommentsListingLoaded(service_comments: service_comments,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  ServiceCommentsIndexModel service_comments = await listingServiceComments(1);
				  int deltaPage = service_comments.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (ServiceCommentsListingLoaded(service_comments: service_comments,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ServiceCommentsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ServiceCommentsListingLoaded).page! + 1;
				  ServiceCommentsIndexModel service_comments = await listingServiceComments(page);
				  if(!service_comments.items.items.isEmpty){
				     (currentState as ServiceCommentsListingLoaded).service_comments!.items.items.addAll(service_comments.items.items);
				  }
				  return emit (service_comments.items.items.isEmpty
					  ? (currentState as ServiceCommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ServiceCommentsListingLoaded(  service_comments:  (currentState as ServiceCommentsListingLoaded).service_comments ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as ServiceCommentsListingLoaded).page! + 1;
				  ServiceCommentsIndexModel service_comments = await listingServiceComments(page);
				  return emit ( service_comments.items.items.isEmpty
					  ? (currentState as ServiceCommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ServiceCommentsListingLoaded(  service_comments:  service_comments ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( ServiceCommentsListingError());
      }
    }
  }

  void _ServiceCommentsListingRefreshEvent(ServiceCommentsListingRefresh event, Emitter<ServiceCommentsState> emit)async{
  final currentState = state;
    try {
        if (currentState is ServiceCommentsListingUninitialized) {
		   if(isSearch){
		      ServiceCommentsIndexModel service_comments = await listingSearchServiceComments(1);
              return emit (ServiceCommentsListingLoaded( service_comments: service_comments,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     ServiceCommentsIndexModel service_comments = await listingServiceComments(1);
             return emit (ServiceCommentsListingLoaded( service_comments: service_comments,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is ServiceCommentsListingLoaded) {
		  if(isSearch){
		     ServiceCommentsIndexModel service_comments = await listingSearchRefreshServiceComments();
              return emit ( service_comments.items.items.isEmpty
              ? (currentState as ServiceCommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServiceCommentsListingLoaded(  service_comments: service_comments ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      ServiceCommentsIndexModel service_comments = await listingRefreshServiceComments();
              return emit ( service_comments.items.items.isEmpty
              ? (currentState as ServiceCommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServiceCommentsListingLoaded(  service_comments: service_comments ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ServiceCommentsListingError());
      }
  }

  @override
  get initialState => ServiceCommentsListingUninitialized();

  @override

  Stream<ServiceCommentsState> mapEventToState(ServiceCommentsEvent event) async* {
    final currentState = state;
    if (event is ServiceCommentsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ServiceCommentsListingUninitialized){
			  if(isSearch){
			     ServiceCommentsIndexModel service_comments = await listingSearchServiceComments(1);
				  int deltaPage = service_comments.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ServiceCommentsListingLoaded(service_comments: service_comments,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ServiceCommentsIndexModel service_comments = await listingServiceComments(1);
				  int deltaPage = service_comments.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ServiceCommentsListingLoaded(service_comments: service_comments,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ServiceCommentsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ServiceCommentsListingLoaded).page! + 1;
				  ServiceCommentsIndexModel service_comments = await listingServiceComments(page);
				  if(!service_comments.items.items.isEmpty){
				     (currentState as ServiceCommentsListingLoaded).service_comments!.items.items.addAll(service_comments.items.items);
				  }
				  yield service_comments.items.items.isEmpty
					  ? (currentState as ServiceCommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ServiceCommentsListingLoaded(  service_comments:  (currentState as ServiceCommentsListingLoaded).service_comments ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as ServiceCommentsListingLoaded).page! + 1;
				  ServiceCommentsIndexModel service_comments = await listingServiceComments(page);
				  yield service_comments.items.items.isEmpty
					  ? (currentState as ServiceCommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ServiceCommentsListingLoaded(  service_comments:  service_comments ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield ServiceCommentsListingError();
      }
    } else if (event is ServiceCommentsListingRefresh){
      try {
        if (currentState is ServiceCommentsListingUninitialized) {
		   if(isSearch){
		      ServiceCommentsIndexModel service_comments = await listingSearchServiceComments(1);
              yield ServiceCommentsListingLoaded( service_comments: service_comments,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ServiceCommentsIndexModel service_comments = await listingServiceComments(1);
             yield ServiceCommentsListingLoaded( service_comments: service_comments,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ServiceCommentsListingLoaded) {
		  if(isSearch){
		     ServiceCommentsIndexModel service_comments = await listingSearchRefreshServiceComments();
              yield service_comments.items.items.isEmpty
              ? (currentState as ServiceCommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServiceCommentsListingLoaded(  service_comments: service_comments ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ServiceCommentsIndexModel service_comments = await listingRefreshServiceComments();
              yield service_comments.items.items.isEmpty
              ? (currentState as ServiceCommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServiceCommentsListingLoaded(  service_comments: service_comments ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ServiceCommentsListingError();
      }

    }
  }



  bool hasReachedMax(ServiceCommentsState state) =>
      state is ServiceCommentsListingLoaded && state.hasReachedMax!;


  Future<ServiceCommentsIndexModel> listingServiceComments(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ServiceCommentsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServiceCommentsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ServiceCommentsIndexModel> listingRefreshServiceComments() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ServiceCommentsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServiceCommentsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ServiceCommentsIndexModel> listingSearchServiceComments(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ServiceCommentsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServiceCommentsListSearch(dt ,'',page);	
	return data;
  }

  Future<ServiceCommentsIndexModel> listingSearchRefreshServiceComments() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ServiceCommentsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServiceCommentsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ServiceCommentsIndexModel> _loadAndSaveServiceCommentsListSearch(ServiceCommentsIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.service_post_id;
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
    }
    return list;
 }


class  UserServiceCommentsListBottomLoader extends StatelessWidget {
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








  

















  

