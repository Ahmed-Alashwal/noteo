import 'package:dartz/dartz.dart';
import 'package:note_app/core/errors/failure.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failure, T>>call([Param param]);
}

class NoParam{}