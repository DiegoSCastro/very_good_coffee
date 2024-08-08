import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  const coffeeImageModel = CoffeeImageModel(
    id: '123',
    imageUrl: 'https://coffee.alexflipnote.dev/random',
    bytes: [1, 2, 3],
  );

  const coffeeImageEntity = CoffeeImage(
    id: '123',
    imageUrl: 'https://coffee.alexflipnote.dev/random',
    bytes: [1, 2, 3],
  );

  group('CoffeeImageModel', () {
    test('fromJson should return valid CoffeeImageModel', () {
      final json = {
        'id': '123',
        'file': 'https://coffee.alexflipnote.dev/random',
        'bytes': [1, 2, 3],
      };

      final result = CoffeeImageModel.fromJson(json);

      expect(result, equals(coffeeImageModel));
    });

    test('toJson should return a valid json map', () {
      final result = coffeeImageModel.toJson();

      expect(result, {
        'id': '123',
        'file': 'https://coffee.alexflipnote.dev/random',
        'bytes': [1, 2, 3],
      });
    });

    test('fromEntity should create a valid CoffeeImageModel from CoffeeImage',
        () {
      final result = CoffeeImageModel.fromEntity(coffeeImageEntity);

      expect(result, equals(coffeeImageModel));
    });

    test(
        'toEntity should create a valid CoffeeImage entity from CoffeeImageModel',
        () {
      final result = coffeeImageModel.toEntity();

      expect(result, equals(coffeeImageEntity));
    });

    test('should correctly handle default values', () {
      const defaultModel = CoffeeImageModel();

      expect(defaultModel.id, isEmpty);
      expect(defaultModel.imageUrl, isEmpty);
      expect(defaultModel.bytes, isEmpty);
    });
  });
}
