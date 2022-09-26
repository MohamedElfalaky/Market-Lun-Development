part of 'mail_sent_cubit.dart';

@immutable
abstract class MailSentState {}

class MailSentInitial extends MailSentState {}

class MailSentLoading extends MailSentState {}

class MailSentSuccess extends MailSentState {}

class MailSentError extends MailSentState {}
