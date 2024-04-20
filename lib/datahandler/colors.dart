import 'package:flutter/material.dart';

class AppColors {
  static  Color primary = HexColor('#4F772E');
  static const Color secondary = Color(0xFFF8F8F8);
  static const Color third = Color(0xFFFFFFFF);
  static const Color forth = Color(0xFF8D8D8D);
  static const Color fifth = Color(0xFF05215B);
  static const Color sixth = Color(0xFF242424);
  static const Color seventh = Colors.black;
  static const Color eigth = Color(0XFFE1E1E1);
  static const Color ninth = Colors.red;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
