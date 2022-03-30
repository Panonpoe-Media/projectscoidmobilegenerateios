import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_orders.dart';
import 'package:projectscoid/models/model.dart';


abstract class MyOrdersState extends Equatable {
    const MyOrdersState();
	@override
	  List<Object> get props => [];
}

class MyOrdersListingUninitialized extends MyOrdersState {
  @override
  String toString() => 'MyOrdersListingUninitialized';
}

class MyOrdersListingError extends MyOrdersState {
  @override
  String toString() => 'MyOrdersListingError';
}

class MyOrdersListingLoaded extends MyOrdersState {
  final MyOrdersListingModel? my_orders;
  final bool? hasReachedMax;
  final int?  page;

  MyOrdersListingLoaded({
    this.my_orders,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_orders!, hasReachedMax!, page!];
//  : super([my_orders, hasReachedMax, page]);

  MyOrdersListingLoaded copyWith({
    MyOrdersListingModel? my_orders,
    bool? hasReachedMax,
    int? page,
  }) {
    return MyOrdersListingLoaded(
      my_orders: my_orders ?? this.my_orders,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MyOrdersListingLoaded  MyOrdersListing: ${ my_orders!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
