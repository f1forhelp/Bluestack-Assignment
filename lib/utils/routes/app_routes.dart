import 'package:bluestack_assignment/presentation/pages/authentication/login_screen.dart';
import 'package:bluestack_assignment/presentation/pages/dashboard/home_page.dart';
import 'package:bluestack_assignment/utils/constants/pref_constants.dart';
import 'package:bluestack_assignment/utils/di/app_init.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginPage.id:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case HomePage.id:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
    }
  }

  static String? getInitialRoutes() {
    if (AppInit.pref.getString(KPref.userId) == "" ||
        AppInit.pref.getString(KPref.userId) == null) {
      return LoginPage.id;
    } else {
      return HomePage.id;
    }
  }
}
