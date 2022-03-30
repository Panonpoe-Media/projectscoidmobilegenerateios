import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/kelurahan.dart';
import 'package:projectscoid/models/model.dart';


abstract class KelurahanState extends Equatable {
    const KelurahanState();
	@override
	  List<Object> get props => [];
}

class KelurahanListingUninitialized extends KelurahanState {
  @override
  String toString() => 'KelurahanListingUninitialized';
}

class KelurahanListingError extends KelurahanState {
  @override
  String toString() => 'KelurahanListingError';
}

class KelurahanListingLoaded extends KelurahanState {
  final KelurahanListingModel? kelurahan;
  final bool? hasReachedMax;
  final int?  page;

  KelurahanListingLoaded({
    this.kelurahan,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [kelurahan!, hasReachedMax!, page!];
//  : super([kelurahan, hasReachedMax, page]);

  KelurahanListingLoaded copyWith({
    KelurahanListingModel? kelurahan,
    bool? hasReachedMax,
    int? page,
  }) {
    return KelurahanListingLoaded(
      kelurahan: kelurahan ?? this.kelurahan,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'KelurahanListingLoaded  KelurahanListing: ${ kelurahan!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
