import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/edit_medicine_usecase.dart';

import 'package:equatable/equatable.dart';

import '../../../domain/usecases/params.dart';

part 'edit_medicine_event.dart';
part 'edit_medicine_state.dart';

class EditMedicineBloc extends Bloc<EditMedicineEvent, EditMedicineState> {
  final EditMedicineUsecase editUsecase;
  late AddParams params;
  EditMedicineBloc({required this.editUsecase}) : super(EditMedicineInitial()) {
    on<EditMedicine>((event, emit) async {
      emit(EditMedicineLoading());
      params = AddParams(
          title: event.title,
          quantity: event.quantity,
          dose: event.dose,
          frequency: event.frequency,
          duration: event.duration,
          start: event.start,
          isContinuous: event.isContinuous);
      bool result = await editUsecase(params: params);

      if (result) {
        emit(const EditMedicineSuccess(message: 'Medicamento foi Modificado'));
      } else {
        emit(const EditMedicineError(
            message: 'Erro, Medicamento não foi Modificado'));
      }
    });
  }
}
