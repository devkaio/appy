// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appy/src/constants.dart';
import 'package:appy/src/data/models/design_pattern.dart';
import 'package:flutter/material.dart';

class DesignPatternDetailsHeader extends StatelessWidget {
  final DesignPattern designPattern;
  const DesignPatternDetailsHeader({
    super.key,
    required this.designPattern,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                designPattern.title,
                style: Theme.of(context).textTheme.headlineLarge?.apply(color: Colors.black87),
              ),
            ),
          ],
        ),
        const SizedBox(height: Constants.large),
        Row(
          children: [
            Flexible(
              child: Text(
                designPattern.description,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 99,
              ),
            ),
          ],
        )
      ],
    );
  }
}
