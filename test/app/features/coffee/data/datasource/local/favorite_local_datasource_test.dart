import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockFavoriteLocalDatasource extends Mock
    implements FavoriteLocalDatasource {}

void main() {
  late MockFavoriteLocalDatasource mockFavoriteLocalDatasource;

  setUp(() {
    mockFavoriteLocalDatasource = MockFavoriteLocalDatasource();
  });

  const coffeeImageModel = CoffeeImageModel(
    id: '123',
    imageUrl: 'https://example.com/coffee.jpg',
    bytes: [1, 2, 3],
  );

  final coffeeImageModels = [coffeeImageModel];

  group('FavoriteLocalDatasource', () {
    test('should return a list of CoffeeImageModel from getFavoriteImages',
        () async {
      when(() => mockFavoriteLocalDatasource.getFavoriteImages()).thenAnswer(
        (_) async => coffeeImageModels,
      );

      final result = await mockFavoriteLocalDatasource.getFavoriteImages();

      expect(result, equals(coffeeImageModels));
      verify(() => mockFavoriteLocalDatasource.getFavoriteImages()).called(1);
    });

    test('should call deleteFavoriteImage with correct parameters', () async {
      when(() => mockFavoriteLocalDatasource.deleteFavoriteImage(any()))
          .thenAnswer((_) async {});

      await mockFavoriteLocalDatasource
          .deleteFavoriteImage(coffeeImageModel.imageUrl);

      verify(
        () => mockFavoriteLocalDatasource
            .deleteFavoriteImage(coffeeImageModel.imageUrl),
      ).called(1);
    });

    test('should return true from containsImageUrl when image is found',
        () async {
      when(() => mockFavoriteLocalDatasource.containsImageUrl(any()))
          .thenAnswer(
        (_) async => true,
      );

      final result = await mockFavoriteLocalDatasource
          .containsImageUrl(coffeeImageModel.imageUrl);

      expect(result, isTrue);
      verify(
        () => mockFavoriteLocalDatasource
            .containsImageUrl(coffeeImageModel.imageUrl),
      ).called(1);
    });

    test('should return false from containsImageUrl when image is not found',
        () async {
      when(() => mockFavoriteLocalDatasource.containsImageUrl(any()))
          .thenAnswer(
        (_) async => false,
      );

      final result = await mockFavoriteLocalDatasource
          .containsImageUrl(coffeeImageModel.imageUrl);

      expect(result, isFalse);
      verify(
        () => mockFavoriteLocalDatasource
            .containsImageUrl(coffeeImageModel.imageUrl),
      ).called(1);
    });
  });
}
