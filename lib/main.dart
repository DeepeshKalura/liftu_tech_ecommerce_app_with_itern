import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'controller/api/fake_api.dart';
import 'controller/navigation/routes.dart';
import 'controller/navigation/routes_name.dart';
import 'controller/view/home_screen_controller.dart';
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
    return MultiProvider(
      providers: [
        //     ChangeNotifierProvider(
        //       create: (_) => FakeAPI(),
        //     ),
        ChangeNotifierProvider(
          create: (_) => HomeScreenController(),
        )
      ],
      child: MaterialApp(
        theme: GlobalTheme.themeData,
        onGenerateRoute: Routes.onGenerative,
        initialRoute: RoutesName.homeScreen,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
