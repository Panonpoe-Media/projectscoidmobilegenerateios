import 'package:equatable/equatable.dart';

abstract class MyBuddiesEvent extends Equatable {
    const MyBuddiesEvent();
	@override
    List<Object> get props => [];
}

class MyBuddiesList extends MyBuddiesEvent {
  @override
  String toString() => 'MyBuddiesList';
}

class MyBuddiesListingRefresh extends MyBuddiesEvent {
  @override
  String toString() => 'MyBuddiesListingRefresh';
}

class MyBuddiesListingChangeSearch extends MyBuddiesEvent {
  @override
  String toString() => 'MyBuddiesChangeSearch';
}

