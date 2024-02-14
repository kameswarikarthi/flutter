import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:message_app/core/constants/constants.dart';
import 'package:message_app/core/constants/api_constants.dart';
import 'package:message_app/core/resources/data_state.dart';
import 'package:message_app/features/auth/domain/repository/auth_repository.dart';
import 'package:message_app/features/auth/data/models/login.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<String> getToken() async {
    var dio = Dio();
    try {
      Response httpResponse = await dio.post(
        '${aPIBaseURL}${ApiConstants.loginApi}',
        data: {'Email': apiEmailId, 'Password': apiPassword},
      );

      // Call the function and wait for it to complete
      String? token = await parseResponseAndFetchToken(httpResponse.data);

      String nonNullableToken =
          token ?? ""; // Provide a default empty string if token is null

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('api_token', nonNullableToken);

      return httpResponse.data;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> setApiToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('api_token', token);
  }

  Future<String?> fetchApiToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('api_token');
  }
}
