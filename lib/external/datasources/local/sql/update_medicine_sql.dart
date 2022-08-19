import '../../../../features/medicine/data/datasources/i_update_medicine_data_source.dart';
import 'sql_database.dart';
import 'package:sqflite/sqflite.dart' as sql;

class UpdateMedicineSql extends SqlDatabase
    implements IUpdateMedicineDatasource {
  @override
  Future<bool> call({required Map<String, dynamic> item}) async {
    try {
      final db = SqlDatabase.database ?? await initDatabase();
      await db.update(
        SqlDatabase.tableName,
        item,
        where: 'id = ?',
        whereArgs: [item['id']],
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
      return true;
    } on Exception catch (e) {
      Exception(' Could not update $e');
    }
    return false;
  }
}
