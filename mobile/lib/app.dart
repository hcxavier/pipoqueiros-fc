import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/constants/theme.dart';
import 'package:mobile/routes.dart';
import 'package:mobile/ui/view_models/settings_view_model.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsViewModel(),
      child: Consumer<SettingsViewModel>(
        builder: (context, settingsVM, child) {
          final isDark = settingsVM.themeMode == ThemeMode.system
              ? MediaQuery.of(context).platformBrightness == Brightness.dark
              : settingsVM.themeMode == ThemeMode.dark;
          AppColors.isDark = isDark;

          return MaterialApp(
            title: 'Pipoqueiros FC',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: settingsVM.themeMode,
            routes: AppRoutes.routes,
            initialRoute: AppRoutes.splash,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
