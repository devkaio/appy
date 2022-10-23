import 'dart:convert';

import 'package:flutter/services.dart';

import '../../constants.dart';
import '../models/design_pattern_category.dart';

class DesignPatternCategoriesRepository {
  Future<List<DesignPatternCategory>> get() async {
    final menuJson =
        await rootBundle.loadString(Constants.designPatternsDataPath);

    final List decodedList = jsonDecode(menuJson);

    final designPatternCategoryJsonList =
        decodedList.map((e) => DesignPatternCategory.fromMap(e)).toList();

    return designPatternCategoryJsonList;
  }
}
