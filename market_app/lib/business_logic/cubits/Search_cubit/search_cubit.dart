import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/data/Models/OrdersModel.dart';
import 'package:market_app/data/Remote/dio_helper.dart';
import 'package:market_app/data/Shared/end_points.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  void searchOrder({
    required int delivery,
    required int pickup,
    required String apiToken,
    required String searchString,
  }) {
    emit(SearchLoading());
    DioHelper.getData(url: GETORDERS, query: {
      "api_token": apiToken,
      "delivery": delivery,
      "pickup": pickup,
      "search": searchString,
    }).then((value) {
      var myOdrersModel = OrdersModel.fromJson(value.data);
      emit(SearchSuccess(myOdrersModel));
      ;
    }).catchError((error) {
      emit(SearchError(error.toString()));
    });
  }
}
