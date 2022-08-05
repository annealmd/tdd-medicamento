import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/delete_medicine_usecase.dart';

import 'package:equatable/equatable.dart';

part 'delete_medicine_event.dart';
part 'delete_medicine_state.dart';

class DeleteMedicineBloc
    extends Bloc<DeleteMedicineEvent, DeleteMedicineState> {
  final IDeleteMedicineUsecase deleteUsecase;
  DeleteMedicineBloc({required this.deleteUsecase})
      : super(DeleteMedicineInitial()) {
    on<DeleteMedicine>((event, emit) async {
      emit(DeleteMedicineLoading());
      bool result = await deleteUsecase(id: event.id);
      if (result) {
        emit(const DeleteMedicineSuccess(message: 'Medicamento foi deletado'));
      } else {
        emit(const DeleteMedicineError(
            message: 'Erro, Medicamento não deletado'));
      }
    });
  }
}
