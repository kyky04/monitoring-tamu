import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static final String kAccesToken = "access_token";
  static final String kIsLogin = "isLogin";
  static final String kShowOnboarding = "showOnBoarding";

  static Future<String> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(kAccesToken) ?? '';
  }

  static Future<bool> setAccessToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(kAccesToken, value);
  }

  static Future<bool> checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(kIsLogin) ?? false;
  }

  static Future<bool> setIsLogin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(kIsLogin, value);
  }

  static Future<bool> checkShowOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(kShowOnboarding) ?? false;
  }

  static Future<bool> setShowOnboarding(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(kShowOnboarding, value);
  }

  static removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.remove(kAccesToken);
    prefs.remove(kIsLogin);
    prefs.remove(kShowOnboarding);

  }
}