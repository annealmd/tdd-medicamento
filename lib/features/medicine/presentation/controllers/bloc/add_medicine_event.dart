part of 'add_medicine_bloc.dart';

abstract class AddMedicineEvent extends Equatable {
  const AddMedicineEvent();

  @override
  List<Object> get props => [];
}

class AddMedicine extends AddMedicineEvent {
  final String title;
  final String quantity;
  final String dose;
  final int frequency;
  final int duration;
  final DateTime start;
  final bool isContinuous;

  const AddMedicine(
      {required this.title,
      required this.quantity,
      required this.dose,
      required this.frequency,
      required this.duration,
      required this.start,
      required this.isContinuous});
}
