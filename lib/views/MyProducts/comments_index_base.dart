
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



class CommentsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  CommentsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  CommentsIndexBaseState createState() => CommentsIndexBaseState();
}

class  CommentsIndexBaseState extends State<CommentsIndexBase>{
  String title = 'Comments'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  CommentsListing? listing;

  CommentsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String product_post_id = 'product_post_id';
	 product_post_id = product_post_id.replaceAll('_id','');
     getPath = widget.url! + product_post_id + 'page=%s';
	listing = new CommentsListing(AppProvider.getApplication(context), getPath, false, CommentsListingUninitialized());
    listing!.add(CommentsList());
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
    return BlocBuilder<CommentsListing, CommentsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is CommentsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is CommentsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is CommentsListingLoaded) {
          if (state.comments!.items.items.isEmpty) {
		  if (state.comments!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.comments!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.comments!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.comments!.items.items.length
									  ?  UserCommentsListBottomLoader()
									  : state.comments!.viewItem (state.comments!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.comments!.items.items.length
									: state.comments!.items.items.length + 1,
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

								  return index >= state.comments!.items.items.length
									  ?  UserCommentsListBottomLoader()
									  : state.comments!.viewItem (state.comments!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.comments!.items.items.length
									: state.comments!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.comments!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(CommentsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(CommentsList());
    }

  }
}




abstract class CommentsEvent extends Equatable {
const CommentsEvent();
   @override
    List<Object> get props => [];
}

class CommentsList extends CommentsEvent {
  @override
  String toString() => 'CommentsList';
}

class CommentsListingRefresh extends CommentsEvent {
  @override
  String toString() => 'CommentsListingRefresh';
}

class CommentsListingChangeSearch extends CommentsEvent {
  @override
  String toString() => 'CommentsChangeSearch';
}


abstract class CommentsState extends Equatable {
  const CommentsState();
   @override
    List<Object> get props => [];
}

class CommentsListingUninitialized extends CommentsState {
  @override
  String toString() => 'CommentsListingUninitialized';
}

class CommentsListingError extends CommentsState {
  @override
  String toString() => 'CommentsListingError';
}

class CommentsListingLoaded extends CommentsState {
  final CommentsIndexModel? comments;
  final bool? hasReachedMax;
  final int?  page;

  CommentsListingLoaded({
    this.comments,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [comments!, hasReachedMax!, page!];
  
  CommentsListingLoaded copyWith({
    CommentsIndexModel? comments,
    bool? hasReachedMax,
    int? page,
  }) {
    return CommentsListingLoaded(
      comments: comments ?? this.comments,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'CommentsListingLoaded  CommentsListing: ${ comments!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class CommentsListing extends Bloc<CommentsEvent, CommentsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  CommentsListing(this.application, this.url, this.isSearch, CommentsState initialState):
  super(initialState){
     on<CommentsList>(_CommentsListEvent);
	 on<CommentsListingRefresh>(_CommentsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<CommentsEvent, CommentsState>> transformEvents(
      Stream<CommentsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<CommentsEvent> transform<CommentsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<CommentsEvent, CommentsState> transition) {
    print(transition);
  }


  void _CommentsListEvent(CommentsList event, Emitter<CommentsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is CommentsListingUninitialized){
			  if(isSearch){
			     CommentsIndexModel comments = await listingSearchComments(1);
				  int deltaPage = comments.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (CommentsListingLoaded(comments: comments,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  CommentsIndexModel comments = await listingComments(1);
				  int deltaPage = comments.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (CommentsListingLoaded(comments: comments,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is CommentsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as CommentsListingLoaded).page! + 1;
				  CommentsIndexModel comments = await listingComments(page);
				  if(!comments.items.items.isEmpty){
				     (currentState as CommentsListingLoaded).comments!.items.items.addAll(comments.items.items);
				  }
				  return emit (comments.items.items.isEmpty
					  ? (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : CommentsListingLoaded(  comments:  (currentState as CommentsListingLoaded).comments ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as CommentsListingLoaded).page! + 1;
				  CommentsIndexModel comments = await listingComments(page);
				  return emit ( comments.items.items.isEmpty
					  ? (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : CommentsListingLoaded(  comments:  comments ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( CommentsListingError());
      }
    }
  }

  void _CommentsListingRefreshEvent(CommentsListingRefresh event, Emitter<CommentsState> emit)async{
  final currentState = state;
    try {
        if (currentState is CommentsListingUninitialized) {
		   if(isSearch){
		      CommentsIndexModel comments = await listingSearchComments(1);
              return emit (CommentsListingLoaded( comments: comments,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     CommentsIndexModel comments = await listingComments(1);
             return emit (CommentsListingLoaded( comments: comments,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is CommentsListingLoaded) {
		  if(isSearch){
		     CommentsIndexModel comments = await listingSearchRefreshComments();
              return emit ( comments.items.items.isEmpty
              ? (currentState as CommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CommentsListingLoaded(  comments: comments ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      CommentsIndexModel comments = await listingRefreshComments();
              return emit ( comments.items.items.isEmpty
              ? (currentState as CommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CommentsListingLoaded(  comments: comments ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (CommentsListingError());
      }
  }

  @override
  get initialState => CommentsListingUninitialized();

  @override

  Stream<CommentsState> mapEventToState(CommentsEvent event) async* {
    final currentState = state;
    if (event is CommentsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is CommentsListingUninitialized){
			  if(isSearch){
			     CommentsIndexModel comments = await listingSearchComments(1);
				  int deltaPage = comments.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield CommentsListingLoaded(comments: comments,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  CommentsIndexModel comments = await listingComments(1);
				  int deltaPage = comments.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield CommentsListingLoaded(comments: comments,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is CommentsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as CommentsListingLoaded).page! + 1;
				  CommentsIndexModel comments = await listingComments(page);
				  if(!comments.items.items.isEmpty){
				     (currentState as CommentsListingLoaded).comments!.items.items.addAll(comments.items.items);
				  }
				  yield comments.items.items.isEmpty
					  ? (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : CommentsListingLoaded(  comments:  (currentState as CommentsListingLoaded).comments ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as CommentsListingLoaded).page! + 1;
				  CommentsIndexModel comments = await listingComments(page);
				  yield comments.items.items.isEmpty
					  ? (currentState as CommentsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : CommentsListingLoaded(  comments:  comments ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield CommentsListingError();
      }
    } else if (event is CommentsListingRefresh){
      try {
        if (currentState is CommentsListingUninitialized) {
		   if(isSearch){
		      CommentsIndexModel comments = await listingSearchComments(1);
              yield CommentsListingLoaded( comments: comments,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     CommentsIndexModel comments = await listingComments(1);
             yield CommentsListingLoaded( comments: comments,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is CommentsListingLoaded) {
		  if(isSearch){
		     CommentsIndexModel comments = await listingSearchRefreshComments();
              yield comments.items.items.isEmpty
              ? (currentState as CommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CommentsListingLoaded(  comments: comments ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      CommentsIndexModel comments = await listingRefreshComments();
              yield comments.items.items.isEmpty
              ? (currentState as CommentsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : CommentsListingLoaded(  comments: comments ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield CommentsListingError();
      }

    }
  }



  bool hasReachedMax(CommentsState state) =>
      state is CommentsListingLoaded && state.hasReachedMax!;


  Future<CommentsIndexModel> listingComments(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = CommentsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCommentsListSearch(dt ,'',page);
	
	return data;
  }

  Future<CommentsIndexModel> listingRefreshComments() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = CommentsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCommentsListSearch(dt ,'',page);
	
	return data;
  }

  Future<CommentsIndexModel> listingSearchComments(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = CommentsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCommentsListSearch(dt ,'',page);	
	return data;
  }

  Future<CommentsIndexModel> listingSearchRefreshComments() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = CommentsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveCommentsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<CommentsIndexModel> _loadAndSaveCommentsListSearch(CommentsIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.product_post_id;
	  list.items.items[i].item.sbttl = list.items.items[i].item.message;
    }
    return list;
 }


class  UserCommentsListBottomLoader extends StatelessWidget {
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








  

















  

