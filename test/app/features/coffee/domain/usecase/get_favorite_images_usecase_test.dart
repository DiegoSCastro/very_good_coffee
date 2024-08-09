import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockFavoriteRepository extends Mock implements FavoriteRepository {}

void main() {
  late GetFavoriteImagesUsecaseImpl getFavoriteImagesUsecase;
  late MockFavoriteRepository mockFavoriteRepository;

  setUp(() {
    mockFavoriteRepository = MockFavoriteRepository();
    getFavoriteImagesUsecase =
        GetFavoriteImagesUsecaseImpl(repository: mockFavoriteRepository);
  });

  final tCoffeeImages = [
    const CoffeeImage(
      imageUrl: 'https://example.com/coffee1.jpg',
      bytes: [1, 2, 3],
    ),
    const CoffeeImage(
      imageUrl: 'https://example.com/coffee2.jpg',
      bytes: [4, 5, 6],
    ),
  ];

  test(
      'should return Right(List<CoffeeImage>) when getting favorite'
      ' images succeeds', () async {
    when(() => mockFavoriteRepository.getFavoriteImages())
        .thenAnswer((_) async => Right(tCoffeeImages));

    final result = await getFavoriteImagesUsecase.call();

    expect(result, equals(Right(tCoffeeImages)));
    verify(() => mockFavoriteRepository.getFavoriteImages()).called(1);
  });

  test('should return Left(Exception) when getting favorite images fails',
      () async {
    final exception = Exception('Failed to get favorite images');
    when(() => mockFavoriteRepository.getFavoriteImages())
        .thenAnswer((_) async => Left(exception));

    final result = await getFavoriteImagesUsecase.call();

    expect(result, equals(Left(exception)));
    verify(() => mockFavoriteRepository.getFavoriteImages()).called(1);
  });
}
