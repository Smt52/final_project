import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  ThemeManager() {
    _loadTheme();
  }

  void toggleTheme() async {
    _themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    await _saveTheme();
  }

  Future<void> _loadTheme() async {
    final preferences = await SharedPreferences.getInstance();
    final isModeDark = preferences.getBool("isModeDark");

    if (isModeDark == null) {
      _themeMode =  ThemeMode.light;
    } else {
      _themeMode = isModeDark ? ThemeMode.dark : ThemeMode.light;
    }
  }

  Future<void> _saveTheme() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool("isModeDark", themeMode == ThemeMode.dark);
  }
}
