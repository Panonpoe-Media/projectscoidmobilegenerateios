import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class NextButtonPressed extends LoginEvent {

  @override
  String toString() =>
      'NextButtonPressed';
}

class ResetError extends LoginEvent {
  final String? username;
  final String? password;

  const ResetError({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username!, password!];

  @override
  String toString() =>
      'ResetError { username: $username, password: $password }';
}

class LoginButtonPressed extends LoginEvent {
  final String? username;
  final String? password;

  const LoginButtonPressed({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username!, password!];

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';
}