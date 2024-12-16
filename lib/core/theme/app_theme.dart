import 'package:flutter/material.dart';
import 'package:shopit/core/theme/app_color.dart';

class AppTheme {
  final lightTheme = ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          color: AppColor.lightPrimaryTextColor,
          fontSize: 32.0,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          color: AppColor.lightSecondaryTextColor,
          fontSize: 28.0,
          fontWeight: FontWeight.w600),
      displaySmall: TextStyle(
          color: AppColor.lightSecondaryTextColor,
          fontSize: 24.0,
          fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(
          color: AppColor.lightPrimaryTextColor,
          fontSize: 20.0,
          fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(
          color: AppColor.lightSecondaryTextColor,
          fontSize: 18.0,
          fontWeight: FontWeight.normal),
      bodySmall: TextStyle(
          color: AppColor.lightSecondaryTextColor,
          fontSize: 16.0,
          fontWeight: FontWeight.normal),
      labelLarge: TextStyle(
          color: AppColor.lightPrimaryTextColor,
          fontSize: 14.0,
          fontWeight: FontWeight.w600),
      labelMedium: TextStyle(
          color: AppColor.lightSecondaryTextColor,
          fontSize: 12.0,
          fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
          color: AppColor.lightSecondaryTextColor,
          fontSize: 10.0,
          fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          color: AppColor.lightPrimaryTextColor,
          fontSize: 22.0,
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: AppColor.lightSecondaryTextColor,
          fontSize: 20.0,
          fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          color: AppColor.lightSecondaryTextColor,
          fontSize: 18.0,
          fontWeight: FontWeight.w500),
    ),
    primaryColor: AppColor.lightPrimaryTextColor,
    iconTheme: const IconThemeData(color: AppColor.lightPrimaryTextColor),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            iconColor:
                WidgetStateProperty.all(AppColor.lightPrimaryTextColor))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                WidgetStateProperty.all(AppColor.lightPrimaryTextColor),
            textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 20)),
            backgroundColor:
                WidgetStateProperty.all(AppColor.lightAppBarBackgroundColor))),
    scaffoldBackgroundColor: AppColor.lightScaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.lightAppBarBackgroundColor,
        iconTheme: IconThemeData(color: AppColor.lightPrimaryTextColor)),
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: AppColor.lightPrimaryTextColor,
          hintStyle: TextStyle(color: AppColor.lightSecondaryTextColor),
        )
  );

  final darkTheme = ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          color: AppColor.darkPrimaryTextColor,
          fontSize: 32.0,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          color: AppColor.darkSecondaryTextColor,
          fontSize: 28.0,
          fontWeight: FontWeight.w600),
      displaySmall: TextStyle(
          color: AppColor.darkSecondaryTextColor,
          fontSize: 24.0,
          fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(
          color: AppColor.darkPrimaryTextColor,
          fontSize: 20.0,
          fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(
          color: AppColor.darkSecondaryTextColor,
          fontSize: 18.0,
          fontWeight: FontWeight.normal),
      bodySmall: TextStyle(
          color: AppColor.darkSecondaryTextColor,
          fontSize: 16.0,
          fontWeight: FontWeight.normal),
      labelLarge: TextStyle(
          color: AppColor.darkPrimaryTextColor,
          fontSize: 14.0,
          fontWeight: FontWeight.w600),
      labelMedium: TextStyle(
          color: AppColor.darkSecondaryTextColor,
          fontSize: 12.0,
          fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
          color: AppColor.darkSecondaryTextColor,
          fontSize: 10.0,
          fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          color: AppColor.darkPrimaryTextColor,
          fontSize: 22.0,
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: AppColor.darkSecondaryTextColor,
          fontSize: 20.0,
          fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          color: AppColor.darkSecondaryTextColor,
          fontSize: 18.0,
          fontWeight: FontWeight.w500),
    ),
    primaryColor: AppColor.darkPrimaryTextColor,
    iconTheme: const IconThemeData(color: AppColor.darkPrimaryTextColor),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            iconColor: WidgetStateProperty.all(AppColor.darkPrimaryTextColor))),
    scaffoldBackgroundColor: AppColor.darkScaffoldBackgroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                WidgetStateProperty.all(AppColor.darkPrimaryTextColor),
            textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 20)),
            backgroundColor:
                WidgetStateProperty.all(AppColor.darkAppBarBackgroundColor))),
                inputDecorationTheme: InputDecorationTheme(
                  prefixIconColor: AppColor.darkPrimaryTextColor,
          hintStyle: TextStyle(color: AppColor.darkSecondaryTextColor),
                ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.darkAppBarBackgroundColor,
    ),
  );
}
