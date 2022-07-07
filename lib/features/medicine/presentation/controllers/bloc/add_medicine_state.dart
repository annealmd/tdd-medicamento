part of 'add_medicine_bloc.dart';

abstract class AddMedicineState extends Equatable {
  const AddMedicineState();

  @override
  List<Object> get props => [];
}

class AddMedicineInitial extends AddMedicineState {}

class AddMedicineLoading extends AddMedicineState {}

class AddMedicineSuccess extends AddMedicineState {
  final String message;

  const AddMedicineSuccess({required this.message});
}

class AddMedicineError extends AddMedicineState {
  final String message;

  const AddMedicineError({required this.message});
}
