import 'package:equatable/equatable.dart';

import '../entities/medicine_entity.dart';
import '../repositories/medicine_repository.dart';

class UpdateMedicine {
  final MedicineRepository repository;

  UpdateMedicine(this.repository);

  Future<void> call(UpdateParams params) async {
    await repository.updateMedicine(params);
  }
}

class UpdateParams extends Equatable implements Params {
  final int id;
  final MedicineEntity newMedicine;
  const UpdateParams({
    required this.id,
    required this.newMedicine,
  });

  @override
  List<Object> get props => [id, newMedicine];
}
