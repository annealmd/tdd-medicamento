import '../usecases/params.dart';

abstract class IAddMedicineRepository {
  Future<bool> call(AddParams params);
}
