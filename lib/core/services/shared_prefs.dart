import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefsSingelton {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static bool getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  static Future<void> remove(String key) async {
    await _instance.remove(key);
  }
}
