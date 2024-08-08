import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee/app/app.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRepositoryImpl({required FavoriteLocalDatasource localDataSource})
      : _localDataSource = localDataSource;

  final FavoriteLocalDatasource _localDataSource;

  @override
  Future<Either<Exception, List<CoffeeImage>>> getFavoriteImages() async {
    try {
      final localImages = await _localDataSource.getFavoriteImages();
      return Right(localImages.map((image) => image.toEntity()).toList());
    } catch (e) {
      return Left(Exception('Failed to load favorite images: $e'));
    }
  }

  @override
  Future<Either<Exception, Unit>> saveFavoriteImage(
    CoffeeImage coffeeImage,
  ) async {
    try {
      await _localDataSource.saveFavoriteImage(
        CoffeeImageModel.fromEntity(coffeeImage),
      );
      return const Right(unit);
    } catch (e) {
      return Left(Exception('Failed to save coffee image'));
    }
  }

  @override
  Future<Either<Exception, Unit>> deleteFavoriteImage(String imageUrl) async {
    try {
      await _localDataSource.deleteFavoriteImage(imageUrl);
      return const Right(unit);
    } catch (e) {
      return Left(Exception('Failed to delete coffee image'));
    }
  }

  @override
  Future<Either<Exception, bool>> containsImageUrl(String imageUrl) async {
    try {
      final hasImage = await _localDataSource.containsImageUrl(imageUrl);
      return Right(hasImage);
    } catch (e) {
      return Left(Exception('Failed to check for image'));
    }
  }
}
