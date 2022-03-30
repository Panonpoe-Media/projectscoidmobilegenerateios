import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/cerita_sukses.dart';
import 'package:projectscoid/models/model.dart';


abstract class CeritaSuksesState extends Equatable {
    const CeritaSuksesState();
	@override
	  List<Object> get props => [];
}

class CeritaSuksesListingUninitialized extends CeritaSuksesState {
  @override
  String toString() => 'CeritaSuksesListingUninitialized';
}

class CeritaSuksesListingError extends CeritaSuksesState {
  @override
  String toString() => 'CeritaSuksesListingError';
}

class CeritaSuksesListingLoaded extends CeritaSuksesState {
  final CeritaSuksesListingModel? cerita_sukses;
  final bool? hasReachedMax;
  final int?  page;

  CeritaSuksesListingLoaded({
    this.cerita_sukses,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [cerita_sukses!, hasReachedMax!, page!];
//  : super([cerita_sukses, hasReachedMax, page]);

  CeritaSuksesListingLoaded copyWith({
    CeritaSuksesListingModel? cerita_sukses,
    bool? hasReachedMax,
    int? page,
  }) {
    return CeritaSuksesListingLoaded(
      cerita_sukses: cerita_sukses ?? this.cerita_sukses,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'CeritaSuksesListingLoaded  CeritaSuksesListing: ${ cerita_sukses!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
