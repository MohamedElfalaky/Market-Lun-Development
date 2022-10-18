part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsSuccess extends SettingsState {
  final myModel;
  SettingsSuccess(this.myModel);
}

class SettingsError extends SettingsState {
  final String error;
  SettingsError(this.error);
}
