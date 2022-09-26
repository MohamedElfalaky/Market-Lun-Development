import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/data/Models/LogOutModel.dart';

import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/end_points.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  static LogoutCubit get(context) => BlocProvider.of(context);

  void userLogout({required token}) {
    emit(LogoutLoading());
    DioHelper.postData(url: LOGOUT, data: {
      "api_token": token,
    }).then((value) {
      var myLogOutModel = LogOutModel.fromJson(value.data);
      // Navigator.of(context).pushNamedAndRemoveUntil(
      //           '/login', (Route<dynamic> route) => false);
      emit(LogoutSuccess(myLogOutModel));
    }).catchError((error) {
      print(error.toString());
      emit(LogoutError(error.toString()));
    });
  }
}
