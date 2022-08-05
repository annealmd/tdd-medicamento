import 'package:flutter/material.dart';

import '../../../../core/internationalization.dart';

class CardEditDisplay extends StatelessWidget {
  CardEditDisplay(
      {Key? key,
      required this.start,
      this.duration,
      required this.isContinuous})
      : super(key: key);
  final DateTime start;
  final int? duration;
  final bool isContinuous;
  final dateFormat = Internationalization.dateFormat;
  final timeFormat = Internationalization.timeFormat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const Text(
              'Início:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Text(dateFormat.format(start)),
          ],
        ),
        isContinuous
            ? Row(
                children: const <Widget>[
                  Text(
                    'Final:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 15),
                  Text('* Uso Contínuo *'),
                ],
              )
            : Row(
                children: <Widget>[
                  const Text(
                    'Final:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    dateFormat.format(
                      start.add(
                        Duration(days: duration!),
                      ),
                    ),
                  ),
                ],
              ),
        Row(
          children: <Widget>[
            const Text(
              'Horário inicial:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Text(timeFormat.format(start)),
          ],
        ),
      ],
    );
  }
}
