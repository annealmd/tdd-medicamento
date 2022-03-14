import 'package:equatable/equatable.dart';

import '../repositories/medicine_repository.dart';

class DeleteMedicine {
  final MedicineRepository repository;

  DeleteMedicine(this.repository);

  Future<void> call(DeleteParams params) async {
    await repository.deleteMedicine(params);
  }
}

class DeleteParams extends Equatable implements Params {
  final int id;
  final int frequency;
  const DeleteParams({
    required this.id,
    required this.frequency,
  });

  @override
  List<Object> get props => [id, frequency];
}
