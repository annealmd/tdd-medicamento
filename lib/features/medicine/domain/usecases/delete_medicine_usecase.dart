import '../repositories/i_delete_medicine_repository.dart';

abstract class IDeleteMedicineUsecase {
  Future<bool> call({required int id});
}

class DeleteMedicineUsecase implements IDeleteMedicineUsecase {
  final IDeleteMedicineRepository deleteRepository;

  DeleteMedicineUsecase({required this.deleteRepository});

  @override
  Future<bool> call({required int id}) async {
    return await deleteRepository(id: id);
  }
}
