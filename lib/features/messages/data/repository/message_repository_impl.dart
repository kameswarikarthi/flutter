import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:message_app/core/constants/constants.dart';
import 'package:message_app/core/constants/api_constants.dart';
import 'package:message_app/core/resources/data_state.dart';
import 'package:message_app/features/messages/domain/repository/message_repository.dart';
import 'package:message_app/features/messages/data/models/message.dart';
import 'package:message_app/features/messages/domain/entities/message.dart';
import 'package:message_app/features/auth/data/repository/auth_repository_impl.dart';

class MessageRepositoryImpl implements MessageRepository {
  @override
  Future<Response?> getMessages() async {
    var dio = Dio();
    try {
      final authRepository = AuthRepositoryImpl();
      final token = await authRepository.fetchApiToken();
      Response httpResponse =
          await dio.post('${aPIBaseURL}${ApiConstants.listMessageApi}',
              data: {
                'Page': 1,
                'PageSize': 100,
                'MessageType': ['Message']
              },
              options: Options(
                headers: <String, String>{
                  'authorization': 'Bearer $token',
                  'client_access': apiCompanyName
                },
              ));

      return httpResponse;
    } catch (e) {
      return null;
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
