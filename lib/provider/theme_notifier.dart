import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode;

  ThemeNotifier(this._themeMode);

  getTheme() => _themeMode;

  setTheme(ThemeMode themeMode) async {
    _themeMode = themeMode;
    onThemeChanged(themeMode);
    notifyListeners();
  }

  onThemeChanged(ThemeMode themeMode) async {
    var themeSelection = themeMode == ThemeMode.dark ? true : false;
    var sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool("isDarkTheme", themeSelection);
  }
}
