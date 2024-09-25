import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  String? language;
  Future<void> setLanguage(String newLanguage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = newLanguage;
    prefs.setString("language", language ?? "en");
    getLanguage();
  }

  getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language") ?? "en";
    notifyListeners();
  }
}
