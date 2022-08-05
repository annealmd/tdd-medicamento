import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      colorSchemeSeed: const Color.fromARGB(255, 1, 114, 82),
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
        checkColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 31, 105, 33)),
      ),
      cardTheme: CardTheme(
        margin: const EdgeInsets.all(10),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ));

  static ThemeData darkTheme = ThemeData(
    colorSchemeSeed: Colors.cyan,
    brightness: Brightness.dark,
  );

  static Color avatarColor(int index) {
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
}
