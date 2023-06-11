import 'package:flutter/material.dart';

class ThemeState {
  ThemeData themeLightState = ThemeData(
    iconTheme: const IconThemeData(color: Colors.blue),
    inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)))),
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.black))),
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
