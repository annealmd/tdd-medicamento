import 'package:flutter/material.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget(
      {Key? key,
      this.onPressedDate,
      this.onPressedTime,
      required this.start,
      required this.dateTimeStyle})
      : super(key: key);
  final void Function()? onPressedDate;
  final void Function()? onPressedTime;
  final DateTime start;
  final ButtonStyle dateTimeStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: TextButton.icon(
            onPressed: onPressedDate,
            // () async {
            //   final pickDate = await DateTimePicker.selectDate(context, start);
            //   if (pickDate == null) return;
            //   setState(() => start = pickDate);
            // },
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
            onPressed: onPressedTime,
            // () async {
            //   final pickTime = await DateTimePicker.selectTime(context, start);
            //   if (pickTime == null) return;
            //   setState(() => start = pickTime);
            // },
            icon: const Icon(Icons.alarm),
            label: Text('${start.hour}: ${start.minute}'),
            style: dateTimeStyle,
          ),
        ),
      ],
    );
  }
}
