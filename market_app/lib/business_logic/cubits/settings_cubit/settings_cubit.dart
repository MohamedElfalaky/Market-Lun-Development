import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_app/data/Models/MarketSettingsGetModel.dart';
import 'package:market_app/data/Models/MarketSettingsSetModel.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/end_points.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  String selectedValue1 = 'non';
  String selectedValue2 = 'non';
  bool check1 = true;
  bool check2 = true;

  void getMarketStatus({
    required String apiToken,
  }) {
    emit(SettingsLoading());
    DioHelper.getData(url: SETTINGS, query: {
      "api_token": apiToken,
    }).then((value) {
      var mySettingsGetModel = MarketSettingsGetModel.fromJson(value.data);
      Fluttertoast.showToast(
          msg: mySettingsGetModel.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color.fromARGB(255, 223, 47, 34),
          textColor: Colors.white,
          fontSize: 16.0);
      emit(SettingsSuccess(mySettingsGetModel));
    }).catchError((error) {
      emit(SettingsError(error.toString()));
    });
  }

  void postMarketStatus({
    required String apiToken,
    required int market_status,
    required int delivery,
    required int pickup,
  }) {
    emit(SettingsLoading());
    DioHelper.postData(url: SETTINGS, data: {
      "api_token": apiToken,
      "market_status": market_status,
      "delivery": delivery,
      "pickup": pickup,
    }).then((value) {
      var mySettingsSetModel = MarketSettingsSetModel.fromJson(value.data);
      Fluttertoast.showToast(
          msg: mySettingsSetModel.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color.fromARGB(255, 223, 47, 34),
          textColor: Colors.white,
          fontSize: 16.0);
      emit(SettingsSuccess(mySettingsSetModel));
    }).catchError((error) {
      emit(SettingsError(error.toString()));
    });
  }
}
