import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class LocalizationManager extends ChangeNotifier{
  Locale deviceLocale = PlatformDispatcher.instance.locale;

  Map<String,String> _localizedValues = {};

  Locale get currentLocale => deviceLocale;

  String translate(String key){
    return _localizedValues[key]??key;
  }

  LocalizationManager(){
    _loadLocale();
  }

  Future<void> changeLocale(Locale local) async{
    deviceLocale = local;
    await _saveLocale(local.languageCode);
    await _loadLanguage();
    notifyListeners();
  }

  Future<void> _loadLanguage() async{
    try{
    String jsonString = await rootBundle.loadString('assets/lang/${deviceLocale.languageCode}.json');
    Map<String,dynamic> jsonMap = json.decode(jsonString);
    _localizedValues = jsonMap.map((key,value)=>MapEntry(key, value.toString()));
    }catch(e){
      print("Dil dosyası yüklenirken hata oluştu: $e");
      _localizedValues = {};
    }
  }

  Future<void> _saveLocale(String languageCode) async{
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('languageCode',languageCode);
  }

  Future<void> _loadLocale() async{
    final preferences = await SharedPreferences.getInstance();
    final savedLanguageCode = preferences.getString("languageCode") ?? PlatformDispatcher.instance.locale.languageCode;
    deviceLocale = Locale(savedLanguageCode);
    await _loadLanguage();
    notifyListeners();
  }
}