import 'package:flutter/material.dart';

ThemeData green = ThemeData(
    primaryColor: Colors.green.shade300,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green.shade50);

ThemeData red = ThemeData(
    primaryColor: Colors.red.shade300,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red.shade50);

class ThemeColorData with ChangeNotifier {
  bool _isGreen = false;
  
  bool get isGreen=>_isGreen;

  ThemeData get themeColor {
    return _isGreen ? green : red;
  }

  void toggleTheme() {
    _isGreen = !_isGreen;
    notifyListeners();
  }
}
