part of 'Assign_cubit.dart';

@immutable
abstract class AssignState {}

class AssignInitial extends AssignState {}

class AssignLoading extends AssignState {}

class AssignSuccess extends AssignState {
  final OrderDetailsModel myOrderDetailsModel;
  AssignSuccess(this.myOrderDetailsModel);
}

class AssignError extends AssignState {
  final String error;
  AssignError(this.error);
}
