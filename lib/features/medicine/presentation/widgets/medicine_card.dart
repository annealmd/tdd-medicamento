import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({
    Key? key,
    required this.dateFormat,
    required this.index,
  }) : super(key: key);

  final DateFormat dateFormat;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: avatarColor(index),
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        title: const Text('Medicamento Nome'),
        subtitle: Text(
          dateFormat.format(DateTime.now()),
        ),
        trailing: const Icon(Icons.all_inclusive),
      ),
    );
  }
}

Color avatarColor(int index) {
  switch (index) {
    case 1:
      return Colors.blue.shade700;
    case 2:
      return Colors.pink.shade700;
    case 3:
      return Colors.green.shade700;
    case 4:
      return Colors.yellow.shade700;
    case 5:
      return Colors.red.shade700;
    case 6:
      return Colors.teal.shade700;
    case 7:
      return Colors.purple.shade600;
    case 8:
      return Colors.indigo.shade700;
    case 9:
      return Colors.orange.shade700;
    case 10:
      return Colors.cyan.shade700;
    default:
      return Colors.blueGrey.shade700;
  }
}
