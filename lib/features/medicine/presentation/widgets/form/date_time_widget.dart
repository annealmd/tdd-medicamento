import 'package:flutter/material.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget(
      {Key? key,
      this.onPressedDate,
      this.onPressedTime,
      required this.start,
      required this.dateTimeStyle,
      this.dateFocusNode,
      this.hourFocusNode})
      : super(key: key);
  final void Function()? onPressedDate;
  final void Function()? onPressedTime;
  final DateTime start;
  final FocusNode? dateFocusNode;
  final FocusNode? hourFocusNode;
  final ButtonStyle dateTimeStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: TextButton.icon(
            focusNode: dateFocusNode,
            onPressed: onPressedDate,
            icon: const Icon(Icons.calendar_month),
            label: Text('${start.day}/ ${start.month}/${start.year}'),
            style: dateTimeStyle,
          ),
        ),
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
