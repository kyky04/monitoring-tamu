import 'dart:io';

import 'package:base/models/news/news_result.dart';
import 'package:base/models/profile/update_profile_result.dart';
import 'package:base/models/profile/user_profile_result.dart';
import 'package:base/models/registrations/registration_result.dart';
import 'package:base/models/sliders/slider_result.dart';
import 'package:base/utils/error_state.dart';
import 'package:base/utils/logging_interceptor.dart';
import 'package:base/utils/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../environments/environment.dart';
import '../models/authentications/login_result.dart';
import '../utils/error_state.dart';
import '../utils/error_state.dart';

class ApiProvider {
  final Dio _dio = Dio();

  //
  static String _endpoint = "${Environment.endpoint}/api/";
  final String _apikey = "SDmBhWn8Ja8X6XjIFhFo";

  //master
  final String _news = _endpoint + "news";
  final String _slider = _endpoint + "sliders";
  final String _city = _endpoint + "master/address/city";
  final String _province = _endpoint + "master/address/province";

  //authentication
  final String _login = _endpoint + "auth/login";
  final String _registration = _endpoint + "users/auth/registration";
  final String _me = _endpoint + "me";
  final String _updateUserProfile = _endpoint + "users/profile/update";

  //reservation

  Future<NewsResult> fetchNews() async {
    _dio.interceptors.add(LoggingInterceptor());
    String accessToken = await SharedPreferencesHelper.getAccessToken();
    _dio.options.headers['Authorization'] = 'Bearer $accessToken';

    try {
      Response response = await _dio.get(_news);
      return NewsResult.fromJson(response.statusCode,response.data);
    } on DioError catch (error) {
      print("Exception occured: $error ");
      return NewsResult.withError(error.response.data);
    }
  }

  Future<SliderResult> fetchSliders() async {
    _dio.interceptors.add(LoggingInterceptor());
    String accessToken = await SharedPreferencesHelper.getAccessToken();
    _dio.options.headers['Authorization'] = 'Bearer $accessToken';

    try {
      Response response = await _dio.get(_slider);
      return SliderResult.fromJson(response.statusCode,response.data);
    } on DioError catch (error) {
      print("Exception occured: $error ");
      return SliderResult.withError(error.response.data);
    }
  }

  Future<LoginResult> login(String identity_number, String password) async {
    _dio.interceptors.add(LoggingInterceptor());

    try {
      Response response = await _dio.post(_login,
          data: {"identity_number": identity_number, "password": password});

      return LoginResult.fromJson(response.statusCode, response.data);
    } on DioError catch (error) {
      return LoginResult.withError(error.response.data);
    }
  }

  Future<SuccessRegistrationResult> registration(
      String username, String email, String password) async {
    _dio.interceptors.add(LoggingInterceptor());
    _dio.options.headers["X-Authkey"] = _apikey;
    _dio.options.contentType = Headers.formUrlEncodedContentType;

    try {
      Response response = await _dio.post(_registration,
          data: {"username": username, "email": email, "password": password});
      print(response.data);
      return SuccessRegistrationResult.fromJson(response.data);
    } on DioError catch (error) {
      print("Error ${handleErrorDio(error)}");
      return SuccessRegistrationResult.withError(error.response.data);
    }
  }

  Future<UserProfileResult> userProfile() async {
    _dio.interceptors.add(LoggingInterceptor());

    String accessToken = await SharedPreferencesHelper.getAccessToken();
    _dio.options.headers['Authorization'] = 'Bearer $accessToken';


    try {
      Response response = await _dio.post(_me);
      return UserProfileResult.fromJson(response.statusCode, response.data);
    } on DioError catch (error) {
      return UserProfileResult.withError(error.response.data);
    }
  }

  Future<UpdateProfileResult> updateProflile(
      {profile_id,
      no_rm,
      name,
      no_ktp,
      province_id,
      city_id,
      address,
      gender,
      no_hp,
      bank_id,
      tanggal_lahir,
      File foto}) async {
    _dio.interceptors.add(LoggingInterceptor());
    _dio.options.headers["X-Authkey"] = _apikey;

    try {
      FormData formData = FormData.fromMap({
        "profile_id": profile_id,
        "name": name,
        "no_ktp": no_ktp,
        "province_id": province_id,
        "city_id": city_id,
        "address": address,
        "no_hp": no_hp,
        "bank_id": bank_id,
        "tanggal_lahir": tanggal_lahir,
        "gender": gender,
      });

      if (foto != null) {
        formData.files
            .add(MapEntry('foto', await MultipartFile.fromFile(foto.path)));
      }

      Response response = await _dio.post(_updateUserProfile, data: formData);
      return UpdateProfileResult.fromJson(response.data);
    } on DioError catch (error) {
      return UpdateProfileResult.withError(handleErrorDio(error));
    }
  }
}
