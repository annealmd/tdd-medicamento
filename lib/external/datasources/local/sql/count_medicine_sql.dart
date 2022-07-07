import 'package:sqflite/sqflite.dart' as sql;
import 'sql_database.dart';
import '../../../../features/medicine/data/datasources/i_count_medicine_data_source.dart';

class CountMedicineSql extends SqlDatabase implements ICountMedicineDatasource {
  @override
  Future<int> call() async {
    final db = SqlDatabase.database ?? await initDatabase();
    var count = sql.Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT (*) ${SqlDatabase.tableName}'));
    return count ?? 0;
  }
}
