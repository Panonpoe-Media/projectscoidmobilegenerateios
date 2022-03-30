import 'package:equatable/equatable.dart';

abstract class MyPointsEvent extends Equatable {
    const MyPointsEvent();
	@override
    List<Object> get props => [];
}

class MyPointsList extends MyPointsEvent {
  @override
  String toString() => 'MyPointsList';
}

class MyPointsListingRefresh extends MyPointsEvent {
  @override
  String toString() => 'MyPointsListingRefresh';
}

class MyPointsListingChangeSearch extends MyPointsEvent {
  @override
  String toString() => 'MyPointsChangeSearch';
}

