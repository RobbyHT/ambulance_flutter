import 'package:ambulance_flutter/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();

  static Database _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('ambulance.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    await deleteDatabase(path);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
        '''
      CREATE TABLE userList(
            id INTEGER PRIMARY KEY, 
            account TEXT, 
            name TEXT, 
            gender TEXT, 
            birther TEXT, 
            perid TEXT, 
            license_VP TEXT, 
            c_id INTEGER, 
            permission TEXT,
            email TEXT,
            telphone TEXT,
            login_attempt INTEGER, 
            deleted_at TEXT, 
            created_at TEXT, 
            updated_at TEXT)
      ''');
  }

  Future<void> create(String table, User user) async {
    final db = await instance.database;

    await db.insert('userList', user.toJson());
  }

  Future insert(String table, User user) async {
    final db = await instance.database;

    await db.insert(table, user.toJson());
  }

  static Future<void> delete(String table) async {
    final db = await instance.database;
    db.delete(table);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await instance.database;
    return db.query(table);
  }
}
