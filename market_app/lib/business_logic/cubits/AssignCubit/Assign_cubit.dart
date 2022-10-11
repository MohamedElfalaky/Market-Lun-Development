import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/data/Models/OrderDetailsModel.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/end_points.dart';
import 'package:meta/meta.dart';

part '../AssignCubit/Assign_state.dart';

class AssignCubit extends Cubit<AssignState> {
  AssignCubit() : super(AssignInitial());
  static AssignCubit get(context) => BlocProvider.of(context);

  getOrdersDetails({
    required String apiToken,
    required String orderId,
  }) {
    emit(AssignLoading());
    DioHelper.getData(url: '$GETORDERS/$orderId', query: {
      "api_token": apiToken,
    }).then((value) {
      var myOdrerDetailModel = OrderDetailsModel.fromJson(value.data);

      emit(AssignSuccess(myOdrerDetailModel));
    }).catchError((error) {
      emit(AssignError(error.toString()));
    });
  }
}
