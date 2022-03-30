import 'package:equatable/equatable.dart';

abstract class NewUserEvent extends Equatable {
    const NewUserEvent();
	@override
    List<Object> get props => [];
}

class NewUserList extends NewUserEvent {
  @override
  String toString() => 'NewUserList';
}

class NewUserListingRefresh extends NewUserEvent {
  @override
  String toString() => 'NewUserListingRefresh';
}

class NewUserListingChangeSearch extends NewUserEvent {
  @override
  String toString() => 'NewUserChangeSearch';
}

