import 'package:flutter/material.dart';
import '../constant/color_constant.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.transparent,
    scrolledUnderElevation: 0,
  ),
    scaffoldBackgroundColor: ColorConstant.darkBackground,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    useMaterial3: true,
  ).copyWith(
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle:  WidgetStatePropertyAll(TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          )),
          backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        ),
      ));
}