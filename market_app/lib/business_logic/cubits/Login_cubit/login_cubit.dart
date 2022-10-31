import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/data/Models/LogInModel.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool isHiddenPass = true;
  Icon? securityIcon = Icon(
    Icons.visibility_off,
  );

  void userLogin({required email, required password}) {
    emit(LoginLoading());
    DioHelper.postData(url: LOGIN, data: {
      "email": email,
      "password": password,
    }).then((value) {
      // print(value.data);
      var myLoginModel = LogInModel.fromJson(value.data);
      // print(myLoginModel.success);
      emit(LoginSuccess(myLoginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginError(error.toString()));
    });
  }

  void showPassWord() {
    isHiddenPass = !isHiddenPass;

    isHiddenPass
        ? securityIcon = Icon(Icons.visibility_off)
        : securityIcon = Icon(Icons.visibility);
    emit(PasswordShown());
  }
}
