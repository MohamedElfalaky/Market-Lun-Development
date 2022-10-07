part of 'drivers_cubit.dart';

@immutable
abstract class DriversState {}

class DriversInitial extends DriversState {}

class DriversLoading extends DriversState {}

class DriversSuccess extends DriversState {
  final DriversModel myDriversModel;
  DriversSuccess(this.myDriversModel);
}

class DriversError extends DriversState {
  final String error;
  DriversError(this.error);
}
