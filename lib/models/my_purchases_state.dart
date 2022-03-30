import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_purchases.dart';
import 'package:projectscoid/models/model.dart';


abstract class MyPurchasesState extends Equatable {
    const MyPurchasesState();
	@override
	  List<Object> get props => [];
}

class MyPurchasesListingUninitialized extends MyPurchasesState {
  @override
  String toString() => 'MyPurchasesListingUninitialized';
}

class MyPurchasesListingError extends MyPurchasesState {
  @override
  String toString() => 'MyPurchasesListingError';
}

class MyPurchasesListingLoaded extends MyPurchasesState {
  final MyPurchasesListingModel? my_purchases;
  final bool? hasReachedMax;
  final int?  page;

  MyPurchasesListingLoaded({
    this.my_purchases,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_purchases!, hasReachedMax!, page!];
//  : super([my_purchases, hasReachedMax, page]);

  MyPurchasesListingLoaded copyWith({
    MyPurchasesListingModel? my_purchases,
    bool? hasReachedMax,
    int? page,
  }) {
    return MyPurchasesListingLoaded(
      my_purchases: my_purchases ?? this.my_purchases,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MyPurchasesListingLoaded  MyPurchasesListing: ${ my_purchases!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
