import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_referals.dart';
import 'package:projectscoid/models/model.dart';


abstract class MyReferalsState extends Equatable {
    const MyReferalsState();
	@override
	  List<Object> get props => [];
}

class MyReferalsListingUninitialized extends MyReferalsState {
  @override
  String toString() => 'MyReferalsListingUninitialized';
}

class MyReferalsListingError extends MyReferalsState {
  @override
  String toString() => 'MyReferalsListingError';
}

class MyReferalsListingLoaded extends MyReferalsState {
  final MyReferalsListingModel? my_referals;
  final bool? hasReachedMax;
  final int?  page;

  MyReferalsListingLoaded({
    this.my_referals,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_referals!, hasReachedMax!, page!];
//  : super([my_referals, hasReachedMax, page]);

  MyReferalsListingLoaded copyWith({
    MyReferalsListingModel? my_referals,
    bool? hasReachedMax,
    int? page,
  }) {
    return MyReferalsListingLoaded(
      my_referals: my_referals ?? this.my_referals,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MyReferalsListingLoaded  MyReferalsListing: ${ my_referals!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
