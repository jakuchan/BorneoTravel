import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;

  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'crud9.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, image TEXT, name TEXT, type TEXT, city TEXT, province TEXT, day TEXT, time TEXT, price TEXT, maps TEXT, description TEXT)",
        );
        
      },
    );
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('users',  row);
  }

  Future<List<Map<String, dynamic>>> queryAllUsers() async {
    Database db = await database;
    return await db.query('users');
  }

  Future<List<String>> getImages() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users', columns: ['image']);
    return List.generate(maps.length, (i) {
      return maps[i]['image'];
    });
  }

  Future<int> updateUser(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('users', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteUser(int id) async {
    Database db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
