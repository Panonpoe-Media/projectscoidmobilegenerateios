import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/test.dart';
import 'package:projectscoid/models/model.dart';


abstract class TestState extends Equatable {
    const TestState();
	@override
	  List<Object> get props => [];
}

class TestListingUninitialized extends TestState {
  @override
  String toString() => 'TestListingUninitialized';
}

class TestListingError extends TestState {
  @override
  String toString() => 'TestListingError';
}

class TestListingLoaded extends TestState {
  final TestListingModel? test;
  final bool? hasReachedMax;
  final int?  page;

  TestListingLoaded({
    this.test,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [test!, hasReachedMax!, page!];
//  : super([test, hasReachedMax, page]);

  TestListingLoaded copyWith({
    TestListingModel? test,
    bool? hasReachedMax,
    int? page,
  }) {
    return TestListingLoaded(
      test: test ?? this.test,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'TestListingLoaded  TestListing: ${ test!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
