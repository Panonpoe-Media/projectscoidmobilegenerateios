import 'package:equatable/equatable.dart';

abstract class MySalesEvent extends Equatable {
    const MySalesEvent();
	@override
    List<Object> get props => [];
}

class MySalesList extends MySalesEvent {
  @override
  String toString() => 'MySalesList';
}

class MySalesListingRefresh extends MySalesEvent {
  @override
  String toString() => 'MySalesListingRefresh';
}

class MySalesListingChangeSearch extends MySalesEvent {
  @override
  String toString() => 'MySalesChangeSearch';
}

