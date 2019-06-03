import 'package:flutter/material.dart';

class BaseTheme {
  static ThemeData _theme = new ThemeData.dark().copyWith(
    primaryColor: Colors.amberAccent,
  );

  static get theme => _theme;
}
