import 'package:equatable/equatable.dart';

abstract class PastProjectsEvent extends Equatable {
    const PastProjectsEvent();
	@override
    List<Object> get props => [];
}

class PastProjectsList extends PastProjectsEvent {
  @override
  String toString() => 'PastProjectsList';
}

class PastProjectsListingRefresh extends PastProjectsEvent {
  @override
  String toString() => 'PastProjectsListingRefresh';
}

class PastProjectsListingChangeSearch extends PastProjectsEvent {
  @override
  String toString() => 'PastProjectsChangeSearch';
}

