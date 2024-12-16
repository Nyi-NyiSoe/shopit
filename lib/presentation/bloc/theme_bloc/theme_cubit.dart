import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopit/core/theme/app_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme) {
    loadTheme();
  }
  static final _lightTheme = AppTheme().lightTheme;
  static final _darkTheme = AppTheme().darkTheme;

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme') ?? 'light';
    emit(theme == 'light' ? _lightTheme : _darkTheme);
  }

  Future<void> toggleTheme() async {
    final isDark = state == _darkTheme;
    emit(isDark ? _lightTheme : _darkTheme);
    _saveTheme(isDark ? 'light' : 'dark');
  }

  Future<void> _saveTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }
}
