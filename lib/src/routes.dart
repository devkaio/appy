import 'package:appy/src/constants.dart';
import 'package:appy/src/data/models/design_pattern_category.dart';
import 'package:appy/src/pages/category/category.dart';
import 'package:appy/src/pages/home/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.initialRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case Constants.categoryRoute:
        return MaterialPageRoute(
          builder: (_) => Category(
            category: settings.arguments as DesignPatternCategory,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
