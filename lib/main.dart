import 'package:flutter/material.dart';
import 'package:shopit/core/theme/app_theme.dart';
import 'package:shopit/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop It',
      theme: AppTheme().lightTheme,
      home: HomePage(),
    );
  }
}
