
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



class UserBidsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  UserBidsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  UserBidsIndexBaseState createState() => UserBidsIndexBaseState();
}

class  UserBidsIndexBaseState extends State<UserBidsIndexBase>{
  String title = 'UserBids'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  UserBidsListing? listing;

  UserBidsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String bid_id = 'bid_id';
	 bid_id = bid_id.replaceAll('_id','');
     getPath = widget.url! + bid_id + 'page=%s';
	listing = new UserBidsListing(AppProvider.getApplication(context), getPath, false, UserBidsListingUninitialized());
    listing!.add(UserBidsList());
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
    return BlocBuilder<UserBidsListing, UserBidsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is UserBidsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is UserBidsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is UserBidsListingLoaded) {
          if (state.user_bids!.items.items.isEmpty) {
		  if (state.user_bids!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.user_bids!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.user_bids!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.user_bids!.items.items.length
									  ?  UserUserBidsListBottomLoader()
									  : state.user_bids!.viewItem (state.user_bids!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.user_bids!.items.items.length
									: state.user_bids!.items.items.length + 1,
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

								  return index >= state.user_bids!.items.items.length
									  ?  UserUserBidsListBottomLoader()
									  : state.user_bids!.viewItem (state.user_bids!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.user_bids!.items.items.length
									: state.user_bids!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.user_bids!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(UserBidsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(UserBidsList());
    }

  }
}




abstract class UserBidsEvent extends Equatable {
const UserBidsEvent();
   @override
    List<Object> get props => [];
}

class UserBidsList extends UserBidsEvent {
  @override
  String toString() => 'UserBidsList';
}

class UserBidsListingRefresh extends UserBidsEvent {
  @override
  String toString() => 'UserBidsListingRefresh';
}

class UserBidsListingChangeSearch extends UserBidsEvent {
  @override
  String toString() => 'UserBidsChangeSearch';
}


abstract class UserBidsState extends Equatable {
  const UserBidsState();
   @override
    List<Object> get props => [];
}

class UserBidsListingUninitialized extends UserBidsState {
  @override
  String toString() => 'UserBidsListingUninitialized';
}

class UserBidsListingError extends UserBidsState {
  @override
  String toString() => 'UserBidsListingError';
}

class UserBidsListingLoaded extends UserBidsState {
  final UserBidsIndexModel? user_bids;
  final bool? hasReachedMax;
  final int?  page;

  UserBidsListingLoaded({
    this.user_bids,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [user_bids!, hasReachedMax!, page!];
  
  UserBidsListingLoaded copyWith({
    UserBidsIndexModel? user_bids,
    bool? hasReachedMax,
    int? page,
  }) {
    return UserBidsListingLoaded(
      user_bids: user_bids ?? this.user_bids,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'UserBidsListingLoaded  UserBidsListing: ${ user_bids!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class UserBidsListing extends Bloc<UserBidsEvent, UserBidsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  UserBidsListing(this.application, this.url, this.isSearch, UserBidsState initialState):
  super(initialState){
     on<UserBidsList>(_UserBidsListEvent);
	 on<UserBidsListingRefresh>(_UserBidsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<UserBidsEvent, UserBidsState>> transformEvents(
      Stream<UserBidsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<UserBidsEvent> transform<UserBidsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<UserBidsEvent, UserBidsState> transition) {
    print(transition);
  }


  void _UserBidsListEvent(UserBidsList event, Emitter<UserBidsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is UserBidsListingUninitialized){
			  if(isSearch){
			     UserBidsIndexModel user_bids = await listingSearchUserBids(1);
				  int deltaPage = user_bids.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (UserBidsListingLoaded(user_bids: user_bids,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  UserBidsIndexModel user_bids = await listingUserBids(1);
				  int deltaPage = user_bids.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (UserBidsListingLoaded(user_bids: user_bids,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is UserBidsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as UserBidsListingLoaded).page! + 1;
				  UserBidsIndexModel user_bids = await listingUserBids(page);
				  if(!user_bids.items.items.isEmpty){
				     (currentState as UserBidsListingLoaded).user_bids!.items.items.addAll(user_bids.items.items);
				  }
				  return emit (user_bids.items.items.isEmpty
					  ? (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : UserBidsListingLoaded(  user_bids:  (currentState as UserBidsListingLoaded).user_bids ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as UserBidsListingLoaded).page! + 1;
				  UserBidsIndexModel user_bids = await listingUserBids(page);
				  return emit ( user_bids.items.items.isEmpty
					  ? (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : UserBidsListingLoaded(  user_bids:  user_bids ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( UserBidsListingError());
      }
    }
  }

  void _UserBidsListingRefreshEvent(UserBidsListingRefresh event, Emitter<UserBidsState> emit)async{
  final currentState = state;
    try {
        if (currentState is UserBidsListingUninitialized) {
		   if(isSearch){
		      UserBidsIndexModel user_bids = await listingSearchUserBids(1);
              return emit (UserBidsListingLoaded( user_bids: user_bids,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     UserBidsIndexModel user_bids = await listingUserBids(1);
             return emit (UserBidsListingLoaded( user_bids: user_bids,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is UserBidsListingLoaded) {
		  if(isSearch){
		     UserBidsIndexModel user_bids = await listingSearchRefreshUserBids();
              return emit ( user_bids.items.items.isEmpty
              ? (currentState as UserBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserBidsListingLoaded(  user_bids: user_bids ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      UserBidsIndexModel user_bids = await listingRefreshUserBids();
              return emit ( user_bids.items.items.isEmpty
              ? (currentState as UserBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserBidsListingLoaded(  user_bids: user_bids ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (UserBidsListingError());
      }
  }

  @override
  get initialState => UserBidsListingUninitialized();

  @override

  Stream<UserBidsState> mapEventToState(UserBidsEvent event) async* {
    final currentState = state;
    if (event is UserBidsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is UserBidsListingUninitialized){
			  if(isSearch){
			     UserBidsIndexModel user_bids = await listingSearchUserBids(1);
				  int deltaPage = user_bids.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield UserBidsListingLoaded(user_bids: user_bids,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  UserBidsIndexModel user_bids = await listingUserBids(1);
				  int deltaPage = user_bids.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield UserBidsListingLoaded(user_bids: user_bids,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is UserBidsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as UserBidsListingLoaded).page! + 1;
				  UserBidsIndexModel user_bids = await listingUserBids(page);
				  if(!user_bids.items.items.isEmpty){
				     (currentState as UserBidsListingLoaded).user_bids!.items.items.addAll(user_bids.items.items);
				  }
				  yield user_bids.items.items.isEmpty
					  ? (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : UserBidsListingLoaded(  user_bids:  (currentState as UserBidsListingLoaded).user_bids ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as UserBidsListingLoaded).page! + 1;
				  UserBidsIndexModel user_bids = await listingUserBids(page);
				  yield user_bids.items.items.isEmpty
					  ? (currentState as UserBidsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : UserBidsListingLoaded(  user_bids:  user_bids ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield UserBidsListingError();
      }
    } else if (event is UserBidsListingRefresh){
      try {
        if (currentState is UserBidsListingUninitialized) {
		   if(isSearch){
		      UserBidsIndexModel user_bids = await listingSearchUserBids(1);
              yield UserBidsListingLoaded( user_bids: user_bids,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     UserBidsIndexModel user_bids = await listingUserBids(1);
             yield UserBidsListingLoaded( user_bids: user_bids,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is UserBidsListingLoaded) {
		  if(isSearch){
		     UserBidsIndexModel user_bids = await listingSearchRefreshUserBids();
              yield user_bids.items.items.isEmpty
              ? (currentState as UserBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserBidsListingLoaded(  user_bids: user_bids ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      UserBidsIndexModel user_bids = await listingRefreshUserBids();
              yield user_bids.items.items.isEmpty
              ? (currentState as UserBidsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserBidsListingLoaded(  user_bids: user_bids ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield UserBidsListingError();
      }

    }
  }



  bool hasReachedMax(UserBidsState state) =>
      state is UserBidsListingLoaded && state.hasReachedMax!;


  Future<UserBidsIndexModel> listingUserBids(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = UserBidsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserBidsListSearch(dt ,'',page);
	
	return data;
  }

  Future<UserBidsIndexModel> listingRefreshUserBids() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = UserBidsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserBidsListSearch(dt ,'',page);
	
	return data;
  }

  Future<UserBidsIndexModel> listingSearchUserBids(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = UserBidsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserBidsListSearch(dt ,'',page);	
	return data;
  }

  Future<UserBidsIndexModel> listingSearchRefreshUserBids() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = UserBidsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserBidsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<UserBidsIndexModel> _loadAndSaveUserBidsListSearch(UserBidsIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.bid_id;
    }
    return list;
 }


class  UserUserBidsListBottomLoader extends StatelessWidget {
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








  

















  

