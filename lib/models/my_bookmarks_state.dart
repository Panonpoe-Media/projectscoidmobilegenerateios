import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_bookmarks.dart';
import 'package:projectscoid/models/model.dart';


abstract class MyBookmarksState extends Equatable {
    const MyBookmarksState();
	@override
	  List<Object> get props => [];
}

class MyBookmarksListingUninitialized extends MyBookmarksState {
  @override
  String toString() => 'MyBookmarksListingUninitialized';
}

class MyBookmarksListingError extends MyBookmarksState {
  @override
  String toString() => 'MyBookmarksListingError';
}

class MyBookmarksListingLoaded extends MyBookmarksState {
  final MyBookmarksListingModel? my_bookmarks;
  final bool? hasReachedMax;
  final int?  page;

  MyBookmarksListingLoaded({
    this.my_bookmarks,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_bookmarks!, hasReachedMax!, page!];
//  : super([my_bookmarks, hasReachedMax, page]);

  MyBookmarksListingLoaded copyWith({
    MyBookmarksListingModel? my_bookmarks,
    bool? hasReachedMax,
    int? page,
  }) {
    return MyBookmarksListingLoaded(
      my_bookmarks: my_bookmarks ?? this.my_bookmarks,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MyBookmarksListingLoaded  MyBookmarksListing: ${ my_bookmarks!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
