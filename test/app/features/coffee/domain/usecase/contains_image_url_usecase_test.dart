import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockFavoriteRepository extends Mock implements FavoriteRepository {}

void main() {
  late ContainsImageUrlUsecaseImpl containsImageUrlUsecase;
  late MockFavoriteRepository mockFavoriteRepository;

  setUp(() {
    mockFavoriteRepository = MockFavoriteRepository();
    containsImageUrlUsecase =
        ContainsImageUrlUsecaseImpl(repository: mockFavoriteRepository);
  });

  const tImageUrl = 'https://example.com/coffee.jpg';

  test('should return Right(true) when imageUrl is found in favorites',
      () async {
    when(() => mockFavoriteRepository.containsImageUrl(tImageUrl))
        .thenAnswer((_) async => const Right(true));
    final result = await containsImageUrlUsecase.call(imageUrl: tImageUrl);

    expect(result, equals(const Right(true)));
    verify(() => mockFavoriteRepository.containsImageUrl(tImageUrl)).called(1);
  });

  test('should return Right(false) when imageUrl is not found in favorites',
      () async {
    when(() => mockFavoriteRepository.containsImageUrl(tImageUrl))
        .thenAnswer((_) async => const Right(false));

    final result = await containsImageUrlUsecase.call(imageUrl: tImageUrl);

    expect(result, equals(const Right(false)));
    verify(() => mockFavoriteRepository.containsImageUrl(tImageUrl)).called(1);
  });

  test(
      'should return Left(Exception) when there is an error checking'
      ' the imageUrl', () async {
    final exception = Exception('Failed to check imageUrl');
    when(() => mockFavoriteRepository.containsImageUrl(tImageUrl))
        .thenAnswer((_) async => Left(exception));

    final result = await containsImageUrlUsecase.call(imageUrl: tImageUrl);

    expect(result, equals(Left(exception)));
    verify(() => mockFavoriteRepository.containsImageUrl(tImageUrl)).called(1);
  });
}
