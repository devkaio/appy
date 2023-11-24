import 'package:appy/src/constants.dart';
import 'package:appy/src/routes.dart';
import 'package:flutter/material.dart';

import 'themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APPY',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: Constants.initialRoute,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
