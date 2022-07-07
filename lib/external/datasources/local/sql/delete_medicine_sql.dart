import 'sql_database.dart';
import '../../../../features/medicine/data/datasources/i_delete_medicine_data_source.dart';

import '../../../../core/exceptions/database_exception.dart';

class DeleteMedicineSql extends SqlDatabase
    implements IDeleteMedicineDatasource {
  @override
  Future<bool> call({required int id}) async {
    // Get a reference to the database.
    try {
      final db = SqlDatabase.database ?? await initDatabase();
      // Remove the Medicamentofrom the Database.
      await db.delete(
        SqlDatabase.tableName,
        // Use a `where` clause to delete a specific item.
        where: "id = ?",
        // Pass the item id as a whereArg to prevent SQL injection.
        whereArgs: [id],
      );
      return true;
    } on Exception catch (e) {
      throw DatabaseException('the Medicine was not deleted, failed $e');
    }
  }
}
