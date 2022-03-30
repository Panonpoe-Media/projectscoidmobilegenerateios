
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



class ShowThreadIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ShowThreadIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ShowThreadIndexBaseState createState() => ShowThreadIndexBaseState();
}

class  ShowThreadIndexBaseState extends State<ShowThreadIndexBase>{
  String title = 'ShowThread'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  ShowThreadListing? listing;

  ShowThreadIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String post_id = 'post_id';
	 post_id = post_id.replaceAll('_id','');
     getPath = widget.url! + post_id + 'page=%s';
	listing = new ShowThreadListing(AppProvider.getApplication(context), getPath, false, ShowThreadListingUninitialized());
    listing!.add(ShowThreadList());
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
    return BlocBuilder<ShowThreadListing, ShowThreadState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is ShowThreadListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is ShowThreadListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is ShowThreadListingLoaded) {
          if (state.show_thread!.items.items.isEmpty) {
		  if (state.show_thread!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.show_thread!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.show_thread!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.show_thread!.items.items.length
									  ?  UserShowThreadListBottomLoader()
									  : state.show_thread!.viewItem (state.show_thread!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.show_thread!.items.items.length
									: state.show_thread!.items.items.length + 1,
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

								  return index >= state.show_thread!.items.items.length
									  ?  UserShowThreadListBottomLoader()
									  : state.show_thread!.viewItem (state.show_thread!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.show_thread!.items.items.length
									: state.show_thread!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.show_thread!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(ShowThreadListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ShowThreadList());
    }

  }
}




abstract class ShowThreadEvent extends Equatable {
const ShowThreadEvent();
   @override
    List<Object> get props => [];
}

class ShowThreadList extends ShowThreadEvent {
  @override
  String toString() => 'ShowThreadList';
}

class ShowThreadListingRefresh extends ShowThreadEvent {
  @override
  String toString() => 'ShowThreadListingRefresh';
}

class ShowThreadListingChangeSearch extends ShowThreadEvent {
  @override
  String toString() => 'ShowThreadChangeSearch';
}


abstract class ShowThreadState extends Equatable {
  const ShowThreadState();
   @override
    List<Object> get props => [];
}

class ShowThreadListingUninitialized extends ShowThreadState {
  @override
  String toString() => 'ShowThreadListingUninitialized';
}

class ShowThreadListingError extends ShowThreadState {
  @override
  String toString() => 'ShowThreadListingError';
}

class ShowThreadListingLoaded extends ShowThreadState {
  final ShowThreadIndexModel? show_thread;
  final bool? hasReachedMax;
  final int?  page;

  ShowThreadListingLoaded({
    this.show_thread,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [show_thread!, hasReachedMax!, page!];
  
  ShowThreadListingLoaded copyWith({
    ShowThreadIndexModel? show_thread,
    bool? hasReachedMax,
    int? page,
  }) {
    return ShowThreadListingLoaded(
      show_thread: show_thread ?? this.show_thread,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ShowThreadListingLoaded  ShowThreadListing: ${ show_thread!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ShowThreadListing extends Bloc<ShowThreadEvent, ShowThreadState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ShowThreadListing(this.application, this.url, this.isSearch, ShowThreadState initialState):
  super(initialState){
     on<ShowThreadList>(_ShowThreadListEvent);
	 on<ShowThreadListingRefresh>(_ShowThreadListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ShowThreadEvent, ShowThreadState>> transformEvents(
      Stream<ShowThreadEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<ShowThreadEvent> transform<ShowThreadEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ShowThreadEvent, ShowThreadState> transition) {
    print(transition);
  }


  void _ShowThreadListEvent(ShowThreadList event, Emitter<ShowThreadState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is ShowThreadListingUninitialized){
			  if(isSearch){
			     ShowThreadIndexModel show_thread = await listingSearchShowThread(1);
				  int deltaPage = show_thread.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (ShowThreadListingLoaded(show_thread: show_thread,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  ShowThreadIndexModel show_thread = await listingShowThread(1);
				  int deltaPage = show_thread.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (ShowThreadListingLoaded(show_thread: show_thread,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ShowThreadListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ShowThreadListingLoaded).page! + 1;
				  ShowThreadIndexModel show_thread = await listingShowThread(page);
				  if(!show_thread.items.items.isEmpty){
				     (currentState as ShowThreadListingLoaded).show_thread!.items.items.addAll(show_thread.items.items);
				  }
				  return emit (show_thread.items.items.isEmpty
					  ? (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ShowThreadListingLoaded(  show_thread:  (currentState as ShowThreadListingLoaded).show_thread ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as ShowThreadListingLoaded).page! + 1;
				  ShowThreadIndexModel show_thread = await listingShowThread(page);
				  return emit ( show_thread.items.items.isEmpty
					  ? (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ShowThreadListingLoaded(  show_thread:  show_thread ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( ShowThreadListingError());
      }
    }
  }

  void _ShowThreadListingRefreshEvent(ShowThreadListingRefresh event, Emitter<ShowThreadState> emit)async{
  final currentState = state;
    try {
        if (currentState is ShowThreadListingUninitialized) {
		   if(isSearch){
		      ShowThreadIndexModel show_thread = await listingSearchShowThread(1);
              return emit (ShowThreadListingLoaded( show_thread: show_thread,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     ShowThreadIndexModel show_thread = await listingShowThread(1);
             return emit (ShowThreadListingLoaded( show_thread: show_thread,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is ShowThreadListingLoaded) {
		  if(isSearch){
		     ShowThreadIndexModel show_thread = await listingSearchRefreshShowThread();
              return emit ( show_thread.items.items.isEmpty
              ? (currentState as ShowThreadListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowThreadListingLoaded(  show_thread: show_thread ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      ShowThreadIndexModel show_thread = await listingRefreshShowThread();
              return emit ( show_thread.items.items.isEmpty
              ? (currentState as ShowThreadListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowThreadListingLoaded(  show_thread: show_thread ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ShowThreadListingError());
      }
  }

  @override
  get initialState => ShowThreadListingUninitialized();

  @override

  Stream<ShowThreadState> mapEventToState(ShowThreadEvent event) async* {
    final currentState = state;
    if (event is ShowThreadList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ShowThreadListingUninitialized){
			  if(isSearch){
			     ShowThreadIndexModel show_thread = await listingSearchShowThread(1);
				  int deltaPage = show_thread.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ShowThreadListingLoaded(show_thread: show_thread,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ShowThreadIndexModel show_thread = await listingShowThread(1);
				  int deltaPage = show_thread.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ShowThreadListingLoaded(show_thread: show_thread,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ShowThreadListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ShowThreadListingLoaded).page! + 1;
				  ShowThreadIndexModel show_thread = await listingShowThread(page);
				  if(!show_thread.items.items.isEmpty){
				     (currentState as ShowThreadListingLoaded).show_thread!.items.items.addAll(show_thread.items.items);
				  }
				  yield show_thread.items.items.isEmpty
					  ? (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ShowThreadListingLoaded(  show_thread:  (currentState as ShowThreadListingLoaded).show_thread ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as ShowThreadListingLoaded).page! + 1;
				  ShowThreadIndexModel show_thread = await listingShowThread(page);
				  yield show_thread.items.items.isEmpty
					  ? (currentState as ShowThreadListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ShowThreadListingLoaded(  show_thread:  show_thread ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield ShowThreadListingError();
      }
    } else if (event is ShowThreadListingRefresh){
      try {
        if (currentState is ShowThreadListingUninitialized) {
		   if(isSearch){
		      ShowThreadIndexModel show_thread = await listingSearchShowThread(1);
              yield ShowThreadListingLoaded( show_thread: show_thread,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ShowThreadIndexModel show_thread = await listingShowThread(1);
             yield ShowThreadListingLoaded( show_thread: show_thread,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ShowThreadListingLoaded) {
		  if(isSearch){
		     ShowThreadIndexModel show_thread = await listingSearchRefreshShowThread();
              yield show_thread.items.items.isEmpty
              ? (currentState as ShowThreadListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowThreadListingLoaded(  show_thread: show_thread ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ShowThreadIndexModel show_thread = await listingRefreshShowThread();
              yield show_thread.items.items.isEmpty
              ? (currentState as ShowThreadListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowThreadListingLoaded(  show_thread: show_thread ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ShowThreadListingError();
      }

    }
  }



  bool hasReachedMax(ShowThreadState state) =>
      state is ShowThreadListingLoaded && state.hasReachedMax!;


  Future<ShowThreadIndexModel> listingShowThread(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ShowThreadIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowThreadListSearch(dt ,'',page);
	
	return data;
  }

  Future<ShowThreadIndexModel> listingRefreshShowThread() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ShowThreadIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowThreadListSearch(dt ,'',page);
	
	return data;
  }

  Future<ShowThreadIndexModel> listingSearchShowThread(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ShowThreadIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowThreadListSearch(dt ,'',page);	
	return data;
  }

  Future<ShowThreadIndexModel> listingSearchRefreshShowThread() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ShowThreadIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowThreadListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ShowThreadIndexModel> _loadAndSaveShowThreadListSearch(ShowThreadIndexModel list, String searchKey, int page) async{

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


class  UserShowThreadListBottomLoader extends StatelessWidget {
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








  

















  

