import 'package:equatable/equatable.dart';

abstract class MyProjectsEvent extends Equatable {
    const MyProjectsEvent();
	@override
    List<Object> get props => [];
}

class MyProjectsList extends MyProjectsEvent {
  @override
  String toString() => 'MyProjectsList';
}

class MyProjectsListingRefresh extends MyProjectsEvent {
  @override
  String toString() => 'MyProjectsListingRefresh';
}

class MyProjectsListingChangeSearch extends MyProjectsEvent {
  @override
  String toString() => 'MyProjectsChangeSearch';
}

abstract class ShowBidsMyProjectsEvent extends Equatable {
    const ShowBidsMyProjectsEvent();
	@override
    List<Object> get props => [];
}

class ShowBidsMyProjectsList extends ShowBidsMyProjectsEvent {
  @override
  String toString() => 'ShowBidsMyProjectsList';
}

class ShowBidsMyProjectsListingRefresh extends ShowBidsMyProjectsEvent {
  @override
  String toString() => 'ShowBidsMyProjectsListingRefresh';
}

class ShowBidsMyProjectsListingChangeSearch extends ShowBidsMyProjectsEvent {
  @override
  String toString() => 'ShowBidsMyProjectsChangeSearch';
}
abstract class ShowThreadMyProjectsEvent extends Equatable {
    const ShowThreadMyProjectsEvent();
	@override
    List<Object> get props => [];
}

class ShowThreadMyProjectsList extends ShowThreadMyProjectsEvent {
  @override
  String toString() => 'ShowThreadMyProjectsList';
}

class ShowThreadMyProjectsListingRefresh extends ShowThreadMyProjectsEvent {
  @override
  String toString() => 'ShowThreadMyProjectsListingRefresh';
}

class ShowThreadMyProjectsListingChangeSearch extends ShowThreadMyProjectsEvent {
  @override
  String toString() => 'ShowThreadMyProjectsChangeSearch';
}
abstract class ShowFilesMyProjectsEvent extends Equatable {
    const ShowFilesMyProjectsEvent();
	@override
    List<Object> get props => [];
}

class ShowFilesMyProjectsList extends ShowFilesMyProjectsEvent {
  @override
  String toString() => 'ShowFilesMyProjectsList';
}

class ShowFilesMyProjectsListingRefresh extends ShowFilesMyProjectsEvent {
  @override
  String toString() => 'ShowFilesMyProjectsListingRefresh';
}

class ShowFilesMyProjectsListingChangeSearch extends ShowFilesMyProjectsEvent {
  @override
  String toString() => 'ShowFilesMyProjectsChangeSearch';
}
abstract class ShowConversationMyProjectsEvent extends Equatable {
    const ShowConversationMyProjectsEvent();
	@override
    List<Object> get props => [];
}

class ShowConversationMyProjectsList extends ShowConversationMyProjectsEvent {
  @override
  String toString() => 'ShowConversationMyProjectsList';
}

class ShowConversationMyProjectsListingRefresh extends ShowConversationMyProjectsEvent {
  @override
  String toString() => 'ShowConversationMyProjectsListingRefresh';
}

class ShowConversationMyProjectsListingChangeSearch extends ShowConversationMyProjectsEvent {
  @override
  String toString() => 'ShowConversationMyProjectsChangeSearch';
}
