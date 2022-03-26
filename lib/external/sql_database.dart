import 'package:app_medicamento/external/i_database.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

import '../core/exceptions/database_exception.dart';

class SqlDatabase implements IDatabase {
  static const _databaseName = 'medicine_database';
  static const _tableName = 'medicine_table';
  static const _databaseVersion = 1;
  static sql.Database? _database;
  static const _columnId = 'id';
  static const _columnTitle = 'title';
  static const _columnQuantity = 'quantity';
  static const _columnDose = 'dose';
  static const _columnFrequency = 'frequency';
  static const _columnDuration = 'duration';
  static const _columnStart = 'start';
  static const _columnIsContinuous = 'isContinuous';

  Future<sql.Database> _initDatabase() async {
    final databasePath = await sql.getDatabasesPath();
    String pathName = path.join(databasePath, _databaseName);
    try {
      _database = await sql.openDatabase(
        pathName,
        onCreate: (db, _) async {
          return await db.execute('''
          'CREATE TABLE $_tableName(
          $_columnId INTEGER PRIMARY KEY NOT NULL,
          $_columnTitle TEXT NOT NULL,
          $_columnQuantity TEXT, 
          $_columnDose TEXT, 
          $_columnFrequency INTEGER, 
          $_columnDuration INTEGER, 
          $_columnStart TEXT, 
          $_columnIsContinuous INTEGER)''');
        },
        version: _databaseVersion,
      );
      return _database!;
    } catch (e) {
      throw DatabaseException('Database failed to initialize $e');
    }
  }

  @override
  Future<void> insertItem(Map<String, Object> item) async {
    final db = _database ?? await _initDatabase();

    db.insert(
      _tableName,
      item,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> countItens() async {
    //database connection
    final db = _database ?? await _initDatabase();
    var x = await db.rawQuery('SELECT COUNT (*) from user_medicamentos');
    print(x);
  }

  @override
  Future<List<Map<String, dynamic>>> getItens() async {
    final db = _database ?? await _initDatabase();
    return db.query(_tableName, orderBy: "id ASC");
  }

  @override
  Future<void> updateItem(
      String table, Map<String, Object> item, int id) async {
    final db = _database ?? await _initDatabase();
    await db.update(table, item, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> deleteItem(int id) async {
    // Get a reference to the database.
    final db = _database ?? await _initDatabase();
    // Remove the Medicamentofrom the Database.
    await db.delete(
      _tableName,
      // Use a `where` clause to delete a specific item.
      where: "id = ?",
      // Pass the item id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
