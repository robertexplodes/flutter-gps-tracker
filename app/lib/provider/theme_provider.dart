import 'package:flutter/material.dart';
import 'package:gpstracking/domain/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {

  ThemeData get themeData => Themes.getTheme(currentTheme);
  ThemeType currentTheme;

  ThemeProvider(this.currentTheme) {
    loadSavedTheme();
  }


  void loadSavedTheme() async {
    var prefs = await SharedPreferences.getInstance();
    var theme = prefs.getString("theme");
    theme ??= "system";
    currentTheme = Themes.getThemeTypeFromString(theme);
  }

  void setTheme(ThemeType themeType) {
    currentTheme = themeType;
    notifyListeners();
  }

  void writeTheme(ThemeType theme) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("theme", theme.name);
  }
}