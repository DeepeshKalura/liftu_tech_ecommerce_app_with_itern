import 'package:flutter/material.dart';

import '../../model/product/product.dart';
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
        final Map arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => DetailScreen(
            product: arguments['product'] as Product,
            index: arguments['index'],
          ),
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
