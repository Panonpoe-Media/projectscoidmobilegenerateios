
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



class ShowConversationIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ShowConversationIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ShowConversationIndexBaseState createState() => ShowConversationIndexBaseState();
}

class  ShowConversationIndexBaseState extends State<ShowConversationIndexBase>{
  String title = 'ShowConversation'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  ShowConversationListing? listing;

  ShowConversationIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String post_id = 'post_id';
	 post_id = post_id.replaceAll('_id','');
     getPath = widget.url! + post_id + 'page=%s';
	listing = new ShowConversationListing(AppProvider.getApplication(context), getPath, false, ShowConversationListingUninitialized());
    listing!.add(ShowConversationList());
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
    return BlocBuilder<ShowConversationListing, ShowConversationState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is ShowConversationListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is ShowConversationListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is ShowConversationListingLoaded) {
          if (state.show_conversation!.items.items.isEmpty) {
		  if (state.show_conversation!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.show_conversation!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.show_conversation!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.show_conversation!.items.items.length
									  ?  UserShowConversationListBottomLoader()
									  : state.show_conversation!.viewItem (state.show_conversation!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.show_conversation!.items.items.length
									: state.show_conversation!.items.items.length + 1,
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

								  return index >= state.show_conversation!.items.items.length
									  ?  UserShowConversationListBottomLoader()
									  : state.show_conversation!.viewItem (state.show_conversation!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.show_conversation!.items.items.length
									: state.show_conversation!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.show_conversation!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(ShowConversationListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ShowConversationList());
    }

  }
}




abstract class ShowConversationEvent extends Equatable {
const ShowConversationEvent();
   @override
    List<Object> get props => [];
}

class ShowConversationList extends ShowConversationEvent {
  @override
  String toString() => 'ShowConversationList';
}

class ShowConversationListingRefresh extends ShowConversationEvent {
  @override
  String toString() => 'ShowConversationListingRefresh';
}

class ShowConversationListingChangeSearch extends ShowConversationEvent {
  @override
  String toString() => 'ShowConversationChangeSearch';
}


abstract class ShowConversationState extends Equatable {
  const ShowConversationState();
   @override
    List<Object> get props => [];
}

class ShowConversationListingUninitialized extends ShowConversationState {
  @override
  String toString() => 'ShowConversationListingUninitialized';
}

class ShowConversationListingError extends ShowConversationState {
  @override
  String toString() => 'ShowConversationListingError';
}

class ShowConversationListingLoaded extends ShowConversationState {
  final ShowConversationIndexModel? show_conversation;
  final bool? hasReachedMax;
  final int?  page;

  ShowConversationListingLoaded({
    this.show_conversation,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [show_conversation!, hasReachedMax!, page!];
  
  ShowConversationListingLoaded copyWith({
    ShowConversationIndexModel? show_conversation,
    bool? hasReachedMax,
    int? page,
  }) {
    return ShowConversationListingLoaded(
      show_conversation: show_conversation ?? this.show_conversation,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ShowConversationListingLoaded  ShowConversationListing: ${ show_conversation!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ShowConversationListing extends Bloc<ShowConversationEvent, ShowConversationState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ShowConversationListing(this.application, this.url, this.isSearch, ShowConversationState initialState):
  super(initialState){
     on<ShowConversationList>(_ShowConversationListEvent);
	 on<ShowConversationListingRefresh>(_ShowConversationListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ShowConversationEvent, ShowConversationState>> transformEvents(
      Stream<ShowConversationEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<ShowConversationEvent> transform<ShowConversationEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ShowConversationEvent, ShowConversationState> transition) {
    print(transition);
  }


  void _ShowConversationListEvent(ShowConversationList event, Emitter<ShowConversationState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is ShowConversationListingUninitialized){
			  if(isSearch){
			     ShowConversationIndexModel show_conversation = await listingSearchShowConversation(1);
				  int deltaPage = show_conversation.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (ShowConversationListingLoaded(show_conversation: show_conversation,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  ShowConversationIndexModel show_conversation = await listingShowConversation(1);
				  int deltaPage = show_conversation.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (ShowConversationListingLoaded(show_conversation: show_conversation,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ShowConversationListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ShowConversationListingLoaded).page! + 1;
				  ShowConversationIndexModel show_conversation = await listingShowConversation(page);
				  if(!show_conversation.items.items.isEmpty){
				     (currentState as ShowConversationListingLoaded).show_conversation!.items.items.addAll(show_conversation.items.items);
				  }
				  return emit (show_conversation.items.items.isEmpty
					  ? (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ShowConversationListingLoaded(  show_conversation:  (currentState as ShowConversationListingLoaded).show_conversation ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as ShowConversationListingLoaded).page! + 1;
				  ShowConversationIndexModel show_conversation = await listingShowConversation(page);
				  return emit ( show_conversation.items.items.isEmpty
					  ? (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ShowConversationListingLoaded(  show_conversation:  show_conversation ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( ShowConversationListingError());
      }
    }
  }

  void _ShowConversationListingRefreshEvent(ShowConversationListingRefresh event, Emitter<ShowConversationState> emit)async{
  final currentState = state;
    try {
        if (currentState is ShowConversationListingUninitialized) {
		   if(isSearch){
		      ShowConversationIndexModel show_conversation = await listingSearchShowConversation(1);
              return emit (ShowConversationListingLoaded( show_conversation: show_conversation,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     ShowConversationIndexModel show_conversation = await listingShowConversation(1);
             return emit (ShowConversationListingLoaded( show_conversation: show_conversation,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is ShowConversationListingLoaded) {
		  if(isSearch){
		     ShowConversationIndexModel show_conversation = await listingSearchRefreshShowConversation();
              return emit ( show_conversation.items.items.isEmpty
              ? (currentState as ShowConversationListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowConversationListingLoaded(  show_conversation: show_conversation ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      ShowConversationIndexModel show_conversation = await listingRefreshShowConversation();
              return emit ( show_conversation.items.items.isEmpty
              ? (currentState as ShowConversationListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowConversationListingLoaded(  show_conversation: show_conversation ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ShowConversationListingError());
      }
  }

  @override
  get initialState => ShowConversationListingUninitialized();

  @override

  Stream<ShowConversationState> mapEventToState(ShowConversationEvent event) async* {
    final currentState = state;
    if (event is ShowConversationList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ShowConversationListingUninitialized){
			  if(isSearch){
			     ShowConversationIndexModel show_conversation = await listingSearchShowConversation(1);
				  int deltaPage = show_conversation.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ShowConversationListingLoaded(show_conversation: show_conversation,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ShowConversationIndexModel show_conversation = await listingShowConversation(1);
				  int deltaPage = show_conversation.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ShowConversationListingLoaded(show_conversation: show_conversation,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ShowConversationListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ShowConversationListingLoaded).page! + 1;
				  ShowConversationIndexModel show_conversation = await listingShowConversation(page);
				  if(!show_conversation.items.items.isEmpty){
				     (currentState as ShowConversationListingLoaded).show_conversation!.items.items.addAll(show_conversation.items.items);
				  }
				  yield show_conversation.items.items.isEmpty
					  ? (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ShowConversationListingLoaded(  show_conversation:  (currentState as ShowConversationListingLoaded).show_conversation ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as ShowConversationListingLoaded).page! + 1;
				  ShowConversationIndexModel show_conversation = await listingShowConversation(page);
				  yield show_conversation.items.items.isEmpty
					  ? (currentState as ShowConversationListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ShowConversationListingLoaded(  show_conversation:  show_conversation ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield ShowConversationListingError();
      }
    } else if (event is ShowConversationListingRefresh){
      try {
        if (currentState is ShowConversationListingUninitialized) {
		   if(isSearch){
		      ShowConversationIndexModel show_conversation = await listingSearchShowConversation(1);
              yield ShowConversationListingLoaded( show_conversation: show_conversation,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ShowConversationIndexModel show_conversation = await listingShowConversation(1);
             yield ShowConversationListingLoaded( show_conversation: show_conversation,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ShowConversationListingLoaded) {
		  if(isSearch){
		     ShowConversationIndexModel show_conversation = await listingSearchRefreshShowConversation();
              yield show_conversation.items.items.isEmpty
              ? (currentState as ShowConversationListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowConversationListingLoaded(  show_conversation: show_conversation ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ShowConversationIndexModel show_conversation = await listingRefreshShowConversation();
              yield show_conversation.items.items.isEmpty
              ? (currentState as ShowConversationListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ShowConversationListingLoaded(  show_conversation: show_conversation ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ShowConversationListingError();
      }

    }
  }



  bool hasReachedMax(ShowConversationState state) =>
      state is ShowConversationListingLoaded && state.hasReachedMax!;


  Future<ShowConversationIndexModel> listingShowConversation(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ShowConversationIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowConversationListSearch(dt ,'',page);
	
	return data;
  }

  Future<ShowConversationIndexModel> listingRefreshShowConversation() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ShowConversationIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowConversationListSearch(dt ,'',page);
	
	return data;
  }

  Future<ShowConversationIndexModel> listingSearchShowConversation(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ShowConversationIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowConversationListSearch(dt ,'',page);	
	return data;
  }

  Future<ShowConversationIndexModel> listingSearchRefreshShowConversation() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ShowConversationIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveShowConversationListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ShowConversationIndexModel> _loadAndSaveShowConversationListSearch(ShowConversationIndexModel list, String searchKey, int page) async{

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


class  UserShowConversationListBottomLoader extends StatelessWidget {
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








  

















  

