import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mail_sent_state.dart';

class MailSentCubit extends Cubit<MailSentState> {
  MailSentCubit() : super(MailSentInitial());
}
