import 'package:app_medicamento/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamento/core/internationalization.dart';

import 'package:app_medicamento/core/inject.dart';

import 'core/app_theme.dart';

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
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      localizationsDelegates: Internationalization.localizationsDelegates,
      supportedLocales: Internationalization.supportedLocales,
    );
  }
}
