import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/browse_services.dart';
import 'package:projectscoid/models/model.dart';


abstract class BrowseServicesState extends Equatable {
    const BrowseServicesState();
	@override
	  List<Object> get props => [];
}

class BrowseServicesListingUninitialized extends BrowseServicesState {
  @override
  String toString() => 'BrowseServicesListingUninitialized';
}

class BrowseServicesListingError extends BrowseServicesState {
  @override
  String toString() => 'BrowseServicesListingError';
}

class BrowseServicesListingLoaded extends BrowseServicesState {
  final BrowseServicesListingModel? browse_services;
  final bool? hasReachedMax;
  final int?  page;

  BrowseServicesListingLoaded({
    this.browse_services,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [browse_services!, hasReachedMax!, page!];
//  : super([browse_services, hasReachedMax, page]);

  BrowseServicesListingLoaded copyWith({
    BrowseServicesListingModel? browse_services,
    bool? hasReachedMax,
    int? page,
  }) {
    return BrowseServicesListingLoaded(
      browse_services: browse_services ?? this.browse_services,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'BrowseServicesListingLoaded  BrowseServicesListing: ${ browse_services!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
