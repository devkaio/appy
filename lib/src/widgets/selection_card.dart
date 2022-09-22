import 'package:flutter/material.dart';

import '../constants.dart';

class SelectionCard extends StatelessWidget {
  final Color backgroundColor;
  final String backgroundHeroTag;
  final String contentText;
  final String contentHeader;
  final VoidCallback onTap;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  SelectionCard({
    Key? key,
    required this.backgroundColor,
    required this.backgroundHeroTag,
    required this.contentText,
    required this.contentHeader,
    required this.onTap,
    this.titleStyle,
    this.subtitleStyle,
  }) : super(key: key);

  final _selectionCardBorderRadius = BorderRadius.circular(10.0);
  final _selectionCardHeight = 112.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          borderRadius: _selectionCardBorderRadius,
          elevation: 8.0,
          child: Hero(
            tag: backgroundHeroTag,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: _selectionCardBorderRadius,
              ),
              height: _selectionCardHeight,
            ),
          ),
        ),
        Material(
          borderRadius: _selectionCardBorderRadius,
          color: Colors.transparent,
          child: InkWell(
            highlightColor: Colors.transparent,
            borderRadius: _selectionCardBorderRadius,
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(Constants.large),
              height: _selectionCardHeight,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contentHeader,
                    style: titleStyle ?? Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: Constants.large),
                  Text(
                    contentText,
                    style:
                        subtitleStyle ?? Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
