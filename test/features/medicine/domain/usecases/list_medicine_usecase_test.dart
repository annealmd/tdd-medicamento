import 'package:app_medicamento/features/medicine/domain/entities/medicine_entity.dart';
import 'package:app_medicamento/features/medicine/domain/repositories/i_list_medicine_repository.dart';
import 'package:app_medicamento/features/medicine/domain/usecases/list_medicine_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockListRepository extends Mock implements IListMedicineRepository {}

void main() {
  ListMedicineUsecase sut;
  MockListRepository mockRepo = MockListRepository();
  sut = ListMedicineUsecase(listRepository: mockRepo);

  callMock() async {
    when(() => mockRepo()).thenAnswer((_) async =>
        List<MedicineEntity>.generate(
            5,
            (index) => MedicineEntity(
                id: 1 * index,
                title: 'test',
                quantity: '2',
                dose: 'ml',
                frequency: 3,
                duration: 10 * index,
                start: DateTime(2022),
                isContinuous: index % 2 == 0 ? true : false)));
  }

  test('Mock should be called once only', () async {
    callMock();
    await sut.call();
    verify(() => mockRepo.call()).called(1);
  });

  test('Sut should return the length of the list when called', () async {
    callMock();
    var result = await sut.call();
    expect(result.length, 5);
  });
  test(
      'Sut should return false if not all the elements in the list is continuous',
      () async {
    callMock();
    var result = await sut.call();
    expect(result.every((e) => e.isContinuous == true), false);
  });
}
