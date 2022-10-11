part of 'Test_cubit.dart';

@immutable
abstract class TestState {}

class TestInitial extends TestState {}

class TestLoading extends TestState {}

class PleaseRender extends TestState {}

class TestSuccess extends TestState {
  final OrderDetailsModel myOrderDetailsModel;
  TestSuccess(this.myOrderDetailsModel);
}

class TestError extends TestState {
  final String error;
  TestError(this.error);
}
