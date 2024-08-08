import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import 'package:very_good_coffee/app/app.dart';

class DatabaseServiceImpl implements DatabaseService {
  DatabaseServiceImpl._privateConstructor();

  static final DatabaseServiceImpl instance =
      DatabaseServiceImpl._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDatabase();
    return _database!;
  }

  Future<Database> _initializeDatabase() async {
    final path = join(await getDatabasesPath(), 'coffee_app.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorite_coffees(id TEXT PRIMARY KEY, imageUrl TEXT, imageBytes BLOB)',
        );
      },
    );
  }

  @override
  Future<void> insertFavoriteCoffee(CoffeeImageModel image) async {
    final db = await instance.database;
    final id = image.id.isNotEmpty ? image.id : const Uuid().v4();

    await db.insert(
      'favorite_coffees',
      {
        'id': id,
        'imageUrl': image.imageUrl,
        'imageBytes': image.bytes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<CoffeeImageModel>> getFavoriteCoffees() async {
    final db = await instance.database;
    final maps = await db.query('favorite_coffees');
    return List.generate(maps.length, (i) {
      return CoffeeImageModel(
        id: maps[i]['id']! as String,
        imageUrl: maps[i]['imageUrl']! as String,
        bytes: maps[i]['imageBytes']! as List<int>,
      );
    });
  }

  @override
  Future<void> deleteFavoriteCoffee(String id) async {
    final db = await instance.database;
    await db.delete(
      'favorite_coffees',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<bool> containsImageUrl(String imageUrl) async {
    final db = await instance.database;
    final maps = await db.query(
      'favorite_coffees',
      where: 'imageUrl = ?',
      whereArgs: [imageUrl],
    );
    return maps.isNotEmpty;
  }
}
