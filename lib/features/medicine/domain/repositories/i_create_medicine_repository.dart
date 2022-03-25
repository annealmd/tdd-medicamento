import 'package:app_medicamento/core/Params/i_params.dart';

abstract class ICreateMedicineRepository {
  Future<void> createMedicine(IParams params);
}
