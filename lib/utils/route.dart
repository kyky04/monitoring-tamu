import 'package:base/screens/base/wevbiew_screen.dart';
import 'package:base/screens/home_page.dart';
import 'package:flutter/material.dart';

class RouteUtil {
  //basic
  static const String ONBOARDING = "/onboarding";
  static const String WELCOME = "/welcome";
  static const String HOME = "/home";
  static const String LOGIN = "/auth/login";
  static const String REGISTER = "/auth/register";
  static const String EDIT_PROFILE = "/profil-profile";

  //reservation

  static const String NEWS_DETAIL = "/news-detail";
  static const String NEWS = "/news";

  static const String WEBVIEW = "/webview";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }

  static backToHome(BuildContext context) {
    Navigator.popAndPushNamed(context, RouteUtil.HOME);
  }
}
