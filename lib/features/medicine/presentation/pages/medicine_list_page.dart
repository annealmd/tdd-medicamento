import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:app_medicamento/features/medicine/domain/entities/medicine_entity.dart';
import 'package:app_medicamento/features/medicine/presentation/pages/medicine_add_page.dart';
import 'package:app_medicamento/features/medicine/presentation/pages/medicine_edit_page.dart';
import 'package:app_medicamento/features/medicine/presentation/widgets/medicine_card.dart';

import '../controllers/bloc/bloc.dart';

class MedicineListPage extends StatefulWidget {
  const MedicineListPage({Key? key}) : super(key: key);

  @override
  State<MedicineListPage> createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  final ListMedicineBloc listBloc = GetIt.I.get<ListMedicineBloc>();
  @override
  void initState() {
    listBloc.add(ListMedicine());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: BlocBuilder<ListMedicineBloc, ListMedicineState>(
            bloc: listBloc,
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is ListMedicineLoading) {
                return const CircularProgressIndicator();
              } else if (state is ListMedicineSuccess) {
                List<MedicineEntity> medicineList = state.medicines;
                return state.medicines.isEmpty
                    ? const Center(
                        child: Text('Adicione os seus Medicamentos'),
                      )
                    : ListView.builder(
                        itemBuilder: (ctx, i) => Column(
                          children: <Widget>[
                            GestureDetector(
                              child: MedicineCard(
                                index: i,
                                medicineList: medicineList,
                              ),
                              onTap: () {
                                Navigator.popAndPushNamed(
                                  context,
                                  MedicineEditPage.routeName,
                                  arguments: EditArguments(
                                      medicine: medicineList[i], index: i),
                                );
                              },
                            ),
                          ],
                        ),
                        itemCount: medicineList.length,
                      );
              }
              return const Center(
                child: Text(
                  'Tente novamente',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 20,
          splashColor: const Color.fromARGB(255, 188, 166, 98),
          backgroundColor: Colors.blueGrey.shade800,
          hoverColor: const Color.fromARGB(255, 2, 118, 156),
          tooltip: 'adicionar',
          child: const Icon(
            Icons.add,
            size: 35,
            shadows: [Shadow(blurRadius: 2)],
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, MedicineAddPage.routeName);
          }),
    );
  }
}

class EditArguments {
  final MedicineEntity medicine;
  final int index;
  EditArguments({
    required this.medicine,
    required this.index,
  });
}
