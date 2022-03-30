
import 'package:equatable/equatable.dart';
import 'package:projectscoid/models/model.dart';


abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeListingUninitialized extends HomeState {
  @override
  String toString() => 'HomeListingUninitialized';
}

class HomeListingError extends HomeState {
  @override
  String toString() => 'HomeListingError';
}

class HomeListingLoaded extends HomeState {
  final HomeListingModel? home;
  final bool? hasReachedMax;
  final int?  page;

  HomeListingLoaded({
    this.home,
    this.hasReachedMax,
    this.page,
  }) ;


  @override
  List<Object> get props => [home!, hasReachedMax!, page!];

  HomeListingLoaded copyWith({
    HomeListingModel? home,
    bool? hasReachedMax,
    int? page,
  }) {
    return HomeListingLoaded(
      home: home ?? this.home,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'HomeListingLoaded  HomeListing: ${ home!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
