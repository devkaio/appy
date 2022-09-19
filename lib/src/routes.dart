import 'package:appy/src/constants.dart';
import 'package:appy/src/pages/home/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.initialRoute:
        return MaterialPageRoute(builder: (_) => Home());
      //TODO other routes
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
