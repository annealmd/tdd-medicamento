import 'package:equatable/equatable.dart';

import '../repositories/medicine_repository.dart';

class DeleteMedicine {
  final MedicineRepository repository;

  DeleteMedicine(this.repository);

  Future<void> call(Params params) async {
    return repository.deleteMedicine();
  }
}

class Params extends Equatable {
  final int id;
  final int frequency;
  const Params({
    required this.id,
    required this.frequency,
  });

  @override
  List<Object> get props => [id, frequency];
}
