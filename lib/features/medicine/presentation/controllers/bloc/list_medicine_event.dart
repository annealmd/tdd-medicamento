part of 'list_medicine_bloc.dart';

abstract class ListMedicineEvent extends Equatable {
  const ListMedicineEvent();

  @override
  List<Object> get props => [];
}

class ListMedicine implements ListMedicineEvent {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}
