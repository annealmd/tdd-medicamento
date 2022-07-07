import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/add_medicine_usecase.dart';
import '../../../domain/usecases/params.dart';

part 'add_medicine_event.dart';
part 'add_medicine_state.dart';

class AddMedicineBloc extends Bloc<AddMedicineEvent, AddMedicineState> {
  final AddMedicineUsecase addUsecase;
  late AddParams params;

  AddMedicineBloc({required this.addUsecase}) : super(AddMedicineInitial()) {
    on<AddMedicine>((event, emit) async {
      emit(AddMedicineLoading());
      params = AddParams(
          title: event.title,
          quantity: event.quantity,
          dose: event.dose,
          frequency: event.frequency,
          duration: event.duration,
          start: event.start,
          isContinuous: event.isContinuous);
      var result = await addUsecase(params);
      if (result.isRight()) {
        emit(AddMedicineSuccess(message: '${event.title} foi adicionado'));
      } else {
        emit(const AddMedicineError(
            message: 'Erro, medicamento não adicionado'));
      }
    });
  }
}
