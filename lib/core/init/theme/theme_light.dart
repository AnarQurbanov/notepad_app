import 'package:flutter/material.dart';

class ThemeLight {
  ThemeData get theme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xffe1e2e6),
        focusColor: Colors.blue,
        cardColor: Colors.white,
        errorColor: Colors.red,
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
      );
}
