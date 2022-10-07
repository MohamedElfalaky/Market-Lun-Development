import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/data/Models/DriversModel.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/end_points.dart';
import 'package:meta/meta.dart';

part 'drivers_state.dart';

class DriversCubit extends Cubit<DriversState> {
  DriversCubit() : super(DriversInitial());

  static DriversCubit get(context) => BlocProvider.of(context);

  void getDrivers({
    required String apiToken,
  }) {
    emit(DriversLoading());
    DioHelper.getData(url: DRIVERS, query: {
      "api_token": apiToken,
    }).then((value) {
      var myDriversModel = DriversModel.fromJson(value.data);

      emit(DriversSuccess(myDriversModel));
    }).catchError((error) {
      emit(DriversError(error.toString()));
    });
  }
}
