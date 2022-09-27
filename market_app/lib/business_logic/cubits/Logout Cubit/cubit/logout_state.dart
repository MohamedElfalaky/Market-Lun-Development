part of 'logout_cubit.dart';

@immutable
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final LogOutModel myLogOutModel;
  LogoutSuccess(this.myLogOutModel);
}

class LogoutError extends LogoutState {
  final String error;
  LogoutError(this.error);
}

// class LoginSuccess extends LoginState {
//   final LogInModel myLoginModel;
//   LoginSuccess(this.myLoginModel);
// }

