import 'package:equatable/equatable.dart';

abstract class MyProfileEvent extends Equatable {
    const MyProfileEvent();
	@override
    List<Object> get props => [];
}

class MyProfileList extends MyProfileEvent {
  @override
  String toString() => 'MyProfileList';
}

class MyProfileListingRefresh extends MyProfileEvent {
  @override
  String toString() => 'MyProfileListingRefresh';
}

class MyProfileListingChangeSearch extends MyProfileEvent {
  @override
  String toString() => 'MyProfileChangeSearch';
}

abstract class PortofolioMyProfileEvent extends Equatable {
    const PortofolioMyProfileEvent();
	@override
    List<Object> get props => [];
}

class PortofolioMyProfileList extends PortofolioMyProfileEvent {
  @override
  String toString() => 'PortofolioMyProfileList';
}

class PortofolioMyProfileListingRefresh extends PortofolioMyProfileEvent {
  @override
  String toString() => 'PortofolioMyProfileListingRefresh';
}

class PortofolioMyProfileListingChangeSearch extends PortofolioMyProfileEvent {
  @override
  String toString() => 'PortofolioMyProfileChangeSearch';
}
