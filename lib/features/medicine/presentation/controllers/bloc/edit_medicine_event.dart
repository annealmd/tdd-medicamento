part of 'edit_medicine_bloc.dart';

abstract class EditMedicineEvent extends Equatable {
  const EditMedicineEvent();

  @override
  List<Object> get props => [];
}

class EditMedicine extends EditMedicineEvent {
  final int id;
  final String title;
  final String quantity;
  final String dose;
  final int frequency;
  final int duration;
  final DateTime start;
  final bool isContinuous;

  const EditMedicine(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.dose,
      required this.frequency,
      required this.duration,
      required this.start,
      required this.isContinuous});
}
