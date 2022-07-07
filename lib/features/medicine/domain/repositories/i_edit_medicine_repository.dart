import '../usecases/params.dart';

abstract class IEditMedicineRepository {
  Future<bool> call({required AddParams params});
}
