import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_sales.dart';
import 'package:projectscoid/models/model.dart';


abstract class MySalesState extends Equatable {
    const MySalesState();
	@override
	  List<Object> get props => [];
}

class MySalesListingUninitialized extends MySalesState {
  @override
  String toString() => 'MySalesListingUninitialized';
}

class MySalesListingError extends MySalesState {
  @override
  String toString() => 'MySalesListingError';
}

class MySalesListingLoaded extends MySalesState {
  final MySalesListingModel? my_sales;
  final bool? hasReachedMax;
  final int?  page;

  MySalesListingLoaded({
    this.my_sales,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_sales!, hasReachedMax!, page!];
//  : super([my_sales, hasReachedMax, page]);

  MySalesListingLoaded copyWith({
    MySalesListingModel? my_sales,
    bool? hasReachedMax,
    int? page,
  }) {
    return MySalesListingLoaded(
      my_sales: my_sales ?? this.my_sales,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MySalesListingLoaded  MySalesListing: ${ my_sales!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
