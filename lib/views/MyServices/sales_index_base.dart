
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



class SalesIndexBase extends StatefulWidget {
  final String? id ;
  final String? title;
  String? url;
  SalesIndexBase({Key? key, this.id, this.title, this.url}) : super(key: key);
  @override
  SalesIndexBaseState createState() => SalesIndexBaseState();
}

class  SalesIndexBaseState extends State<SalesIndexBase>{
  String title = 'Sales'; 
  bool _dialVisible = true;
  bool search = true;
  String getPath = '';
  final scrollController = ScrollController();
  TextEditingController searchBoxController = TextEditingController();
  final scrollThreshold = 200.0;
  bool selected = false;
  String searchText = '';
  SalesListing? listing;

  SalesIndexBaseState() {
   
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
     String order_item_id = 'order_item_id';
	 order_item_id = order_item_id.replaceAll('_id','');
     getPath = widget.url! + order_item_id + 'page=%s';
	listing = new SalesListing(AppProvider.getApplication(context), getPath, false, SalesListingUninitialized());
    listing!.add(SalesList());
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
    return BlocBuilder<SalesListing, SalesState>(
     bloc: listing,

      builder: (BuildContext context, state) {
        if (state is SalesListingUninitialized) {
         // return Center(
         //   child: CircularProgressIndicator(),
         // );
          return new Container(width: 0.0, height: 0.0);
        }
        if (state is SalesListingError) {
          return Center(
            child: Text('failed to ' + title),
          );
        }
        if (state is SalesListingLoaded) {
          if (state.sales!.items.items.isEmpty) {
		  if (state.sales!.tools.buttons.length == 0){ 
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
                 floatingActionButton: state.sales!.Buttons(context, _dialVisible)
              );
			  }
          }
			if (state.sales!.tools.buttons.length == 0){ 
				return
				Scaffold(
					body:
							RefreshIndicator(
							  child: new ListView.builder(
								itemBuilder: (BuildContext context, int index) {

								  return index >= state.sales!.items.items.length
									  ?  UserSalesListBottomLoader()
									  : state.sales!.viewItem (state.sales!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.sales!.items.items.length
									: state.sales!.items.items.length + 1,
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

								  return index >= state.sales!.items.items.length
									  ?  UserSalesListBottomLoader()
									  : state.sales!.viewItem (state.sales!.items.items[index] , searchText );
								},
								itemCount: state.hasReachedMax!
									? state.sales!.items.items.length
									: state.sales!.items.items.length + 1,
								controller: scrollController,
							  ),
							  onRefresh: _onRefresh,
							),
							
					floatingActionButton: state.sales!.Buttons(context, _dialVisible)
							
                   
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
    listing!.add(SalesListingRefresh());

    Timer timer = new Timer(new Duration(seconds: 3), () {
      completer.complete();
    }); 
    return completer.future;
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= scrollThreshold) {
      listing!.add(SalesList());
    }

  }
}




abstract class SalesEvent extends Equatable {
const SalesEvent();
   @override
    List<Object> get props => [];
}

class SalesList extends SalesEvent {
  @override
  String toString() => 'SalesList';
}

class SalesListingRefresh extends SalesEvent {
  @override
  String toString() => 'SalesListingRefresh';
}

class SalesListingChangeSearch extends SalesEvent {
  @override
  String toString() => 'SalesChangeSearch';
}


abstract class SalesState extends Equatable {
  const SalesState();
   @override
    List<Object> get props => [];
}

class SalesListingUninitialized extends SalesState {
  @override
  String toString() => 'SalesListingUninitialized';
}

class SalesListingError extends SalesState {
  @override
  String toString() => 'SalesListingError';
}

class SalesListingLoaded extends SalesState {
  final SalesIndexModel? sales;
  final bool? hasReachedMax;
  final int?  page;

  SalesListingLoaded({
    this.sales,
    this.hasReachedMax,
    this.page,

  });
   @override
    List<Object> get props => [sales!, hasReachedMax!, page!];
  
  SalesListingLoaded copyWith({
    SalesIndexModel? sales,
    bool? hasReachedMax,
    int? page,
  }) {
    return SalesListingLoaded(
      sales: sales ?? this.sales,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'SalesListingLoaded  SalesListing: ${ sales!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


class SalesListing extends Bloc<SalesEvent, SalesState> {


  final ProjectscoidApplication application;
  final String url;
  final bool isSearch;
  SalesListing(this.application, this.url, this.isSearch, SalesState initialState):
  super(initialState){
     on<SalesList>(_SalesListEvent);
	 on<SalesListingRefresh>(_SalesListingRefreshEvent); 
  }
  @override
  void dispose() {
   // super.dispose();
  }


  @override
  /*
 Stream<Transition<SalesEvent, SalesState>> transformEvents(
      Stream<SalesEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 500)), transitionFn);
  }
  */
  EventTransformer<SalesEvent> transform<SalesEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void onTransition(Transition<SalesEvent, SalesState> transition) {
    print(transition);
  }


  void _SalesListEvent(SalesList event, Emitter<SalesState> emit)async{
  final currentState = state;
     if ( !hasReachedMax(currentState)) {
      try {
        if (currentState is SalesListingUninitialized){
			  if(isSearch){
			     SalesIndexModel sales = await listingSearchSales(1);
				  int deltaPage = sales.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  return emit (SalesListingLoaded(sales: sales,
					  hasReachedMax: false,
					  page: deltaPage));
			  }else{
				  SalesIndexModel sales = await listingSales(1);
				  int deltaPage = sales.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				 return emit (SalesListingLoaded(sales: sales,
					  hasReachedMax: false,
					  page: deltaPage));
			  }
        }

        if (currentState is SalesListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as SalesListingLoaded).page! + 1;
				  SalesIndexModel sales = await listingSales(page);
				  if(!sales.items.items.isEmpty){
				     (currentState as SalesListingLoaded).sales!.items.items.addAll(sales.items.items);
				  }
				  return emit (sales.items.items.isEmpty
					  ? (currentState as SalesListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : SalesListingLoaded(  sales:  (currentState as SalesListingLoaded).sales ,
											  hasReachedMax: false,
											  page: page,));
			}else{
		  
				  final page = (currentState as SalesListingLoaded).page! + 1;
				  SalesIndexModel sales = await listingSales(page);
				  return emit ( sales.items.items.isEmpty
					  ? (currentState as SalesListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : SalesListingLoaded(  sales:  sales ,
											  hasReachedMax: false,
											  page: page,));
			}	  
        }
      } catch (_) {
       return emit ( SalesListingError());
      }
    }
  }

  void _SalesListingRefreshEvent(SalesListingRefresh event, Emitter<SalesState> emit)async{
  final currentState = state;
    try {
        if (currentState is SalesListingUninitialized) {
		   if(isSearch){
		      SalesIndexModel sales = await listingSearchSales(1);
              return emit (SalesListingLoaded( sales: sales,
                   hasReachedMax: false,
                   page: 1 ));
		   }else{
		     SalesIndexModel sales = await listingSales(1);
             return emit (SalesListingLoaded( sales: sales,
                   hasReachedMax: false,
                   page: 1 ));
		   }

        }

        if (currentState is SalesListingLoaded) {
		  if(isSearch){
		     SalesIndexModel sales = await listingSearchRefreshSales();
              return emit ( sales.items.items.isEmpty
              ? (currentState as SalesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : SalesListingLoaded(  sales: sales ,
              hasReachedMax: false,
              page: 1 ));
		  }else{
		      SalesIndexModel sales = await listingRefreshSales();
              return emit ( sales.items.items.isEmpty
              ? (currentState as SalesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : SalesListingLoaded(  sales: sales ,
              hasReachedMax: false,
              page: 1 ));
		  }

        }
      } catch (_) {
        return emit (SalesListingError());
      }
  }

  @override
  get initialState => SalesListingUninitialized();

  @override

  Stream<SalesState> mapEventToState(SalesEvent event) async* {
    final currentState = state;
    if (event is SalesList && !hasReachedMax(currentState)) {
      try {
        if (currentState is SalesListingUninitialized){
			  if(isSearch){
			     SalesIndexModel sales = await listingSearchSales(1);
				  int deltaPage = sales.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield SalesListingLoaded(sales: sales,
					  hasReachedMax: false,
					  page: deltaPage);
			  }else{
				  SalesIndexModel sales = await listingSales(1);
				  int deltaPage = sales.items.items.length ~/ 25;
				  if (deltaPage < 1){
					deltaPage = 1;
				  }
				  yield SalesListingLoaded(sales: sales,
					  hasReachedMax: false,
					  page: deltaPage);
			  }
        }

        if (currentState is SalesListingLoaded) {
          //page++;
		  	if(isSearch){
			  	  final page = (currentState as SalesListingLoaded).page! + 1;
				  SalesIndexModel sales = await listingSales(page);
				  if(!sales.items.items.isEmpty){
				     (currentState as SalesListingLoaded).sales!.items.items.addAll(sales.items.items);
				  }
				  yield sales.items.items.isEmpty
					  ? (currentState as SalesListingLoaded).copyWith(hasReachedMax: true,
					  page: page)                           
					  : SalesListingLoaded(  sales:  (currentState as SalesListingLoaded).sales ,
											  hasReachedMax: false,
											  page: page,);
			}else{
		  
				  final page = (currentState as SalesListingLoaded).page! + 1;
				  SalesIndexModel sales = await listingSales(page);
				  yield sales.items.items.isEmpty
					  ? (currentState as SalesListingLoaded).copyWith(hasReachedMax: true,
					  page: page)
					  : SalesListingLoaded(  sales:  sales ,
											  hasReachedMax: false,
											  page: page,);
			}	  
        }
      } catch (_) {
        yield SalesListingError();
      }
    } else if (event is SalesListingRefresh){
      try {
        if (currentState is SalesListingUninitialized) {
		   if(isSearch){
		      SalesIndexModel sales = await listingSearchSales(1);
              yield SalesListingLoaded( sales: sales,
                   hasReachedMax: false,
                   page: 1 );
		   }else{
		     SalesIndexModel sales = await listingSales(1);
             yield SalesListingLoaded( sales: sales,
                   hasReachedMax: false,
                   page: 1 );
		   }

        }

        if (currentState is SalesListingLoaded) {
		  if(isSearch){
		     SalesIndexModel sales = await listingSearchRefreshSales();
              yield sales.items.items.isEmpty
              ? (currentState as SalesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : SalesListingLoaded(  sales: sales ,
              hasReachedMax: false,
              page: 1 );
		  }else{
		      SalesIndexModel sales = await listingRefreshSales();
              yield sales.items.items.isEmpty
              ? (currentState as SalesListingLoaded).copyWith( hasReachedMax: false,
              page: 1)
              : SalesListingLoaded(  sales: sales ,
              hasReachedMax: false,
              page: 1 );
		  }

        }
      } catch (_) {
        yield SalesListingError();
      }

    }
  }



  bool hasReachedMax(SalesState state) =>
      state is SalesListingLoaded && state.hasReachedMax!;


  Future<SalesIndexModel> listingSales(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	
	var dt  = SalesIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveSalesListSearch(dt ,'',page);
	
	return data;
  }

  Future<SalesIndexModel> listingRefreshSales() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
	var dt  = SalesIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveSalesListSearch(dt ,'',page);
	
	return data;
  }

  Future<SalesIndexModel> listingSearchSales(int page) async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;

	var dt  = SalesIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveSalesListSearch(dt ,'',page);	
	return data;
  }

  Future<SalesIndexModel> listingSearchRefreshSales() async {
    APIRepository? apiRepProvider = application.projectsAPIRepository;
	int page = 0;
		var dt  = SalesIndexModel(await apiRepProvider!.getData(sprintf(url, [page])));
	final data = await _loadAndSaveSalesListSearch(dt ,'',page);
	
	return data;
  }
}


Future<SalesIndexModel> _loadAndSaveSalesListSearch(SalesIndexModel list, String searchKey, int page) async{

    int age = DateTime.now().toUtc().millisecondsSinceEpoch;
	
    for(var i = 0; i < list.items.items.length ; i++){

      list.items.items[i].item.cnt = i ;
      list.items.items[i].item.age = age;
      list.items.items[i].item.page = page;
	  list.items.items[i].item.ttl = '';
	  list.items.items[i].item.pht = 'https://cdn.projects.co.id/assets/img/projectscoid.png';
	  list.items.items[i].item.sbttl = '';
	  
	  list.items.items[i].item.ttl = list.items.items[i].item.order_item_id;
    }
    return list;
 }


class  UserSalesListBottomLoader extends StatelessWidget {
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








  

















  

