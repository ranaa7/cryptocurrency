import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeprovider extends ChangeNotifier{
  ThemeMode themeMode=ThemeMode.system;
  Future <void> savethememode (ThemeMode mode) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String thememode='system';
    switch(mode){
      case ThemeMode.system:
      this.themeMode=ThemeMode.system;
      thememode ='system';
      break;
      case ThemeMode.dark:
        this.themeMode=ThemeMode.dark;
        thememode ='dark';
        break;
      case ThemeMode.light:
        this.themeMode=ThemeMode.light;
        thememode ='light';
        break;
    }
    notifyListeners();
    sharedPreferences .setString("thememode", thememode);
  }

  void getThemeModeFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeModeString = prefs.getString("themeMode");
    if (themeModeString == "System") {
      themeMode = ThemeMode.system;
    } else if (themeModeString == "Light") {
      themeMode = ThemeMode.light;
    } else if (themeModeString == "Dark") {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

}
