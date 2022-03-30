
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



class ScreenshotsIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  ScreenshotsIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  ScreenshotsIndexBaseState createState() => ScreenshotsIndexBaseState();
}

class  ScreenshotsIndexBaseState extends State<ScreenshotsIndexBase>{
  String title = 'Screenshots'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  ScreenshotsListing? listing;

  ScreenshotsIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String product_images_id = 'product_images_id';
	 product_images_id = product_images_id.replaceAll('_id','');
     getPath = widget.url! + product_images_id + 'page=%s';
	listing = new ScreenshotsListing(AppProvider.getApplication(context), getPath, false, ScreenshotsListingUninitialized());
    listing!.add(ScreenshotsList());
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
    return BlocBuilder<ScreenshotsListing, ScreenshotsState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is ScreenshotsListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is ScreenshotsListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is ScreenshotsListingLoaded) {
          if (state.screenshots!.items.items.isEmpty) {
		  if (state.screenshots!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.screenshots!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.screenshots!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.screenshots!.items.items.length
									  ?  PublicScreenshotsListBottomLoader()
									  : state.screenshots!.viewItem (state.screenshots!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.screenshots!.items.items.length
									: state.screenshots!.items.items.length + 1,
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

								  return index >= state.screenshots!.items.items.length
									  ?  PublicScreenshotsListBottomLoader()
									  : state.screenshots!.viewItem (state.screenshots!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.screenshots!.items.items.length
									: state.screenshots!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.screenshots!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(ScreenshotsListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(ScreenshotsList());
    }

  }
}




abstract class ScreenshotsEvent extends Equatable {
const ScreenshotsEvent();
   @override
    List<Object> get props => [];
}

class ScreenshotsList extends ScreenshotsEvent {
  @override
  String toString() => 'ScreenshotsList';
}

class ScreenshotsListingRefresh extends ScreenshotsEvent {
  @override
  String toString() => 'ScreenshotsListingRefresh';
}

class ScreenshotsListingChangeSearch extends ScreenshotsEvent {
  @override
  String toString() => 'ScreenshotsChangeSearch';
}


abstract class ScreenshotsState extends Equatable {
  const ScreenshotsState();
   @override
    List<Object> get props => [];
}

class ScreenshotsListingUninitialized extends ScreenshotsState {
  @override
  String toString() => 'ScreenshotsListingUninitialized';
}

class ScreenshotsListingError extends ScreenshotsState {
  @override
  String toString() => 'ScreenshotsListingError';
}

class ScreenshotsListingLoaded extends ScreenshotsState {
  final ScreenshotsIndexModel? screenshots;
  final bool? hasReachedMax;
  final int?  page;

  ScreenshotsListingLoaded({
    this.screenshots,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [screenshots!, hasReachedMax!, page!];
  
  ScreenshotsListingLoaded copyWith({
    ScreenshotsIndexModel? screenshots,
    bool? hasReachedMax,
    int? page,
  }) {
    return ScreenshotsListingLoaded(
      screenshots: screenshots ?? this.screenshots,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ScreenshotsListingLoaded  ScreenshotsListing: ${ screenshots!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class ScreenshotsListing extends Bloc<ScreenshotsEvent, ScreenshotsState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  ScreenshotsListing(this.application, this.url, this.isSearch, ScreenshotsState initialState):
  super(initialState){
     on<ScreenshotsList>(_ScreenshotsListEvent);
	 on<ScreenshotsListingRefresh>(_ScreenshotsListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<ScreenshotsEvent, ScreenshotsState>> transformEvents(
      Stream<ScreenshotsEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<ScreenshotsEvent> transform<ScreenshotsEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<ScreenshotsEvent, ScreenshotsState> transition) {
    print(transition);
  }


  void _ScreenshotsListEvent(ScreenshotsList event, Emitter<ScreenshotsState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is ScreenshotsListingUninitialized){
			  if(isSearch){
			     ScreenshotsIndexModel screenshots = await listingSearchScreenshots(1);
				  int deltaPage = screenshots.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (ScreenshotsListingLoaded(screenshots: screenshots,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  ScreenshotsIndexModel screenshots = await listingScreenshots(1);
				  int deltaPage = screenshots.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (ScreenshotsListingLoaded(screenshots: screenshots,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is ScreenshotsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ScreenshotsListingLoaded).page! + 1;
				  ScreenshotsIndexModel screenshots = await listingScreenshots(page);
				  if(!screenshots.items.items.isEmpty){
				     (currentState as ScreenshotsListingLoaded).screenshots!.items.items.addAll(screenshots.items.items);
				  }
				  return emit (screenshots.items.items.isEmpty
					  ? (currentState as ScreenshotsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ScreenshotsListingLoaded(  screenshots:  (currentState as ScreenshotsListingLoaded).screenshots ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as ScreenshotsListingLoaded).page! + 1;
				  ScreenshotsIndexModel screenshots = await listingScreenshots(page);
				  return emit ( screenshots.items.items.isEmpty
					  ? (currentState as ScreenshotsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ScreenshotsListingLoaded(  screenshots:  screenshots ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( ScreenshotsListingError());
      }
    }
  }

  void _ScreenshotsListingRefreshEvent(ScreenshotsListingRefresh event, Emitter<ScreenshotsState> emit)async{
  final currentState = state;
    try {
        if (currentState is ScreenshotsListingUninitialized) {
		   if(isSearch){
		      ScreenshotsIndexModel screenshots = await listingSearchScreenshots(1);
              return emit (ScreenshotsListingLoaded( screenshots: screenshots,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     ScreenshotsIndexModel screenshots = await listingScreenshots(1);
             return emit (ScreenshotsListingLoaded( screenshots: screenshots,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is ScreenshotsListingLoaded) {
		  if(isSearch){
		     ScreenshotsIndexModel screenshots = await listingSearchRefreshScreenshots();
              return emit ( screenshots.items.items.isEmpty
              ? (currentState as ScreenshotsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ScreenshotsListingLoaded(  screenshots: screenshots ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      ScreenshotsIndexModel screenshots = await listingRefreshScreenshots();
              return emit ( screenshots.items.items.isEmpty
              ? (currentState as ScreenshotsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ScreenshotsListingLoaded(  screenshots: screenshots ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (ScreenshotsListingError());
      }
  }

  @override
  get initialState => ScreenshotsListingUninitialized();

  @override

  Stream<ScreenshotsState> mapEventToState(ScreenshotsEvent event) async* {
    final currentState = state;
    if (event is ScreenshotsList && !hasReachedMax(currentState)) {
      try {
        if (currentState is ScreenshotsListingUninitialized){
			  if(isSearch){
			     ScreenshotsIndexModel screenshots = await listingSearchScreenshots(1);
				  int deltaPage = screenshots.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ScreenshotsListingLoaded(screenshots: screenshots,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  ScreenshotsIndexModel screenshots = await listingScreenshots(1);
				  int deltaPage = screenshots.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield ScreenshotsListingLoaded(screenshots: screenshots,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is ScreenshotsListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as ScreenshotsListingLoaded).page! + 1;
				  ScreenshotsIndexModel screenshots = await listingScreenshots(page);
				  if(!screenshots.items.items.isEmpty){
				     (currentState as ScreenshotsListingLoaded).screenshots!.items.items.addAll(screenshots.items.items);
				  }
				  yield screenshots.items.items.isEmpty
					  ? (currentState as ScreenshotsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : ScreenshotsListingLoaded(  screenshots:  (currentState as ScreenshotsListingLoaded).screenshots ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as ScreenshotsListingLoaded).page! + 1;
				  ScreenshotsIndexModel screenshots = await listingScreenshots(page);
				  yield screenshots.items.items.isEmpty
					  ? (currentState as ScreenshotsListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : ScreenshotsListingLoaded(  screenshots:  screenshots ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield ScreenshotsListingError();
      }
    } else if (event is ScreenshotsListingRefresh){
      try {
        if (currentState is ScreenshotsListingUninitialized) {
		   if(isSearch){
		      ScreenshotsIndexModel screenshots = await listingSearchScreenshots(1);
              yield ScreenshotsListingLoaded( screenshots: screenshots,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     ScreenshotsIndexModel screenshots = await listingScreenshots(1);
             yield ScreenshotsListingLoaded( screenshots: screenshots,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is ScreenshotsListingLoaded) {
		  if(isSearch){
		     ScreenshotsIndexModel screenshots = await listingSearchRefreshScreenshots();
              yield screenshots.items.items.isEmpty
              ? (currentState as ScreenshotsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ScreenshotsListingLoaded(  screenshots: screenshots ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      ScreenshotsIndexModel screenshots = await listingRefreshScreenshots();
              yield screenshots.items.items.isEmpty
              ? (currentState as ScreenshotsListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : ScreenshotsListingLoaded(  screenshots: screenshots ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield ScreenshotsListingError();
      }

    }
  }



  bool hasReachedMax(ScreenshotsState state) =>
      state is ScreenshotsListingLoaded && state.hasReachedMax!;


  Future<ScreenshotsIndexModel> listingScreenshots(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = ScreenshotsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveScreenshotsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ScreenshotsIndexModel> listingRefreshScreenshots() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = ScreenshotsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveScreenshotsListSearch(dt ,'',page);
	
	return data;
  }

  Future<ScreenshotsIndexModel> listingSearchScreenshots(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = ScreenshotsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveScreenshotsListSearch(dt ,'',page);	
	return data;
  }

  Future<ScreenshotsIndexModel> listingSearchRefreshScreenshots() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = ScreenshotsIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveScreenshotsListSearch(dt ,'',page);
	
	return data;
  }
}


Future<ScreenshotsIndexModel> _loadAndSaveScreenshotsListSearch(ScreenshotsIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.product_images_id;
	  list.items.items[i].item.sbttl = list.items.items[i].item.description;
    }
    return list;
 }


class  PublicScreenshotsListBottomLoader extends StatelessWidget {
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








  

















  

