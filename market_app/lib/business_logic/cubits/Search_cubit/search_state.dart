part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final OrdersModel myOrderModel;
  SearchSuccess(this.myOrderModel);
}

class SearchError extends SearchState {
  final String error;
  SearchError(this.error);
}
