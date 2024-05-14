import 'package:biemart/features/auth/presentation/pages/login.dart';
import 'package:biemart/features/auth/presentation/pages/registration.dart';
import 'package:biemart/features/home/presentation/pages/home.dart';
import 'package:biemart/features/home/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return _materialRoute(const LoginPage());
      case '/registration':
        return _materialRoute(const RegistrationPage());
      case '/home':
        return _materialRoute(const MainPage());
      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
