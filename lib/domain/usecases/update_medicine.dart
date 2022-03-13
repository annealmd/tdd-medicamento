import 'package:equatable/equatable.dart';

import '../entities/medicine_entity.dart';
import '../repositories/medicine_repository.dart';

class UpdateMedicine {
  final MedicineRepository repository;

  UpdateMedicine(this.repository);

  Future<void> call(Params params) async {
    return await repository.updateMedicine(
        id: params.id, newMedicine: params.newMedicine);
  }
}

class Params extends Equatable {
  final int id;
  final MedicineEntity newMedicine;
  const Params({
    required this.id,
    required this.newMedicine,
  });

  @override
  List<Object> get props => [id, newMedicine];
}
