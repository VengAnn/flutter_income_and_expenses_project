import 'package:flutter/material.dart';

ThemeData ligthMode = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  colorScheme: ColorScheme.light(
    // ignore: deprecated_member_use
    background: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade900,
  ),
);
