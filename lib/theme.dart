import 'package:flutter/material.dart';

class ThemeState {
  ThemeData themeLightState = ThemeData(
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.black))),
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme:
        const AppBarTheme(backgroundColor: Color.fromARGB(255, 163, 228, 224)),
    brightness: Brightness.light,
  );

  ThemeData themeDarkState = ThemeData(
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white))),
      appBarTheme:
          const AppBarTheme(backgroundColor: Color.fromARGB(255, 31, 30, 30)),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark);

  final ValueNotifier isDarkState = ValueNotifier<bool>(false);
}
