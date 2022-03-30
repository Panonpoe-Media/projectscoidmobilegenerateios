import 'package:equatable/equatable.dart';

abstract class MyBidsEvent extends Equatable {
    const MyBidsEvent();
	@override
    List<Object> get props => [];
}

class MyBidsList extends MyBidsEvent {
  @override
  String toString() => 'MyBidsList';
}

class MyBidsListingRefresh extends MyBidsEvent {
  @override
  String toString() => 'MyBidsListingRefresh';
}

class MyBidsListingChangeSearch extends MyBidsEvent {
  @override
  String toString() => 'MyBidsChangeSearch';
}

abstract class ShowConversationMyBidsEvent extends Equatable {
    const ShowConversationMyBidsEvent();
	@override
    List<Object> get props => [];
}

class ShowConversationMyBidsList extends ShowConversationMyBidsEvent {
  @override
  String toString() => 'ShowConversationMyBidsList';
}

class ShowConversationMyBidsListingRefresh extends ShowConversationMyBidsEvent {
  @override
  String toString() => 'ShowConversationMyBidsListingRefresh';
}

class ShowConversationMyBidsListingChangeSearch extends ShowConversationMyBidsEvent {
  @override
  String toString() => 'ShowConversationMyBidsChangeSearch';
}
