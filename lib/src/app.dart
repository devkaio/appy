import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APPY',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
    );
  }
}