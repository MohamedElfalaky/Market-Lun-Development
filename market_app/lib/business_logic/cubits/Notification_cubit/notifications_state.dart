part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsSuccess extends NotificationsState {
  final NotificationsModel myNotificationsModel;
  NotificationsSuccess(this.myNotificationsModel);
}

class NotificationsError extends NotificationsState {
  final String error;
  NotificationsError(this.error);
}
