import 'package:message_app/core/resources/data_state.dart';

abstract class AuthRepository {
  // API methods
  Future<String> getToken();
}
