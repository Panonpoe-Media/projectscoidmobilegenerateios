import 'package:equatable/equatable.dart';

abstract class MyProductsEvent extends Equatable {
    const MyProductsEvent();
	@override
    List<Object> get props => [];
}

class MyProductsList extends MyProductsEvent {
  @override
  String toString() => 'MyProductsList';
}

class MyProductsListingRefresh extends MyProductsEvent {
  @override
  String toString() => 'MyProductsListingRefresh';
}

class MyProductsListingChangeSearch extends MyProductsEvent {
  @override
  String toString() => 'MyProductsChangeSearch';
}

abstract class SalesMyProductsEvent extends Equatable {
    const SalesMyProductsEvent();
	@override
    List<Object> get props => [];
}

class SalesMyProductsList extends SalesMyProductsEvent {
  @override
  String toString() => 'SalesMyProductsList';
}

class SalesMyProductsListingRefresh extends SalesMyProductsEvent {
  @override
  String toString() => 'SalesMyProductsListingRefresh';
}

class SalesMyProductsListingChangeSearch extends SalesMyProductsEvent {
  @override
  String toString() => 'SalesMyProductsChangeSearch';
}
abstract class CommentsMyProductsEvent extends Equatable {
    const CommentsMyProductsEvent();
	@override
    List<Object> get props => [];
}

class CommentsMyProductsList extends CommentsMyProductsEvent {
  @override
  String toString() => 'CommentsMyProductsList';
}

class CommentsMyProductsListingRefresh extends CommentsMyProductsEvent {
  @override
  String toString() => 'CommentsMyProductsListingRefresh';
}

class CommentsMyProductsListingChangeSearch extends CommentsMyProductsEvent {
  @override
  String toString() => 'CommentsMyProductsChangeSearch';
}
abstract class ScreenshotsMyProductsEvent extends Equatable {
    const ScreenshotsMyProductsEvent();
	@override
    List<Object> get props => [];
}

class ScreenshotsMyProductsList extends ScreenshotsMyProductsEvent {
  @override
  String toString() => 'ScreenshotsMyProductsList';
}

class ScreenshotsMyProductsListingRefresh extends ScreenshotsMyProductsEvent {
  @override
  String toString() => 'ScreenshotsMyProductsListingRefresh';
}

class ScreenshotsMyProductsListingChangeSearch extends ScreenshotsMyProductsEvent {
  @override
  String toString() => 'ScreenshotsMyProductsChangeSearch';
}
