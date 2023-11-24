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
    super.key,
    required this.backgroundColor,
    required this.backgroundHeroTag,
    required this.contentText,
    required this.contentHeader,
    required this.onTap,
    this.titleStyle,
    this.subtitleStyle,
  });

  final _selectionCardBorderRadius = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: Constants.medium,
          child: Material(
            borderRadius: _selectionCardBorderRadius,
            elevation: 8.0,
            child: Hero(
              tag: backgroundHeroTag,
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: _selectionCardBorderRadius,
                ),
              ),
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
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          contentHeader,
                          style: titleStyle ?? Theme.of(context).textTheme.titleLarge,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.large),
                  Text(
                    contentText,
                    style: subtitleStyle ?? Theme.of(context).textTheme.bodyMedium,
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
