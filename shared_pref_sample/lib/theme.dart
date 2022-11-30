import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData green = ThemeData(
    primaryColor: Colors.green.shade300,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green.shade50);

ThemeData red = ThemeData(
    primaryColor: Colors.red.shade300,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red.shade50);

class ThemeColorData with ChangeNotifier {
 late SharedPreferences _sharedPrefObjec;

  bool _isGreen = true;
  
  bool get isGreen=>_isGreen;

  ThemeData get themeColor {
    return _isGreen ? green : red;
  }

  void toggleTheme() {
    _isGreen = !_isGreen;
    saveThemeToSharedPref(_isGreen);
    notifyListeners();
  }

  Future<void> createSharedPrefObject()async{
   _sharedPrefObjec= await SharedPreferences.getInstance();
  } 

  void saveThemeToSharedPref(bool value){
    _sharedPrefObjec.setBool('themeData', value);

  }

  void loadThemeThemeSharedPref()async{
    await createSharedPrefObject();
    _isGreen =_sharedPrefObjec.getBool('themeData') ?? true;

  //   if(_sharedPrefObjec.getBool('themeData')==null){
  //     _isGreen=true;
  //   }else{
  //   _sharedPrefObjec.getBool('themeData');
  //   }
  // }
}
}