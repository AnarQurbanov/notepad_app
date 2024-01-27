import 'package:flutter/material.dart';

import '../../constants/enums/app_theme_enum.dart';
import '../theme/theme_dark.dart';
import '../theme/theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = ThemeLight().theme;
  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = ThemeLight().theme;
    } else
      _currentTheme = ThemeDark().theme;
    notifyListeners();
  }
}
