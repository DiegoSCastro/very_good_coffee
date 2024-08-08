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
  Future<Either<Exception, bool>> saveFavoriteImage(
    CoffeeImage coffeeImage,
  ) async {
    try {
      await _localDataSource.saveFavoriteImage(
        CoffeeImageModel.fromEntity(coffeeImage),
      );
      return const Right(true);
    } catch (e) {
      return Left(Exception('Failed to save coffee image'));
    }
  }

  @override
  Future<Either<Exception, bool>> deleteFavoriteImage(String id) async {
    try {
      await _localDataSource.deleteFavoriteImage(id);
      return const Right(true);
    } catch (e) {
      return Left(Exception('Failed to delete coffee image'));
    }
  }

  @override
  Future<Either<Exception, bool>> containsImageUrl(String image) async {
    try {
      final hasImage = await _localDataSource.containsImageUrl(image);
      return Right(hasImage);
    } catch (e) {
      return Left(Exception('Failed to check for image'));
    }
  }
}
