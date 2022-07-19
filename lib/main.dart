import 'package:flutter/material.dart';
import 'package:app_medicamento/core/internationalization.dart';

import 'package:app_medicamento/core/inject.dart';
import 'features/medicine/presentation/pages/medicine_add_page.dart';
import 'features/medicine/presentation/pages/medicine_list_page.dart';

void main() {
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.cyan,
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 1, 114, 82),
        brightness: Brightness.light,
        //primarySwatch: Colors.green,
      ),
      home: const MedicineAddPage(),
      localizationsDelegates: Internationalization.localizationsDelegates,
      supportedLocales: Internationalization.supportedLocales,
    );
  }
}
