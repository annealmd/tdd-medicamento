abstract class IDatabase {
  Future<void> insertItem(Map<String, Object> item);

  Future<List<Map<String, dynamic>>> getItens();

  Future<void> countItens();

  Future<void> deleteItem(int id);

  Future<void> updateItem(String table, Map<String, Object> item, int id);
}
