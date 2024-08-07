import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:very_good_coffee/app/app.dart';

/// Http client implementation using the Dio package
///
/// See https://pub.dev/packages/dio.
class DioClient implements AppHttpClient {
  /// Creates new instance of [DioClient].
  DioClient({
    Dio? dioOverride,
  }) {
    dio = dioOverride ?? Dio(baseOptions);

    dio.httpClientAdapter = IOHttpClientAdapter();

    dio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    ]);
  }

  late final Dio dio;

  final timeoutDuration = const Duration(milliseconds: AppEnv.receiveTimeout);

  BaseOptions get baseOptions => BaseOptions(
        headers: baseHeaders,
        baseUrl: baseUrl,
        connectTimeout: timeoutDuration,
      );

  @override
  Map<String, String> get baseHeaders => {
        HttpHeaders.acceptHeader: Headers.jsonContentType,
        HttpHeaders.contentTypeHeader: Headers.jsonContentType,
      };

  @override
  String baseUrl = AppEnv.baseUrl;

  @override
  Future<AppHttpResponse<T?>> get<T>(
    Uri uri, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    final response = await dio.getUri<T>(
      uri,
      options: Options(
        headers: headers != null ? {...baseHeaders, ...headers} : baseHeaders,
        extra: extra,
      ),
    );

    return AppHttpResponse<T?>(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<AppHttpResponse<T?>> post<T>(
    Uri uri, {
    Object? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    final response = await dio.postUri<T>(
      uri,
      data: body,
      options: Options(
        headers: headers != null ? {...baseHeaders, ...headers} : baseHeaders,
        extra: extra,
      ),
    );

    return AppHttpResponse<T?>(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<AppHttpResponse<T?>> delete<T>(
    Uri uri, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    final response = await dio.deleteUri<T>(
      uri,
      options: Options(
        headers: headers != null ? {...baseHeaders, ...headers} : baseHeaders,
        extra: extra,
      ),
    );

    return AppHttpResponse<T?>(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<AppHttpResponse<T?>> patch<T>(
    Uri uri, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    final response = await dio.patchUri<T>(
      uri,
      data: body,
      options: Options(
        headers: headers != null ? {...baseHeaders, ...headers} : baseHeaders,
        extra: extra,
      ),
    );

    return AppHttpResponse<T?>(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<AppHttpResponse<T?>> put<T>(
    Uri uri, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    final response = await dio.putUri<T>(
      uri,
      data: body,
      options: Options(
        headers: headers != null ? {...baseHeaders, ...headers} : baseHeaders,
        extra: extra,
      ),
    );

    return AppHttpResponse<T?>(
      data: response.data,
      statusCode: response.statusCode,
    );
  }
}
