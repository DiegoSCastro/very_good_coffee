import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  DatabaseService._privateConstructor();

  static final DatabaseService instance = DatabaseService._privateConstructor();

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
          'CREATE TABLE favorite_coffees(id INTEGER PRIMARY KEY AUTOINCREMENT, imageUrl TEXT, localPath TEXT)',
        );
      },
    );
  }

  Future<void> insertFavoriteCoffee(Map<String, dynamic> data) async {
    final db = await instance.database;
    await db.insert(
      'favorite_coffees',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getFavoriteCoffees() async {
    final db = await instance.database;
    return db.query('favorite_coffees');
  }

  Future<void> deleteFavoriteCoffee(String id) async {
    final db = await instance.database;
    await db.delete(
      'favorite_coffees',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
