import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/add_medicine_usecase.dart';
import '../../../domain/usecases/params.dart';

part 'add_medicine_event.dart';
part 'add_medicine_state.dart';

class AddMedicineBloc extends Bloc<AddMedicineEvent, AddMedicineState> {
  final IAddMedicineUsecase addUsecase;
  late AddParams params;

  AddMedicineBloc({required this.addUsecase}) : super(AddMedicineInitial()) {
    on<AddMedicine>((event, emit) async {
      params = AddParams(
          title: event.title,
          quantity: event.quantity,
          dose: event.dose,
          frequency: event.frequency,
          duration: event.duration,
          start: event.start,
          isContinuous: event.isContinuous);
      var result = await addUsecase(params);
      if (result.isLeft()) {
        emit(const AddMedicineError(
            message: 'Erro, medicamento não adicionado'));
      }
    });
  }
}
