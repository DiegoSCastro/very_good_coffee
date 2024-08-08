import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockSaveFavoriteImageUsecase extends Mock
    implements SaveFavoriteImageUsecase {}

class MockGetFavoriteImagesUsecase extends Mock
    implements GetFavoriteImagesUsecase {}

class MockRemoveFavoriteImageUsecase extends Mock
    implements RemoveFavoriteImageUsecase {}

class MockContainsImageUrlUsecase extends Mock
    implements ContainsImageUrlUsecase {}

void main() {
  late FavoriteCubit favoriteCubit;
  late MockSaveFavoriteImageUsecase mockSaveFavoriteImageUsecase;
  late MockGetFavoriteImagesUsecase mockGetFavoriteImagesUsecase;
  late MockRemoveFavoriteImageUsecase mockRemoveFavoriteImageUsecase;
  late MockContainsImageUrlUsecase mockContainsImageUrlUsecase;

  setUp(() {
    mockSaveFavoriteImageUsecase = MockSaveFavoriteImageUsecase();
    mockGetFavoriteImagesUsecase = MockGetFavoriteImagesUsecase();
    mockRemoveFavoriteImageUsecase = MockRemoveFavoriteImageUsecase();
    mockContainsImageUrlUsecase = MockContainsImageUrlUsecase();

    favoriteCubit = FavoriteCubit(
      saveFavoriteImageUsecase: mockSaveFavoriteImageUsecase,
      getFavoriteImagesUsecase: mockGetFavoriteImagesUsecase,
      removeFavoriteImageUsecase: mockRemoveFavoriteImageUsecase,
      containsImageUrlUsecase: mockContainsImageUrlUsecase,
    );
  });

  test('returns true if containsImageUrlUsecase returns true', () async {
    when(() => mockContainsImageUrlUsecase(imageUrl: 'url')).thenAnswer(
      (_) async => const Right(true),
    );

    final result = await favoriteCubit.containsImageUrl(imageUrl: 'url');

    expect(result, isTrue);
  });

  test('returns false if containsImageUrlUsecase returns false', () async {
    when(() => mockContainsImageUrlUsecase(imageUrl: 'url')).thenAnswer(
      (_) async => const Right(false),
    );

    final result = await favoriteCubit.containsImageUrl(imageUrl: 'url');

    expect(result, isFalse);
  });
}
