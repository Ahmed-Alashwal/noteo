import 'package:dartz/dartz.dart';
import 'package:note_app/core/errors/failure.dart';
import 'package:note_app/core/usecase/use_case.dart';
import 'package:note_app/features/auth/domain/repository/auth_repository.dart';

class LoginParams {
  final String userName;
  final String password;

  const LoginParams({required this.userName, required this.password});
}

class AuthLoginUseCase extends UseCase<void, LoginParams> {
  final AuthRepository authRepository;

  AuthLoginUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call([LoginParams? userCredentials]) {
    return authRepository.login(
      userName: userCredentials!.userName,
      password: userCredentials.password,
    );
  }
}
