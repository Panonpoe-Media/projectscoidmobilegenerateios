
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



class ServicesIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ServicesIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ServicesIndexBaseState createState() => ServicesIndexBaseState();
}

class  ServicesIndexBaseState extends State<ServicesIndexBase>{
  String title = 'Services'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  ServicesListing? listing;

  ServicesIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String service_id = 'service_id';
	 service_id = service_id.replaceAll('_id','');
     getPath = widget.url! + service_id + 'page=%s';
	listing = new ServicesListing(AppProvider.getApplication(context), getPath, false, ServicesListingUninitialized());
    listing!.add(ServicesList());
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
    return BlocBuilder<ServicesListing, ServicesState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is ServicesListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is ServicesListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is ServicesListingLoaded) {
          if (state.services!.items.items.isEmpty) {
		  if (state.services!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.services!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.services!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.services!.items.items.length
									  ?  PublicServicesListBottomLoader()
									  : state.services!.viewItem (state.services!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.services!.items.items.length
									: state.services!.items.items.length + 1,
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

								  return index >= state.services!.items.items.length
									  ?  PublicServicesListBottomLoader()
									  : state.services!.viewItem (state.services!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.services!.items.items.length
									: state.services!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.services!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(ServicesListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ServicesList());
    }

  }
}




abstract class ServicesEvent extends Equatable {
const ServicesEvent();
   @override
    List<Object> get props => [];
}

class ServicesList extends ServicesEvent {
  @override
  String toString() => 'ServicesList';
}

class ServicesListingRefresh extends ServicesEvent {
  @override
  String toString() => 'ServicesListingRefresh';
}

class ServicesListingChangeSearch extends ServicesEvent {
  @override
  String toString() => 'ServicesChangeSearch';
}


abstract class ServicesState extends Equatable {
  const ServicesState();
   @override
    List<Object> get props => [];
}

class ServicesListingUninitialized extends ServicesState {
  @override
  String toString() => 'ServicesListingUninitialized';
}

class ServicesListingError extends ServicesState {
  @override
  String toString() => 'ServicesListingError';
}

class ServicesListingLoaded extends ServicesState {
  final ServicesIndexModel? services;
  final bool? hasReachedMax;
  final int?  page;

  ServicesListingLoaded({
    this.services,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [services!, hasReachedMax!, page!];
  
  ServicesListingLoaded copyWith({
    ServicesIndexModel? services,
    bool? hasReachedMax,
    int? page,
  }) {
    return ServicesListingLoaded(
      services: services ?? this.services,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ServicesListingLoaded  ServicesListing: ${ services!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ServicesListing extends Bloc<ServicesEvent, ServicesState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ServicesListing(this.application, this.url, this.isSearch, ServicesState initialState):
  super(initialState){
     on<ServicesList>(_ServicesListEvent);
	 on<ServicesListingRefresh>(_ServicesListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ServicesEvent, ServicesState>> transformEvents(
      Stream<ServicesEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<ServicesEvent> transform<ServicesEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ServicesEvent, ServicesState> transition) {
    print(transition);
  }


  void _ServicesListEvent(ServicesList event, Emitter<ServicesState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is ServicesListingUninitialized){
			  if(isSearch){
			     ServicesIndexModel services = await listingSearchServices(1);
				  int deltaPage = services.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (ServicesListingLoaded(services: services,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  ServicesIndexModel services = await listingServices(1);
				  int deltaPage = services.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (ServicesListingLoaded(services: services,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ServicesListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ServicesListingLoaded).page! + 1;
				  ServicesIndexModel services = await listingServices(page);
				  if(!services.items.items.isEmpty){
				     (currentState as ServicesListingLoaded).services!.items.items.addAll(services.items.items);
				  }
				  return emit (services.items.items.isEmpty
					  ? (currentState as ServicesListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ServicesListingLoaded(  services:  (currentState as ServicesListingLoaded).services ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as ServicesListingLoaded).page! + 1;
				  ServicesIndexModel services = await listingServices(page);
				  return emit ( services.items.items.isEmpty
					  ? (currentState as ServicesListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ServicesListingLoaded(  services:  services ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( ServicesListingError());
      }
    }
  }

  void _ServicesListingRefreshEvent(ServicesListingRefresh event, Emitter<ServicesState> emit)async{
  final currentState = state;
    try {
        if (currentState is ServicesListingUninitialized) {
		   if(isSearch){
		      ServicesIndexModel services = await listingSearchServices(1);
              return emit (ServicesListingLoaded( services: services,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     ServicesIndexModel services = await listingServices(1);
             return emit (ServicesListingLoaded( services: services,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is ServicesListingLoaded) {
		  if(isSearch){
		     ServicesIndexModel services = await listingSearchRefreshServices();
              return emit ( services.items.items.isEmpty
              ? (currentState as ServicesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServicesListingLoaded(  services: services ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      ServicesIndexModel services = await listingRefreshServices();
              return emit ( services.items.items.isEmpty
              ? (currentState as ServicesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServicesListingLoaded(  services: services ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ServicesListingError());
      }
  }

  @override
  get initialState => ServicesListingUninitialized();

  @override

  Stream<ServicesState> mapEventToState(ServicesEvent event) async* {
    final currentState = state;
    if (event is ServicesList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ServicesListingUninitialized){
			  if(isSearch){
			     ServicesIndexModel services = await listingSearchServices(1);
				  int deltaPage = services.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ServicesListingLoaded(services: services,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ServicesIndexModel services = await listingServices(1);
				  int deltaPage = services.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ServicesListingLoaded(services: services,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ServicesListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ServicesListingLoaded).page! + 1;
				  ServicesIndexModel services = await listingServices(page);
				  if(!services.items.items.isEmpty){
				     (currentState as ServicesListingLoaded).services!.items.items.addAll(services.items.items);
				  }
				  yield services.items.items.isEmpty
					  ? (currentState as ServicesListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ServicesListingLoaded(  services:  (currentState as ServicesListingLoaded).services ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as ServicesListingLoaded).page! + 1;
				  ServicesIndexModel services = await listingServices(page);
				  yield services.items.items.isEmpty
					  ? (currentState as ServicesListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ServicesListingLoaded(  services:  services ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield ServicesListingError();
      }
    } else if (event is ServicesListingRefresh){
      try {
        if (currentState is ServicesListingUninitialized) {
		   if(isSearch){
		      ServicesIndexModel services = await listingSearchServices(1);
              yield ServicesListingLoaded( services: services,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ServicesIndexModel services = await listingServices(1);
             yield ServicesListingLoaded( services: services,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ServicesListingLoaded) {
		  if(isSearch){
		     ServicesIndexModel services = await listingSearchRefreshServices();
              yield services.items.items.isEmpty
              ? (currentState as ServicesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServicesListingLoaded(  services: services ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ServicesIndexModel services = await listingRefreshServices();
              yield services.items.items.isEmpty
              ? (currentState as ServicesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ServicesListingLoaded(  services: services ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ServicesListingError();
      }

    }
  }



  bool hasReachedMax(ServicesState state) =>
      state is ServicesListingLoaded && state.hasReachedMax!;


  Future<ServicesIndexModel> listingServices(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ServicesIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServicesListSearch(dt ,'',page);
	
	return data;
  }

  Future<ServicesIndexModel> listingRefreshServices() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ServicesIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServicesListSearch(dt ,'',page);
	
	return data;
  }

  Future<ServicesIndexModel> listingSearchServices(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ServicesIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServicesListSearch(dt ,'',page);	
	return data;
  }

  Future<ServicesIndexModel> listingSearchRefreshServices() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ServicesIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveServicesListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ServicesIndexModel> _loadAndSaveServicesListSearch(ServicesIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.service_id;
	  list.items.items[i].item.pht = list.items.items[i].item.logo_url;
	  list.items.items[i].item.ttl = list.items.items[i].item.title;
    }
    return list;
 }


class  PublicServicesListBottomLoader extends StatelessWidget {
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








  

















  

