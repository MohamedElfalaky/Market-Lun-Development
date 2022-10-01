part of 'order_details_cubit.dart';

@immutable
abstract class OrderDetailsState {}

class OrderDetailsInitial extends OrderDetailsState {}

class OrderDetailsLoading extends OrderDetailsState {}

class OrderDetailsSuccess extends OrderDetailsState {
  final OrderDetailsModel myOrderDetailsModel;
  OrderDetailsSuccess(this.myOrderDetailsModel);
}

class OrderDetailsError extends OrderDetailsState {
  final String error;
  OrderDetailsError(this.error);
}
