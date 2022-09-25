part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LogInModel myLoginModel;
  LoginSuccess(this.myLoginModel);
}

class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
}

class PasswordShown extends LoginState {}
