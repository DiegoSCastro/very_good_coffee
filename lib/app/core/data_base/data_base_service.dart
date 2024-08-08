import 'package:very_good_coffee/app/app.dart';

abstract interface class DatabaseService {
  Future<void> insertFavoriteCoffee(CoffeeImageModel image);
  Future<List<CoffeeImageModel>> getFavoriteCoffees();
  Future<void> deleteFavoriteCoffee(String id);
  Future<bool> containsImageUrl(String imageUrl);
}
