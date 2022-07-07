import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

import '../../../../core/exceptions/database_exception.dart';

class SqlDatabase {
  static const databaseName = 'medicine_database';
  static const tableName = 'medicine_table';
  static const _databaseVersion = 1;
  static sql.Database? database;
  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnQuantity = 'quantity';
  static const columnDose = 'dose';
  static const columnFrequency = 'frequency';
  static const columnDuration = 'duration';
  static const columnStart = 'start';
  static const columnIsContinuous = 'isContinuous';

  Future<sql.Database> initDatabase() async {
    final databasePath = await sql.getDatabasesPath();
    String pathName = path.join(databasePath, databaseName);
    try {
      database = await sql.openDatabase(
        pathName,
        onCreate: (db, _) async {
          return await db.execute('''
          'CREATE TABLE $tableName(
          $columnId INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
          $columnTitle TEXT NOT NULL,
          $columnQuantity TEXT, 
          $columnDose TEXT, 
          $columnFrequency INTEGER, 
          $columnDuration INTEGER, 
          $columnStart TEXT, 
          $columnIsContinuous INTEGER)''');
        },
        version: _databaseVersion,
      );
      return database!;
    } catch (e) {
      throw DatabaseException('Database failed to initialize $e');
    }
  }
}
