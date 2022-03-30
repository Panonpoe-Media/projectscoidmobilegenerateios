import 'package:equatable/equatable.dart';

abstract class TestimonialEvent extends Equatable {
    const TestimonialEvent();
	@override
    List<Object> get props => [];
}

class TestimonialList extends TestimonialEvent {
  @override
  String toString() => 'TestimonialList';
}

class TestimonialListingRefresh extends TestimonialEvent {
  @override
  String toString() => 'TestimonialListingRefresh';
}

class TestimonialListingChangeSearch extends TestimonialEvent {
  @override
  String toString() => 'TestimonialChangeSearch';
}

