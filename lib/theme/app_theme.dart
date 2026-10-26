import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const ink = Color(0xFF17140F); 
  static const cream = Color(0xFFFAF3E3); 
  static const paper = Color(0xFFFFFBF0);
  static const lime = Color(0xFFD9F250);
  static const orange = Color(0xFFFF7054);
  static const olive = Color(0xFF97AA26);
}

ThemeData buildAppTheme() {
  const garis = BorderSide(color: AppColors.ink, width: 1.5);
  final borderField = OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: garis,
  );

  return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColors.lime,
    scaffoldBackgroundColor: AppColors.cream,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.ink,
      foregroundColor: AppColors.cream,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
    ),
    listTileTheme: const ListTileThemeData(iconColor: AppColors.ink),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.lime,
      foregroundColor: AppColors.ink,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.ink, width: 2),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.paper,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      hintStyle: GoogleFonts.bricolageGrotesque(color: Colors.black45),
      border: borderField,
      enabledBorder: borderField,
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: AppColors.olive, width: 3),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: Colors.red, width: 3),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lime,
        foregroundColor: AppColors.ink,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: AppColors.ink, width: 2),
        ),
      ),
    ),
  );
}