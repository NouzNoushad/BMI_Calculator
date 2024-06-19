import 'package:flutter/material.dart';

import '../../core/utils/strings.dart';
import '../../features/presentation/screens/weight_screen/weight_screen.dart';
import 'route_constant.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.weightScreen:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstants.weightScreen),
            builder: (context) => const BMIWeightScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text(AppStrings.pageNotFound),
                  ),
                ));
    }
  }
}