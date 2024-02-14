import 'dart:convert';

// Define a model class for the response
class LoginResponse {
  final bool status;
  final String message;
  final Map<String, dynamic> data;

  LoginResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  // Factory method to create an instance of LoginResponse from JSON
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['Status'] ??
          false, // Provide a default value if 'Status' is null
      message:
          json['Message'] ?? '', // Provide a default value if 'Message' is null
      data: json['Data'] ?? {}, // Provide a default value if 'Data' is null
    );
  }
}

// Parse the JSON response and fetch the token
Future<String?> parseResponseAndFetchToken(
    Map<String, dynamic> jsonResponse) async {
  // Create LoginResponse instance from parsed JSON
  LoginResponse response = LoginResponse.fromJson(jsonResponse);

  // Fetch the token from the response data
  String? token = response.data['Token'];

  return token;
}
