part of 'mail_sent_cubit.dart';

@immutable
abstract class MailSentState {}

class MailSentInitial extends MailSentState {}

class MailSentLoading extends MailSentState {}

class MailSentSuccess extends MailSentState {
  final MailSentModel mailSentModel;
  MailSentSuccess(this.mailSentModel);
}

class MailSentError extends MailSentState {
  final String error;
  MailSentError(this.error);
}
