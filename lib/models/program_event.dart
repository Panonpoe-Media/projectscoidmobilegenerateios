import 'package:equatable/equatable.dart';

abstract class ProgramEvent extends Equatable {
    const ProgramEvent();
	@override
    List<Object> get props => [];
}

class ProgramList extends ProgramEvent {
  @override
  String toString() => 'ProgramList';
}

class ProgramListingRefresh extends ProgramEvent {
  @override
  String toString() => 'ProgramListingRefresh';
}

class ProgramListingChangeSearch extends ProgramEvent {
  @override
  String toString() => 'ProgramChangeSearch';
}

