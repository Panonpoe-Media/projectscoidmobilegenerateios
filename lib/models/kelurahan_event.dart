import 'package:equatable/equatable.dart';

abstract class KelurahanEvent extends Equatable {
    const KelurahanEvent();
	@override
    List<Object> get props => [];
}

class KelurahanList extends KelurahanEvent {
  @override
  String toString() => 'KelurahanList';
}

class KelurahanListingRefresh extends KelurahanEvent {
  @override
  String toString() => 'KelurahanListingRefresh';
}

class KelurahanListingChangeSearch extends KelurahanEvent {
  @override
  String toString() => 'KelurahanChangeSearch';
}

