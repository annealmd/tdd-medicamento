import 'package:app_medicamento/domain/domain.dart';
import 'package:equatable/equatable.dart';

import 'package:app_medicamento/domain/repositories/medicine_repository.dart';

class AddMedicine {
  final MedicineRepository repository;

  AddMedicine(this.repository);

  Future<MedicineEntity> call(AddParams params) async {
    return await repository.addMedicine(params);
  }
}

class AddParams extends Equatable implements Params {
  final int id;
  final String title;
  final String quantity;
  final String dose;
  final int frequency;
  final int? duration;
  final DateTime start;
  final DateTime end;
  final bool isContinuous;
  const AddParams({
    required this.id,
    required this.title,
    required this.quantity,
    required this.dose,
    required this.frequency,
    this.duration,
    required this.start,
    required this.end,
    required this.isContinuous,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      quantity,
      dose,
      frequency,
      duration!,
      start,
      end,
      isContinuous,
    ];
  }
}
