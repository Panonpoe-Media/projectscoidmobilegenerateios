import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/tips.dart';
import 'package:projectscoid/models/model.dart';


abstract class TipsState extends Equatable {
    const TipsState();
	@override
	  List<Object> get props => [];
}

class TipsListingUninitialized extends TipsState {
  @override
  String toString() => 'TipsListingUninitialized';
}

class TipsListingError extends TipsState {
  @override
  String toString() => 'TipsListingError';
}

class TipsListingLoaded extends TipsState {
  final TipsListingModel? tips;
  final bool? hasReachedMax;
  final int?  page;

  TipsListingLoaded({
    this.tips,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [tips!, hasReachedMax!, page!];
//  : super([tips, hasReachedMax, page]);

  TipsListingLoaded copyWith({
    TipsListingModel? tips,
    bool? hasReachedMax,
    int? page,
  }) {
    return TipsListingLoaded(
      tips: tips ?? this.tips,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'TipsListingLoaded  TipsListing: ${ tips!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
