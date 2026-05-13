import 'package:flutter/material.dart';
import 'package:mobile/constants/theme.dart';
import 'package:mobile/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pipoqueiros FC',
      theme: AppThemes.darkTheme,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.login,
    );
  }
}