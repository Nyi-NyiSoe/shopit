import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopit/core/theme/app_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  static final _lightTheme = AppTheme().lightTheme;
  static final _darkTheme = AppTheme().darkTheme;

  ThemeCubit() : super(_lightTheme) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme') ?? 'light';
    emit(theme == 'dark' ? _darkTheme : _lightTheme);
  }

  Future<void> toggleTheme() async {
    final isDark = state == _darkTheme;
    emit(isDark ? _lightTheme : _darkTheme);
    final newTheme = isDark ? 'light' : 'dark';
    await _saveTheme(newTheme);
  }

  Future<void> _saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }
}
