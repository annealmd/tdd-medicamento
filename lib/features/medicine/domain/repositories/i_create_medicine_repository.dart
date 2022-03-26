import 'package:app_medicamento/core/Params/params.dart';

abstract class ICreateMedicineRepository {
  Future<void> createMedicine(AddParams params);
}
