part of 'update_order_cubit.dart';

@immutable
abstract class UpdateOrderState {}

class UpdateOrderInitial extends UpdateOrderState {}

class UpdateOrderLoading extends UpdateOrderState {}

class UpdateOrderSuccess extends UpdateOrderState {
  final UpdateOrderModel myUpdateOrderModel;
  UpdateOrderSuccess(this.myUpdateOrderModel);
}

class UpdateOrderError extends UpdateOrderState {
  final String error;
  UpdateOrderError(this.error);
}
