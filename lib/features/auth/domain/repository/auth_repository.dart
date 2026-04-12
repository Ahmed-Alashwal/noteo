import 'package:dartz/dartz.dart';
import 'package:note_app/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> register({
    required String userName,
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> login({
    required String userName,
    required String password,
  });
}
