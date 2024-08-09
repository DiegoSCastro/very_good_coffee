import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockDatabaseService extends Mock implements DatabaseService {}

void main() {
  group('DatabaseService', () {
    late MockDatabaseService mockDatabaseService;

    setUp(() {
      mockDatabaseService = MockDatabaseService();
    });

    test('insertFavoriteCoffee should return a Future<void>', () async {
      // Arrange
      final coffeeImage = CoffeeImageModel(
        id: '1',
        imageUrl: 'https://example.com/coffee.jpg',
        bytes: Uint8List.fromList([1, 2, 3]),
      );
      when(() => mockDatabaseService.insertFavoriteCoffee(coffeeImage))
          .thenAnswer((_) async {});

      // Act
      await mockDatabaseService.insertFavoriteCoffee(coffeeImage);

      // Assert
      verify(() => mockDatabaseService.insertFavoriteCoffee(coffeeImage))
          .called(1);
    });

    test('getFavoriteCoffees should return a Future<List<CoffeeImageModel>>',
        () async {
      // Arrange
      when(() => mockDatabaseService.getFavoriteCoffees()).thenAnswer(
        (_) async => [
          CoffeeImageModel(
            id: '1',
            imageUrl: 'https://example.com/coffee.jpg',
            bytes: Uint8List.fromList([1, 2, 3]),
          ),
        ],
      );

      // Act
      final result = await mockDatabaseService.getFavoriteCoffees();

      // Assert
      expect(result, isA<List<CoffeeImageModel>>());
      verify(() => mockDatabaseService.getFavoriteCoffees()).called(1);
    });

    test('deleteFavoriteCoffee should return a Future<void>', () async {
      // Arrange
      when(() => mockDatabaseService.deleteFavoriteCoffee(any()))
          .thenAnswer((_) async {});

      // Act
      await mockDatabaseService.deleteFavoriteCoffee('1');

      // Assert
      verify(() => mockDatabaseService.deleteFavoriteCoffee('1')).called(1);
    });

    test('containsImageUrl should return a Future<bool>', () async {
      // Arrange
      when(() => mockDatabaseService.containsImageUrl(any()))
          .thenAnswer((_) async => true);

      // Act
      final result = await mockDatabaseService
          .containsImageUrl('https://example.com/coffee.jpg');

      // Assert
      expect(result, isA<bool>());
      verify(
        () => mockDatabaseService
            .containsImageUrl('https://example.com/coffee.jpg'),
      ).called(1);
    });
  });
}
