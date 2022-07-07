import 'package:app_medicamento/features/medicine/data/datasources/i_delete_medicine_data_source.dart';
import 'package:app_medicamento/features/medicine/data/repositories/delete_medicine_repository_ipml.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDeleteMedicineDataSource extends Mock
    implements IDeleteMedicineDatasource {}

void main() {
  MockDeleteMedicineDataSource mockDatasource = MockDeleteMedicineDataSource();
  DeleteMedicineRepositoryIpml sut;
  sut = DeleteMedicineRepositoryIpml(deleteDatasource: mockDatasource);
  setUpAll(() {
    registerFallbackValue(1);
  });
  callMock() async {
    when(() => mockDatasource(id: any(named: 'id')))
        .thenAnswer((_) async => true);
  }

  test('Mock should be called once only', () async {
    callMock();
    await sut.call(id: 5);
    verify(() => mockDatasource.call(id: 5)).called(1);
  });

  test('sut should return true when called', () async {
    callMock();
    var result = await sut.call(id: 5);
    expect(result, true);
  });
}
