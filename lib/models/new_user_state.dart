import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/new_user.dart';
import 'package:projectscoid/models/model.dart';


abstract class NewUserState extends Equatable {
    const NewUserState();
	@override
	  List<Object> get props => [];
}

class NewUserListingUninitialized extends NewUserState {
  @override
  String toString() => 'NewUserListingUninitialized';
}

class NewUserListingError extends NewUserState {
  @override
  String toString() => 'NewUserListingError';
}

class NewUserListingLoaded extends NewUserState {
  final NewUserListingModel? new_user;
  final bool? hasReachedMax;
  final int?  page;

  NewUserListingLoaded({
    this.new_user,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [new_user!, hasReachedMax!, page!];
//  : super([new_user, hasReachedMax, page]);

  NewUserListingLoaded copyWith({
    NewUserListingModel? new_user,
    bool? hasReachedMax,
    int? page,
  }) {
    return NewUserListingLoaded(
      new_user: new_user ?? this.new_user,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'NewUserListingLoaded  NewUserListing: ${ new_user!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
