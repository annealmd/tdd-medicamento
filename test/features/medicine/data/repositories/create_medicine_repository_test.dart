import 'package:app_medicamento/core/Params/params.dart';
import 'package:app_medicamento/external/i_database.dart';
import 'package:app_medicamento/features/medicine/data/repositories/create_medicine_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSqlDatabase extends Mock implements IDatabase {}

class FakeParams extends Fake implements AddParams {}

void main() {
  CreateMedicineRepository sut;
  MockSqlDatabase mockDatabase = MockSqlDatabase();

  sut = CreateMedicineRepository(mockDatabase);

  AddParams params = AddParams(
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
  String checkMap(Map params) {
    return 'id: ${params['id']} \ntext: ${params['title']} \nstart: ${params['start']}';
  }

  test('check if mockDatabase is called once', () async {
    when(() => mockDatabase.insertItem(any())).thenAnswer((_) async {});
    await sut.createMedicine(params);
    verify(() => mockDatabase.insertItem(any())).called(1);
  });

  test('check if mockDatabase is called with correct params', () async {
    when(() => mockDatabase.insertItem(any())).thenAnswer((_) async {});
    await sut.createMedicine(params);
    var captured = verify(() => mockDatabase.insertItem(captureAny())).captured;
    print(checkMap(captured.first));
  });
}

// var paramsMap = {
//     'id': 1,
//     'title': 'textMap',
//     'quantity': '5',
//     'dose': 'mg',
//     'frequency': 12,
//     'duration': 30,
//     'start': DateTime(2022, 2, 22, 18, 00),
//     'isContinuous': false
//   };