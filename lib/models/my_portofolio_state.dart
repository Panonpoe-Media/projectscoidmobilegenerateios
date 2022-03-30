import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_portofolio.dart';
import 'package:projectscoid/models/model.dart';


abstract class MyPortofolioState extends Equatable {
    const MyPortofolioState();
	@override
	  List<Object> get props => [];
}

class MyPortofolioListingUninitialized extends MyPortofolioState {
  @override
  String toString() => 'MyPortofolioListingUninitialized';
}

class MyPortofolioListingError extends MyPortofolioState {
  @override
  String toString() => 'MyPortofolioListingError';
}

class MyPortofolioListingLoaded extends MyPortofolioState {
  final MyPortofolioListingModel? my_portofolio;
  final bool? hasReachedMax;
  final int?  page;

  MyPortofolioListingLoaded({
    this.my_portofolio,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_portofolio!, hasReachedMax!, page!];
//  : super([my_portofolio, hasReachedMax, page]);

  MyPortofolioListingLoaded copyWith({
    MyPortofolioListingModel? my_portofolio,
    bool? hasReachedMax,
    int? page,
  }) {
    return MyPortofolioListingLoaded(
      my_portofolio: my_portofolio ?? this.my_portofolio,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MyPortofolioListingLoaded  MyPortofolioListing: ${ my_portofolio!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
