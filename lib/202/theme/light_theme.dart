import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late final ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.green,
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      )),
      scaffoldBackgroundColor: Colors.white70,
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.green),
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
