import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/data/Models/OrdersModel.dart';
import 'package:market_app/data/Models/UpdateOrderModel.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import 'package:market_app/data/Shared/end_points.dart';
import 'package:meta/meta.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit() : super(UpdateOrderInitial());

  static UpdateOrderCubit get(context) => BlocProvider.of(context);

  int currentId = 0;

  void updateNewToPreparing({required time, required orderId}) {
    emit(NewToPreparinLoading());
    DioHelper.postData(url: "$GETORDERS/$orderId", data: {
      "api_token": CacheHelper.getFromShared("token"),
      "timing": time,
      "order_status_id": 2,
    }).then((value) {
      var myUpdateOrderModel = UpdateOrderModel.fromJson(value.data);
      Fluttertoast.showToast(
          msg: myUpdateOrderModel.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color.fromARGB(255, 223, 47, 34),
          textColor: Colors.white,
          fontSize: 16.0);
      emit(NewToPreparingSuccess(myUpdateOrderModel));
    });
  }

  void updateNewToPreparingWithDriver(
      {required time, required orderId, required driverId}) {
    emit(UpdateOrderLoading());
    DioHelper.postData(url: "$GETORDERS/$orderId", data: {
      "api_token": CacheHelper.getFromShared("token"),
      "timing": time,
      "order_status_id": 2,
      "driver_id": driverId,
    }).then((value) {
      var myUpdateOrderModel = UpdateOrderModel.fromJson(value.data);
      Fluttertoast.showToast(
          msg: myUpdateOrderModel.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color.fromARGB(255, 223, 47, 34),
          textColor: Colors.white,
          fontSize: 16.0);
      emit(NewToPreparingWithDriverSuccess(myUpdateOrderModel));
    }).catchError((error) {
      emit(UpdateOrderError(error.toString()));
    });
  }

  void updateNotAssignedDriver({required orderId, required driverId}) {
    emit(UpdateOrderLoading());
    DioHelper.postData(url: "$GETORDERS/$orderId", data: {
      "api_token": CacheHelper.getFromShared("token"),
      "order_status_id": 2,
      "driver_id": driverId,
    }).then((value) {
      var myUpdateOrderModel = UpdateOrderModel.fromJson(value.data);
      Fluttertoast.showToast(
          msg: myUpdateOrderModel.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color.fromARGB(255, 223, 47, 34),
          textColor: Colors.white,
          fontSize: 16.0);
      emit(NotAssignedDriverSuccess(myUpdateOrderModel));
    }).catchError((error) {
      emit(UpdateOrderError(error.toString()));
    });
  }

  declineOrder({required orderId, cancelReason}) {
    emit(UpdateOrderLoading());
    DioHelper.postData(url: "$GETORDERS/$orderId", data: {
      "api_token": CacheHelper.getFromShared("token"),
      "cancel_reason": cancelReason,
      "order_status_id": 6,
    }).then((value) {
      var myUpdateOrderModel = UpdateOrderModel.fromJson(value.data);
      Fluttertoast.showToast(
          msg: myUpdateOrderModel.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color.fromARGB(255, 223, 47, 34),
          textColor: Colors.white,
          fontSize: 16.0);
      emit(declineOrderSuccess(myUpdateOrderModel));
    }).catchError((error) {
      emit(UpdateOrderError(error.toString()));
    });
  }

  void updatePreparingToDelivered({required orderId}) {
    currentId = orderId;
    emit(UpdateOrderLoading());
    DioHelper.postData(url: "$GETORDERS/$orderId", data: {
      "api_token": CacheHelper.getFromShared("token"),
      "order_status_id": 5,
    }).then((value) async {
      var myUpdateOrderModel = UpdateOrderModel.fromJson(value.data);
      Fluttertoast.showToast(
          msg: myUpdateOrderModel.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color.fromARGB(255, 223, 47, 34),
          textColor: Colors.white,
          fontSize: 16.0);
      emit(PreparingToDeliveredSuccess(myUpdateOrderModel));
      // emit(PleaseRender());
    }).catchError((error) {
      emit(UpdateOrderError(error.toString()));
    });
  }

  pleaseRender() {
    emit(PleaseRender());
  }

  declineOrderImmediately({required orderId, cancelReason}) {
    emit(UpdateOrderLoading());
    DioHelper.postData(url: "$GETORDERS/$orderId", data: {
      "api_token": CacheHelper.getFromShared("token"),
      "cancel_reason": cancelReason,
      "order_status_id": 6,
    }).then((value) {
      var myUpdateOrderModel = UpdateOrderModel.fromJson(value.data);
      Fluttertoast.showToast(
          msg: myUpdateOrderModel.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Color.fromARGB(255, 223, 47, 34),
          textColor: Colors.white,
          fontSize: 16.0);
      emit(declineOrderSuccess(myUpdateOrderModel));
    }).catchError((error) {
      emit(UpdateOrderError(error.toString()));
    });
  }
}
