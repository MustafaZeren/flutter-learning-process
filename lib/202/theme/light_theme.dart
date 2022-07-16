import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late final ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 78, 33, 92),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
          )),
      scaffoldBackgroundColor: Colors.white,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 228, 154, 250)),
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(
              onPrimary: _lightColor.purple,
              onSecondary: _lightColor.blueMenia)),
      colorScheme: const ColorScheme.light(),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.green),
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(fontSize: 20, color: _lightColor._textColor),
          ),
    );
  }
}

class _LightColor {
  final Color _textColor = Colors.black;
  final Color blueMenia = const Color.fromARGB(95, 188, 248, 1);
  final Color purple = Colors.purple;
}
