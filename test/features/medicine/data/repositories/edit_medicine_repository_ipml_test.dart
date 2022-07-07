import 'package:app_medicamento/features/medicine/data/repositories/edit_medicine_repository_ipml.dart';
import 'package:app_medicamento/features/medicine/domain/usecases/params.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:app_medicamento/features/medicine/data/datasources/i_update_medicine_data_source.dart';

class MockEditDatasource extends Mock implements IUpdateMedicineDatasource {}

void main() {
  MockEditDatasource mockDatasource = MockEditDatasource();
  EditMedicineRepositoryIpml sut;
  sut = EditMedicineRepositoryIpml(updateDatasource: mockDatasource);
  AddParams params = AddParams(
      title: 'test',
      quantity: '2',
      dose: 'ml',
      frequency: 3,
      duration: 10,
      start: DateTime(2022),
      isContinuous: true);
  var paramsJson = {
    'title': params.title,
    'quantity': params.quantity,
    'dose': params.dose,
    'frequency': params.frequency,
    'duration': params.duration,
    'start': params.start.toIso8601String(),
    'isContinuous': params.isContinuous ? 1 : 0,
  };

  setUpAll(() {
    registerFallbackValue(1);
  });
  callMock() async {
    when(() => mockDatasource(item: any(named: 'item')))
        .thenAnswer((_) async => true);
  }

  test('Mock should be called once only', () async {
    callMock();
    await sut.call(params: params);
    verify(() => mockDatasource.call(item: any(named: 'item'))).called(1);
  });

  test('sut should return true when called', () async {
    callMock();
    var result = await sut.call(params: params);
    expect(result, true);
  });

  test('Mock should be called with correct argument', () async {
    callMock();
    clearInteractions(mockDatasource);
    await sut.call(params: params);
    final captured =
        verify(() => mockDatasource(item: captureAny(named: 'item'))).captured;
    expect(captured, equals([paramsJson]));
  });
}
