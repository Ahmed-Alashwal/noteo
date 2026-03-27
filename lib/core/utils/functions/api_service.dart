import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = "http://127.0.0.1:8000/api/";
  ApiService({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<void> post({required String endPoint, required Map<String, dynamic> body}) async{
    await _dio.post('$baseUrl$endPoint', data: body);
  }

  Future<void> delete({required String endPoint, required String id})async {
    await _dio.delete('$baseUrl$endPoint/$id');
  }
}
