import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/data/Models/OrdersModel.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import 'package:market_app/data/Shared/end_points.dart';
import 'package:meta/meta.dart';

part 'new_order_counter_state.dart';

class NewOrderCounterCubit extends Cubit<NewOrderCounterState> {
  NewOrderCounterCubit() : super(NewOrderCounterInitial());

  static NewOrderCounterCubit get(context) => BlocProvider.of(context);
  static var myCounter = 0;

  void test() {
    emit(NewOrderCounterTest());
  }

  getOrders(
      {int delivery = 1,
      int pickup = 1,
      required String apiToken,
      status = 1}) {
    emit(NewOrderCounterLoading());
    DioHelper.getData(url: GETORDERS, query: {
      "api_token": apiToken,
      "delivery": delivery,
      "pickup": pickup,
      "statuses[0]": status,
    }).then((value) {
      var myOdrersModel = OrdersModel.fromJson(value.data);
      myCounter = myOdrersModel.data.length;
      emit(NewOrderCounterSucces());
    }).catchError((error) {
      emit(NewOrderCounterError(error.toString()));
    });
  }
}
