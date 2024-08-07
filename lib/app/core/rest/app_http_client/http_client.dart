import 'package:very_good_coffee/app/app.dart';

/// Http Client Interface.
abstract interface class AppHttpClient {
  /// Http base url.
  String get baseUrl;

  /// Http headers.
  Map<String, String> get baseHeaders;

  /// Http get request.
  Future<AppHttpResponse<T?>> get<T>(
    Uri uri, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  });

  /// Http post request.
  Future<AppHttpResponse<T?>> post<T>(
    Uri uri, {
    Object? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  });

  /// Http put request.
  Future<AppHttpResponse<T?>> put<T>(
    Uri uri, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  });

  /// Http put request.
  Future<AppHttpResponse<T?>> patch<T>(
    Uri uri, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  });

  /// Http delete request.
  Future<AppHttpResponse<T?>> delete<T>(
    Uri uri, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  });
}
