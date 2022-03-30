import 'package:equatable/equatable.dart';

abstract class BrowseProductsEvent extends Equatable {
    const BrowseProductsEvent();
	@override
    List<Object> get props => [];
}

class BrowseProductsList extends BrowseProductsEvent {
  @override
  String toString() => 'BrowseProductsList';
}

class BrowseProductsListingRefresh extends BrowseProductsEvent {
  @override
  String toString() => 'BrowseProductsListingRefresh';
}

class BrowseProductsListingChangeSearch extends BrowseProductsEvent {
  @override
  String toString() => 'BrowseProductsChangeSearch';
}

