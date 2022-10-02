import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/data/Models/NotificationsModel.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/end_points.dart';
import 'package:meta/meta.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());
  static NotificationsCubit get(context) => BlocProvider.of(context);

  void getNotifications({
    required String apiToken,
  }) {
    emit(NotificationsLoading());
    DioHelper.getData(url: NOTIFICATIONS, query: {
      "api_token": apiToken,
    }).then((value) {
      var myNotificationsModel = NotificationsModel.fromJson(value.data);
      emit(NotificationsSuccess(myNotificationsModel));
    }).catchError((error) {
      emit(NotificationsError(error.toString()));
    });
  }
}
