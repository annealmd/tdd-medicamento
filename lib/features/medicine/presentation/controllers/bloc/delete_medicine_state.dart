part of 'delete_medicine_bloc.dart';

abstract class DeleteMedicineState extends Equatable {
  const DeleteMedicineState();

  @override
  List<Object> get props => [];
}

class DeleteMedicineInitial extends DeleteMedicineState {}

class DeleteMedicineLoading extends DeleteMedicineState {}

class DeleteMedicineSuccess extends DeleteMedicineState {
  final String message;

  const DeleteMedicineSuccess({required this.message});
}

class DeleteMedicineError extends DeleteMedicineState {
  final String message;

  const DeleteMedicineError({required this.message});
}
