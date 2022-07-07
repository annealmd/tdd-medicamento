import 'package:app_medicamento/features/medicine/data/mapper/medicine_mapper.dart';
import 'package:app_medicamento/features/medicine/domain/entities/medicine_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var json = {
    'id': 1,
    'title': 'json test',
    'quantity': '5',
    'dose': 'ml',
    'frequency': 2,
    'duration': 10,
    'start': DateTime(2022, 7, 1).toIso8601String(),
    'isContinuous': 1,
  };
  test('Should convert a json to a Medicine Entity', () {
    var result = MedicineMapper.fromJson(json);
    expect(result, isInstanceOf<MedicineEntity>());
  });
  test('Should return month equal to 7', () {
    var result = MedicineMapper.fromJson(json);
    expect(result.start.month, 7);
  });
}
