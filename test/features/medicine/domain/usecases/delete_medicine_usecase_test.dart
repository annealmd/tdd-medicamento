import 'package:app_medicamento/features/medicine/domain/repositories/i_delete_medicine_repository.dart';
import 'package:app_medicamento/features/medicine/domain/usecases/delete_medicine_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDeleteRepository extends Mock implements IDeleteMedicineRepository {}

void main() {
  MockDeleteRepository mockRepo = MockDeleteRepository();
  DeleteMedicineUsecase sut;
  sut = DeleteMedicineUsecase(deleteRepository: mockRepo);

  setUpAll(() {
    registerFallbackValue(1);
  });
  callMock() async {
    when(() => mockRepo(id: any(named: 'id'))).thenAnswer((_) async => true);
  }

  test('Mock should be called once only', () async {
    callMock();
    await sut.call(id: 1);
    verify(() => mockRepo.call(id: 1)).called(1);
  });
  test('Mock should be called with correct argument', () async {
    callMock();
    await sut.call(id: 7);
    final captured =
        verify(() => mockRepo(id: captureAny(named: 'id'))).captured;
    expect(captured, equals([7]));
  });
}
