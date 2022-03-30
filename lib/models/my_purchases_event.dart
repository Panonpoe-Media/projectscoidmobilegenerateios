import 'package:equatable/equatable.dart';

abstract class MyPurchasesEvent extends Equatable {
    const MyPurchasesEvent();
	@override
    List<Object> get props => [];
}

class MyPurchasesList extends MyPurchasesEvent {
  @override
  String toString() => 'MyPurchasesList';
}

class MyPurchasesListingRefresh extends MyPurchasesEvent {
  @override
  String toString() => 'MyPurchasesListingRefresh';
}

class MyPurchasesListingChangeSearch extends MyPurchasesEvent {
  @override
  String toString() => 'MyPurchasesChangeSearch';
}

