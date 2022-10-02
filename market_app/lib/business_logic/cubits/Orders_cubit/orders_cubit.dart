import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/data/Models/OrdersModel.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/end_points.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  static OrdersCubit get(context) => BlocProvider.of(context);
  static const List<String> values1 = ["All", "Pick up", "Delivery"];
  static const List<String> values2 = [
    "Today",
    "Yesterday",
    "Lastweek",
    "Lastmonth"
  ];
  static String selectedValue1 = values1.first;
  static String selectedValue2 = values2.first;
  int? selectedIndex;

  void getAllOrders({
    required int delivery,
    required int pickup,
    required String apiToken,
  }) {
    emit(OrdersLoading());
    DioHelper.getData(url: GETORDERS, query: {
      "api_token": apiToken,
      "delivery": delivery,
      "pickup": pickup,
    }).then((value) {
      var myOdrersModel = OrdersModel.fromJson(value.data);

      emit(OrdersSuccess(myOdrersModel));
    }).catchError((error) {
      emit(OrdersError(error.toString()));
    });
  }

  void getOrders(
      {required int delivery,
      required int pickup,
      required String apiToken,
      status}) {
    emit(OrdersLoading());
    DioHelper.getData(url: GETORDERS, query: {
      "api_token": apiToken,
      "delivery": delivery,
      "pickup": pickup,
      "statuses[0]": status,
    }).then((value) {
      var myOdrersModel = OrdersModel.fromJson(value.data);
      // myCounter = myOdrersModel.data.length;
      emit(OrdersSuccess(myOdrersModel));
    }).catchError((error) {
      emit(OrdersError(error.toString()));
    });
  }

  void changeRadioButton() {
    emit(OnChangeRadioButton());
  }
}
