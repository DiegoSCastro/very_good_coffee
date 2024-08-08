import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  group('CoffeeImage', () {
    test('supports value equality', () {
      const coffeeImage1 = CoffeeImage(
        id: '1',
        imageUrl: 'https://example.com/coffee1.jpg',
        bytes: [1, 2, 3],
      );

      const coffeeImage2 = CoffeeImage(
        id: '1',
        imageUrl: 'https://example.com/coffee1.jpg',
        bytes: [1, 2, 3],
      );

      expect(coffeeImage1, equals(coffeeImage2));
    });

    test('has correct initial values', () {
      const coffeeImage = CoffeeImage();

      expect(coffeeImage.id, equals(''));
      expect(coffeeImage.imageUrl, equals(''));
      expect(coffeeImage.bytes, equals([]));
    });

    test('copyWith creates a copy with updated values', () {
      const coffeeImage = CoffeeImage(
        id: '1',
        imageUrl: 'https://example.com/coffee1.jpg',
        bytes: [1, 2, 3],
      );

      final updatedCoffeeImage = coffeeImage.copyWith(
        id: '2',
        imageUrl: 'https://example.com/coffee2.jpg',
        bytes: [4, 5, 6],
      );

      expect(updatedCoffeeImage.id, equals('2'));
      expect(
        updatedCoffeeImage.imageUrl,
        equals('https://example.com/coffee2.jpg'),
      );
      expect(updatedCoffeeImage.bytes, equals([4, 5, 6]));
    });

    test('toString returns correct string representation', () {
      const coffeeImage = CoffeeImage(
        id: '1',
        imageUrl: 'https://example.com/coffee1.jpg',
        bytes: [1, 2, 3],
      );

      expect(
        coffeeImage.toString(),
        equals(
          'CoffeeImage(id: 1, imageUrl: https://example.com/coffee1.jpg, bytes: [1, 2, 3])',
        ),
      );
    });
  });
}
