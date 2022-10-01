import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/data/Models/OrderDetailsModel.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/end_points.dart';
import 'package:meta/meta.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());
  static OrderDetailsCubit get(context) => BlocProvider.of(context);

  void getDetails({
    required String apiToken,
    required String orderId,
  }) {
    emit(OrderDetailsLoading());
    DioHelper.getData(url: '$GETORDERS/$orderId', query: {
      "api_token": apiToken,
    }).then((value) {
      var myOdrerDetailModel = OrderDetailsModel.fromJson(value.data);

      emit(OrderDetailsSuccess(myOdrerDetailModel));
    }).catchError((error) {
      emit(OrderDetailsError(error.toString()));
    });
  }
}
