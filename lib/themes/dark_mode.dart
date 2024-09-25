import 'package:flutter/material.dart';

ThemeData mydarkMode = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.grey.shade900,
    titleTextStyle: const TextStyle(
      color: Colors.amber,
    ),
  ),
  colorScheme: ColorScheme.dark(
    // ignore: deprecated_member_use
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade300,
    inverseSurface: Colors.amber,
  ),
);
