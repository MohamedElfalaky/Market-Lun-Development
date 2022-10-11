import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/data/Models/OrderDetailsModel.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/end_points.dart';
import 'package:meta/meta.dart';

part 'Test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());
  static TestCubit get(context) => BlocProvider.of(context);

  getOrdersDetails({
    required String apiToken,
    required String orderId,
  }) {
    emit(TestLoading());
    DioHelper.getData(url: '$GETORDERS/$orderId', query: {
      "api_token": apiToken,
    }).then((value) {
      var myOdrerDetailModel = OrderDetailsModel.fromJson(value.data);

      emit(TestSuccess(myOdrerDetailModel));
    }).catchError((error) {
      emit(TestError(error.toString()));
    });
  }

  pleaseRender() {
    emit(PleaseRender());
  }
}
