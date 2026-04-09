abstract class ApiConsumer {
  Future<dynamic> get({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> put({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> patch({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> delete({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  });
}
