import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/features/coffee/coffee.dart';

class MockFavoriteRepository extends Mock implements FavoriteRepository {}

void main() {
  group('FavoriteRepository', () {
    late MockFavoriteRepository favoriteRepository;
    final coffeeImage = CoffeeImage(
      id: '1',
      imageUrl: 'https://example.com/coffee.jpg',
      bytes: Uint8List.fromList([1, 2, 3]),
    );

    setUp(() {
      favoriteRepository = MockFavoriteRepository();
    });

    test('saveFavoriteImage should return Either<Exception, Unit>', () async {
      when(() => favoriteRepository.saveFavoriteImage(coffeeImage))
          .thenAnswer((_) async => const Right(unit));

      final result = await favoriteRepository.saveFavoriteImage(coffeeImage);

      expect(result.isRight(), true);
      expect(result.getOrElse((e) => unit), isA<Unit>());
    });

    test('getFavoriteImages should return Either<Exception, List<CoffeeImage>>',
        () async {
      when(() => favoriteRepository.getFavoriteImages())
          .thenAnswer((_) async => Right([coffeeImage]));

      final result = await favoriteRepository.getFavoriteImages();

      expect(result.isRight(), true);
      expect(result.getOrElse((e) => []), isA<List<CoffeeImage>>());
    });

    test('deleteFavoriteImage should return Either<Exception, Unit>', () async {
      when(() => favoriteRepository.deleteFavoriteImage(coffeeImage.imageUrl))
          .thenAnswer((_) async => const Right(unit));

      final result =
          await favoriteRepository.deleteFavoriteImage(coffeeImage.imageUrl);

      expect(result.isRight(), true);
      expect(result.getOrElse((e) => unit), isA<Unit>());
    });

    test('containsImageUrl should return Either<Exception, bool>', () async {
      when(() => favoriteRepository.containsImageUrl(coffeeImage.imageUrl))
          .thenAnswer((_) async => const Right(true));

      final result =
          await favoriteRepository.containsImageUrl(coffeeImage.imageUrl);

      expect(result.isRight(), true);
      expect(result.getOrElse((e) => false), isA<bool>());
    });
  });
}
