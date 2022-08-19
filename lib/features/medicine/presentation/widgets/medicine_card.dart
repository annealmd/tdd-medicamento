import 'package:app_medicamento/features/medicine/domain/entities/medicine_entity.dart';
import 'package:app_medicamento/features/medicine/presentation/widgets/card_start_display.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({
    Key? key,
    required this.index,
    required this.medicineList,
  }) : super(key: key);

  //final DateFormat dateFormat;
  final int index;
  final List<MedicineEntity> medicineList;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.avatarColor(index + 1),
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        title: Text(
          medicineList[index].title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${medicineList[index].quantity} ${medicineList[index].dose}',
              textAlign: TextAlign.start,
            ),
            CardStartDisplay(start: medicineList[index].start),
          ],
        ),
        trailing: medicineList[index].isContinuous
            ? const Icon(Icons.all_inclusive)
            : null,
      ),
    );
  }
}
