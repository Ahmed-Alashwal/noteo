import 'package:note_app/core/api/api_consumer.dart';
import 'package:note_app/core/api/api_endpoints.dart';

abstract class AuthRemoteDataSource {
  Future<dynamic> register({
    required String userName,
    required String email,
    required String password,
  });
  Future<dynamic> login({required String userName, required String password});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<dynamic> register({
    required String userName,
    required String email,
    required String password,
  }) async {
    final response = await apiConsumer.post(
      endPoint: ApiEndpoints.register,
      data: {
        ApiKey.username: userName,
        ApiKey.email: email,
        ApiKey.password: password,
      },
    );
    return response;
  }

  @override
  Future<dynamic> login({
    required String userName,
    required String password,
  }) async {
    final response = await apiConsumer.post(
      endPoint: ApiEndpoints.login,
      data: {ApiKey.username: userName, ApiKey.password: password},
    );
    return response;
  }
}
