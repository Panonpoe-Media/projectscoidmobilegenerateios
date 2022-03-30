import 'package:equatable/equatable.dart';

abstract class CheckoutEvent extends Equatable {
    const CheckoutEvent();
	@override
    List<Object> get props => [];
}

class CheckoutList extends CheckoutEvent {
  @override
  String toString() => 'CheckoutList';
}

class CheckoutListingRefresh extends CheckoutEvent {
  @override
  String toString() => 'CheckoutListingRefresh';
}

class CheckoutListingChangeSearch extends CheckoutEvent {
  @override
  String toString() => 'CheckoutChangeSearch';
}

