import '../entities/medicine_entity.dart';

//add, get, update, delete
abstract class MedicineRepository {
  Future<MedicineEntity> addMedicine(Params params);

  Future<List<MedicineEntity>> get medicineList;

  Future<void> updateMedicine(Params params);

  Future<void> deleteMedicine(Params params);
}

abstract class Params {}
