import '../entities/medicine_entity.dart';

abstract class IListMedicineRepository {
  Future<List<MedicineEntity>> call();
}
