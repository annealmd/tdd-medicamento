import '../repositories/i_edit_medicine_repository.dart';
import 'params.dart';

abstract class IEditMedicineUsecase {
  Future<bool> call({required AddParams params});
}

class EditMedicineUsecase implements IEditMedicineUsecase {
  final IEditMedicineRepository editRepository;

  EditMedicineUsecase({required this.editRepository});

  @override
  Future<bool> call({required AddParams params}) async {
    return await editRepository(params: params);
  }
}
