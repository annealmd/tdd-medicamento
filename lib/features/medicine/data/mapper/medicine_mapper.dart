import '../../domain/entities/medicine_entity.dart';

import '../../domain/usecases/params.dart';

class MedicineMapper {
  static MedicineEntity fromJson(Map<String, dynamic> json) {
    var medicine = MedicineEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      quantity: json['quantity'] as String,
      dose: json['dose'] as String,
      frequency: json['frequency'] as int,
      duration: json['duration'] as int,
      start: DateTime.parse(json['start'] as String),
      isContinuous: json['isContinuous'] == 0 ? false : true,
    );

    return medicine;
  }

  static Map<String, dynamic> toJson(AddParams params) {
    var json = {
      'title': params.title,
      'quantity': params.quantity,
      'dose': params.dose,
      'frequency': params.frequency,
      'duration': params.duration,
      'start': params.start.toIso8601String(),
      'isContinuous': params.isContinuous ? 1 : 0,
    };
    return json;
  }
}
