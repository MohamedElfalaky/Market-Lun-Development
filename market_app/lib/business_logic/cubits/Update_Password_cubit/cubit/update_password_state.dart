part of 'update_password_cubit.dart';

@immutable
abstract class UpdatePasswordState {}

class UpdatePasswordInitial extends UpdatePasswordState {}

class UpdatePasswordLoading extends UpdatePasswordState {}

class UpdatePasswordSuccess extends UpdatePasswordState {
  final UpdatePasswordModel myUpdatePassModel;
  UpdatePasswordSuccess(this.myUpdatePassModel);
}

class UpdatePasswordError extends UpdatePasswordState {
  final String error;
  UpdatePasswordError(this.error);
}
