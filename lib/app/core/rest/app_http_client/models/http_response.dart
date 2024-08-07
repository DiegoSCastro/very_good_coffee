/// Response describes the http Response info.
final class AppHttpResponse<T> {
  /// Create a instance of [AppHttpResponse].
  AppHttpResponse({required this.data, this.statusCode});

  /// Response body.
  final T data;

  /// Http status code.
  final int? statusCode;
}
