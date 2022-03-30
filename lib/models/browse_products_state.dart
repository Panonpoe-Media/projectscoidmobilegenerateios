import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/browse_products.dart';
import 'package:projectscoid/models/model.dart';


abstract class BrowseProductsState extends Equatable {
    const BrowseProductsState();
	@override
	  List<Object> get props => [];
}

class BrowseProductsListingUninitialized extends BrowseProductsState {
  @override
  String toString() => 'BrowseProductsListingUninitialized';
}

class BrowseProductsListingError extends BrowseProductsState {
  @override
  String toString() => 'BrowseProductsListingError';
}

class BrowseProductsListingLoaded extends BrowseProductsState {
  final BrowseProductsListingModel? browse_products;
  final bool? hasReachedMax;
  final int?  page;

  BrowseProductsListingLoaded({
    this.browse_products,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [browse_products!, hasReachedMax!, page!];
//  : super([browse_products, hasReachedMax, page]);

  BrowseProductsListingLoaded copyWith({
    BrowseProductsListingModel? browse_products,
    bool? hasReachedMax,
    int? page,
  }) {
    return BrowseProductsListingLoaded(
      browse_products: browse_products ?? this.browse_products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'BrowseProductsListingLoaded  BrowseProductsListing: ${ browse_products!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
