import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:note_app/core/api/api_endpoints.dart';
import 'package:note_app/core/utils/functions/service_locator.dart';

class CustomInterceptor implements Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    List<String> publicEndpoints = [ApiEndpoints.register, ApiEndpoints.login];

    bool isPublic = publicEndpoints.any(
      (endpoint) => options.path.contains(endpoint),
    ); // options.path: means sub-domain,
    //  which is after baseUrl, such as: /api/auth/token/

    if (!isPublic) {
      String? accessToken = await di.get<FlutterSecureStorage>().read(
        key: ApiKey.accessToken,
      );
      if (accessToken != null) {
        options.headers[ApiKey.authorization] = "Bearer $accessToken";
      }
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response); // must be called! because I forgot them
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err); // must be called! because I forgot them
  }
}
