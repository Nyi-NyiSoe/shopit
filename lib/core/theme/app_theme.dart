import 'package:flutter/material.dart';
import 'package:shopit/core/theme/app_color.dart';

class AppTheme {
  final lightTheme = ThemeData(
    textTheme: const TextTheme(
      displayLarge:
          TextStyle(color: AppColor.lightPrimaryTextColor, fontSize: 32.0),
      displayMedium:
          TextStyle(color: AppColor.lightSecondaryTextColor, fontSize: 28.0),
      displaySmall:
          TextStyle(color: AppColor.lightSecondaryTextColor, fontSize: 24.0),
      bodyLarge:
          TextStyle(color: AppColor.lightPrimaryTextColor, fontSize: 20.0),
      bodyMedium:
          TextStyle(color: AppColor.lightSecondaryTextColor, fontSize: 18.0),
      bodySmall:
          TextStyle(color: AppColor.lightSecondaryTextColor, fontSize: 16.0),
      labelLarge:
          TextStyle(color: AppColor.lightPrimaryTextColor, fontSize: 14.0),
      labelMedium:
          TextStyle(color: AppColor.lightSecondaryTextColor, fontSize: 12.0),
      labelSmall:
          TextStyle(color: AppColor.lightSecondaryTextColor, fontSize: 10.0),
      titleLarge:
          TextStyle(color: AppColor.lightPrimaryTextColor, fontSize: 22.0),
      titleMedium:
          TextStyle(color: AppColor.lightSecondaryTextColor, fontSize: 20.0),
      titleSmall:
          TextStyle(color: AppColor.lightSecondaryTextColor, fontSize: 18.0),
    ),
    primaryColor: AppColor.lightPrimaryTextColor,
    scaffoldBackgroundColor: AppColor.lightScaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.lightAppBarBackgroundColor,
        iconTheme: IconThemeData(color: AppColor.lightPrimaryTextColor)),
  );

  final darkTheme = ThemeData(
    textTheme: const TextTheme(
      displayLarge:
          TextStyle(color: AppColor.darkPrimaryTextColor, fontSize: 32.0),
      displayMedium:
          TextStyle(color: AppColor.darkSecondaryTextColor, fontSize: 28.0),
      displaySmall:
          TextStyle(color: AppColor.darkSecondaryTextColor, fontSize: 24.0),
      bodyLarge:
          TextStyle(color: AppColor.darkPrimaryTextColor, fontSize: 20.0),
      bodyMedium:
          TextStyle(color: AppColor.darkSecondaryTextColor, fontSize: 18.0),
      bodySmall:
          TextStyle(color: AppColor.darkSecondaryTextColor, fontSize: 16.0),
      labelLarge:
          TextStyle(color: AppColor.darkPrimaryTextColor, fontSize: 14.0),
      labelMedium:
          TextStyle(color: AppColor.darkSecondaryTextColor, fontSize: 12.0),
      labelSmall:
          TextStyle(color: AppColor.darkSecondaryTextColor, fontSize: 10.0),
      titleLarge:
          TextStyle(color: AppColor.darkPrimaryTextColor, fontSize: 22.0),
      titleMedium:
          TextStyle(color: AppColor.darkSecondaryTextColor, fontSize: 20.0),
      titleSmall:
          TextStyle(color: AppColor.darkSecondaryTextColor, fontSize: 18.0),
    ),
    primaryColor: AppColor.darkPrimaryTextColor,
    scaffoldBackgroundColor: AppColor.darkScaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.darkAppBarBackgroundColor,
    ),
  );
}
