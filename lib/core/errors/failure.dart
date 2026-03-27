import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class CacheFailure extends Failure {
  CacheFailure({required super.errMessage});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: "Connection Timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: "Send timeout  with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: "Receive timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: "Bad certificate with ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: e.response!.statusCode!,
          response: e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: "Request to ApiServer was canceld");
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: "No internet connection.");
      case DioExceptionType.unknown:
        return ServerFailure(
          errMessage: "Unknown: Oops! there was an error, please try later.",
        );
    }
  }

  factory ServerFailure.fromResponse({
    required int statusCode,
    required dynamic response,
  }) {
    if (statusCode == 404) {
      return ServerFailure(
        errMessage: "Your request wasn't found, please try later",
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errMessage: "There's a problem with server, please try later",
      );
    } else {
      // Will be modified in the future!
      // For statusCode in [ 401, 403, etc. ]
      return ServerFailure(
        errMessage: "BadResponse: Oops! there was an error, please try later.",
      );
    }
  }
}
