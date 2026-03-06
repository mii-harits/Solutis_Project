import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static final PreferenceHandler _instance = PreferenceHandler._internal();
  late SharedPreferences _preferences;
  factory PreferenceHandler() => _instance;
  PreferenceHandler._internal();
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static const String _isLogin = 'isLogin';

  Future<void> storingIsLogin(bool isLogin) async {
    await _preferences.setBool(_isLogin, isLogin);
  }

  static Future<bool?> getIsLogin() async {
    final prefs = await SharedPreferences.getInstance();

    var data = prefs.getBool(_isLogin);
    return data;
  }

  Future<void> deleteIsLogin() async {
    _preferences.remove(_isLogin);
  }
}
