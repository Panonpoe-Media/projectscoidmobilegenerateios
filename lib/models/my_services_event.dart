import 'package:equatable/equatable.dart';

abstract class MyServicesEvent extends Equatable {
    const MyServicesEvent();
	@override
    List<Object> get props => [];
}

class MyServicesList extends MyServicesEvent {
  @override
  String toString() => 'MyServicesList';
}

class MyServicesListingRefresh extends MyServicesEvent {
  @override
  String toString() => 'MyServicesListingRefresh';
}

class MyServicesListingChangeSearch extends MyServicesEvent {
  @override
  String toString() => 'MyServicesChangeSearch';
}

abstract class SalesMyServicesEvent extends Equatable {
    const SalesMyServicesEvent();
	@override
    List<Object> get props => [];
}

class SalesMyServicesList extends SalesMyServicesEvent {
  @override
  String toString() => 'SalesMyServicesList';
}

class SalesMyServicesListingRefresh extends SalesMyServicesEvent {
  @override
  String toString() => 'SalesMyServicesListingRefresh';
}

class SalesMyServicesListingChangeSearch extends SalesMyServicesEvent {
  @override
  String toString() => 'SalesMyServicesChangeSearch';
}
abstract class CommentsMyServicesEvent extends Equatable {
    const CommentsMyServicesEvent();
	@override
    List<Object> get props => [];
}

class CommentsMyServicesList extends CommentsMyServicesEvent {
  @override
  String toString() => 'CommentsMyServicesList';
}

class CommentsMyServicesListingRefresh extends CommentsMyServicesEvent {
  @override
  String toString() => 'CommentsMyServicesListingRefresh';
}

class CommentsMyServicesListingChangeSearch extends CommentsMyServicesEvent {
  @override
  String toString() => 'CommentsMyServicesChangeSearch';
}
abstract class ScreenshotsMyServicesEvent extends Equatable {
    const ScreenshotsMyServicesEvent();
	@override
    List<Object> get props => [];
}

class ScreenshotsMyServicesList extends ScreenshotsMyServicesEvent {
  @override
  String toString() => 'ScreenshotsMyServicesList';
}

class ScreenshotsMyServicesListingRefresh extends ScreenshotsMyServicesEvent {
  @override
  String toString() => 'ScreenshotsMyServicesListingRefresh';
}

class ScreenshotsMyServicesListingChangeSearch extends ScreenshotsMyServicesEvent {
  @override
  String toString() => 'ScreenshotsMyServicesChangeSearch';
}
