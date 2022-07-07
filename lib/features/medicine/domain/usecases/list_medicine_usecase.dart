import '../entities/medicine_entity.dart';
import '../repositories/i_list_medicine_repository.dart';

abstract class IListMedicineUsecase {
  Future<List<MedicineEntity>> call();
}

class ListMedicineUsecase implements IListMedicineUsecase {
  final IListMedicineRepository listRepository;

  ListMedicineUsecase({required this.listRepository});

  @override
  Future<List<MedicineEntity>> call() async {
    return await listRepository();
  }
}
