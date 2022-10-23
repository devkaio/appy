import 'package:flutter/services.dart';

import '../../constants.dart';

class MarkdownRepository {
  Future<String> get(String designPatternId) async {
    final path = '${Constants.markdownPath}/$designPatternId.md';
    final markdownString = await rootBundle.loadString(path);

    return markdownString;
  }
}
