import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/add_medicine_exception.dart';
import '../repositories/i_add_medicine_repository.dart';
import 'params.dart';

abstract class IAddMedicineUsecase {
  Future<Either<AddMedicineException, bool>> call(AddParams params);
}

class AddMedicineUsecase implements IAddMedicineUsecase {
  final IAddMedicineRepository addRepository;

  AddMedicineUsecase({required this.addRepository});

  @override
  Future<Either<AddMedicineException, bool>> call(AddParams params) async {
    if (params.title.isEmpty) {
      return const Left(AddMedicineException('title não adicionado'));
    }

    return Right(await addRepository(params));
  }
}
