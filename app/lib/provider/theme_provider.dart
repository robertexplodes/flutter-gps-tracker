import 'package:flutter/material.dart';
import 'package:gpstracking/domain/theme.dart';

class ThemeProvider with ChangeNotifier {

  ThemeData _themeData;
  ThemeData get themeData => _themeData;

  ThemeProvider(this._themeData);

  void changeTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void switchTheme() {
    if (_themeData == Themes().darkTheme) {
      changeTheme(Themes().lightTheme);
    } else {
      changeTheme(Themes().darkTheme);
    }
  }
}