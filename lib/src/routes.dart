import 'package:appy/src/constants.dart';
import 'package:appy/src/data/models/design_pattern.dart';
import 'package:appy/src/data/models/design_pattern_category.dart';
import 'package:appy/src/pages/category/category.dart';
import 'package:appy/src/pages/design_pattern_details/design_pattern_details.dart';
import 'package:appy/src/pages/home/home.dart';
import 'package:flutter/material.dart';

import 'widgets/introduction/introduction.dart';

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
      case "/intro":
        return MaterialPageRoute(
            builder: (_) => DesignPatternDetails(
                  designPattern: settings.arguments as DesignPattern,
                  example: const Introduction(),
                ));
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
