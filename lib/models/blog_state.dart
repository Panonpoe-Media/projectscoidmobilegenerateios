import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/blog.dart';
import 'package:projectscoid/models/model.dart';


abstract class BlogState extends Equatable {
    const BlogState();
	@override
	  List<Object> get props => [];
}

class BlogListingUninitialized extends BlogState {
  @override
  String toString() => 'BlogListingUninitialized';
}

class BlogListingError extends BlogState {
  @override
  String toString() => 'BlogListingError';
}

class BlogListingLoaded extends BlogState {
  final BlogListingModel? blog;
  final bool? hasReachedMax;
  final int?  page;

  BlogListingLoaded({
    this.blog,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [blog!, hasReachedMax!, page!];
//  : super([blog, hasReachedMax, page]);

  BlogListingLoaded copyWith({
    BlogListingModel? blog,
    bool? hasReachedMax,
    int? page,
  }) {
    return BlogListingLoaded(
      blog: blog ?? this.blog,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'BlogListingLoaded  BlogListing: ${ blog!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
