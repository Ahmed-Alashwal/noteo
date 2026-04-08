import 'package:dio/dio.dart';
import 'package:note_app/core/api/api_consumer.dart';
import 'package:note_app/core/api/api_endpoints.dart';
import 'package:note_app/core/api/api_interceptors.dart';
import 'package:note_app/core/utils/functions/color_print.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  // Configure the REQUEST
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiEndpoints.baseUrl;
    dio.interceptors.add(CustomInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        requestUrl: true,
        request: true,
        requestHeader: true,
        requestBody: true,
        responseUrl: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  @override
  Future<dynamic> get({
    required String endPoint,
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    colorPrint("Arrive to Dio consumer (GET) method");
    final response = await dio.get(endPoint, queryParameters: queryParameters);
    colorPrint("Go out from Dio consumer (GET) method");
    return response;
  }

  @override
  Future<dynamic> post({
    required String endPoint,
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    colorPrint("Arrive to Dio consumer (POST) method");
    final response = await dio.post(endPoint, data: data);
    colorPrint("Go out from Dio consumer (POST) method");
    return response;
  }

  @override
  Future<dynamic> put({
    required String endPoint,
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    colorPrint("Arrive to Dio consumer (PUT) method");
    final response = await dio.put(
      endPoint,
      data: data,
      queryParameters: queryParameters,
    );
    colorPrint("Go out from Dio consumer (PUT) method");
    return response;
  }

  @override
  Future<dynamic> delete({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    colorPrint("Arrive to Dio consumer (DELETE) method");
    final response = await dio.delete(
      endPoint,
      queryParameters: queryParameters,
    );
    colorPrint("Go out from Dio consumer (DELETE) method");
    return response;
  }
}
