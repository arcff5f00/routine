// core/colors.dart

import 'package:flutter/material.dart';

class AppColors {
  // Dark theme colors
  static const Color darkBackground = Color(0xFF202020);
  static const Color darkSurface = Color(0xFF2C2C2C);
  static const Color darkPrimary = Color(0xFF2383E2); // Default accent color
  static const Color darkSecondary = Color(0xFF383838);
  static const Color darkOnBackground = Color(0xFFF9F9F7);
  static const Color darkOnSurface = Color(0xFFF9F9F7);
  static const Color darkOnPrimary = Color(0xFFF9F9F7);
  static const Color darkOnSecondary = Color(0xFF8F8F8D);

  // Light theme colors
  static const Color lightBackground = Color(0xFFF9F9F7);
  static const Color lightSurface = Color(0xFFEEEEEC);
  static const Color lightPrimary = Color(0xFF2383E2); // Default accent color
  static const Color lightSecondary = Color(0xFFE8E8E6);
  static const Color lightOnBackground = Color(0xFF202020);
  static const Color lightOnSurface = Color(0xFF202020);
  static const Color lightOnPrimary = Color(0xFFF9F9F7);
  static const Color lightOnSecondary = Color(0xFF8F8F8D);

  // Pitch black theme
  static const Color pitchBlack = Color(0xFF000000);
  static const Color pitchSurface = Color(0xFF232323);
  static const Color pitchOnSecondary = Color(0xFF5E5E5E);
  static const Color pitchOnBackground = Color(0xFFEDEDED);

  // New Accent Colors
  static const Color redAccent = Color(0xFFE14646);
  static const Color orangeAccent = Color(0xFFD9730D);
  static const Color yellowAccent = Color(0xFFDFAC03);
  static const Color greenAccent = Color(0xFF0F7B6C);
  static const Color cobaltAccent = Color(0xFF0047AB);
  static const Color blueAccent = Color(0xFF2383E2);
  static const Color purpleAccent = Color(0xFF6940A5);
  static const Color pinkAccent = Color(0xFFB2297B);
  static const Color magentaAccent = Color(0xFFE040FB);

  static final List<ColorInfo> categoryColors = [
    ColorInfo(color: Colors.red, name: 'Red'),
    ColorInfo(color: Colors.pink, name: 'Pink'),
    ColorInfo(color: Colors.pinkAccent, name: 'Pink Accent'),
    ColorInfo(color: Colors.orange, name: 'Orange'),
    ColorInfo(color: Colors.deepOrange, name: 'Deep Orange'),
    ColorInfo(color: Colors.orangeAccent, name: 'Orange Accent'),
    ColorInfo(color: Colors.amber, name: 'Amber'),
    ColorInfo(color: Colors.yellow, name: 'Yellow'),
    ColorInfo(color: Colors.green, name: 'Green'),
    ColorInfo(color: Colors.greenAccent, name: 'Green Accent'),
    ColorInfo(color: Colors.lightGreen, name: 'Light Green'),
    ColorInfo(color: Colors.lime, name: 'Lime'),
    ColorInfo(color: Colors.teal, name: 'Teal'),
    ColorInfo(color: Colors.blue, name: 'Blue'),
    ColorInfo(color: Colors.lightBlue, name: 'Light Blue'),
    ColorInfo(color: Colors.cyan, name: 'Cyan'),
    ColorInfo(color: Colors.indigo, name: 'Indigo'),
    ColorInfo(color: Colors.indigoAccent, name: 'Indigo Accent'),
    ColorInfo(color: Colors.deepPurple, name: 'Deep Purple'),
    ColorInfo(color: Colors.purple, name: 'Purple'),
  ];

  static Color getColorFromHex(String hexColor) {
    return Color(int.parse(hexColor.replaceAll('#', '0xFF')));
  }

  static String getHexFromColor(Color color) {
    return '#${color.value.toRadixString(16).substring(2)}';
  }
}

class ColorInfo {
  final Color color;
  final String name;

  ColorInfo({required this.color, required this.name});
}
