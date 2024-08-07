import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:very_good_coffee/app/app.dart';

abstract interface class FavoriteLocalDatasource {
  Future<void> saveFavoriteImage(CoffeeImageModel image);
  Future<List<CoffeeImageModel>> getFavoriteImages();
  Future<void> deleteFavoriteImage(String id);
}

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
  Future<void> deleteFavoriteImage(String id) async {
    await _databaseService.deleteFavoriteCoffee(id);
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$id.jpg';
    final file = File(path);
    if (file.existsSync()) {
      file.deleteSync();
    }
  }
}
