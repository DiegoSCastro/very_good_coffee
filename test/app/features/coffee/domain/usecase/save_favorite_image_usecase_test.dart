import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockFavoriteRepository extends Mock implements FavoriteRepository {}

class MockImageDownloadService extends Mock implements ImageDownloadService {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      CoffeeImage(id: 'test_id', imageUrl: 'test_url', bytes: Uint8List(0)),
    );
  }); // Register fallback value

  group('SaveFavoriteImageUsecaseImpl', () {
    late MockFavoriteRepository favoriteRepository;
    late MockImageDownloadService imageDownloadService;
    late SaveFavoriteImageUsecaseImpl saveFavoriteImageUsecase;
    const imageUrl = 'https://example.com/coffee.jpg';
    final imageBytes = Uint8List.fromList([1, 2, 3]);

    setUp(() {
      favoriteRepository = MockFavoriteRepository();
      imageDownloadService = MockImageDownloadService();
      saveFavoriteImageUsecase = SaveFavoriteImageUsecaseImpl(
        repository: favoriteRepository,
        imageDownloadService: imageDownloadService,
      );
    });

    test('should successfully save image when download succeeds', () async {
      // Arrange
      when(() => imageDownloadService.downloadImage(imageUrl))
          .thenAnswer((_) async => Right(imageBytes));
      when(() => favoriteRepository.saveFavoriteImage(any()))
          .thenAnswer((_) async => const Right(unit));

      // Act
      final result = await saveFavoriteImageUsecase(imageUrl: imageUrl);

      // Assert
      expect(result.isRight(), true);
      verify(() => imageDownloadService.downloadImage(imageUrl)).called(1);
      verify(() => favoriteRepository.saveFavoriteImage(any())).called(1);
    });
  });
}
