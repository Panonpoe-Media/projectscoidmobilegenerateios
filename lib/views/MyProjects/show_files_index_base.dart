
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



class ShowFilesIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ShowFilesIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ShowFilesIndexBaseState createState() => ShowFilesIndexBaseState();
}

class  ShowFilesIndexBaseState extends State<ShowFilesIndexBase>{
  String title = 'ShowFiles'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  ShowFilesListing? listing;

  ShowFilesIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String post_id = 'post_id';
	 post_id = post_id.replaceAll('_id','');
     getPath = widget.url! + post_id + 'page=%s';
	listing = new ShowFilesListing(AppProvider.getApplication(context), getPath, false, ShowFilesListingUninitialized());
    listing!.add(ShowFilesList());
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
    return BlocBuilder<ShowFilesListing, ShowFilesState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is ShowFilesListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is ShowFilesListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is ShowFilesListingLoaded) {
          if (state.show_files!.items.items.isEmpty) {
		  if (state.show_files!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.show_files!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.show_files!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.show_files!.items.items.length
									  ?  UserShowFilesListBottomLoader()
									  : state.show_files!.viewItem (state.show_files!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.show_files!.items.items.length
									: state.show_files!.items.items.length + 1,
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

								  return index >= state.show_files!.items.items.length
									  ?  UserShowFilesListBottomLoader()
									  : state.show_files!.viewItem (state.show_files!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.show_files!.items.items.length
									: state.show_files!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.show_files!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(ShowFilesListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ShowFilesList());
    }

  }
}




abstract class ShowFilesEvent extends Equatable {
const ShowFilesEvent();
   @override
    List<Object> get props => [];
}

class ShowFilesList extends ShowFilesEvent {
  @override
  String toString() => 'ShowFilesList';
}

class ShowFilesListingRefresh extends ShowFilesEvent {
  @override
  String toString() => 'ShowFilesListingRefresh';
}

class ShowFilesListingChangeSearch extends ShowFilesEvent {
  @override
  String toString() => 'ShowFilesChangeSearch';
}


abstract class ShowFilesState extends Equatable {
  const ShowFilesState();
   @override
    List<Object> get props => [];
}

class ShowFilesListingUninitialized extends ShowFilesState {
  @override
  String toString() => 'ShowFilesListingUninitialized';
}

class ShowFilesListingError extends ShowFilesState {
  @override
  String toString() => 'ShowFilesListingError';
}

class ShowFilesListingLoaded extends ShowFilesState {
  final ShowFilesIndexModel? show_files;
  final bool? hasReachedMax;
  final int?  page;

  ShowFilesListingLoaded({
    this.show_files,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [show_files!, hasReachedMax!, page!];
  
  ShowFilesListingLoaded copyWith({
    ShowFilesIndexModel? show_files,
    bool? hasReachedMax,
    int? page,
  }) {
    return ShowFilesListingLoaded(
      show_files: show_files ?? this.show_files,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ShowFilesListingLoaded  ShowFilesListing: ${ show_files!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ShowFilesListing extends Bloc<ShowFilesEvent, ShowFilesState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ShowFilesListing(this.application, this.url, this.isSearch, ShowFilesState initialState):
  super(initialState){
     on<ShowFilesList>(_ShowFilesListEvent);
	 on<ShowFilesListingRefresh>(_ShowFilesListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ShowFilesEvent, ShowFilesState>> transformEvents(
      Stream<ShowFilesEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<ShowFilesEvent> transform<ShowFilesEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ShowFilesEvent, ShowFilesState> transition) {
    print(transition);
  }


  void _ShowFilesListEvent(ShowFilesList event, Emitter<ShowFilesState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is ShowFilesListingUninitialized){
			  if(isSearch){
			     ShowFilesIndexModel show_files = await listingSearchShowFiles(1);
				  int deltaPage = show_files.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (ShowFilesListingLoaded(show_files: show_files,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  ShowFilesIndexModel show_files = await listingShowFiles(1);
				  int deltaPage = show_files.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (ShowFilesListingLoaded(show_files: show_files,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ShowFilesListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ShowFilesListingLoaded).page! + 1;
				  ShowFilesIndexModel show_files = await listingShowFiles(page);
				  if(!show_files.items.items.isEmpty){
				     (currentState as ShowFilesListingLoaded).show_files!.items.items.addAll(show_files.items.items);
				  }
				  return emit (show_files.items.items.isEmpty
					  ? (currentState as ShowFilesListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ShowFilesListingLoaded(  show_files:  (currentState as ShowFilesListingLoaded).show_files ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as ShowFilesListingLoaded).page! + 1;
				  ShowFilesIndexModel show_files = await listingShowFiles(page);
				  return emit ( show_files.items.items.isEmpty
					  ? (currentState as ShowFilesListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ShowFilesListingLoaded(  show_files:  show_files ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( ShowFilesListingError());
      }
    }
  }

  void _ShowFilesListingRefreshEvent(ShowFilesListingRefresh event, Emitter<ShowFilesState> emit)async{
  final currentState = state;
    try {
        if (currentState is ShowFilesListingUninitialized) {
		   if(isSearch){
		      ShowFilesIndexModel show_files = await listingSearchShowFiles(1);
              return emit (ShowFilesListingLoaded( show_files: show_files,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     ShowFilesIndexModel show_files = await listingShowFiles(1);
             return emit (ShowFilesListingLoaded( show_files: show_files,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is ShowFilesListingLoaded) {
		  if(isSearch){
		     ShowFilesIndexModel show_files = await listingSearchRefreshShowFiles();
              return emit ( show_files.items.items.isEmpty
              ? (currentState as ShowFilesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowFilesListingLoaded(  show_files: show_files ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      ShowFilesIndexModel show_files = await listingRefreshShowFiles();
              return emit ( show_files.items.items.isEmpty
              ? (currentState as ShowFilesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowFilesListingLoaded(  show_files: show_files ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ShowFilesListingError());
      }
  }

  @override
  get initialState => ShowFilesListingUninitialized();

  @override

  Stream<ShowFilesState> mapEventToState(ShowFilesEvent event) async* {
    final currentState = state;
    if (event is ShowFilesList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ShowFilesListingUninitialized){
			  if(isSearch){
			     ShowFilesIndexModel show_files = await listingSearchShowFiles(1);
				  int deltaPage = show_files.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ShowFilesListingLoaded(show_files: show_files,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ShowFilesIndexModel show_files = await listingShowFiles(1);
				  int deltaPage = show_files.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ShowFilesListingLoaded(show_files: show_files,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ShowFilesListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ShowFilesListingLoaded).page! + 1;
				  ShowFilesIndexModel show_files = await listingShowFiles(page);
				  if(!show_files.items.items.isEmpty){
				     (currentState as ShowFilesListingLoaded).show_files!.items.items.addAll(show_files.items.items);
				  }
				  yield show_files.items.items.isEmpty
					  ? (currentState as ShowFilesListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ShowFilesListingLoaded(  show_files:  (currentState as ShowFilesListingLoaded).show_files ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as ShowFilesListingLoaded).page! + 1;
				  ShowFilesIndexModel show_files = await listingShowFiles(page);
				  yield show_files.items.items.isEmpty
					  ? (currentState as ShowFilesListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ShowFilesListingLoaded(  show_files:  show_files ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield ShowFilesListingError();
      }
    } else if (event is ShowFilesListingRefresh){
      try {
        if (currentState is ShowFilesListingUninitialized) {
		   if(isSearch){
		      ShowFilesIndexModel show_files = await listingSearchShowFiles(1);
              yield ShowFilesListingLoaded( show_files: show_files,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ShowFilesIndexModel show_files = await listingShowFiles(1);
             yield ShowFilesListingLoaded( show_files: show_files,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ShowFilesListingLoaded) {
		  if(isSearch){
		     ShowFilesIndexModel show_files = await listingSearchRefreshShowFiles();
              yield show_files.items.items.isEmpty
              ? (currentState as ShowFilesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowFilesListingLoaded(  show_files: show_files ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ShowFilesIndexModel show_files = await listingRefreshShowFiles();
              yield show_files.items.items.isEmpty
              ? (currentState as ShowFilesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowFilesListingLoaded(  show_files: show_files ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ShowFilesListingError();
      }

    }
  }



  bool hasReachedMax(ShowFilesState state) =>
      state is ShowFilesListingLoaded && state.hasReachedMax!;


  Future<ShowFilesIndexModel> listingShowFiles(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ShowFilesIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowFilesListSearch(dt ,'',page);
	
	return data;
  }

  Future<ShowFilesIndexModel> listingRefreshShowFiles() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ShowFilesIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowFilesListSearch(dt ,'',page);
	
	return data;
  }

  Future<ShowFilesIndexModel> listingSearchShowFiles(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ShowFilesIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowFilesListSearch(dt ,'',page);	
	return data;
  }

  Future<ShowFilesIndexModel> listingSearchRefreshShowFiles() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ShowFilesIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowFilesListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ShowFilesIndexModel> _loadAndSaveShowFilesListSearch(ShowFilesIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.post_id;
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
    }
    return list;
 }


class  UserShowFilesListBottomLoader extends StatelessWidget {
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








  

















  

