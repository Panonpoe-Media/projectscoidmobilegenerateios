import 'package:equatable/equatable.dart';

abstract class MyBookmarksEvent extends Equatable {
    const MyBookmarksEvent();
	@override
    List<Object> get props => [];
}

class MyBookmarksList extends MyBookmarksEvent {
  @override
  String toString() => 'MyBookmarksList';
}

class MyBookmarksListingRefresh extends MyBookmarksEvent {
  @override
  String toString() => 'MyBookmarksListingRefresh';
}

class MyBookmarksListingChangeSearch extends MyBookmarksEvent {
  @override
  String toString() => 'MyBookmarksChangeSearch';
}

