import 'package:appy/src/constants.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(background: Constants.defaultBackGroundColor),
  typography: Typography(
    englishLike: Typography.englishLike2021,
    tall: Typography.tall2021,
  ),
);
