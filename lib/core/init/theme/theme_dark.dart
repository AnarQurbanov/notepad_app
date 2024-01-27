import 'package:flutter/material.dart';

class ThemeDark {
  ThemeData get theme => ThemeData.dark().copyWith(
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
      );
}
