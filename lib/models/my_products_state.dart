import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_products.dart';
import 'package:projectscoid/models/model.dart';


abstract class MyProductsState extends Equatable {
    const MyProductsState();
	@override
	  List<Object> get props => [];
}

class MyProductsListingUninitialized extends MyProductsState {
  @override
  String toString() => 'MyProductsListingUninitialized';
}

class MyProductsListingError extends MyProductsState {
  @override
  String toString() => 'MyProductsListingError';
}

class MyProductsListingLoaded extends MyProductsState {
  final MyProductsListingModel? my_products;
  final bool? hasReachedMax;
  final int?  page;

  MyProductsListingLoaded({
    this.my_products,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_products!, hasReachedMax!, page!];
//  : super([my_products, hasReachedMax, page]);

  MyProductsListingLoaded copyWith({
    MyProductsListingModel? my_products,
    bool? hasReachedMax,
    int? page,
  }) {
    return MyProductsListingLoaded(
      my_products: my_products ?? this.my_products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MyProductsListingLoaded  MyProductsListing: ${ my_products!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  

abstract class SalesMyProductsState extends Equatable {
    const SalesMyProductsState();
	@override
	  List<Object> get props => [];
  
}

class SalesMyProductsListingUninitialized extends SalesMyProductsState {
  @override
  String toString() => 'SalesMyProductsListingUninitialized';
}

class SalesMyProductsListingError extends SalesMyProductsState {
  @override
  String toString() => 'SalesMyProductsListingError';
}

class SalesMyProductsListingLoaded extends SalesMyProductsState {
  final SalesListingModel? sales;
  final bool? hasReachedMax;
  final int?  page;

  SalesMyProductsListingLoaded({
    this.sales,
    this.hasReachedMax,
    this.page,

  }) ;
   @override
  List<Object> get props => [sales!, hasReachedMax!, page!];
  //: super([sales, hasReachedMax, page]);

  SalesMyProductsListingLoaded copyWith({
    SalesListingModel? sales,
    bool? hasReachedMax,
    int? page,
  }) {
    return SalesMyProductsListingLoaded(
      sales: sales ?? this.sales,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'SalesMyProductsListingLoaded  SalesMyProductsListing: ${ sales!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


abstract class CommentsMyProductsState extends Equatable {
    const CommentsMyProductsState();
	@override
	  List<Object> get props => [];
  
}

class CommentsMyProductsListingUninitialized extends CommentsMyProductsState {
  @override
  String toString() => 'CommentsMyProductsListingUninitialized';
}

class CommentsMyProductsListingError extends CommentsMyProductsState {
  @override
  String toString() => 'CommentsMyProductsListingError';
}

class CommentsMyProductsListingLoaded extends CommentsMyProductsState {
  final CommentsListingModel? comments;
  final bool? hasReachedMax;
  final int?  page;

  CommentsMyProductsListingLoaded({
    this.comments,
    this.hasReachedMax,
    this.page,

  }) ;
   @override
  List<Object> get props => [comments!, hasReachedMax!, page!];
  //: super([comments, hasReachedMax, page]);

  CommentsMyProductsListingLoaded copyWith({
    CommentsListingModel? comments,
    bool? hasReachedMax,
    int? page,
  }) {
    return CommentsMyProductsListingLoaded(
      comments: comments ?? this.comments,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'CommentsMyProductsListingLoaded  CommentsMyProductsListing: ${ comments!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


abstract class ScreenshotsMyProductsState extends Equatable {
    const ScreenshotsMyProductsState();
	@override
	  List<Object> get props => [];
  
}

class ScreenshotsMyProductsListingUninitialized extends ScreenshotsMyProductsState {
  @override
  String toString() => 'ScreenshotsMyProductsListingUninitialized';
}

class ScreenshotsMyProductsListingError extends ScreenshotsMyProductsState {
  @override
  String toString() => 'ScreenshotsMyProductsListingError';
}

class ScreenshotsMyProductsListingLoaded extends ScreenshotsMyProductsState {
  final ScreenshotsListingModel? screenshots;
  final bool? hasReachedMax;
  final int?  page;

  ScreenshotsMyProductsListingLoaded({
    this.screenshots,
    this.hasReachedMax,
    this.page,

  }) ;
   @override
  List<Object> get props => [screenshots!, hasReachedMax!, page!];
  //: super([screenshots, hasReachedMax, page]);

  ScreenshotsMyProductsListingLoaded copyWith({
    ScreenshotsListingModel? screenshots,
    bool? hasReachedMax,
    int? page,
  }) {
    return ScreenshotsMyProductsListingLoaded(
      screenshots: screenshots ?? this.screenshots,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ScreenshotsMyProductsListingLoaded  ScreenshotsMyProductsListing: ${ screenshots!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

