import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  group('HttpClientConstants', () {
    test('should have correct withoutAccessToken value', () {
      expect(HttpClientConstants.withoutAccessToken, {'DIO_AUTH_KEY': false});
    });

    test('should have correct withAccessToken value', () {
      expect(HttpClientConstants.withAccessToken, {'DIO_AUTH_KEY': true});
    });
  });
}
