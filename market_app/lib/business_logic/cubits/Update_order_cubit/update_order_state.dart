part of 'update_order_cubit.dart';

@immutable
abstract class UpdateOrderState {}

class UpdateOrderInitial extends UpdateOrderState {}

class UpdateOrderLoading extends UpdateOrderState {}

class NewToPreparinLoading extends UpdateOrderState {}

class PleaseRender extends UpdateOrderState {}

class NewToPreparingSuccess extends UpdateOrderState {
  final UpdateOrderModel myUpdateOrderModel;
  NewToPreparingSuccess(this.myUpdateOrderModel);
}

class NewToPreparingWithDriverSuccess extends UpdateOrderState {
  final UpdateOrderModel myUpdateOrderModel;
  NewToPreparingWithDriverSuccess(this.myUpdateOrderModel);
}

class NotAssignedDriverSuccess extends UpdateOrderState {
  final UpdateOrderModel myUpdateOrderModel;
  NotAssignedDriverSuccess(this.myUpdateOrderModel);
}

class declineOrderSuccess extends UpdateOrderState {
  final UpdateOrderModel myUpdateOrderModel;
  declineOrderSuccess(this.myUpdateOrderModel);
}

class PreparingToDeliveredSuccess extends UpdateOrderState {
  final UpdateOrderModel myUpdateOrderModel;
  PreparingToDeliveredSuccess(this.myUpdateOrderModel);
}

class UpdateOrderError extends UpdateOrderState {
  final String error;
  UpdateOrderError(this.error);
}
