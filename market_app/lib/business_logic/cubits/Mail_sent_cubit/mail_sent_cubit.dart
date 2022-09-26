import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/data/Models/MailSentModel.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/end_points.dart';

part 'mail_sent_state.dart';

class MailSentCubit extends Cubit<MailSentState> {
  MailSentCubit() : super(MailSentInitial());
  static MailSentCubit get(context) => BlocProvider.of(context);

  void sendMail({required email}) {
    emit(MailSentLoading());
    DioHelper.postData(url: SENDMAIL, data: {
      "email": email,
    }).then((value) {
      var myMailSentModel = MailSentModel.fromJson(value.data);

      emit(MailSentSuccess(myMailSentModel));
    }).catchError((error) {
      emit(MailSentError(error.toString()));
    });
  }
}
