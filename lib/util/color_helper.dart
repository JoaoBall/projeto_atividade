import 'package:flutter/material.dart';

class ColorHelper {
  static const int _accentColor = 0xFF536DFE;
  static const int _primaryColor = 0xFF1A237E;

  static const Color primaryColor = Color(_primaryColor);

  static const MaterialColor swatchColor = MaterialColor(_primaryColor, <int, Color>{
    50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CAE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7986CB),
    400: Color(0xFF5C6BC0),
    500: Color(0xFF3F51B5),
    600: Color(0xFF3949AB),
    700: Color(0xFF303F9F),
    800: Color(0xFF283593),
    900: Color(_primaryColor),
  });

  static const MaterialColor accentColor = MaterialColor(_accentColor, <int, Color>{
    100: Color(0xFF8C9EFF),
    200: Color(_accentColor),
    400: Color(0xFF3D5AFE),
    700: Color(0xFF304FFE),
  });
}
