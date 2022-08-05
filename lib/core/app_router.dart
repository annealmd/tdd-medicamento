import 'package:app_medicamento/features/medicine/presentation/pages/medicine_add_page.dart';
import 'package:app_medicamento/features/medicine/presentation/pages/medicine_list_page.dart';
import 'package:flutter/material.dart';

import '../core/exceptions/route_exception.dart';
import '../features/medicine/presentation/pages/medicine_edit_page.dart';

class AppRouter {
  static const String home = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const MedicineListPage(),
        );
      case MedicineAddPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const MedicineAddPage(),
        );
      case MedicineEditPage.routeName:
        final EditArguments editArguments = settings.arguments as EditArguments;
        return MaterialPageRoute(
          builder: (_) => MedicineEditPage(
              medicine: editArguments.medicine, index: editArguments.index),
        );

      default:
        throw const RouteException('Route not found!');
      // could be an error page as well
    }
  }
}
