import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/support.dart';
import 'package:projectscoid/models/model.dart';


abstract class SupportState extends Equatable {
    const SupportState();
	@override
	  List<Object> get props => [];
}

class SupportListingUninitialized extends SupportState {
  @override
  String toString() => 'SupportListingUninitialized';
}

class SupportListingError extends SupportState {
  @override
  String toString() => 'SupportListingError';
}

class SupportListingLoaded extends SupportState {
  final SupportListingModel? support;
  final bool? hasReachedMax;
  final int?  page;

  SupportListingLoaded({
    this.support,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [support!, hasReachedMax!, page!];
//  : super([support, hasReachedMax, page]);

  SupportListingLoaded copyWith({
    SupportListingModel? support,
    bool? hasReachedMax,
    int? page,
  }) {
    return SupportListingLoaded(
      support: support ?? this.support,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'SupportListingLoaded  SupportListing: ${ support!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
