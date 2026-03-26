import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = "http://127.0.0.1:8000/api/";
  ApiService({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
