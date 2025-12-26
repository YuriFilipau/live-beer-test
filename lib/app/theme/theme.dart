import 'package:flutter/material.dart';
import 'package:live_beer/app/constants/app_styles.dart';

ThemeData buildTheme() {
  final base = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppStyles.buttonYellow,
    brightness: Brightness.light,
  );

  return base.copyWith(
    scaffoldBackgroundColor: AppStyles.bgGrey,
    textTheme: base.textTheme.apply(
      bodyColor: AppStyles.text,
      displayColor: AppStyles.text,
    ),
    cardTheme: const CardThemeData(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppStyles.radius),
        ),
      ),
    ),
  );
}