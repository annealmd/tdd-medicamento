import '../repositories/i_edit_medicine_repository.dart';
import 'params.dart';

abstract class IEditMedicineUsecase {}

class EditMedicineUsecase implements IEditMedicineUsecase {
  final IEditMedicineRepository editRepository;

  EditMedicineUsecase({required this.editRepository});

  Future<bool> call({required AddParams params}) async {
    return await editRepository(params: params);
  }
}
