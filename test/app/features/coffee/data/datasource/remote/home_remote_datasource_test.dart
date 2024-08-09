import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/features/coffee/coffee.dart';

class MockHomeRemoteDatasource extends Mock implements HomeRemoteDatasource {}

void main() {
  group('HomeRemoteDatasource', () {
    late MockHomeRemoteDatasource mockHomeRemoteDatasource;

    setUp(() {
      mockHomeRemoteDatasource = MockHomeRemoteDatasource();
    });

    test('getRandomCoffeeImage should return a Future<CoffeeImageModel>',
        () async {
      // Arrange
      when(() => mockHomeRemoteDatasource.getRandomCoffeeImage()).thenAnswer(
        (_) async => CoffeeImageModel(
          id: 'test_id',
          imageUrl: 'test_url',
          bytes: Uint8List.fromList([1, 2, 3]),
        ),
      );

      // Act
      final coffeeImage = await mockHomeRemoteDatasource.getRandomCoffeeImage();

      // Assert
      expect(coffeeImage, isA<CoffeeImageModel>());
    });
  });
}
