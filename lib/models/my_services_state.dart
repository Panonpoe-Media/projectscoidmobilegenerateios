import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_services.dart';
import 'package:projectscoid/models/model.dart';


abstract class MyServicesState extends Equatable {
    const MyServicesState();
	@override
	  List<Object> get props => [];
}

class MyServicesListingUninitialized extends MyServicesState {
  @override
  String toString() => 'MyServicesListingUninitialized';
}

class MyServicesListingError extends MyServicesState {
  @override
  String toString() => 'MyServicesListingError';
}

class MyServicesListingLoaded extends MyServicesState {
  final MyServicesListingModel? my_services;
  final bool? hasReachedMax;
  final int?  page;

  MyServicesListingLoaded({
    this.my_services,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_services!, hasReachedMax!, page!];
//  : super([my_services, hasReachedMax, page]);

  MyServicesListingLoaded copyWith({
    MyServicesListingModel? my_services,
    bool? hasReachedMax,
    int? page,
  }) {
    return MyServicesListingLoaded(
      my_services: my_services ?? this.my_services,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MyServicesListingLoaded  MyServicesListing: ${ my_services!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  

abstract class SalesMyServicesState extends Equatable {
    const SalesMyServicesState();
	@override
	  List<Object> get props => [];
  
}

class SalesMyServicesListingUninitialized extends SalesMyServicesState {
  @override
  String toString() => 'SalesMyServicesListingUninitialized';
}

class SalesMyServicesListingError extends SalesMyServicesState {
  @override
  String toString() => 'SalesMyServicesListingError';
}

class SalesMyServicesListingLoaded extends SalesMyServicesState {
  final SalesListingModel? sales;
  final bool? hasReachedMax;
  final int?  page;

  SalesMyServicesListingLoaded({
    this.sales,
    this.hasReachedMax,
    this.page,

  }) ;
   @override
  List<Object> get props => [sales!, hasReachedMax!, page!];
  //: super([sales, hasReachedMax, page]);

  SalesMyServicesListingLoaded copyWith({
    SalesListingModel? sales,
    bool? hasReachedMax,
    int? page,
  }) {
    return SalesMyServicesListingLoaded(
      sales: sales ?? this.sales,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'SalesMyServicesListingLoaded  SalesMyServicesListing: ${ sales!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


abstract class CommentsMyServicesState extends Equatable {
    const CommentsMyServicesState();
	@override
	  List<Object> get props => [];
  
}

class CommentsMyServicesListingUninitialized extends CommentsMyServicesState {
  @override
  String toString() => 'CommentsMyServicesListingUninitialized';
}

class CommentsMyServicesListingError extends CommentsMyServicesState {
  @override
  String toString() => 'CommentsMyServicesListingError';
}

class CommentsMyServicesListingLoaded extends CommentsMyServicesState {
  final CommentsListingModel? comments;
  final bool? hasReachedMax;
  final int?  page;

  CommentsMyServicesListingLoaded({
    this.comments,
    this.hasReachedMax,
    this.page,

  }) ;
   @override
  List<Object> get props => [comments!, hasReachedMax!, page!];
  //: super([comments, hasReachedMax, page]);

  CommentsMyServicesListingLoaded copyWith({
    CommentsListingModel? comments,
    bool? hasReachedMax,
    int? page,
  }) {
    return CommentsMyServicesListingLoaded(
      comments: comments ?? this.comments,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'CommentsMyServicesListingLoaded  CommentsMyServicesListing: ${ comments!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


abstract class ScreenshotsMyServicesState extends Equatable {
    const ScreenshotsMyServicesState();
	@override
	  List<Object> get props => [];
  
}

class ScreenshotsMyServicesListingUninitialized extends ScreenshotsMyServicesState {
  @override
  String toString() => 'ScreenshotsMyServicesListingUninitialized';
}

class ScreenshotsMyServicesListingError extends ScreenshotsMyServicesState {
  @override
  String toString() => 'ScreenshotsMyServicesListingError';
}

class ScreenshotsMyServicesListingLoaded extends ScreenshotsMyServicesState {
  final ScreenshotsListingModel? screenshots;
  final bool? hasReachedMax;
  final int?  page;

  ScreenshotsMyServicesListingLoaded({
    this.screenshots,
    this.hasReachedMax,
    this.page,

  }) ;
   @override
  List<Object> get props => [screenshots!, hasReachedMax!, page!];
  //: super([screenshots, hasReachedMax, page]);

  ScreenshotsMyServicesListingLoaded copyWith({
    ScreenshotsListingModel? screenshots,
    bool? hasReachedMax,
    int? page,
  }) {
    return ScreenshotsMyServicesListingLoaded(
      screenshots: screenshots ?? this.screenshots,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ScreenshotsMyServicesListingLoaded  ScreenshotsMyServicesListing: ${ screenshots!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

