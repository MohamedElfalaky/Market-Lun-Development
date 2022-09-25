import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future saveToken(String token) async {
    await prefs!.setString('token', token);
  }

  static getToken(String key) {
    return prefs?.get(key);
  }

  static Future<bool?> removeToken(String key) async {
    return await prefs?.remove(key);
  }
}
