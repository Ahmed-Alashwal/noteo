import 'package:note_app/core/api/api_endpoints.dart';

class ErrorModel {
  final String errMessage;

  ErrorModel({required this.errMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      errMessage:
          // Creates an [ErrorModel] from a JSON error response.
          ///
          /// The API may return errors in different structures:
          /// - `{"detail": "Invalid credentials"}`
          /// - `{"username": ["This field is required"]}`
          ///
          /// The extraction order is critical: `detailError` is attempted first
          /// to avoid accessing index [0] on a non-list value, which would throw.
          json[ApiKey.detailError] ??
          json[ApiKey.username][0] ??
          '[ErrorModel]: Unknown Error',
    );
  }
}
