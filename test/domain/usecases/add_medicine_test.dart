import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:app_medicamento/domain/domain.dart';

class MockMedicineRepository extends Mock implements MedicineRepository {
  @override
  Future<MedicineEntity> addMedicine(Params params) async {
    return MedicineEntity(
        id: 0,
        title: 'test1',
        quantity: '1',
        dose: 'grams',
        frequency: 12,
        duration: 10,
        start: DateTime.utc(2020),
        end: DateTime.utc(2022),
        isContinuous: false);
  }
}

void main() {
  late MockMedicineRepository mockRepository;
  late AddMedicine sut;

  setUp(() {
    mockRepository = MockMedicineRepository();
    sut = AddMedicine(mockRepository);
  });

  final params = AddParams(
      id: 0,
      title: 'test1',
      quantity: '1',
      dose: 'grams',
      frequency: 12,
      duration: 10,
      start: DateTime.utc(2020),
      end: DateTime.utc(2022),
      isContinuous: false);

  test(
    'When called, should return a MedicineEntity',
    () async {
      final result = await sut(params);
      expect(result, isA<MedicineEntity>());
      expect(result.title, 'test1');
    },
  );
}
