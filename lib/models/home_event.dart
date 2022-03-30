 import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class HomeList extends HomeEvent {
  @override
  String toString() => 'HomeList';
}

class HomeListingRefresh extends HomeEvent {
  @override
  String toString() => 'HomeListingRefresh';
}

class HomeListingChangeSearch extends HomeEvent {
  @override
  String toString() => 'HomeChangeSearch';
}
