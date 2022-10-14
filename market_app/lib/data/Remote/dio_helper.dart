import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static Dio? dioLogOut;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://dev.talabatcom.sa/Admin",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query}) async {
    return dio!.post(url, data: data, queryParameters: query);
  }
}
