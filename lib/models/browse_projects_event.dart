import 'package:equatable/equatable.dart';

abstract class BrowseProjectsEvent extends Equatable {
    const BrowseProjectsEvent();
	@override
    List<Object> get props => [];
}

class BrowseProjectsList extends BrowseProjectsEvent {
  @override
  String toString() => 'BrowseProjectsList';
}

class BrowseProjectsListingRefresh extends BrowseProjectsEvent {
  @override
  String toString() => 'BrowseProjectsListingRefresh';
}

class BrowseProjectsListingChangeSearch extends BrowseProjectsEvent {
  @override
  String toString() => 'BrowseProjectsChangeSearch';
}

