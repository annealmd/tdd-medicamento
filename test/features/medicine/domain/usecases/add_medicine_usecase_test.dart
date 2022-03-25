import 'package:app_medicamento/features/medicine/domain/repositories/i_create_medicine_repository.dart';
import 'package:app_medicamento/features/medicine/domain/usecases/add_medicine_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreateMedicineRepository extends Mock
    implements ICreateMedicineRepository {}

class FakeParams extends Fake implements AddParams {}

void main() {
  AddMedicineUsecase sut;
  MockCreateMedicineRepository repository;
  AddParams params;
  repository = MockCreateMedicineRepository();
  sut = AddMedicineUsecase(repository: repository);
  params = AddParams(
      id: 1,
      title: 'text',
      quantity: '5',
      dose: 'mg',
      frequency: 12,
      duration: 30,
      start: DateTime(2022, 2, 22, 18, 00),
      isContinuous: false);

  setUpAll(() {
    //This instance of AddParams will only be passed around, but never be interacted with.
    registerFallbackValue(FakeParams());
  });
  // this is to check the comment above is right.
  String toString(AddParams params) {
    return 'id: ${params.id} \ntext: ${params.title} \nstart: ${params.start}';
  }

  test('check if sut is called with correct params', () async {
    when(() => repository.createMedicine(any())).thenAnswer((_) async {});
    await sut(params);
    var captured = verify(() => sut(captureAny())).captured;
    print(toString(captured.first));
  });
  test('check if repository is called once', () async {
    when(() => repository.createMedicine(any())).thenAnswer((_) async {});
    await sut(params);
    verify(() => repository.createMedicine(params)).called(1);
  });
}
