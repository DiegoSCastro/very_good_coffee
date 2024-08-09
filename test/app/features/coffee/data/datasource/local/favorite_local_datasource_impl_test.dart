import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockDatabaseService extends Mock implements DatabaseService {}

void main() {
  late FavoriteLocalDatasourceImpl datasource;
  late MockDatabaseService mockDatabaseService;

  setUp(() {
    mockDatabaseService = MockDatabaseService();
    datasource =
        FavoriteLocalDatasourceImpl(databaseService: mockDatabaseService);
  });

  const coffeeImageModel = CoffeeImageModel(
    id: '123',
    imageUrl: 'https://example.com/coffee.jpg',
    bytes: [1, 2, 3],
  );

  final coffeeImageModels = [coffeeImageModel];
  final coffeeImageMaps = [coffeeImageModel];

  group('FavoriteLocalDatasourceImpl', () {
    test(
        'should return a list of CoffeeImageModel when getFavoriteImages'
        ' is called', () async {
      when(() => mockDatabaseService.getFavoriteCoffees()).thenAnswer(
        (_) async => coffeeImageMaps,
      );

      final result = await datasource.getFavoriteImages();

      expect(result, equals(coffeeImageModels));
      verify(() => mockDatabaseService.getFavoriteCoffees()).called(1);
    });

    test('should call deleteFavoriteCoffee when deleting image', () async {
      when(() => mockDatabaseService.deleteFavoriteCoffee(any()))
          .thenAnswer((_) async {});

      await datasource.deleteFavoriteImage(coffeeImageModel.imageUrl);

      verify(
        () =>
            mockDatabaseService.deleteFavoriteCoffee(coffeeImageModel.imageUrl),
      ).called(1);
    });

    test('should return true when containsImageUrl returns true', () async {
      when(() => mockDatabaseService.containsImageUrl(any())).thenAnswer(
        (_) async => true,
      );

      final result =
          await datasource.containsImageUrl(coffeeImageModel.imageUrl);

      expect(result, isTrue);
      verify(
        () => mockDatabaseService.containsImageUrl(coffeeImageModel.imageUrl),
      ).called(1);
    });

    test('should return false when containsImageUrl returns false', () async {
      when(() => mockDatabaseService.containsImageUrl(any())).thenAnswer(
        (_) async => false,
      );

      final result =
          await datasource.containsImageUrl(coffeeImageModel.imageUrl);

      expect(result, isFalse);
      verify(
        () => mockDatabaseService.containsImageUrl(coffeeImageModel.imageUrl),
      ).called(1);
    });
  });
}
