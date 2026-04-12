import 'package:note_app/core/api/api_endpoints.dart';

class RegisterModel {
  final String userName;
  final String email;

  const RegisterModel({required this.userName, required this.email});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      userName: json[ApiKey.username],
      email: json[ApiKey.email],
    );
  }
}
