import 'package:very_good_coffee/app/app.dart';

abstract interface class FavoriteLocalDatasource {
  Future<void> saveFavoriteImage(CoffeeImageModel image);
  Future<List<CoffeeImageModel>> getFavoriteImages();
  Future<void> deleteFavoriteImage(String id);
  Future<bool> containsImageUrl(String imageUrl);
}
