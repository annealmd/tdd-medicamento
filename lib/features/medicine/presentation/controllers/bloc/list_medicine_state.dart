part of 'list_medicine_bloc.dart';

abstract class ListMedicineState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListMedicineLoading extends ListMedicineState {}

class ListMedicineSuccess extends ListMedicineState {
  final List<MedicineEntity> medicines;

  ListMedicineSuccess({required this.medicines});
}

class ListMedicineError extends ListMedicineState {
  final String message;

  ListMedicineError({required this.message});
}
