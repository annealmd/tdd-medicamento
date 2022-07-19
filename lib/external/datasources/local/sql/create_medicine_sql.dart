import 'package:sqflite/sqflite.dart' as sql;
import 'sql_database.dart';
import '../../../../features/medicine/data/datasources/i_create_medicine_data_source.dart';

import '../../../../core/exceptions/database_exception.dart';

class CreateMedicineSql extends SqlDatabase
    implements ICreateMedicineDatasource {
  CreateMedicineSql() : super();

  @override
  Future<bool> call({required Map<String, dynamic> json}) async {
    final db = SqlDatabase.database ?? await initDatabase();

    try {
      db.insert(
        SqlDatabase.tableName,
        json,
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      throw DatabaseException('The insertion in the BD failed $e');
    }
  }
}
