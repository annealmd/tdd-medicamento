import 'package:app_medicamento/core/internationalization.dart';
import 'package:app_medicamento/features/medicine/presentation/widgets/medicine_card.dart';
import 'package:flutter/material.dart';

class MedicineListPage extends StatefulWidget {
  const MedicineListPage({Key? key}) : super(key: key);

  @override
  State<MedicineListPage> createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  final dateFormat = Internationalization.dateFormat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ListView.builder(
              itemBuilder: (ctx, i) => Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: MedicineCard(dateFormat: dateFormat, index: i),
                  ),
                ],
              ),
              itemCount: 10,
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
            onPressed: () {}));
  }
}
