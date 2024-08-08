import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  group('AppEnv', () {
    test('should return default values when environment variables are not set',
        () {
      // Arrange
      const expectedDefaultConnectTimeout = 10000;
      const expectedDefaultReceiveTimeout = 30000;

      // Act
      const connectTimeout = AppEnv.connectTimeout;
      const receiveTimeout = AppEnv.receiveTimeout;

      // Assert
      expect(connectTimeout, expectedDefaultConnectTimeout);
      expect(receiveTimeout, expectedDefaultReceiveTimeout);
    });
  });
}
