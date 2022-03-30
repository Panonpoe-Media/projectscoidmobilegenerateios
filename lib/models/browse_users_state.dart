import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/browse_users.dart';
import 'package:projectscoid/models/model.dart';


abstract class BrowseUsersState extends Equatable {
    const BrowseUsersState();
	@override
	  List<Object> get props => [];
}

class BrowseUsersListingUninitialized extends BrowseUsersState {
  @override
  String toString() => 'BrowseUsersListingUninitialized';
}

class BrowseUsersListingError extends BrowseUsersState {
  @override
  String toString() => 'BrowseUsersListingError';
}

class BrowseUsersListingLoaded extends BrowseUsersState {
  final BrowseUsersListingModel? browse_users;
  final bool? hasReachedMax;
  final int?  page;

  BrowseUsersListingLoaded({
    this.browse_users,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [browse_users!, hasReachedMax!, page!];
//  : super([browse_users, hasReachedMax, page]);

  BrowseUsersListingLoaded copyWith({
    BrowseUsersListingModel? browse_users,
    bool? hasReachedMax,
    int? page,
  }) {
    return BrowseUsersListingLoaded(
      browse_users: browse_users ?? this.browse_users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'BrowseUsersListingLoaded  BrowseUsersListing: ${ browse_users!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
