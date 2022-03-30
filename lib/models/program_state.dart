import 'package:equatable/equatable.dart';
//import 'package:projectscoid/models/program.dart';
import 'package:projectscoid/models/model.dart';


abstract class ProgramState extends Equatable {
    const ProgramState();
	@override
	  List<Object> get props => [];
}

class ProgramListingUninitialized extends ProgramState {
  @override
  String toString() => 'ProgramListingUninitialized';
}

class ProgramListingError extends ProgramState {
  @override
  String toString() => 'ProgramListingError';
}

class ProgramListingLoaded extends ProgramState {
  final ProgramListingModel? program;
  final bool? hasReachedMax;
  final int?  page;

  ProgramListingLoaded({
    this.program,
    this.hasReachedMax,
    this.page,

  });
  @override
  List<Object> get props => [program!, hasReachedMax!, page!];
//  : super([program, hasReachedMax, page]);

  ProgramListingLoaded copyWith({
    ProgramListingModel? program,
    bool? hasReachedMax,
    int? page,
  }) {
    return ProgramListingLoaded(
      program: program ?? this.program,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() =>
      'ProgramListingLoaded  ProgramListing: ${ program!.items.items.length } , hasReachedMax: $hasReachedMax ';
}

  
