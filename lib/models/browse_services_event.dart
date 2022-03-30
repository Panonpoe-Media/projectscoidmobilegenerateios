import 'package:equatable/equatable.dart';

abstract class BrowseServicesEvent extends Equatable {
    const BrowseServicesEvent();
	@override
    List<Object> get props => [];
}

class BrowseServicesList extends BrowseServicesEvent {
  @override
  String toString() => 'BrowseServicesList';
}

class BrowseServicesListingRefresh extends BrowseServicesEvent {
  @override
  String toString() => 'BrowseServicesListingRefresh';
}

class BrowseServicesListingChangeSearch extends BrowseServicesEvent {
  @override
  String toString() => 'BrowseServicesChangeSearch';
}

