import '../../domain/repositories/i_edit_medicine_repository.dart';
import '../../domain/usecases/params.dart';
import '../datasources/i_update_medicine_data_source.dart';
import '../mapper/medicine_mapper.dart';

class EditMedicineRepositoryIpml implements IEditMedicineRepository {
  IUpdateMedicineDatasource updateDatasource;
  EditMedicineRepositoryIpml({
    required this.updateDatasource,
  });
  @override
  Future<bool> call({required AddParams params}) {
    var item = MedicineMapper.toJson(params);
    return updateDatasource(item: item);
  }
}
