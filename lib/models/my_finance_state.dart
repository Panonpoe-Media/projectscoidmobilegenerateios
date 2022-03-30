import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_finance.dart';
import 'package:projectscoid/models/model.dart';


abstract class MyFinanceState extends Equatable {
    const MyFinanceState();
	@override
	  List<Object> get props => [];
}

class MyFinanceListingUninitialized extends MyFinanceState {
  @override
  String toString() => 'MyFinanceListingUninitialized';
}

class MyFinanceListingError extends MyFinanceState {
  @override
  String toString() => 'MyFinanceListingError';
}

class MyFinanceListingLoaded extends MyFinanceState {
  final MyFinanceListingModel? my_finance;
  final bool? hasReachedMax;
  final int?  page;

  MyFinanceListingLoaded({
    this.my_finance,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_finance!, hasReachedMax!, page!];
//  : super([my_finance, hasReachedMax, page]);

  MyFinanceListingLoaded copyWith({
    MyFinanceListingModel? my_finance,
    bool? hasReachedMax,
    int? page,
  }) {
    return MyFinanceListingLoaded(
      my_finance: my_finance ?? this.my_finance,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MyFinanceListingLoaded  MyFinanceListing: ${ my_finance!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
