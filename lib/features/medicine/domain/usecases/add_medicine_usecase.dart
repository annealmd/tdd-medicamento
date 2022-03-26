import 'package:app_medicamento/features/medicine/domain/repositories/i_create_medicine_repository.dart';

import '../../../../core/Params/params.dart';

class AddMedicineUsecase {
  final ICreateMedicineRepository repository;

  AddMedicineUsecase({required this.repository});

  Future<void> call(AddParams params) async {
    //TODO case durations is infinity

    return await repository.createMedicine(params);
  }
}
