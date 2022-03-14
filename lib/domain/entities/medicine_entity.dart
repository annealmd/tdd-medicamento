import 'package:equatable/equatable.dart';

class MedicineEntity extends Equatable {
  final int id;
  final String title;
  final String quantity;
  final String dose;
  final int frequency;
  final int duration;
  final DateTime start;
  final DateTime end;
  final bool isContinuous;

  const MedicineEntity({
    required this.id,
    required this.title,
    required this.quantity,
    required this.dose,
    required this.frequency,
    this.duration = 800,
    required this.start,
    required this.end,
    required this.isContinuous,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        quantity,
        dose,
        frequency,
        duration,
        start,
        end,
        isContinuous
      ];
}
