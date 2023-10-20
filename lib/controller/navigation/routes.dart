import 'package:flutter/material.dart';

import '../../view/global/screen/no_routes_screen.dart';
import '../../view/screens/detail/detail_screen.dart';
import '../../view/screens/home/home_screen.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> onGenerative(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case RoutesName.detailScreen:
        return MaterialPageRoute(
          builder: (_) => const DetailScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => NoRoutesScreen(
            routeName: settings.name.toString(),
          ),
        );
    }
  }
}
