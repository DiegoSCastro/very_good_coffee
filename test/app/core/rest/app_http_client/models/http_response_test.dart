import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  test('AppHttpResponse should correctly set data and statusCode', () {
    final data = {'key': 'value'};
    const statusCode = 200;

    final response = AppHttpResponse<Map<String, String>>(
      data: data,
      statusCode: statusCode,
    );

    expect(response.data, data);
    expect(response.statusCode, statusCode);
  });

  test('AppHttpResponse should correctly handle null statusCode', () {
    final data = {'key': 'value'};

    final response = AppHttpResponse<Map<String, String>>(
      data: data,
    );

    expect(response.data, data);
    expect(response.statusCode, isNull);
  });

  test('AppHttpResponse should correctly handle empty data', () {
    final data = {};

    final response = AppHttpResponse<Map<dynamic, dynamic>>(
      data: data,
      statusCode: 404,
    );

    expect(response.data, data);
    expect(response.statusCode, 404);
  });
}
