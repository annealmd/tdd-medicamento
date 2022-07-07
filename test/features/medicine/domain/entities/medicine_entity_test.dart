import 'package:app_medicamento/features/medicine/domain/entities/medicine_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MedicineEntity entity;
  entity = MedicineEntity(
      id: 1,
      title: 'test',
      quantity: '2',
      dose: 'ml',
      frequency: 3,
      duration: 4,
      start: DateTime(2022),
      isContinuous: true);
  test('Entity Should not be null', () {
    expect(entity, isNotNull);
  });
  test('Entity should be type of MedicineEntity', () {
    expect(entity, isInstanceOf<MedicineEntity>());
  });
  test('Quantity Should be a String of value 2', () {
    expect(entity.quantity, '2');
  });
}
