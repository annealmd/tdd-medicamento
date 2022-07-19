import 'package:app_medicamento/features/medicine/domain/repositories/i_add_medicine_repository.dart';
import 'package:app_medicamento/features/medicine/domain/usecases/add_medicine_usecase.dart';
import 'package:app_medicamento/features/medicine/domain/usecases/params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAddRepository extends Mock implements IAddMedicineRepository {}

void main() {
  AddMedicineUsecase sut;
  MockAddRepository mockRepo = MockAddRepository();
  sut = AddMedicineUsecase(addRepository: mockRepo);
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
    when(() => mockRepo(any())).thenAnswer((_) async => true);
  }

  test('Mock should be called once only', () async {
    callMock();

    var result = await sut.call(params);
    expect(result, isA<Right>());
    verify(() => mockRepo.call(params)).called(1);
  });

  test('sut should return RIGHT side when called', () async {
    callMock();

    var result = await sut.call(params);
    expect(result.fold(id, id), true);
    verify(() => mockRepo.call(params)).called(1);
  });
}
