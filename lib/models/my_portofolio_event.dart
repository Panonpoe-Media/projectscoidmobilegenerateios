import 'package:equatable/equatable.dart';

abstract class MyPortofolioEvent extends Equatable {
    const MyPortofolioEvent();
	@override
    List<Object> get props => [];
}

class MyPortofolioList extends MyPortofolioEvent {
  @override
  String toString() => 'MyPortofolioList';
}

class MyPortofolioListingRefresh extends MyPortofolioEvent {
  @override
  String toString() => 'MyPortofolioListingRefresh';
}

class MyPortofolioListingChangeSearch extends MyPortofolioEvent {
  @override
  String toString() => 'MyPortofolioChangeSearch';
}

