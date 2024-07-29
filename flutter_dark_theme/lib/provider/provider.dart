import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemeProvider extends ChangeNotifier{


  late SharedPreferences storage;

  final darkTheme = ThemeData(
    primaryColor: Colors.black12,
    primaryColorDark: Colors.black12,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 15
      )
    )
  );

  final lightTheme = ThemeData(
      primaryColor: Colors.white,
      primaryColorDark: Colors.white,
      brightness: Brightness.light,
      textTheme: TextTheme(
          titleMedium: TextStyle(
              fontSize: 25
          )
      )
  );



  bool _themeValue = false;
  bool get isDark => _themeValue;
  void changeThemeToDarkAndLight(){
    _themeValue = !_themeValue;
    storage.setBool('isDark', _themeValue);
    notifyListeners();
  }

  init() async {
    storage = await SharedPreferences.getInstance();
    _themeValue = storage.getBool('isDark')??false;
    notifyListeners();
  }
}