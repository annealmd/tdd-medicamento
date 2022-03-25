import 'package:app_medicamento/features/medicine/domain/repositories/i_create_medicine_repository.dart';

import '../../../../core/Params/i_params.dart';

class AddMedicineUsecase {
  final ICreateMedicineRepository repository;

  AddMedicineUsecase({required this.repository});

  Future<void> call(AddParams params) async {
    //TODO case durations is infinity

    return await repository.createMedicine(params);
  }
}

class AddParams extends IParams {
  final int id;
  final String title;
  final String quantity;
  final String dose;
  final int frequency;
  final int duration;
  final DateTime start;
  final bool isContinuous;

  AddParams(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.dose,
      required this.frequency,
      required this.duration,
      required this.start,
      required this.isContinuous});
}
