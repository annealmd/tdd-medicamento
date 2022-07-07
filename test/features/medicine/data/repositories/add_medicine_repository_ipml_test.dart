import 'package:app_medicamento/features/medicine/data/datasources/i_create_medicine_data_source.dart';
import 'package:app_medicamento/features/medicine/data/repositories/add_medicine_repository_ipml.dart';
import 'package:app_medicamento/features/medicine/domain/usecases/params.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreateDatasource extends Mock implements ICreateMedicineDatasource {}

void main() {
  MockCreateDatasource mockDatasource = MockCreateDatasource();
  AddMedicineRepositoryIpml sut;
  sut = AddMedicineRepositoryIpml(createDatasource: mockDatasource);

  AddParams params = AddParams(
      title: 'test',
      quantity: '2',
      dose: 'ml',
      frequency: 3,
      duration: 10,
      start: DateTime(2022),
      isContinuous: true);

  setUpAll(() {
    registerFallbackValue({
      'title': params.title,
      'quantity': params.quantity,
      'dose': params.dose,
      'frequency': params.frequency,
      'duration': params.duration,
      'start': params.start.toIso8601String(),
      'isContinuous': params.isContinuous ? 1 : 0,
    });
  });
  callMock() async {
    when(() => mockDatasource(json: any(named: 'json')))
        .thenAnswer((_) async => true);
  }

  test('The MockDataSource should be called once only', () async {
    callMock();
    await sut(params);
    verify(() => mockDatasource(json: {
          'title': params.title,
          'quantity': params.quantity,
          'dose': params.dose,
          'frequency': params.frequency,
          'duration': params.duration,
          'start': params.start.toIso8601String(),
          'isContinuous': params.isContinuous ? 1 : 0,
        })).called(1);
  });

  test('Mock should be called with correct argument', () async {
    callMock();
    await sut.call(params);
    final captured =
        verify(() => mockDatasource(json: captureAny(named: 'json'))).captured;
    expect(
        captured,
        equals([
          {
            'title': 'test',
            'quantity': '2',
            'dose': 'ml',
            'frequency': 3,
            'duration': 10,
            'start': DateTime(2022).toIso8601String(),
            'isContinuous': 1
          }
        ]));
  });
}
