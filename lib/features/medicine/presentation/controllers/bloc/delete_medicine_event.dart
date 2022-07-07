part of 'delete_medicine_bloc.dart';

abstract class DeleteMedicineEvent extends Equatable {
  const DeleteMedicineEvent();

  @override
  List<Object> get props => [];
}

class DeleteMedicine extends DeleteMedicineEvent {
  final int id;

  const DeleteMedicine({required this.id});
}
