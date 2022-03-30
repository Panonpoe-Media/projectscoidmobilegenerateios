import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/my_profile.dart';
import 'package:projectscoid/models/model.dart';


abstract class MyProfileState extends Equatable {
    const MyProfileState();
	@override
	  List<Object> get props => [];
}

class MyProfileListingUninitialized extends MyProfileState {
  @override
  String toString() => 'MyProfileListingUninitialized';
}

class MyProfileListingError extends MyProfileState {
  @override
  String toString() => 'MyProfileListingError';
}

class MyProfileListingLoaded extends MyProfileState {
  final MyProfileListingModel? my_profile;
  final bool? hasReachedMax;
  final int?  page;

  MyProfileListingLoaded({
    this.my_profile,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [my_profile!, hasReachedMax!, page!];
//  : super([my_profile, hasReachedMax, page]);

  MyProfileListingLoaded copyWith({
    MyProfileListingModel? my_profile,
    bool? hasReachedMax,
    int? page,
  }) {
    return MyProfileListingLoaded(
      my_profile: my_profile ?? this.my_profile,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'MyProfileListingLoaded  MyProfileListing: ${ my_profile!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  

abstract class PortofolioMyProfileState extends Equatable {
    const PortofolioMyProfileState();
	@override
	  List<Object> get props => [];
  
}

class PortofolioMyProfileListingUninitialized extends PortofolioMyProfileState {
  @override
  String toString() => 'PortofolioMyProfileListingUninitialized';
}

class PortofolioMyProfileListingError extends PortofolioMyProfileState {
  @override
  String toString() => 'PortofolioMyProfileListingError';
}

class PortofolioMyProfileListingLoaded extends PortofolioMyProfileState {
  final PortofolioListingModel? portofolio;
  final bool? hasReachedMax;
  final int?  page;

  PortofolioMyProfileListingLoaded({
    this.portofolio,
    this.hasReachedMax,
    this.page,

  }) ;
   @override
  List<Object> get props => [portofolio!, hasReachedMax!, page!];
  //: super([portofolio, hasReachedMax, page]);

  PortofolioMyProfileListingLoaded copyWith({
    PortofolioListingModel? portofolio,
    bool? hasReachedMax,
    int? page,
  }) {
    return PortofolioMyProfileListingLoaded(
      portofolio: portofolio ?? this.portofolio,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'PortofolioMyProfileListingLoaded  PortofolioMyProfileListing: ${ portofolio!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

