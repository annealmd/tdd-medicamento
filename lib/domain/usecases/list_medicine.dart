import '../entities/medicine_entity.dart';
import '../repositories/medicine_repository.dart';

class ListMedicine {
  final MedicineRepository repository;

  ListMedicine(this.repository);

  Future<List<MedicineEntity>> call() async {
    return await repository.medicineList;
  }
}
