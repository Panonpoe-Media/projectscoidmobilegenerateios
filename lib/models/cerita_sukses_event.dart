import 'package:equatable/equatable.dart';

abstract class CeritaSuksesEvent extends Equatable {
    const CeritaSuksesEvent();
	@override
    List<Object> get props => [];
}

class CeritaSuksesList extends CeritaSuksesEvent {
  @override
  String toString() => 'CeritaSuksesList';
}

class CeritaSuksesListingRefresh extends CeritaSuksesEvent {
  @override
  String toString() => 'CeritaSuksesListingRefresh';
}

class CeritaSuksesListingChangeSearch extends CeritaSuksesEvent {
  @override
  String toString() => 'CeritaSuksesChangeSearch';
}

