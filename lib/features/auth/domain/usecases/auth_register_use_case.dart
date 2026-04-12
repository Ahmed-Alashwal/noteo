import 'package:dartz/dartz.dart';
import 'package:note_app/core/errors/failure.dart';
import 'package:note_app/core/usecase/use_case.dart';
import 'package:note_app/features/auth/domain/repository/auth_repository.dart';

class RegisterParams {
  final String userName;
  final String email;
  final String password;

  const RegisterParams({
    required this.userName,
    required this.email,
    required this.password,
  });
}

class AuthRegisterUseCase extends UseCase<void, RegisterParams> {
  final AuthRepository authRepository;

  AuthRegisterUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call([RegisterParams? userCredentials]) {
    return authRepository.register(
      userName: userCredentials!.userName,
      email: userCredentials.email,
      password: userCredentials.password,
    );
  }
}
