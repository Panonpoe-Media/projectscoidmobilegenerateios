import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/past_projects.dart';
import 'package:projectscoid/models/model.dart';


abstract class PastProjectsState extends Equatable {
    const PastProjectsState();
	@override
	  List<Object> get props => [];
}

class PastProjectsListingUninitialized extends PastProjectsState {
  @override
  String toString() => 'PastProjectsListingUninitialized';
}

class PastProjectsListingError extends PastProjectsState {
  @override
  String toString() => 'PastProjectsListingError';
}

class PastProjectsListingLoaded extends PastProjectsState {
  final PastProjectsListingModel? past_projects;
  final bool? hasReachedMax;
  final int?  page;

  PastProjectsListingLoaded({
    this.past_projects,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [past_projects!, hasReachedMax!, page!];
//  : super([past_projects, hasReachedMax, page]);

  PastProjectsListingLoaded copyWith({
    PastProjectsListingModel? past_projects,
    bool? hasReachedMax,
    int? page,
  }) {
    return PastProjectsListingLoaded(
      past_projects: past_projects ?? this.past_projects,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PastProjectsListingLoaded  PastProjectsListing: ${ past_projects!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
