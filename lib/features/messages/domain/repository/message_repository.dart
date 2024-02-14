import 'package:message_app/core/resources/data_state.dart';
import 'package:message_app/features/messages/domain/entities/message.dart';
import 'package:dio/dio.dart';

abstract class MessageRepository {
  // API methods
  Future<Response?> getMessages();

  Future<Response?> getMessageList();
}
