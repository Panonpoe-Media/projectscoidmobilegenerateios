import 'package:equatable/equatable.dart';

abstract class ExistingUserEvent extends Equatable {
    const ExistingUserEvent();
	@override
    List<Object> get props => [];
}

class ExistingUserList extends ExistingUserEvent {
  @override
  String toString() => 'ExistingUserList';
}

class ExistingUserListingRefresh extends ExistingUserEvent {
  @override
  String toString() => 'ExistingUserListingRefresh';
}

class ExistingUserListingChangeSearch extends ExistingUserEvent {
  @override
  String toString() => 'ExistingUserChangeSearch';
}

