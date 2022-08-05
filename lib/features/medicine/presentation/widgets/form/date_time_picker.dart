import 'package:flutter/material.dart';

class DateTimePicker {
  static Future<DateTime?> selectDate(
      BuildContext context, DateTime start) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      helpText: 'Entre o dia de início do tratamento',
      locale: const Locale("pt", "BR"),
      initialDate: start,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(2100),
    );
    return DateTime(
      picked!.year,
      picked.month,
      picked.day,
      start.hour,
      start.minute,
    );
  }

  static Future<DateTime?> selectTime(
      BuildContext context, DateTime start) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      helpText: 'Entre o horário da primeira dose',
      initialTime: TimeOfDay.now(),
    );

    return DateTime(
      start.year,
      start.month,
      start.day,
      picked!.hour,
      picked.minute,
    );
  }

  static ButtonStyle dateTimeStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white70),
      foregroundColor: MaterialStateProperty.all(Colors.black87),
      fixedSize: MaterialStateProperty.all(
          Size.fromWidth(MediaQuery.of(context).size.width * 0.1)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      side: MaterialStateProperty.all(
          const BorderSide(width: 1.5, color: Color.fromARGB(255, 56, 55, 55))),
      padding:
          MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20)),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
    );
  }
}
