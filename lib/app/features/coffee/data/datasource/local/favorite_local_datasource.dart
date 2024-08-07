import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:very_good_coffee/app/app.dart';

abstract interface class FavoriteLocalDatasource {
  Future<void> saveFavoriteImage(CoffeeImageModel image);
  Future<List<File>> getFavoriteImages();
  Future<void> deleteFavoriteImage(String id);
}

class FavoriteLocalDatasourceImpl implements FavoriteLocalDatasource {
  FavoriteLocalDatasourceImpl({required DatabaseService databaseService})
      : _databaseService = databaseService;

  final DatabaseService _databaseService;

  @override
  Future<void> saveFavoriteImage(CoffeeImageModel image) async {
    final directory = await getApplicationDocumentsDirectory();
    final path =
        '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final file = File(path);

    if (image.bytes.isNotEmpty) {
      await file.writeAsBytes(image.bytes);
      await _databaseService.insertFavoriteCoffee({
        'imageUrl': image.imageUrl,
        'localPath': path,
      });
    } else {
      throw Exception('Bytes da imagem estão vazios ou nulos');
    }
  }

  @override
  Future<List<File>> getFavoriteImages() async {
    final coffeeMaps = await _databaseService.getFavoriteCoffees();
    return coffeeMaps.map((map) => File(map['localPath'])).toList();
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
