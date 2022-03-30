import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/testimonial.dart';
import 'package:projectscoid/models/model.dart';


abstract class TestimonialState extends Equatable {
    const TestimonialState();
	@override
	  List<Object> get props => [];
}

class TestimonialListingUninitialized extends TestimonialState {
  @override
  String toString() => 'TestimonialListingUninitialized';
}

class TestimonialListingError extends TestimonialState {
  @override
  String toString() => 'TestimonialListingError';
}

class TestimonialListingLoaded extends TestimonialState {
  final TestimonialListingModel? testimonial;
  final bool? hasReachedMax;
  final int?  page;

  TestimonialListingLoaded({
    this.testimonial,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [testimonial!, hasReachedMax!, page!];
//  : super([testimonial, hasReachedMax, page]);

  TestimonialListingLoaded copyWith({
    TestimonialListingModel? testimonial,
    bool? hasReachedMax,
    int? page,
  }) {
    return TestimonialListingLoaded(
      testimonial: testimonial ?? this.testimonial,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'TestimonialListingLoaded  TestimonialListing: ${ testimonial!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
