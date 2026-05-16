import 'package:flutter/material.dart';
import 'package:mobile/ui/pages/home_page.dart';
import 'package:mobile/ui/pages/login_page.dart';
import 'package:mobile/ui/pages/register_page.dart';
import 'package:mobile/ui/pages/splash_page.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/';
  static const String home = '/home';
  static const String register = '/register';

  static Map<String, WidgetBuilder> get routes {
    return {
      splash: (context) => const SplashPage(),
      login: (context) => const LoginPage(),
      home: (context) => const HomePage(),
      register: (context) => const RegisterPage()
    };
  }
}