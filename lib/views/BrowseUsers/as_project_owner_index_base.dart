
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



class AsProjectOwnerIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  AsProjectOwnerIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  AsProjectOwnerIndexBaseState createState() => AsProjectOwnerIndexBaseState();
}

class  AsProjectOwnerIndexBaseState extends State<AsProjectOwnerIndexBase>{
  String title = 'AsProjectOwner'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  AsProjectOwnerListing? listing;

  AsProjectOwnerIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String project_id = 'project_id';
	 project_id = project_id.replaceAll('_id','');
     getPath = widget.url! + project_id + 'page=%s';
	listing = new AsProjectOwnerListing(AppProvider.getApplication(context), getPath, false, AsProjectOwnerListingUninitialized());
    listing!.add(AsProjectOwnerList());
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
    return BlocBuilder<AsProjectOwnerListing, AsProjectOwnerState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is AsProjectOwnerListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is AsProjectOwnerListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is AsProjectOwnerListingLoaded) {
          if (state.as_project_owner!.items.items.isEmpty) {
		  if (state.as_project_owner!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.as_project_owner!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.as_project_owner!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.as_project_owner!.items.items.length
									  ?  PublicAsProjectOwnerListBottomLoader()
									  : state.as_project_owner!.viewItem (state.as_project_owner!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.as_project_owner!.items.items.length
									: state.as_project_owner!.items.items.length + 1,
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

								  return index >= state.as_project_owner!.items.items.length
									  ?  PublicAsProjectOwnerListBottomLoader()
									  : state.as_project_owner!.viewItem (state.as_project_owner!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.as_project_owner!.items.items.length
									: state.as_project_owner!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.as_project_owner!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(AsProjectOwnerListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(AsProjectOwnerList());
    }

  }
}




abstract class AsProjectOwnerEvent extends Equatable {
const AsProjectOwnerEvent();
   @override
    List<Object> get props => [];
}

class AsProjectOwnerList extends AsProjectOwnerEvent {
  @override
  String toString() => 'AsProjectOwnerList';
}

class AsProjectOwnerListingRefresh extends AsProjectOwnerEvent {
  @override
  String toString() => 'AsProjectOwnerListingRefresh';
}

class AsProjectOwnerListingChangeSearch extends AsProjectOwnerEvent {
  @override
  String toString() => 'AsProjectOwnerChangeSearch';
}


abstract class AsProjectOwnerState extends Equatable {
  const AsProjectOwnerState();
   @override
    List<Object> get props => [];
}

class AsProjectOwnerListingUninitialized extends AsProjectOwnerState {
  @override
  String toString() => 'AsProjectOwnerListingUninitialized';
}

class AsProjectOwnerListingError extends AsProjectOwnerState {
  @override
  String toString() => 'AsProjectOwnerListingError';
}

class AsProjectOwnerListingLoaded extends AsProjectOwnerState {
  final AsProjectOwnerIndexModel? as_project_owner;
  final bool? hasReachedMax;
  final int?  page;

  AsProjectOwnerListingLoaded({
    this.as_project_owner,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [as_project_owner!, hasReachedMax!, page!];
  
  AsProjectOwnerListingLoaded copyWith({
    AsProjectOwnerIndexModel? as_project_owner,
    bool? hasReachedMax,
    int? page,
  }) {
    return AsProjectOwnerListingLoaded(
      as_project_owner: as_project_owner ?? this.as_project_owner,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'AsProjectOwnerListingLoaded  AsProjectOwnerListing: ${ as_project_owner!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class AsProjectOwnerListing extends Bloc<AsProjectOwnerEvent, AsProjectOwnerState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  AsProjectOwnerListing(this.application, this.url, this.isSearch, AsProjectOwnerState initialState):
  super(initialState){
     on<AsProjectOwnerList>(_AsProjectOwnerListEvent);
	 on<AsProjectOwnerListingRefresh>(_AsProjectOwnerListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<AsProjectOwnerEvent, AsProjectOwnerState>> transformEvents(
      Stream<AsProjectOwnerEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<AsProjectOwnerEvent> transform<AsProjectOwnerEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<AsProjectOwnerEvent, AsProjectOwnerState> transition) {
    print(transition);
  }


  void _AsProjectOwnerListEvent(AsProjectOwnerList event, Emitter<AsProjectOwnerState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is AsProjectOwnerListingUninitialized){
			  if(isSearch){
			     AsProjectOwnerIndexModel as_project_owner = await listingSearchAsProjectOwner(1);
				  int deltaPage = as_project_owner.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (AsProjectOwnerListingLoaded(as_project_owner: as_project_owner,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  AsProjectOwnerIndexModel as_project_owner = await listingAsProjectOwner(1);
				  int deltaPage = as_project_owner.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (AsProjectOwnerListingLoaded(as_project_owner: as_project_owner,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is AsProjectOwnerListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as AsProjectOwnerListingLoaded).page! + 1;
				  AsProjectOwnerIndexModel as_project_owner = await listingAsProjectOwner(page);
				  if(!as_project_owner.items.items.isEmpty){
				     (currentState as AsProjectOwnerListingLoaded).as_project_owner!.items.items.addAll(as_project_owner.items.items);
				  }
				  return emit (as_project_owner.items.items.isEmpty
					  ? (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : AsProjectOwnerListingLoaded(  as_project_owner:  (currentState as AsProjectOwnerListingLoaded).as_project_owner ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as AsProjectOwnerListingLoaded).page! + 1;
				  AsProjectOwnerIndexModel as_project_owner = await listingAsProjectOwner(page);
				  return emit ( as_project_owner.items.items.isEmpty
					  ? (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : AsProjectOwnerListingLoaded(  as_project_owner:  as_project_owner ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( AsProjectOwnerListingError());
      }
    }
  }

  void _AsProjectOwnerListingRefreshEvent(AsProjectOwnerListingRefresh event, Emitter<AsProjectOwnerState> emit)async{
  final currentState = state;
    try {
        if (currentState is AsProjectOwnerListingUninitialized) {
		   if(isSearch){
		      AsProjectOwnerIndexModel as_project_owner = await listingSearchAsProjectOwner(1);
              return emit (AsProjectOwnerListingLoaded( as_project_owner: as_project_owner,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     AsProjectOwnerIndexModel as_project_owner = await listingAsProjectOwner(1);
             return emit (AsProjectOwnerListingLoaded( as_project_owner: as_project_owner,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is AsProjectOwnerListingLoaded) {
		  if(isSearch){
		     AsProjectOwnerIndexModel as_project_owner = await listingSearchRefreshAsProjectOwner();
              return emit ( as_project_owner.items.items.isEmpty
              ? (currentState as AsProjectOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : AsProjectOwnerListingLoaded(  as_project_owner: as_project_owner ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      AsProjectOwnerIndexModel as_project_owner = await listingRefreshAsProjectOwner();
              return emit ( as_project_owner.items.items.isEmpty
              ? (currentState as AsProjectOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : AsProjectOwnerListingLoaded(  as_project_owner: as_project_owner ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (AsProjectOwnerListingError());
      }
  }

  @override
  get initialState => AsProjectOwnerListingUninitialized();

  @override

  Stream<AsProjectOwnerState> mapEventToState(AsProjectOwnerEvent event) async* {
    final currentState = state;
    if (event is AsProjectOwnerList && !hasReachedMax(currentState)) {
      try {
        if (currentState is AsProjectOwnerListingUninitialized){
			  if(isSearch){
			     AsProjectOwnerIndexModel as_project_owner = await listingSearchAsProjectOwner(1);
				  int deltaPage = as_project_owner.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield AsProjectOwnerListingLoaded(as_project_owner: as_project_owner,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  AsProjectOwnerIndexModel as_project_owner = await listingAsProjectOwner(1);
				  int deltaPage = as_project_owner.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield AsProjectOwnerListingLoaded(as_project_owner: as_project_owner,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is AsProjectOwnerListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as AsProjectOwnerListingLoaded).page! + 1;
				  AsProjectOwnerIndexModel as_project_owner = await listingAsProjectOwner(page);
				  if(!as_project_owner.items.items.isEmpty){
				     (currentState as AsProjectOwnerListingLoaded).as_project_owner!.items.items.addAll(as_project_owner.items.items);
				  }
				  yield as_project_owner.items.items.isEmpty
					  ? (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : AsProjectOwnerListingLoaded(  as_project_owner:  (currentState as AsProjectOwnerListingLoaded).as_project_owner ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as AsProjectOwnerListingLoaded).page! + 1;
				  AsProjectOwnerIndexModel as_project_owner = await listingAsProjectOwner(page);
				  yield as_project_owner.items.items.isEmpty
					  ? (currentState as AsProjectOwnerListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : AsProjectOwnerListingLoaded(  as_project_owner:  as_project_owner ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield AsProjectOwnerListingError();
      }
    } else if (event is AsProjectOwnerListingRefresh){
      try {
        if (currentState is AsProjectOwnerListingUninitialized) {
		   if(isSearch){
		      AsProjectOwnerIndexModel as_project_owner = await listingSearchAsProjectOwner(1);
              yield AsProjectOwnerListingLoaded( as_project_owner: as_project_owner,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     AsProjectOwnerIndexModel as_project_owner = await listingAsProjectOwner(1);
             yield AsProjectOwnerListingLoaded( as_project_owner: as_project_owner,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is AsProjectOwnerListingLoaded) {
		  if(isSearch){
		     AsProjectOwnerIndexModel as_project_owner = await listingSearchRefreshAsProjectOwner();
              yield as_project_owner.items.items.isEmpty
              ? (currentState as AsProjectOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : AsProjectOwnerListingLoaded(  as_project_owner: as_project_owner ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      AsProjectOwnerIndexModel as_project_owner = await listingRefreshAsProjectOwner();
              yield as_project_owner.items.items.isEmpty
              ? (currentState as AsProjectOwnerListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : AsProjectOwnerListingLoaded(  as_project_owner: as_project_owner ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield AsProjectOwnerListingError();
      }

    }
  }



  bool hasReachedMax(AsProjectOwnerState state) =>
      state is AsProjectOwnerListingLoaded && state.hasReachedMax!;


  Future<AsProjectOwnerIndexModel> listingAsProjectOwner(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = AsProjectOwnerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveAsProjectOwnerListSearch(dt ,'',page);
	
	return data;
  }

  Future<AsProjectOwnerIndexModel> listingRefreshAsProjectOwner() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = AsProjectOwnerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveAsProjectOwnerListSearch(dt ,'',page);
	
	return data;
  }

  Future<AsProjectOwnerIndexModel> listingSearchAsProjectOwner(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = AsProjectOwnerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveAsProjectOwnerListSearch(dt ,'',page);	
	return data;
  }

  Future<AsProjectOwnerIndexModel> listingSearchRefreshAsProjectOwner() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = AsProjectOwnerIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveAsProjectOwnerListSearch(dt ,'',page);
	
	return data;
  }
}


Future<AsProjectOwnerIndexModel> _loadAndSaveAsProjectOwnerListSearch(AsProjectOwnerIndexModel list, String searchKey, int page) async{

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


class  PublicAsProjectOwnerListBottomLoader extends StatelessWidget {
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








  

















  

