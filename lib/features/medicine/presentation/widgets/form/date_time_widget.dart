import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DateTimeWidget extends StatelessWidget {
  final void Function()? onPressedDate;
  final void Function()? onPressedTime;
  DateTime start;
  final FocusNode? dateFocusNode;
  final FocusNode? hourFocusNode;
  final ButtonStyle dateTimeStyle;
  final bool dateAndtime;
  DateTimeWidget({
    Key? key,
    this.onPressedDate,
    this.onPressedTime,
    required this.start,
    this.dateFocusNode,
    this.hourFocusNode,
    required this.dateTimeStyle,
    required this.dateAndtime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 9,
            child: dateAndtime
                ? TextButton.icon(
                    focusNode: dateFocusNode,
                    onPressed: onPressedDate,
                    icon: const Icon(Icons.calendar_month),
                    label: Text('${start.day}/ ${start.month}/${start.year}'),
                    style: dateTimeStyle,
                  )
                : const Text(
                    '''horário da\nprimeira dose.''',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 9,
          child: TextButton.icon(
            focusNode: hourFocusNode,
            onPressed: onPressedTime,
            icon: const Icon(Icons.alarm),
            label: Text('${start.hour}: ${start.minute}'),
            style: dateTimeStyle,
          ),
        ),
      ],
    );
  }
}
