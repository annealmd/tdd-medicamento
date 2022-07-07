import 'sql_database.dart';
import '../../../../features/medicine/data/datasources/i_read_medicine_datasource.dart';

class ReadMedicineSql extends SqlDatabase implements IReadMedicineDatasource {
  @override
  Future<List<Map<String, dynamic>>> call() async {
    final db = SqlDatabase.database ?? await initDatabase();
    return db.query(SqlDatabase.tableName, orderBy: "id ASC");
  }
}
