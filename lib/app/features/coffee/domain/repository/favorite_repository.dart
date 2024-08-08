import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee/app/app.dart';

abstract interface class FavoriteRepository {
  Future<Either<Exception, Unit>> saveFavoriteImage(CoffeeImage image);
  Future<Either<Exception, List<CoffeeImage>>> getFavoriteImages();
  Future<Either<Exception, Unit>> deleteFavoriteImage(String imageUrl);
  Future<Either<Exception, bool>> containsImageUrl(String imageUrl);
}
