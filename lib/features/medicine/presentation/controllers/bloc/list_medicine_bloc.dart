import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/list_medicine_usecase.dart';

import 'package:equatable/equatable.dart';

import '../../../domain/entities/medicine_entity.dart';

part 'list_medicine_event.dart';
part 'list_medicine_state.dart';

class ListMedicineBloc extends Bloc<ListMedicineEvent, ListMedicineState> {
  final ListMedicineUsecase listUsecase;
  ListMedicineBloc({required this.listUsecase})
      : super(ListMedicineSuccess(medicines: const <MedicineEntity>[])) {
    on<ListMedicineEvent>((event, emit) async {
      emit(ListMedicineLoading());
      emit(ListMedicineSuccess(medicines: await listUsecase()));
    });
  }
}
