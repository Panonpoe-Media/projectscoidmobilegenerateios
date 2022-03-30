import 'package:equatable/equatable.dart';

abstract class MyFinanceEvent extends Equatable {
    const MyFinanceEvent();
	@override
    List<Object> get props => [];
}

class MyFinanceList extends MyFinanceEvent {
  @override
  String toString() => 'MyFinanceList';
}

class MyFinanceListingRefresh extends MyFinanceEvent {
  @override
  String toString() => 'MyFinanceListingRefresh';
}

class MyFinanceListingChangeSearch extends MyFinanceEvent {
  @override
  String toString() => 'MyFinanceChangeSearch';
}

