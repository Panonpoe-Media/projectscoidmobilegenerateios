import 'package:equatable/equatable.dart';

abstract class MyReferalsEvent extends Equatable {
    const MyReferalsEvent();
	@override
    List<Object> get props => [];
}

class MyReferalsList extends MyReferalsEvent {
  @override
  String toString() => 'MyReferalsList';
}

class MyReferalsListingRefresh extends MyReferalsEvent {
  @override
  String toString() => 'MyReferalsListingRefresh';
}

class MyReferalsListingChangeSearch extends MyReferalsEvent {
  @override
  String toString() => 'MyReferalsChangeSearch';
}

