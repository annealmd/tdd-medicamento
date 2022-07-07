import 'dart:async';

import 'package:app_medicamento/features/medicine/data/mapper/medicine_mapper.dart';
import 'package:app_medicamento/features/medicine/data/repositories/list_medicine_repository_ipml.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:app_medicamento/features/medicine/data/datasources/i_read_medicine_datasource.dart';
import 'package:app_medicamento/features/medicine/domain/entities/medicine_entity.dart';
import 'package:app_medicamento/features/medicine/domain/repositories/i_list_medicine_repository.dart';

class MockReadMedicineDatasource extends Mock
    implements IReadMedicineDatasource {}

void main() {
  MockReadMedicineDatasource readDatasource = MockReadMedicineDatasource();
  ListMedicineRepositoryIpml sut;
  sut = ListMedicineRepositoryIpml(readDatasource: readDatasource);
  var jsonList = [
    {
      'id': 1,
      'title': 'test1',
      'quantity': '2',
      'dose': 'ml',
      'frequency': 3,
      'duration': 10,
      'start': DateTime(2022).toIso8601String(),
      'isContinuous': 1
    },
    {
      'id': 2,
      'title': 'test2',
      'quantity': '2',
      'dose': 'ml',
      'frequency': 3,
      'duration': 10,
      'start': DateTime(2023).toIso8601String(),
      'isContinuous': 0
    }
  ];

  callMock() async {
    when(() => readDatasource()).thenAnswer((_) async => jsonList);
  }

  test('Should return the title of the first element', () async {
    callMock();
    List<MedicineEntity> listMedicine = await sut.call();
    expect(listMedicine.first.title, 'test1');
  });

  test('Should return the title of the last element', () async {
    callMock();
    List<MedicineEntity> listMedicine = await sut.call();
    expect(listMedicine.last.title, 'test2');
  });
}
