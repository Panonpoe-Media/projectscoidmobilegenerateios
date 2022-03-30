import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_bids.dart';
import 'package:projectscoid/models/model.dart';


abstract class MyBidsState extends Equatable {
    const MyBidsState();
	@override
	  List<Object> get props => [];
}

class MyBidsListingUninitialized extends MyBidsState {
  @override
  String toString() => 'MyBidsListingUninitialized';
}

class MyBidsListingError extends MyBidsState {
  @override
  String toString() => 'MyBidsListingError';
}

class MyBidsListingLoaded extends MyBidsState {
  final MyBidsListingModel? my_bids;
  final bool? hasReachedMax;
  final int?  page;

  MyBidsListingLoaded({
    this.my_bids,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_bids!, hasReachedMax!, page!];
//  : super([my_bids, hasReachedMax, page]);

  MyBidsListingLoaded copyWith({
    MyBidsListingModel? my_bids,
    bool? hasReachedMax,
    int? page,
  }) {
    return MyBidsListingLoaded(
      my_bids: my_bids ?? this.my_bids,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MyBidsListingLoaded  MyBidsListing: ${ my_bids!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  

abstract class ShowConversationMyBidsState extends Equatable {
    const ShowConversationMyBidsState();
	@override
	  List<Object> get props => [];
  
}

class ShowConversationMyBidsListingUninitialized extends ShowConversationMyBidsState {
  @override
  String toString() => 'ShowConversationMyBidsListingUninitialized';
}

class ShowConversationMyBidsListingError extends ShowConversationMyBidsState {
  @override
  String toString() => 'ShowConversationMyBidsListingError';
}

class ShowConversationMyBidsListingLoaded extends ShowConversationMyBidsState {
  final ShowConversationListingModel? show_conversation;
  final bool? hasReachedMax;
  final int?  page;

  ShowConversationMyBidsListingLoaded({
    this.show_conversation,
    this.hasReachedMax,
    this.page,

  }) ;
   @override
  List<Object> get props => [show_conversation!, hasReachedMax!, page!];
  //: super([show_conversation, hasReachedMax, page]);

  ShowConversationMyBidsListingLoaded copyWith({
    ShowConversationListingModel? show_conversation,
    bool? hasReachedMax,
    int? page,
  }) {
    return ShowConversationMyBidsListingLoaded(
      show_conversation: show_conversation ?? this.show_conversation,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ShowConversationMyBidsListingLoaded  ShowConversationMyBidsListing: ${ show_conversation!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

