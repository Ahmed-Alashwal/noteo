import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:note_app/core/api/api_endpoints.dart';
import 'package:note_app/core/errors/failure.dart';
import 'package:note_app/core/utils/functions/color_print.dart';
import 'package:note_app/core/utils/functions/service_locator.dart';
import 'package:note_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:note_app/features/auth/data/models/login_model.dart';
import 'package:note_app/features/auth/data/models/register_model.dart';
import 'package:note_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, void>> register({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      Response response = await authRemoteDataSource.register(
        userName: userName,
        email: email,
        password: password,
      );
      final userCredentials = RegisterModel.fromJson(response.data);

      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(
        ServerFailure(errMessage: "auth_repo_impl ---> register() line 'X'"),
      );
    }
  }

  @override
  Future<Either<Failure, void>> login({
    required String userName,
    required String password,
  }) async {
    try {
      Response response = await authRemoteDataSource.login(
        userName: userName,
        password: password,
      );

      // After success login'
      final tokens = LoginModel.fromJson(response.data);
      await di.get<FlutterSecureStorage>().write(
        key: ApiKey.accessToken,
        value: tokens.accessToken,
      );
      colorPrint("ACCESS TOKEN $tokens.accessToken FROM REPO IMPL.");
      // Here we'll store tokens to flutter secure storage!

      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(
        ServerFailure(errMessage: "auth_repo_impl ---> login() line 'X'"),
      );
    }
  }
}
