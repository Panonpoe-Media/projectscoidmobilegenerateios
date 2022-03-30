import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/cart.dart';
import 'package:projectscoid/models/model.dart';


abstract class CartState extends Equatable {
    const CartState();
	@override
	  List<Object> get props => [];
}

class CartListingUninitialized extends CartState {
  @override
  String toString() => 'CartListingUninitialized';
}

class CartListingError extends CartState {
  @override
  String toString() => 'CartListingError';
}

class CartListingLoaded extends CartState {
  final CartListingModel? cart;
  final bool? hasReachedMax;
  final int?  page;

  CartListingLoaded({
    this.cart,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [cart!, hasReachedMax!, page!];
//  : super([cart, hasReachedMax, page]);

  CartListingLoaded copyWith({
    CartListingModel? cart,
    bool? hasReachedMax,
    int? page,
  }) {
    return CartListingLoaded(
      cart: cart ?? this.cart,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'CartListingLoaded  CartListing: ${ cart!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
