import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee/app/app.dart';

abstract interface class FavoriteRepository {
  Future<Either<Exception, bool>> saveFavoriteImage(CoffeeImage image);
  Future<Either<Exception, List<File>>> getFavoriteImages();
  Future<Either<Exception, bool>> deleteFavoriteImage(String id);
}
