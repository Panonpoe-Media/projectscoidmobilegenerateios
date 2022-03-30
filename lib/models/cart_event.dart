import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
    const CartEvent();
	@override
    List<Object> get props => [];
}

class CartList extends CartEvent {
  @override
  String toString() => 'CartList';
}

class CartListingRefresh extends CartEvent {
  @override
  String toString() => 'CartListingRefresh';
}

class CartListingChangeSearch extends CartEvent {
  @override
  String toString() => 'CartChangeSearch';
}

