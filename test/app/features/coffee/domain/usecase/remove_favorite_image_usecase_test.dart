import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockFavoriteRepository extends Mock implements FavoriteRepository {}

void main() {
  late RemoveFavoriteImageUsecaseImpl removeFavoriteImageUsecase;
  late MockFavoriteRepository mockFavoriteRepository;

  setUp(() {
    mockFavoriteRepository = MockFavoriteRepository();
    removeFavoriteImageUsecase = RemoveFavoriteImageUsecaseImpl(
      repository: mockFavoriteRepository,
    );
  });

  const tImageUrl = 'https://example.com/image.jpg';

  test('should return Right(Unit) when deletion succeeds', () async {
    when(() => mockFavoriteRepository.deleteFavoriteImage(tImageUrl))
        .thenAnswer((_) async => const Right(unit));

    final result = await removeFavoriteImageUsecase.call(imageUrl: tImageUrl);

    expect(result, equals(const Right(unit)));
    verify(() => mockFavoriteRepository.deleteFavoriteImage(tImageUrl))
        .called(1);
  });

  test('should return Left(Exception) when deletion fails', () async {
    final exception = Exception('Deletion failed');
    when(() => mockFavoriteRepository.deleteFavoriteImage(tImageUrl))
        .thenAnswer((_) async => Left(exception));

    final result = await removeFavoriteImageUsecase.call(imageUrl: tImageUrl);

    expect(result, equals(Left(exception)));
    verify(() => mockFavoriteRepository.deleteFavoriteImage(tImageUrl))
        .called(1);
  });
}
