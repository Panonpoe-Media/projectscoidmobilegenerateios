import 'package:equatable/equatable.dart';

abstract class TestEvent extends Equatable {
    const TestEvent();
	@override
    List<Object> get props => [];
}

class TestList extends TestEvent {
  @override
  String toString() => 'TestList';
}

class TestListingRefresh extends TestEvent {
  @override
  String toString() => 'TestListingRefresh';
}

class TestListingChangeSearch extends TestEvent {
  @override
  String toString() => 'TestChangeSearch';
}

