part of 'local_cubit.dart';

@immutable
abstract class LocalState {}

class LocalInitial extends LocalState {}

class ChangeLocaleState extends LocalState {
  final Locale local;
  ChangeLocaleState({required this.local});
}
