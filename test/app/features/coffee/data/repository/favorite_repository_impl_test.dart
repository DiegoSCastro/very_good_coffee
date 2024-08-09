import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockFavoriteLocalDatasource extends Mock
    implements FavoriteLocalDatasource {}

void main() {
  late FavoriteRepositoryImpl repository;
  late MockFavoriteLocalDatasource mockLocalDatasource;

  setUp(() {
    mockLocalDatasource = MockFavoriteLocalDatasource();
    repository = FavoriteRepositoryImpl(localDataSource: mockLocalDatasource);
  });

  group('FavoriteRepositoryImpl', () {
    test('should return Left with Exception when an error occurs', () async {
      when(() => mockLocalDatasource.getFavoriteImages())
          .thenThrow(Exception('Error'));

      final result = await repository.getFavoriteImages();

      expect(result.isLeft(), isTrue);
      result.fold(
        (exception) => expect(exception, isA<Exception>()),
        (_) => fail('Expected a Left with Exception'),
      );
      verify(() => mockLocalDatasource.getFavoriteImages()).called(1);
    });

    group('deleteFavoriteImage', () {
      const imageUrl = 'https://coffee.alexflipnote.dev/random';

      test('should return Right when image is deleted successfully', () async {
        when(() => mockLocalDatasource.deleteFavoriteImage(imageUrl))
            .thenAnswer((_) async {});

        final result = await repository.deleteFavoriteImage(imageUrl);

        expect(result, equals(const Right<Exception, Unit>(unit)));
        verify(() => mockLocalDatasource.deleteFavoriteImage(imageUrl))
            .called(1);
      });

      test('should return Left with Exception when an error occurs', () async {
        when(() => mockLocalDatasource.deleteFavoriteImage(imageUrl))
            .thenThrow(Exception('Error'));

        final result = await repository.deleteFavoriteImage(imageUrl);

        expect(result.isLeft(), isTrue);
        result.fold(
          (exception) => expect(exception, isA<Exception>()),
          (_) => fail('Expected a Left with Exception'),
        );
        verify(() => mockLocalDatasource.deleteFavoriteImage(imageUrl))
            .called(1);
      });
    });

    group('containsImageUrl', () {
      const imageUrl = 'https://coffee.alexflipnote.dev/random';

      test('should return Right with true when image exists', () async {
        when(() => mockLocalDatasource.containsImageUrl(imageUrl))
            .thenAnswer((_) async => true);

        final result = await repository.containsImageUrl(imageUrl);

        expect(result, equals(const Right<Exception, bool>(true)));
        verify(() => mockLocalDatasource.containsImageUrl(imageUrl)).called(1);
      });

      test('should return Right with false when image does not exist',
          () async {
        when(() => mockLocalDatasource.containsImageUrl(imageUrl))
            .thenAnswer((_) async => false);

        final result = await repository.containsImageUrl(imageUrl);

        expect(result, equals(const Right<Exception, bool>(false)));
        verify(() => mockLocalDatasource.containsImageUrl(imageUrl)).called(1);
      });

      test('should return Left with Exception when an error occurs', () async {
        when(() => mockLocalDatasource.containsImageUrl(imageUrl))
            .thenThrow(Exception('Error'));

        final result = await repository.containsImageUrl(imageUrl);

        expect(result.isLeft(), isTrue);
        result.fold(
          (exception) => expect(exception, isA<Exception>()),
          (_) => fail('Expected a Left with Exception'),
        );
        verify(() => mockLocalDatasource.containsImageUrl(imageUrl)).called(1);
      });
    });
  });
}
