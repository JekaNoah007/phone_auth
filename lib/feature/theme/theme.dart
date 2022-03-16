import 'package:flutter/material.dart';

part 'colors.dart';

abstract class AppTheme {
  static BorderRadius br = BorderRadius.circular(12);

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.color003057,
  );
}
