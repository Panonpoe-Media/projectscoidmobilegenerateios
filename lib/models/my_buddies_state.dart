import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_buddies.dart';
import 'package:projectscoid/models/model.dart';


abstract class MyBuddiesState extends Equatable {
    const MyBuddiesState();
	@override
	  List<Object> get props => [];
}

class MyBuddiesListingUninitialized extends MyBuddiesState {
  @override
  String toString() => 'MyBuddiesListingUninitialized';
}

class MyBuddiesListingError extends MyBuddiesState {
  @override
  String toString() => 'MyBuddiesListingError';
}

class MyBuddiesListingLoaded extends MyBuddiesState {
  final MyBuddiesListingModel? my_buddies;
  final bool? hasReachedMax;
  final int?  page;

  MyBuddiesListingLoaded({
    this.my_buddies,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_buddies!, hasReachedMax!, page!];
//  : super([my_buddies, hasReachedMax, page]);

  MyBuddiesListingLoaded copyWith({
    MyBuddiesListingModel? my_buddies,
    bool? hasReachedMax,
    int? page,
  }) {
    return MyBuddiesListingLoaded(
      my_buddies: my_buddies ?? this.my_buddies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MyBuddiesListingLoaded  MyBuddiesListing: ${ my_buddies!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
