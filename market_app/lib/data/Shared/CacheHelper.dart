import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future saveToShared(String key, String value) async {
    await prefs!.setString(key, value);
  }

  static getFromShared(String key) {
    return prefs!.get(key);
  }

  static Future<bool?> removeToken(String key) async {
    return await prefs?.remove(key);
  }
}
