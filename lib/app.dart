import 'package:flutter/material.dart';

import 'config/routes/app_routes.dart';
import 'config/routes/route_constant.dart';
import 'config/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConstants.weightScreen,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}