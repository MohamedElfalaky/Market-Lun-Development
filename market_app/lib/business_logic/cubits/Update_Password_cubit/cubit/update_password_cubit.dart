import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/data/Models/UpdatePasswordModel.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/end_points.dart';
import 'package:meta/meta.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit() : super(UpdatePasswordInitial());
  static UpdatePasswordCubit get(context) => BlocProvider.of(context);
  bool isHiddenPass = false;
  bool isHiddenPass2 = false;
  Icon stateIcon1 = Icon(Icons.visibility_off);
  Icon stateIcon2 = Icon(Icons.visibility_off);

  showPass() {
    isHiddenPass = !isHiddenPass;
    if (!isHiddenPass) {
      stateIcon1 = Icon(Icons.visibility);
    } else {
      stateIcon1 = Icon(Icons.visibility_off);
    }
    emit(ShowPassState());
  }

  showPass2() {
    isHiddenPass2 = !isHiddenPass2;
    if (!isHiddenPass2) {
      stateIcon2 = Icon(Icons.visibility);
    } else {
      stateIcon2 = Icon(Icons.visibility_off);
    }
    emit(ShowPassState());
  }

  void updatePass({required pass, required passConfirmation}) {
    emit(UpdatePasswordLoading());
    DioHelper.postData(url: UPDATEPASS, data: {
      "email": "medof613@gmail.com",
      "password": pass,
      "password_confirmation": passConfirmation
    }).then((value) {
      var myUpdatePassModel = UpdatePasswordModel.fromJson(value.data);

      emit(UpdatePasswordSuccess(myUpdatePassModel));
    }).catchError((error) {
      emit(UpdatePasswordError(error.toString()));
    });
  }
}
