import 'package:flutter/material.dart';

import 'themes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APPY',
      theme: lightTheme,
    );
  }
}
