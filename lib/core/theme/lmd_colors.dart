import 'package:flutter/material.dart';

abstract class LmdColors {
  // Primary and Material color
  static Color primaryColor = const Color(0xFF81B44F);
  static MaterialColor primaryColorMaterial = const MaterialColor(
    0xFF81B44F,
    <int, Color>{
      50: Color.fromRGBO(129, 180, 79, .1),
      100: Color.fromRGBO(129, 180, 79, .2),
      200: Color.fromRGBO(129, 180, 79, .3),
      300: Color.fromRGBO(129, 180, 79, .4),
      400: Color.fromRGBO(129, 180, 79, .5),
      500: Color.fromRGBO(129, 180, 79, .6),
      600: Color.fromRGBO(129, 180, 79, .7),
      700: Color.fromRGBO(129, 180, 79, .8),
      800: Color.fromRGBO(129, 180, 79, .9),
      900: Color.fromRGBO(129, 180, 79, 1),
    },
  );

  // LightTheme color
  static Color lightBgColor = const Color(0xFFF5F5F5);
  static Color lightTextColor = const Color(0xFF181a20);

  // DarkTheme color
  static Color darkBgColor = const Color(0xFF181a20);
  static Color darkTextColor = const Color(0xFFD9D9D9);
  static Color cardColor = const Color(0xFF1F222A);
}
