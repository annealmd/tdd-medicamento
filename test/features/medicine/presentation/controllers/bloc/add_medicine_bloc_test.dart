import 'package:app_medicamento/features/medicine/domain/usecases/add_medicine_usecase.dart';
import 'package:app_medicamento/features/medicine/presentation/controllers/bloc/add_medicine_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AddUseCaseMock extends Mock implements IAddMedicineUsecase {}

void main() {
  final AddUseCaseMock useCaseMock = AddUseCaseMock();
  final AddMedicineBloc sut = AddMedicineBloc(addUsecase: useCaseMock);

  test('testing Bloc', () async {});
}
