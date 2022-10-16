import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode;

  ThemeNotifier(this._themeMode);

  getTheme() => _themeMode;

  setTheme(ThemeMode themeMode) async {
    _themeMode = themeMode;
    notifyListeners();
  }
}
