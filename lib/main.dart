import 'package:flutter/material.dart';

import 'controller/navigation/routes.dart';
import 'controller/navigation/routes_name.dart';
import 'view/global/global_theme.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: GlobalTheme.themeData,
      onGenerateRoute: Routes.onGenerative,
      initialRoute: RoutesName.homeScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
