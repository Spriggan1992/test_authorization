import 'package:flutter/material.dart';
import 'package:test_authorization/auth/presentation/shared/res/colors/colors.dart';

/// Set up general theme for material.
ThemeData setUpThemeData() {
  final ThemeData theme = ThemeData();
  return theme.copyWith(
    primaryColor: Colors.white,
    colorScheme: theme.colorScheme.copyWith(secondary: Colors.red),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Palette.primaryColor,
        ),
      ),
    ),
  );
}
