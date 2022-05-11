import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final Map<String, dynamic> user;

  LoginSuccess(this.user);
  @override
  List<Object> get props => [];
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
  @override
  List<Object> get props => [error];
}
