import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../data/models/design_pattern_category.dart';
import '../../../widgets/selection_card.dart';

class HomeMenuCard extends StatelessWidget {
  final DesignPatternCategory category;
  const HomeMenuCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionCard(
      backgroundColor: Color(category.color),
      backgroundHeroTag: "${category.id}_background",
      contentHeader: category.title,
      contentText: category.patterns.length > 1
          ? '${category.patterns.length} patterns'
          : '${category.patterns.length} pattern',
      titleStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontSize: Constants.mediumLarge,
            color: Colors.white,
          ),
      subtitleStyle: Theme.of(context).textTheme.subtitle2?.copyWith(
            fontSize: Constants.large,
            color: Colors.white,
          ),
      onTap: () => Navigator.pushNamed(
        context,
        Constants.categoryRoute,
        arguments: category,
      ),
    );
  }
}
