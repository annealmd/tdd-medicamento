import '../../domain/repositories/i_add_medicine_repository.dart';
import '../../domain/usecases/params.dart';
import '../datasources/i_create_medicine_data_source.dart';
import '../mapper/medicine_mapper.dart';

class AddMedicineRepositoryIpml implements IAddMedicineRepository {
  final ICreateMedicineDatasource createDatasource;

  AddMedicineRepositoryIpml({required this.createDatasource});

  @override
  Future<bool> call(AddParams params) async {
    var json = MedicineMapper.toJson(params);

    return await createDatasource(json: json);
  }
}
