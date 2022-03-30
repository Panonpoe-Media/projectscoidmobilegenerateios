
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:projectscoid/ProjectscoidApplication.dart';
import 'package:projectscoid/models/model.dart';
import 'package:projectscoid/repository/repository.dart';
import 'package:projectscoid/core/components/helpers/action_helpers.dart';
import 'dart:async';

class HomeController {

  ProjectscoidApplication? application;
  HomeListing? listing;

  String? url;
  AppAction? action;
  String? id;
  String? title;
  var formData;
  bool? isSearch;
  HomeController(this.application, this.url, this.action, this.id, this.title, this.formData,this.isSearch){
    switch (action?.index){
      case 0 : {listing = HomeListing(application, url, isSearch, HomeListingUninitialized());}
      break;
      case 1 : {}
      break;
      default:{}
    }
  }


  Future downloadFile() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await apiRepProvider?.downloadFile(url!, title!);
  }
  /*Future editHome()async{
    APIRepository apiRepProvider = application.projectsAPIRepository;
    var editHome;
    editHome = await apiRepProvider.getHomeEdit(url, id, title);
    return editHome;
  }*/

  Future postHome() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postHome;
    postHome = await apiRepProvider?.sendHomePost(url!,formData);
    return postHome;
  }
  
    Future postHomeWithID() async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    var postHome;
    postHome = await apiRepProvider?.sendHomePostWithID(url!,formData, id!, title!);
    return postHome;
  }
  
}

class HomeListing extends Bloc<HomeEvent, HomeState> {

  final ProjectscoidApplication? application;
  final String? url;
  final bool? isSearch;
  HomeListing(this.application, this.url, this.isSearch, HomeState initialState)
  :super(initialState){
	  on<HomeList>(_homeListEvent);
	
	  on<HomeListingRefresh>(_homeListingRefreshEvent);
  }
  @override
  void dispose() {
  //  super.dispose();
  }

  @override
  /*
  Stream<Transition<HomeEvent, HomeState>> transformEvents(
      Stream<HomeEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
   EventTransformer<HomeEvent> transform<HomeEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }
  
  
  
  @override
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    print(transition);
  }

  @override
  get initialState => HomeListingUninitialized();

  void _homeListEvent(HomeList event, Emitter<HomeState> emit)async{
  final currentState = state;
     if(!hasReachedMax(currentState)){
	   try {
        if (currentState is HomeListingUninitialized){
          if(isSearch!){
            HomeListingModel? home = await listingSearchHome(1);
            int deltaPage = home?.items.items.length ~/ 25;
            if (deltaPage < 1){
              deltaPage = 1;
            }
            return emit (HomeListingLoaded(home: home!,
                hasReachedMax: false,
                page: deltaPage));
          }else{
            HomeListingModel? home = await listingHome(1);
            int deltaPage = home!.items.items.length ~/ 25;
            if (deltaPage < 1){
              deltaPage = 1;
            }
            return emit (HomeListingLoaded(home: home!,
                hasReachedMax: false,
                page: deltaPage));
          }
        }

        if (currentState is HomeListingLoaded) {
          //page++;
          if(isSearch!){
            final page = (currentState as HomeListingLoaded).page! + 1;
            HomeListingModel? home = await listingHome(page);
            if(!home!.items.items.isEmpty){
              (currentState as HomeListingLoaded).home!.items.items.addAll(home!.items.items);
            }
            return emit ( home!.items.items.isEmpty
                ? (currentState as HomeListingLoaded).copyWith(hasReachedMax: true,
                page: page)
                : HomeListingLoaded(  home:  (currentState as HomeListingLoaded).home ,
              hasReachedMax: false,
              page: page,));
          }else{

            final page = (currentState as HomeListingLoaded).page! + 1;
            HomeListingModel? home = await listingHome(page);
            return emit ( home!.items.items.isEmpty
                ? (currentState as HomeListingLoaded).copyWith(hasReachedMax: true,
                page: page)
                : HomeListingLoaded(  home:  home ,
              hasReachedMax: false,
              page: page,));
          }
        }
      } catch (_) {
        return emit (HomeListingError());
      }
	 }
  }
  
    void _homeListingRefreshEvent(HomeListingRefresh event, Emitter<HomeState> emit)async{
    final currentState = state;
   try {
        if (currentState is HomeListingUninitialized) {
          if(isSearch!){
		  
	
            HomeListingModel? home = await listingSearchHome(1);
            return emit ( HomeListingLoaded( home: home!,
                hasReachedMax: false,
                page: 1 ));
          }else{
		   int page;
			
            HomeListingModel? home = await listingHome(1);
            return emit ( HomeListingLoaded( home: home!,
                hasReachedMax: false,
                page: 1 ));
          }

        }

        if (currentState is HomeListingLoaded) {
          if(isSearch!){
            HomeListingModel? home = await listingSearchRefreshHome();
            return emit ( home!.items.items.isEmpty
                ? (currentState as HomeListingLoaded).copyWith( hasReachedMax: false,
                page: 1)
                : HomeListingLoaded(  home: home ,
                hasReachedMax: false,
                page: 1 ));
          }else{
            HomeListingModel? home = await listingRefreshHome(1);
            return emit ( home!.items.items.isEmpty
                ? (currentState as HomeListingLoaded).copyWith( hasReachedMax: false,
                page: 1)
                : HomeListingLoaded(  home: home ,
                hasReachedMax: false,
                page: 1 ));
          }

        }
      } catch (_) {
        return emit ( HomeListingError());
      }
}

  @override

  Stream<HomeState> mapEventToState(HomeEvent event) async* {
  final currentState = state;
    if (event is HomeList && !hasReachedMax(currentState)) {
      try {
        if (currentState is HomeListingUninitialized){
          if(isSearch!){
            HomeListingModel? home = await listingSearchHome(1);
            int deltaPage = home!.items.items.length ~/ 25;
            if (deltaPage < 1){
              deltaPage = 1;
            }
            yield HomeListingLoaded(home: home!,
                hasReachedMax: false,
                page: deltaPage);
          }else{
            HomeListingModel? home = await listingHome(1);
            int deltaPage = home!.items.items.length ~/ 25;
            if (deltaPage < 1){
              deltaPage = 1;
            }
            yield HomeListingLoaded(home: home!,
                hasReachedMax: false,
                page: deltaPage);
          }
        }

        if (currentState is HomeListingLoaded) {
          //page++;
          if(isSearch!){
            final page = (currentState as HomeListingLoaded).page! + 1;
            HomeListingModel? home = await listingHome(page);
            if(!home!.items.items.isEmpty){
              (currentState as HomeListingLoaded).home!.items.items.addAll(home!.items.items);
            }
            yield home!.items.items.isEmpty
                ? (currentState as HomeListingLoaded).copyWith(hasReachedMax: true,
                page: page)
                : HomeListingLoaded(  home:  (currentState as HomeListingLoaded).home ,
              hasReachedMax: false,
              page: page,);
          }else{

            final page = (currentState as HomeListingLoaded).page! + 1;
            HomeListingModel? home = await listingHome(page);
            yield home!.items.items.isEmpty
                ? (currentState as HomeListingLoaded).copyWith(hasReachedMax: true,
                page: page)
                : HomeListingLoaded(  home:  home ,
              hasReachedMax: false,
              page: page,);
          }
        }
      } catch (_) {
        yield HomeListingError();
      }
    } else if (event is HomeListingRefresh){
      try {
        if (currentState is HomeListingUninitialized) {
          if(isSearch!){
		  
	
            HomeListingModel? home = await listingSearchHome(1);
            yield HomeListingLoaded( home: home!,
                hasReachedMax: false,
                page: 1 );
          }else{
		   int page;
			
            HomeListingModel? home = await listingHome(1);
            yield HomeListingLoaded( home: home!,
                hasReachedMax: false,
                page: 1 );
          }

        }

        if (currentState is HomeListingLoaded) {
          if(isSearch!){
            HomeListingModel? home = await listingSearchRefreshHome();
            yield home!.items.items.isEmpty
                ? (currentState as HomeListingLoaded).copyWith( hasReachedMax: false,
                page: 1)
                : HomeListingLoaded(  home: home ,
                hasReachedMax: false,
                page: 1 );
          }else{
            HomeListingModel? home = await listingRefreshHome(1);
            yield home!.items.items.isEmpty
                ? (currentState as HomeListingLoaded).copyWith( hasReachedMax: false,
                page: 1)
                : HomeListingLoaded(  home: home ,
                hasReachedMax: false,
                page: 1 );
          }

        }
      } catch (_) {
        yield HomeListingError();
      }

    }
  }

  bool hasReachedMax(HomeState state) =>
      state is HomeListingLoaded && state.hasReachedMax!;

  Future<HomeListingModel?> listingHome(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getHomeList(url!, page!);
  }

  Future<HomeListingModel?> listingRefreshHome(int? page) async {
    HomeListingModel? home;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    await application?.projectsDBRepository?.deleteAllHomeList();
    home  = await apiRepProvider?.getHomeList(url!, 1);
    return home;
  }


  Future<HomeListingModel?> listingSearchHome(int? page) async {
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    return await apiRepProvider?.getHomeListSearch(url!, page!);
  }

  Future<HomeListingModel?> listingSearchRefreshHome() async {
    HomeListingModel? home ;
    APIRepository? apiRepProvider = application?.projectsAPIRepository;
    home  = await apiRepProvider?.getHomeListSearch(url!, 1);
    return home!;
  }

}

