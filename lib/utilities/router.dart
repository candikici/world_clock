import 'package:dop_case/constants/routes.dart';
import 'package:dop_case/view/pages/home_page.dart';
import 'package:dop_case/view/pages/single_timezone.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WorldClockRoutes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case WorldClockRoutes.singleTimezone:
        return MaterialPageRoute(
            builder: (_) => SingleTimezone(
                timezone: (settings.arguments as Map)["timezone"]));
      default:
        return null;
    }
  }
}
