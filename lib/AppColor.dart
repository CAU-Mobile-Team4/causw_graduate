import 'package:flutter/material.dart';

class AppColor extends Color {
  AppColor(super.value);

  static const background = Color(0xFFEEF3F9);
  static const main = Color(0xFF33AAF3);
  static const mainOpacity = Color(0x9933AAF3);
  static const text = Color(0xFFC7C8CF);
  static const yellow = Color(0xFFFBC212);
  static const purple = Color(0xFFB0B2D9);

  static MaterialColor createMaterialColor(Color color) {
    List<int> strengths = <int>[
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900
    ];

    Map<int, Color> swatch = <int, Color>{};
    final int primary = color.value;
    for (int strength in strengths) {
      final double blend = 1.0 - (strength / 900);
      swatch[strength] = Color.lerp(Colors.white, color, blend)!;
    }
    return MaterialColor(primary, swatch);
  }
}
