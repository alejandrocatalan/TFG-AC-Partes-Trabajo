import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.teal,
    fontFamily: 'Roboto',
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange),
  );
}
