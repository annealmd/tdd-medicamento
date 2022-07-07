part of 'edit_medicine_bloc.dart';

abstract class EditMedicineState extends Equatable {
  const EditMedicineState();

  @override
  List<Object> get props => [];
}

class EditMedicineInitial extends EditMedicineState {}

class EditMedicineLoading extends EditMedicineState {}

class EditMedicineSuccess extends EditMedicineState {
  final String message;

  const EditMedicineSuccess({required this.message});
}

class EditMedicineError extends EditMedicineState {
  final String message;

  const EditMedicineError({required this.message});
}
