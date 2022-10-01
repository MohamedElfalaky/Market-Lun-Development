part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersSuccess extends OrdersState {
  final OrdersModel myOrdermodel;
  OrdersSuccess(this.myOrdermodel);
}

class OnChangeRadioButton extends OrdersState {}

class OrdersError extends OrdersState {
  final String error;
  OrdersError(this.error);
}
