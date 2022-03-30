import 'package:equatable/equatable.dart';

abstract class SupportEvent extends Equatable {
    const SupportEvent();
	@override
    List<Object> get props => [];
}

class SupportList extends SupportEvent {
  @override
  String toString() => 'SupportList';
}

class SupportListingRefresh extends SupportEvent {
  @override
  String toString() => 'SupportListingRefresh';
}

class SupportListingChangeSearch extends SupportEvent {
  @override
  String toString() => 'SupportChangeSearch';
}

