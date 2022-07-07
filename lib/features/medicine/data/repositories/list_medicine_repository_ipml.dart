import '../../domain/entities/medicine_entity.dart';

import '../../domain/repositories/i_list_medicine_repository.dart';
import '../datasources/i_read_medicine_datasource.dart';
import '../mapper/medicine_mapper.dart';

class ListMedicineRepositoryIpml implements IListMedicineRepository {
  IReadMedicineDatasource readDatasource;
  ListMedicineRepositoryIpml({
    required this.readDatasource,
  });
  @override
  Future<List<MedicineEntity>> call() async {
    var jsonData = await readDatasource();
    List<MedicineEntity> list = [];
    for (Map<String, dynamic> e in jsonData) {
      list.add(MedicineMapper.fromJson(e));
    }

    return list;
  }
}
