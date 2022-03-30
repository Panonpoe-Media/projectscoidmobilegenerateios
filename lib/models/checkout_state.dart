import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/checkout.dart';
import 'package:projectscoid/models/model.dart';


abstract class CheckoutState extends Equatable {
    const CheckoutState();
	@override
	  List<Object> get props => [];
}

class CheckoutListingUninitialized extends CheckoutState {
  @override
  String toString() => 'CheckoutListingUninitialized';
}

class CheckoutListingError extends CheckoutState {
  @override
  String toString() => 'CheckoutListingError';
}

class CheckoutListingLoaded extends CheckoutState {
  final CheckoutListingModel? checkout;
  final bool? hasReachedMax;
  final int?  page;

  CheckoutListingLoaded({
    this.checkout,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [checkout!, hasReachedMax!, page!];
//  : super([checkout, hasReachedMax, page]);

  CheckoutListingLoaded copyWith({
    CheckoutListingModel? checkout,
    bool? hasReachedMax,
    int? page,
  }) {
    return CheckoutListingLoaded(
      checkout: checkout ?? this.checkout,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'CheckoutListingLoaded  CheckoutListing: ${ checkout!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
