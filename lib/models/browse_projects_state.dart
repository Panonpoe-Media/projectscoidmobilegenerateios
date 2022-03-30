import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/browse_projects.dart';
import 'package:projectscoid/models/model.dart';


abstract class BrowseProjectsState extends Equatable {
    const BrowseProjectsState();
	@override
	  List<Object> get props => [];
}

class BrowseProjectsListingUninitialized extends BrowseProjectsState {
  @override
  String toString() => 'BrowseProjectsListingUninitialized';
}

class BrowseProjectsListingError extends BrowseProjectsState {
  @override
  String toString() => 'BrowseProjectsListingError';
}

class BrowseProjectsListingLoaded extends BrowseProjectsState {
  final BrowseProjectsListingModel? browse_projects;
  final bool? hasReachedMax;
  final int?  page;

  BrowseProjectsListingLoaded({
    this.browse_projects,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [browse_projects!, hasReachedMax!, page!];
//  : super([browse_projects, hasReachedMax, page]);

  BrowseProjectsListingLoaded copyWith({
    BrowseProjectsListingModel? browse_projects,
    bool? hasReachedMax,
    int? page,
  }) {
    return BrowseProjectsListingLoaded(
      browse_projects: browse_projects ?? this.browse_projects,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'BrowseProjectsListingLoaded  BrowseProjectsListing: ${ browse_projects!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
