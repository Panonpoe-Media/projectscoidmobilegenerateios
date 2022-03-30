
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



class UserArbitrationsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  UserArbitrationsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  UserArbitrationsIndexBaseState createState() => UserArbitrationsIndexBaseState();
}

class  UserArbitrationsIndexBaseState extends State<UserArbitrationsIndexBase>{
  String title = 'UserArbitrations'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  UserArbitrationsListing? listing;

  UserArbitrationsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String arbitration_id = 'arbitration_id';
	 arbitration_id = arbitration_id.replaceAll('_id','');
     getPath = widget.url! + arbitration_id + 'page=%s';
	listing = new UserArbitrationsListing(AppProvider.getApplication(context), getPath, false, UserArbitrationsListingUninitialized());
    listing!.add(UserArbitrationsList());
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
    return BlocBuilder<UserArbitrationsListing, UserArbitrationsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is UserArbitrationsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is UserArbitrationsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is UserArbitrationsListingLoaded) {
          if (state.user_arbitrations!.items.items.isEmpty) {
		  if (state.user_arbitrations!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.user_arbitrations!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.user_arbitrations!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.user_arbitrations!.items.items.length
									  ?  PublicUserArbitrationsListBottomLoader()
									  : state.user_arbitrations!.viewItem (state.user_arbitrations!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.user_arbitrations!.items.items.length
									: state.user_arbitrations!.items.items.length + 1,
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

								  return index >= state.user_arbitrations!.items.items.length
									  ?  PublicUserArbitrationsListBottomLoader()
									  : state.user_arbitrations!.viewItem (state.user_arbitrations!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.user_arbitrations!.items.items.length
									: state.user_arbitrations!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.user_arbitrations!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(UserArbitrationsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(UserArbitrationsList());
    }

  }
}




abstract class UserArbitrationsEvent extends Equatable {
const UserArbitrationsEvent();
   @override
    List<Object> get props => [];
}

class UserArbitrationsList extends UserArbitrationsEvent {
  @override
  String toString() => 'UserArbitrationsList';
}

class UserArbitrationsListingRefresh extends UserArbitrationsEvent {
  @override
  String toString() => 'UserArbitrationsListingRefresh';
}

class UserArbitrationsListingChangeSearch extends UserArbitrationsEvent {
  @override
  String toString() => 'UserArbitrationsChangeSearch';
}


abstract class UserArbitrationsState extends Equatable {
  const UserArbitrationsState();
   @override
    List<Object> get props => [];
}

class UserArbitrationsListingUninitialized extends UserArbitrationsState {
  @override
  String toString() => 'UserArbitrationsListingUninitialized';
}

class UserArbitrationsListingError extends UserArbitrationsState {
  @override
  String toString() => 'UserArbitrationsListingError';
}

class UserArbitrationsListingLoaded extends UserArbitrationsState {
  final UserArbitrationsIndexModel? user_arbitrations;
  final bool? hasReachedMax;
  final int?  page;

  UserArbitrationsListingLoaded({
    this.user_arbitrations,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [user_arbitrations!, hasReachedMax!, page!];
  
  UserArbitrationsListingLoaded copyWith({
    UserArbitrationsIndexModel? user_arbitrations,
    bool? hasReachedMax,
    int? page,
  }) {
    return UserArbitrationsListingLoaded(
      user_arbitrations: user_arbitrations ?? this.user_arbitrations,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'UserArbitrationsListingLoaded  UserArbitrationsListing: ${ user_arbitrations!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class UserArbitrationsListing extends Bloc<UserArbitrationsEvent, UserArbitrationsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  UserArbitrationsListing(this.application, this.url, this.isSearch, UserArbitrationsState initialState):
  super(initialState){
     on<UserArbitrationsList>(_UserArbitrationsListEvent);
	 on<UserArbitrationsListingRefresh>(_UserArbitrationsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<UserArbitrationsEvent, UserArbitrationsState>> transformEvents(
      Stream<UserArbitrationsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<UserArbitrationsEvent> transform<UserArbitrationsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<UserArbitrationsEvent, UserArbitrationsState> transition) {
    print(transition);
  }


  void _UserArbitrationsListEvent(UserArbitrationsList event, Emitter<UserArbitrationsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is UserArbitrationsListingUninitialized){
			  if(isSearch){
			     UserArbitrationsIndexModel user_arbitrations = await listingSearchUserArbitrations(1);
				  int deltaPage = user_arbitrations.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (UserArbitrationsListingLoaded(user_arbitrations: user_arbitrations,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  UserArbitrationsIndexModel user_arbitrations = await listingUserArbitrations(1);
				  int deltaPage = user_arbitrations.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (UserArbitrationsListingLoaded(user_arbitrations: user_arbitrations,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is UserArbitrationsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as UserArbitrationsListingLoaded).page! + 1;
				  UserArbitrationsIndexModel user_arbitrations = await listingUserArbitrations(page);
				  if(!user_arbitrations.items.items.isEmpty){
				     (currentState as UserArbitrationsListingLoaded).user_arbitrations!.items.items.addAll(user_arbitrations.items.items);
				  }
				  return emit (user_arbitrations.items.items.isEmpty
					  ? (currentState as UserArbitrationsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : UserArbitrationsListingLoaded(  user_arbitrations:  (currentState as UserArbitrationsListingLoaded).user_arbitrations ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as UserArbitrationsListingLoaded).page! + 1;
				  UserArbitrationsIndexModel user_arbitrations = await listingUserArbitrations(page);
				  return emit ( user_arbitrations.items.items.isEmpty
					  ? (currentState as UserArbitrationsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : UserArbitrationsListingLoaded(  user_arbitrations:  user_arbitrations ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( UserArbitrationsListingError());
      }
    }
  }

  void _UserArbitrationsListingRefreshEvent(UserArbitrationsListingRefresh event, Emitter<UserArbitrationsState> emit)async{
  final currentState = state;
    try {
        if (currentState is UserArbitrationsListingUninitialized) {
		   if(isSearch){
		      UserArbitrationsIndexModel user_arbitrations = await listingSearchUserArbitrations(1);
              return emit (UserArbitrationsListingLoaded( user_arbitrations: user_arbitrations,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     UserArbitrationsIndexModel user_arbitrations = await listingUserArbitrations(1);
             return emit (UserArbitrationsListingLoaded( user_arbitrations: user_arbitrations,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is UserArbitrationsListingLoaded) {
		  if(isSearch){
		     UserArbitrationsIndexModel user_arbitrations = await listingSearchRefreshUserArbitrations();
              return emit ( user_arbitrations.items.items.isEmpty
              ? (currentState as UserArbitrationsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserArbitrationsListingLoaded(  user_arbitrations: user_arbitrations ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      UserArbitrationsIndexModel user_arbitrations = await listingRefreshUserArbitrations();
              return emit ( user_arbitrations.items.items.isEmpty
              ? (currentState as UserArbitrationsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserArbitrationsListingLoaded(  user_arbitrations: user_arbitrations ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (UserArbitrationsListingError());
      }
  }

  @override
  get initialState => UserArbitrationsListingUninitialized();

  @override

  Stream<UserArbitrationsState> mapEventToState(UserArbitrationsEvent event) async* {
    final currentState = state;
    if (event is UserArbitrationsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is UserArbitrationsListingUninitialized){
			  if(isSearch){
			     UserArbitrationsIndexModel user_arbitrations = await listingSearchUserArbitrations(1);
				  int deltaPage = user_arbitrations.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield UserArbitrationsListingLoaded(user_arbitrations: user_arbitrations,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  UserArbitrationsIndexModel user_arbitrations = await listingUserArbitrations(1);
				  int deltaPage = user_arbitrations.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield UserArbitrationsListingLoaded(user_arbitrations: user_arbitrations,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is UserArbitrationsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as UserArbitrationsListingLoaded).page! + 1;
				  UserArbitrationsIndexModel user_arbitrations = await listingUserArbitrations(page);
				  if(!user_arbitrations.items.items.isEmpty){
				     (currentState as UserArbitrationsListingLoaded).user_arbitrations!.items.items.addAll(user_arbitrations.items.items);
				  }
				  yield user_arbitrations.items.items.isEmpty
					  ? (currentState as UserArbitrationsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : UserArbitrationsListingLoaded(  user_arbitrations:  (currentState as UserArbitrationsListingLoaded).user_arbitrations ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as UserArbitrationsListingLoaded).page! + 1;
				  UserArbitrationsIndexModel user_arbitrations = await listingUserArbitrations(page);
				  yield user_arbitrations.items.items.isEmpty
					  ? (currentState as UserArbitrationsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : UserArbitrationsListingLoaded(  user_arbitrations:  user_arbitrations ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield UserArbitrationsListingError();
      }
    } else if (event is UserArbitrationsListingRefresh){
      try {
        if (currentState is UserArbitrationsListingUninitialized) {
		   if(isSearch){
		      UserArbitrationsIndexModel user_arbitrations = await listingSearchUserArbitrations(1);
              yield UserArbitrationsListingLoaded( user_arbitrations: user_arbitrations,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     UserArbitrationsIndexModel user_arbitrations = await listingUserArbitrations(1);
             yield UserArbitrationsListingLoaded( user_arbitrations: user_arbitrations,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is UserArbitrationsListingLoaded) {
		  if(isSearch){
		     UserArbitrationsIndexModel user_arbitrations = await listingSearchRefreshUserArbitrations();
              yield user_arbitrations.items.items.isEmpty
              ? (currentState as UserArbitrationsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserArbitrationsListingLoaded(  user_arbitrations: user_arbitrations ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      UserArbitrationsIndexModel user_arbitrations = await listingRefreshUserArbitrations();
              yield user_arbitrations.items.items.isEmpty
              ? (currentState as UserArbitrationsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : UserArbitrationsListingLoaded(  user_arbitrations: user_arbitrations ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield UserArbitrationsListingError();
      }

    }
  }



  bool hasReachedMax(UserArbitrationsState state) =>
      state is UserArbitrationsListingLoaded && state.hasReachedMax!;


  Future<UserArbitrationsIndexModel> listingUserArbitrations(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = UserArbitrationsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserArbitrationsListSearch(dt ,'',page);
	
	return data;
  }

  Future<UserArbitrationsIndexModel> listingRefreshUserArbitrations() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = UserArbitrationsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserArbitrationsListSearch(dt ,'',page);
	
	return data;
  }

  Future<UserArbitrationsIndexModel> listingSearchUserArbitrations(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = UserArbitrationsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserArbitrationsListSearch(dt ,'',page);	
	return data;
  }

  Future<UserArbitrationsIndexModel> listingSearchRefreshUserArbitrations() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = UserArbitrationsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveUserArbitrationsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<UserArbitrationsIndexModel> _loadAndSaveUserArbitrationsListSearch(UserArbitrationsIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.arbitration_id;
    }
    return list;
 }


class  PublicUserArbitrationsListBottomLoader extends StatelessWidget {
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








  

















  

