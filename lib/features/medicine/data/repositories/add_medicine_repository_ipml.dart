import '../../domain/repositories/i_add_medicine_repository.dart';
import '../../domain/usecases/params.dart';
import '../datasources/i_create_medicine_data_source.dart';

class AddMedicineRepositoryIpml implements IAddMedicineRepository {
  final ICreateMedicineDatasource createDatasource;

  AddMedicineRepositoryIpml({required this.createDatasource});

  @override
  Future<bool> call(AddParams params) async {
    var json = {
      'title': params.title,
      'quantity': params.quantity,
      'dose': params.dose,
      'frequency': params.frequency,
      'duration': params.duration,
      'start': params.start.toIso8601String(),
      'isContinuous': params.isContinuous ? 1 : 0,
    };
    return await createDatasource(json: json);
  }
}
