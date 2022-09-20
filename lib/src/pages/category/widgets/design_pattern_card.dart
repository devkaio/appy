// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appy/src/constants.dart';
import 'package:appy/src/data/models/design_pattern.dart';
import 'package:appy/src/widgets/selection_card.dart';
import 'package:flutter/cupertino.dart';

class DesignPatternCard extends StatelessWidget {
  final DesignPattern designPattern;

  const DesignPatternCard({
    Key? key,
    required this.designPattern,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionCard(
      backgroundColor: Constants.defaultBackGroundColor,
      backgroundHeroTag: '${designPattern.id}_background',
      contentHeader: designPattern.title,
      contentText: designPattern.description,
      onTap: () => Navigator.pushNamed(
        context,
        designPattern.route,
        arguments: designPattern,
      ),
    );
  }
}
