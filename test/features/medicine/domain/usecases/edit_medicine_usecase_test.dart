import 'package:app_medicamento/features/medicine/domain/repositories/i_edit_medicine_repository.dart';
import 'package:app_medicamento/features/medicine/domain/usecases/edit_medicine_usecase.dart';
import 'package:app_medicamento/features/medicine/domain/usecases/params.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEditRepository extends Mock implements IEditMedicineRepository {}

void main() {
  MockEditRepository mockRepo = MockEditRepository();
  EditMedicineUsecase sut;
  sut = EditMedicineUsecase(editRepository: mockRepo);
  AddParams params = AddParams(
      title: 'test',
      quantity: '2',
      dose: 'ml',
      frequency: 3,
      duration: 10,
      start: DateTime(2022),
      isContinuous: true);

  setUpAll(() {
    registerFallbackValue(params);
  });
  callMock() async {
    when(() => mockRepo(params: any(named: 'params')))
        .thenAnswer((_) async => true);
  }

  test('Mock should be called once only', () async {
    callMock();
    await sut.call(params: params);
    verify(() => mockRepo.call(params: params)).called(1);
  });
  test('Mock should be called with correct argument', () async {
    callMock();
    await sut.call(params: params);
    final captured =
        verify(() => mockRepo(params: captureAny(named: 'params'))).captured;
    expect(captured, equals([params]));
  });
}
