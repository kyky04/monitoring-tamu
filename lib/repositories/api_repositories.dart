import 'package:base/models/authentications/login_result.dart';
import 'package:base/models/profile/update_profile_result.dart';
import 'package:base/models/profile/user_profile_result.dart';
import 'package:base/models/registrations/registration_result.dart';
import 'package:base/models/sliders/slider_result.dart';
import 'package:base/repositories/api_provider.dart';
import 'package:base/models/news/news_result.dart';
import 'dart:convert';

class ApiRepository {
  ApiProvider _apiProvider = ApiProvider();

  Future<NewsResult> getNews() {
    return _apiProvider.fetchNews();
  }

  Future<SliderResult> fetchSliders() {
    return _apiProvider.fetchSliders();
  }

  Future<LoginResult> login(identity_numnber, password) {
    return _apiProvider.login(identity_numnber, password);
  }

  Future<SuccessRegistrationResult> registration(username, email, password) {
    return _apiProvider.registration(username, email, password);
  }

  Future<UserProfileResult> userProfile() {
    return _apiProvider.userProfile();
  }

}
