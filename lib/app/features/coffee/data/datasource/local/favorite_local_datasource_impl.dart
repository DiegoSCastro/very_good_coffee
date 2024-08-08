import 'package:very_good_coffee/app/app.dart';

class FavoriteLocalDatasourceImpl implements FavoriteLocalDatasource {
  FavoriteLocalDatasourceImpl({required DatabaseService databaseService})
      : _databaseService = databaseService;

  final DatabaseService _databaseService;

  @override
  Future<void> saveFavoriteImage(CoffeeImageModel image) async {
    if (image.bytes.isNotEmpty) {
      await _databaseService.insertFavoriteCoffee(image);
    } else {
      throw Exception('Bytes da imagem estão vazios ou nulos');
    }
  }

  @override
  Future<List<CoffeeImageModel>> getFavoriteImages() async {
    final coffeeMaps = await _databaseService.getFavoriteCoffees();
    return coffeeMaps;
  }

  @override
  Future<void> deleteFavoriteImage(String imageUrl) async {
    await _databaseService.deleteFavoriteCoffee(imageUrl);
  }

  @override
  Future<bool> containsImageUrl(String imageUrl) async {
    return _databaseService.containsImageUrl(imageUrl);
  }
}
