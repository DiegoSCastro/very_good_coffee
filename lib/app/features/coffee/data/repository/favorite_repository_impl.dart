import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee/app/app.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRepositoryImpl({required FavoriteLocalDatasource localDataSource})
      : _localDataSource = localDataSource;

  final FavoriteLocalDatasource _localDataSource;

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
  Future<Either<Exception, List<File>>> getFavoriteImages() async {
    try {
      final localImages = await _localDataSource.getFavoriteImages();
      return Right(localImages);
    } catch (e) {
      return Left(Exception('Failed to load favorite images'));
    }
  }

  @override
  Future<Either<Exception, bool>> saveFavoriteImage(CoffeeImage image) async {
    try {
      await _localDataSource.saveFavoriteImage(image as CoffeeImageModel);
      return const Right(true);
    } catch (e) {
      return Left(Exception('Failed to save coffee image'));
    }
  }
}
