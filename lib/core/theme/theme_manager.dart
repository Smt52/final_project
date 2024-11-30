import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;


  ThemeManager(){
    _loadTheme();
  }

  void toggleTheme() async{
    _themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    print("Toggled");
    notifyListeners();
    await _saveTheme();
  }

  Future<void> _loadTheme() async{
    final preferences = await SharedPreferences.getInstance();
    final isModeDark = preferences.getBool("isModeDark");

    if(isModeDark == null){
      final deviceTheme = PlatformDispatcher.instance.platformBrightness;
      _themeMode = deviceTheme == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    }else{
      _themeMode = isModeDark ? ThemeMode.dark : ThemeMode.light;
    }



    notifyListeners();
  }

  Future<void> _saveTheme() async{
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool("isModeDark", themeMode == ThemeMode.dark);
  }
}