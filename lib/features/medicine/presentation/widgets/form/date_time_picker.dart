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
    TimeOfDay? picked = await showTimePicker(
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
}
