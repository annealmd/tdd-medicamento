import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class Internationalization {
  static final dateFormat = DateFormat('dd.MMM/yy', 'pt_Br');
  static final timeFormat = DateFormat('hh:mm a', 'pt_Br');

  static var localizationsDelegates = [
    // ... app-specific localization delegate[s] here
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  static var supportedLocales = [
    const Locale('en'), // English
    const Locale('pt', 'BR'), // Portuguese Brazil
  ];
}
