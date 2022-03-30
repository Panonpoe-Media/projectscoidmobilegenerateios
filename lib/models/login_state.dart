import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  final String? username;
  final String? password;

  const LoginInitial({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username!, password!];
  @override
  String toString() => 'LoginInitial';
}

class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginLoading';
}

class LoginFailure extends LoginState {
  final String? error;

  const LoginFailure({@required this.error});

  @override
  List<Object> get props => [error!];

  @override
  String toString() => 'LoginFailure { error: $error }';
}