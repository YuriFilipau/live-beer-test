import 'package:flutter/material.dart';
import 'package:live_beer/app/design/design_tokens.dart';

ThemeData buildTheme() {
  final base = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: DT.buttonYellow,
    brightness: Brightness.light,
  );

  return base.copyWith(
    scaffoldBackgroundColor: DT.bgGrey,
    textTheme: base.textTheme.apply(
      bodyColor: DT.text,
      displayColor: DT.text,
    ),
    cardTheme: const CardThemeData(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(DT.radius),
        ),
      ),
    ),
  );
}