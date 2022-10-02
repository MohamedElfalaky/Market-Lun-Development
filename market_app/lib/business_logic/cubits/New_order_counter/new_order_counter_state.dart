part of 'new_order_counter_cubit.dart';

@immutable
abstract class NewOrderCounterState {}

class NewOrderCounterInitial extends NewOrderCounterState {}

class NewOrderCounterLoading extends NewOrderCounterState {}

class NewOrderCounterSucces extends NewOrderCounterState {}

class NewOrderCounterError extends NewOrderCounterState {
  final String error;
  NewOrderCounterError(this.error);
}
