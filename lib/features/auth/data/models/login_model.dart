import 'package:note_app/core/api/api_endpoints.dart';

class LoginModel {
  final String refreshToken;
  final String accessToken;

  const LoginModel({required this.refreshToken, required this.accessToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      refreshToken: json[ApiKey.refreshToken],
      accessToken: json[ApiKey.accessToken],
    );
  }
}
