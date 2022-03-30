
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



class PortofolioIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  PortofolioIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  PortofolioIndexBaseState createState() => PortofolioIndexBaseState();
}

class  PortofolioIndexBaseState extends State<PortofolioIndexBase>{
  String title = 'Portofolio'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  PortofolioListing? listing;

  PortofolioIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String portofolio_id = 'portofolio_id';
	 portofolio_id = portofolio_id.replaceAll('_id','');
     getPath = widget.url! + portofolio_id + 'page=%s';
	listing = new PortofolioListing(AppProvider.getApplication(context), getPath, false, PortofolioListingUninitialized());
    listing!.add(PortofolioList());
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
    return BlocBuilder<PortofolioListing, PortofolioState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is PortofolioListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is PortofolioListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is PortofolioListingLoaded) {
          if (state.portofolio!.items.items.isEmpty) {
		  if (state.portofolio!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.portofolio!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.portofolio!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.portofolio!.items.items.length
									  ?  UserPortofolioListBottomLoader()
									  : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.portofolio!.items.items.length
									: state.portofolio!.items.items.length + 1,
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

								  return index >= state.portofolio!.items.items.length
									  ?  UserPortofolioListBottomLoader()
									  : state.portofolio!.viewItem (state.portofolio!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.portofolio!.items.items.length
									: state.portofolio!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.portofolio!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(PortofolioListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(PortofolioList());
    }

  }
}




abstract class PortofolioEvent extends Equatable {
const PortofolioEvent();
   @override
    List<Object> get props => [];
}

class PortofolioList extends PortofolioEvent {
  @override
  String toString() => 'PortofolioList';
}

class PortofolioListingRefresh extends PortofolioEvent {
  @override
  String toString() => 'PortofolioListingRefresh';
}

class PortofolioListingChangeSearch extends PortofolioEvent {
  @override
  String toString() => 'PortofolioChangeSearch';
}


abstract class PortofolioState extends Equatable {
  const PortofolioState();
   @override
    List<Object> get props => [];
}

class PortofolioListingUninitialized extends PortofolioState {
  @override
  String toString() => 'PortofolioListingUninitialized';
}

class PortofolioListingError extends PortofolioState {
  @override
  String toString() => 'PortofolioListingError';
}

class PortofolioListingLoaded extends PortofolioState {
  final PortofolioIndexModel? portofolio;
  final bool? hasReachedMax;
  final int?  page;

  PortofolioListingLoaded({
    this.portofolio,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [portofolio!, hasReachedMax!, page!];
  
  PortofolioListingLoaded copyWith({
    PortofolioIndexModel? portofolio,
    bool? hasReachedMax,
    int? page,
  }) {
    return PortofolioListingLoaded(
      portofolio: portofolio ?? this.portofolio,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PortofolioListingLoaded  PortofolioListing: ${ portofolio!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class PortofolioListing extends Bloc<PortofolioEvent, PortofolioState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  PortofolioListing(this.application, this.url, this.isSearch, PortofolioState initialState):
  super(initialState){
     on<PortofolioList>(_PortofolioListEvent);
	 on<PortofolioListingRefresh>(_PortofolioListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<PortofolioEvent, PortofolioState>> transformEvents(
      Stream<PortofolioEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<PortofolioEvent> transform<PortofolioEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<PortofolioEvent, PortofolioState> transition) {
    print(transition);
  }


  void _PortofolioListEvent(PortofolioList event, Emitter<PortofolioState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is PortofolioListingUninitialized){
			  if(isSearch){
			     PortofolioIndexModel portofolio = await listingSearchPortofolio(1);
				  int deltaPage = portofolio.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (PortofolioListingLoaded(portofolio: portofolio,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  PortofolioIndexModel portofolio = await listingPortofolio(1);
				  int deltaPage = portofolio.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (PortofolioListingLoaded(portofolio: portofolio,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is PortofolioListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PortofolioListingLoaded).page! + 1;
				  PortofolioIndexModel portofolio = await listingPortofolio(page);
				  if(!portofolio.items.items.isEmpty){
				     (currentState as PortofolioListingLoaded).portofolio!.items.items.addAll(portofolio.items.items);
				  }
				  return emit (portofolio.items.items.isEmpty
					  ? (currentState as PortofolioListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PortofolioListingLoaded(  portofolio:  (currentState as PortofolioListingLoaded).portofolio ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as PortofolioListingLoaded).page! + 1;
				  PortofolioIndexModel portofolio = await listingPortofolio(page);
				  return emit ( portofolio.items.items.isEmpty
					  ? (currentState as PortofolioListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PortofolioListingLoaded(  portofolio:  portofolio ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( PortofolioListingError());
      }
    }
  }

  void _PortofolioListingRefreshEvent(PortofolioListingRefresh event, Emitter<PortofolioState> emit)async{
  final currentState = state;
    try {
        if (currentState is PortofolioListingUninitialized) {
		   if(isSearch){
		      PortofolioIndexModel portofolio = await listingSearchPortofolio(1);
              return emit (PortofolioListingLoaded( portofolio: portofolio,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     PortofolioIndexModel portofolio = await listingPortofolio(1);
             return emit (PortofolioListingLoaded( portofolio: portofolio,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is PortofolioListingLoaded) {
		  if(isSearch){
		     PortofolioIndexModel portofolio = await listingSearchRefreshPortofolio();
              return emit ( portofolio.items.items.isEmpty
              ? (currentState as PortofolioListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PortofolioListingLoaded(  portofolio: portofolio ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      PortofolioIndexModel portofolio = await listingRefreshPortofolio();
              return emit ( portofolio.items.items.isEmpty
              ? (currentState as PortofolioListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PortofolioListingLoaded(  portofolio: portofolio ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (PortofolioListingError());
      }
  }

  @override
  get initialState => PortofolioListingUninitialized();

  @override

  Stream<PortofolioState> mapEventToState(PortofolioEvent event) async* {
    final currentState = state;
    if (event is PortofolioList && !hasReachedMax(currentState)) {
      try {
        if (currentState is PortofolioListingUninitialized){
			  if(isSearch){
			     PortofolioIndexModel portofolio = await listingSearchPortofolio(1);
				  int deltaPage = portofolio.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PortofolioListingLoaded(portofolio: portofolio,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  PortofolioIndexModel portofolio = await listingPortofolio(1);
				  int deltaPage = portofolio.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield PortofolioListingLoaded(portofolio: portofolio,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is PortofolioListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as PortofolioListingLoaded).page! + 1;
				  PortofolioIndexModel portofolio = await listingPortofolio(page);
				  if(!portofolio.items.items.isEmpty){
				     (currentState as PortofolioListingLoaded).portofolio!.items.items.addAll(portofolio.items.items);
				  }
				  yield portofolio.items.items.isEmpty
					  ? (currentState as PortofolioListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : PortofolioListingLoaded(  portofolio:  (currentState as PortofolioListingLoaded).portofolio ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as PortofolioListingLoaded).page! + 1;
				  PortofolioIndexModel portofolio = await listingPortofolio(page);
				  yield portofolio.items.items.isEmpty
					  ? (currentState as PortofolioListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : PortofolioListingLoaded(  portofolio:  portofolio ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield PortofolioListingError();
      }
    } else if (event is PortofolioListingRefresh){
      try {
        if (currentState is PortofolioListingUninitialized) {
		   if(isSearch){
		      PortofolioIndexModel portofolio = await listingSearchPortofolio(1);
              yield PortofolioListingLoaded( portofolio: portofolio,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     PortofolioIndexModel portofolio = await listingPortofolio(1);
             yield PortofolioListingLoaded( portofolio: portofolio,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is PortofolioListingLoaded) {
		  if(isSearch){
		     PortofolioIndexModel portofolio = await listingSearchRefreshPortofolio();
              yield portofolio.items.items.isEmpty
              ? (currentState as PortofolioListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PortofolioListingLoaded(  portofolio: portofolio ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      PortofolioIndexModel portofolio = await listingRefreshPortofolio();
              yield portofolio.items.items.isEmpty
              ? (currentState as PortofolioListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : PortofolioListingLoaded(  portofolio: portofolio ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield PortofolioListingError();
      }

    }
  }



  bool hasReachedMax(PortofolioState state) =>
      state is PortofolioListingLoaded && state.hasReachedMax!;


  Future<PortofolioIndexModel> listingPortofolio(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = PortofolioIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePortofolioListSearch(dt ,'',page);
	
	return data;
  }

  Future<PortofolioIndexModel> listingRefreshPortofolio() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = PortofolioIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePortofolioListSearch(dt ,'',page);
	
	return data;
  }

  Future<PortofolioIndexModel> listingSearchPortofolio(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = PortofolioIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePortofolioListSearch(dt ,'',page);	
	return data;
  }

  Future<PortofolioIndexModel> listingSearchRefreshPortofolio() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = PortofolioIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSavePortofolioListSearch(dt ,'',page);
	
	return data;
  }
}


Future<PortofolioIndexModel> _loadAndSavePortofolioListSearch(PortofolioIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.portofolio_id;
	  list.items.items[i].item.sbttl = list.items.items[i].item.description;
    }
    return list;
 }


class  UserPortofolioListBottomLoader extends StatelessWidget {
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








  

















  

