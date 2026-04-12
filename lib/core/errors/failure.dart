import 'package:dio/dio.dart';
import 'package:note_app/core/errors/error_model.dart';
import 'package:note_app/core/utils/functions/color_print.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure({required super.errMessage});
}

class CacheFailure extends Failure {
  CacheFailure({required super.errMessage});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: "Connection Timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: "Send timeout  with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: "Receive timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: "Bad certificate with ApiServer");
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: "Request to ApiServer was canceld");
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: "No internet connection.");
      case DioExceptionType.unknown:
        return ServerFailure(
          errMessage: "Unknown: Oops! there was an error, please try later.",
        );
      case DioExceptionType.badResponse:
        colorPrint("Get into [DioExceptionType.badResponse]");
        return ServerFailure(
          errMessage: ErrorModel.fromJson(e.response!.data).errMessage,
        );
    }
  }
}
