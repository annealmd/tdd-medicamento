import 'package:app_medicamento/core/Params/params.dart';
import 'package:app_medicamento/features/medicine/domain/repositories/i_create_medicine_repository.dart';

import '../../../../external/i_database.dart';

class CreateMedicineRepository implements ICreateMedicineRepository {
  final IDatabase database;

  CreateMedicineRepository(this.database);

  @override
  Future<void> createMedicine(AddParams params) async {
    var medicineMap = {
      'id': params.id,
      'title': params.title,
      'quantity': params.quantity,
      'dose': params.dose,
      'frequency': params.frequency,
      'duration': params.duration,
      'start': params.start.toIso8601String(),
      'isContinuous': params.isContinuous ? 1 : 0
    };
    database.insertItem(medicineMap);
  }
}
