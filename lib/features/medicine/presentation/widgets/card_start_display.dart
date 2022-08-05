import 'package:flutter/material.dart';

import '../../../../core/internationalization.dart';

class CardStartDisplay extends StatelessWidget {
  CardStartDisplay({
    Key? key,
    required this.start,
  }) : super(key: key);
  final DateTime start;

  final dateFormat = Internationalization.dateFormat;
  final timeFormat = Internationalization.timeFormat;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          dateFormat.format(start),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          timeFormat.format(start),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
