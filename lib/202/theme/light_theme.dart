import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late final ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      )),
      scaffoldBackgroundColor: Colors.white24,
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.green),
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(
              onPrimary: Colors.purple, onSecondary: _lightColor.blueMenia)),
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
  final Color _textColor = Color.fromARGB(255, 149, 177, 24);
  final Color blueMenia = const Color.fromARGB(95, 188, 248, 1);
}
