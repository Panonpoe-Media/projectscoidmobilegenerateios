import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_points.dart';
import 'package:projectscoid/models/model.dart';


abstract class MyPointsState extends Equatable {
    const MyPointsState();
	@override
	  List<Object> get props => [];
}

class MyPointsListingUninitialized extends MyPointsState {
  @override
  String toString() => 'MyPointsListingUninitialized';
}

class MyPointsListingError extends MyPointsState {
  @override
  String toString() => 'MyPointsListingError';
}

class MyPointsListingLoaded extends MyPointsState {
  final MyPointsListingModel? my_points;
  final bool? hasReachedMax;
  final int?  page;

  MyPointsListingLoaded({
    this.my_points,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_points!, hasReachedMax!, page!];
//  : super([my_points, hasReachedMax, page]);

  MyPointsListingLoaded copyWith({
    MyPointsListingModel? my_points,
    bool? hasReachedMax,
    int? page,
  }) {
    return MyPointsListingLoaded(
      my_points: my_points ?? this.my_points,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MyPointsListingLoaded  MyPointsListing: ${ my_points!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
