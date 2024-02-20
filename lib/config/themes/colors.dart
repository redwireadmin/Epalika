import 'package:flutter/material.dart';

class CustomColors {
  // static const Color primaryColor = Color(0xFF33CC66);
  // static const Color primaryColor = Color(0xFF789461);
  static const Color primaryColor = Color(0xFF638889);
  // static const Color primaryColor = Color(0xFF83C0C1);

  static const Color primaryColor1 = Color(0xFF336699);
  static const Color appWhite = Color(0xFFE0F3F9);
  static const Color appBlack = Color(0xff050a0f);
  static const textFieldBorderColor = Color(0xffB8B8D2);
  static const Color primaryTextColor = Color(0xffa73371);

//darker shades for primaryColor1 - blue
  static const Color primaryColor11 = Color(0xFF336699); //20%
  static const Color primaryColor12 = Color(0xff2c5884); //40%
  static const Color primaryColor13 = Color(0xff224567); //60%
  static const Color primaryColor14 = Color(0xff19314a); //70%
  //icon and spash background primaryColor4
  // static const Color primaryColor15 = Color(0xff0f1d2c); //80%
  // static const Color primaryColor16 = Color(0xff050a0f); //90
  //used as background in topcontainers linear gradient of 12 and 1

//pallete

  static const MaterialColor pallete1 =
      MaterialColor(_pallete2PrimaryValue, <int, Color>{
    50: Color(0xFFE7F9ED),
    100: Color(0xFFC2F0D1),
    200: Color(0xFF99E6B3),
    300: Color(0xFF70DB94),
    400: Color(0xFF52D47D),
    500: Color(_pallete2PrimaryValue),
    600: Color(0xFF2EC75E),
    700: Color(0xFF27C053),
    800: Color(0xFF20B949),
    900: Color(0xFF14AD38),
  });
  static const int _pallete2PrimaryValue = 0xFF33CC66;

  static const MaterialColor pallete2Accent =
      MaterialColor(_pallete2AccentValue, <int, Color>{
    100: Color(0xFFE0FFE6),
    200: Color(_pallete2AccentValue),
    400: Color(0xFF7AFF94),
    700: Color(0xFF60FF7F),
  });
  static const int _pallete2AccentValue = 0xFFADFFBD;
}
