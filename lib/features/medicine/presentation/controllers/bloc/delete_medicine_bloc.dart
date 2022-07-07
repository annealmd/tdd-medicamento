import '../../../domain/usecases/delete_medicine_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_medicine_event.dart';
part 'delete_medicine_state.dart';

class DeleteMedicineBloc
    extends Bloc<DeleteMedicineEvent, DeleteMedicineState> {
  final DeleteMedicineUsecase deleteUsecase;
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
