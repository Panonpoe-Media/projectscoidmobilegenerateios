import 'package:equatable/equatable.dart';

abstract class MyOrdersEvent extends Equatable {
    const MyOrdersEvent();
	@override
    List<Object> get props => [];
}

class MyOrdersList extends MyOrdersEvent {
  @override
  String toString() => 'MyOrdersList';
}

class MyOrdersListingRefresh extends MyOrdersEvent {
  @override
  String toString() => 'MyOrdersListingRefresh';
}

class MyOrdersListingChangeSearch extends MyOrdersEvent {
  @override
  String toString() => 'MyOrdersChangeSearch';
}

