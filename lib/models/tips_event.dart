import 'package:equatable/equatable.dart';

abstract class TipsEvent extends Equatable {
    const TipsEvent();
	@override
    List<Object> get props => [];
}

class TipsList extends TipsEvent {
  @override
  String toString() => 'TipsList';
}

class TipsListingRefresh extends TipsEvent {
  @override
  String toString() => 'TipsListingRefresh';
}

class TipsListingChangeSearch extends TipsEvent {
  @override
  String toString() => 'TipsChangeSearch';
}

