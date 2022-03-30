import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_projects.dart';
import 'package:projectscoid/models/model.dart';


abstract class MyProjectsState extends Equatable {
    const MyProjectsState();
	@override
	  List<Object> get props => [];
}

class MyProjectsListingUninitialized extends MyProjectsState {
  @override
  String toString() => 'MyProjectsListingUninitialized';
}

class MyProjectsListingError extends MyProjectsState {
  @override
  String toString() => 'MyProjectsListingError';
}

class MyProjectsListingLoaded extends MyProjectsState {
  final MyProjectsListingModel? my_projects;
  final bool? hasReachedMax;
  final int?  page;

  MyProjectsListingLoaded({
    this.my_projects,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_projects!, hasReachedMax!, page!];
//  : super([my_projects, hasReachedMax, page]);

  MyProjectsListingLoaded copyWith({
    MyProjectsListingModel? my_projects,
    bool? hasReachedMax,
    int? page,
  }) {
    return MyProjectsListingLoaded(
      my_projects: my_projects ?? this.my_projects,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MyProjectsListingLoaded  MyProjectsListing: ${ my_projects!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  

abstract class ShowBidsMyProjectsState extends Equatable {
    const ShowBidsMyProjectsState();
	@override
	  List<Object> get props => [];
  
}

class ShowBidsMyProjectsListingUninitialized extends ShowBidsMyProjectsState {
  @override
  String toString() => 'ShowBidsMyProjectsListingUninitialized';
}

class ShowBidsMyProjectsListingError extends ShowBidsMyProjectsState {
  @override
  String toString() => 'ShowBidsMyProjectsListingError';
}

class ShowBidsMyProjectsListingLoaded extends ShowBidsMyProjectsState {
  final ShowBidsListingModel? show_bids;
  final bool? hasReachedMax;
  final int?  page;

  ShowBidsMyProjectsListingLoaded({
    this.show_bids,
    this.hasReachedMax,
    this.page,

  }) ;
   @override
  List<Object> get props => [show_bids!, hasReachedMax!, page!];
  //: super([show_bids, hasReachedMax, page]);

  ShowBidsMyProjectsListingLoaded copyWith({
    ShowBidsListingModel? show_bids,
    bool? hasReachedMax,
    int? page,
  }) {
    return ShowBidsMyProjectsListingLoaded(
      show_bids: show_bids ?? this.show_bids,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ShowBidsMyProjectsListingLoaded  ShowBidsMyProjectsListing: ${ show_bids!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


abstract class ShowThreadMyProjectsState extends Equatable {
    const ShowThreadMyProjectsState();
	@override
	  List<Object> get props => [];
  
}

class ShowThreadMyProjectsListingUninitialized extends ShowThreadMyProjectsState {
  @override
  String toString() => 'ShowThreadMyProjectsListingUninitialized';
}

class ShowThreadMyProjectsListingError extends ShowThreadMyProjectsState {
  @override
  String toString() => 'ShowThreadMyProjectsListingError';
}

class ShowThreadMyProjectsListingLoaded extends ShowThreadMyProjectsState {
  final ShowThreadListingModel? show_thread;
  final bool? hasReachedMax;
  final int?  page;

  ShowThreadMyProjectsListingLoaded({
    this.show_thread,
    this.hasReachedMax,
    this.page,

  }) ;
   @override
  List<Object> get props => [show_thread!, hasReachedMax!, page!];
  //: super([show_thread, hasReachedMax, page]);

  ShowThreadMyProjectsListingLoaded copyWith({
    ShowThreadListingModel? show_thread,
    bool? hasReachedMax,
    int? page,
  }) {
    return ShowThreadMyProjectsListingLoaded(
      show_thread: show_thread ?? this.show_thread,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ShowThreadMyProjectsListingLoaded  ShowThreadMyProjectsListing: ${ show_thread!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


abstract class ShowFilesMyProjectsState extends Equatable {
    const ShowFilesMyProjectsState();
	@override
	  List<Object> get props => [];
  
}

class ShowFilesMyProjectsListingUninitialized extends ShowFilesMyProjectsState {
  @override
  String toString() => 'ShowFilesMyProjectsListingUninitialized';
}

class ShowFilesMyProjectsListingError extends ShowFilesMyProjectsState {
  @override
  String toString() => 'ShowFilesMyProjectsListingError';
}

class ShowFilesMyProjectsListingLoaded extends ShowFilesMyProjectsState {
  final ShowFilesListingModel? show_files;
  final bool? hasReachedMax;
  final int?  page;

  ShowFilesMyProjectsListingLoaded({
    this.show_files,
    this.hasReachedMax,
    this.page,

  }) ;
   @override
  List<Object> get props => [show_files!, hasReachedMax!, page!];
  //: super([show_files, hasReachedMax, page]);

  ShowFilesMyProjectsListingLoaded copyWith({
    ShowFilesListingModel? show_files,
    bool? hasReachedMax,
    int? page,
  }) {
    return ShowFilesMyProjectsListingLoaded(
      show_files: show_files ?? this.show_files,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ShowFilesMyProjectsListingLoaded  ShowFilesMyProjectsListing: ${ show_files!.items.items.length } , hasReachedMax: $hasReachedMax ';
}


abstract class ShowConversationMyProjectsState extends Equatable {
    const ShowConversationMyProjectsState();
	@override
	  List<Object> get props => [];
  
}

class ShowConversationMyProjectsListingUninitialized extends ShowConversationMyProjectsState {
  @override
  String toString() => 'ShowConversationMyProjectsListingUninitialized';
}

class ShowConversationMyProjectsListingError extends ShowConversationMyProjectsState {
  @override
  String toString() => 'ShowConversationMyProjectsListingError';
}

class ShowConversationMyProjectsListingLoaded extends ShowConversationMyProjectsState {
  final ShowConversationListingModel? show_conversation;
  final bool? hasReachedMax;
  final int?  page;

  ShowConversationMyProjectsListingLoaded({
    this.show_conversation,
    this.hasReachedMax,
    this.page,

  }) ;
   @override
  List<Object> get props => [show_conversation!, hasReachedMax!, page!];
  //: super([show_conversation, hasReachedMax, page]);

  ShowConversationMyProjectsListingLoaded copyWith({
    ShowConversationListingModel? show_conversation,
    bool? hasReachedMax,
    int? page,
  }) {
    return ShowConversationMyProjectsListingLoaded(
      show_conversation: show_conversation ?? this.show_conversation,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ShowConversationMyProjectsListingLoaded  ShowConversationMyProjectsListing: ${ show_conversation!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

