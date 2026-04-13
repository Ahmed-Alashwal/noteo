import 'package:dio/dio.dart';
import 'package:note_app/core/errors/error_model.dart';

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
        return ServerFailure.fromBadResponse(
          statusCode: e.response!.statusCode!,
          data: e.response!.data,
        );
    }
  }

  factory ServerFailure.fromBadResponse({
    required int statusCode,
    required dynamic data,
  }) {
    String message = switch (statusCode) {
      400 => 'Bad request. Please check your input.',
      401 => ErrorModel.fromJson(data).errMessage,
      403 => 'You don\'t have permission to perform this action.',
      404 => 'The requested resource was not found.',
      500 => 'Internal server error. Please try again later.',
      _ => 'Unexpected error occurred. (Code: $statusCode)',
    };
    return ServerFailure(errMessage: message);
  }
}
