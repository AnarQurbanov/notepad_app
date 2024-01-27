import 'package:flutter/material.dart';

class ApplicationAppBar {
  final String title;
  final List<Widget> actions;

  ApplicationAppBar({required this.title, required this.actions});

  AppBar get applicationAppBar {
    return AppBar(
      elevation: 0,
      title: Text(
        title,
      ),
      actions: actions,
    );
  }
}
