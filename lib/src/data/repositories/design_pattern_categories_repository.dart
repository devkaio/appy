import 'dart:convert';

import 'package:flutter/services.dart';

import '../../constants.dart';
import '../models/design_pattern_category.dart';

class DesignPatternCategoriesRepository {
  Future<List<DesignPatternCategory>> get() async {
    final menuJson =
        await rootBundle.loadString(Constants.designPatternsDataPath);

    final designPatternCategoryJsonList = List<DesignPatternCategory>.from(
      (jsonDecode(menuJson) as List).map(
        (e) => DesignPatternCategory.fromJson(e),
      ),
    );

    return designPatternCategoryJsonList;
  }
}
