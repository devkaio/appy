import 'dart:io';

import 'package:appy/src/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformButton extends StatelessWidget {
  const PlatformButton({
    super.key,
    required this.text,
    this.onPressed,
    this.materialColor = Colors.blue,
    this.materialTextColor = Colors.white,
  });

  final VoidCallback? onPressed;
  final Color materialColor;
  final Color materialTextColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.small),
      child: kIsWeb || Platform.isAndroid
          ? MaterialButton(
              onPressed: onPressed,
              color: materialColor,
              textColor: materialTextColor,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.white,
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            )
          : CupertinoButton(
              onPressed: onPressed,
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
