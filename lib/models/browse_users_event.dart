import 'package:equatable/equatable.dart';

abstract class BrowseUsersEvent extends Equatable {
    const BrowseUsersEvent();
	@override
    List<Object> get props => [];
}

class BrowseUsersList extends BrowseUsersEvent {
  @override
  String toString() => 'BrowseUsersList';
}

class BrowseUsersListingRefresh extends BrowseUsersEvent {
  @override
  String toString() => 'BrowseUsersListingRefresh';
}

class BrowseUsersListingChangeSearch extends BrowseUsersEvent {
  @override
  String toString() => 'BrowseUsersChangeSearch';
}

