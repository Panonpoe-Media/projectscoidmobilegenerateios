import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/existing_user.dart';
import 'package:projectscoid/models/model.dart';


abstract class ExistingUserState extends Equatable {
    const ExistingUserState();
	@override
	  List<Object> get props => [];
}

class ExistingUserListingUninitialized extends ExistingUserState {
  @override
  String toString() => 'ExistingUserListingUninitialized';
}

class ExistingUserListingError extends ExistingUserState {
  @override
  String toString() => 'ExistingUserListingError';
}

class ExistingUserListingLoaded extends ExistingUserState {
  final ExistingUserListingModel? existing_user;
  final bool? hasReachedMax;
  final int?  page;

  ExistingUserListingLoaded({
    this.existing_user,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [existing_user!, hasReachedMax!, page!];
//  : super([existing_user, hasReachedMax, page]);

  ExistingUserListingLoaded copyWith({
    ExistingUserListingModel? existing_user,
    bool? hasReachedMax,
    int? page,
  }) {
    return ExistingUserListingLoaded(
      existing_user: existing_user ?? this.existing_user,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ExistingUserListingLoaded  ExistingUserListing: ${ existing_user!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
