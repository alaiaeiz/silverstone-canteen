import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// saya memilih bricolage grotesque karena hurufnya jelas dan mudah dibaca
// oleh semua usia. warna dibatasi indigo dan putih dengan gaya sederhana
// agar tampilannya bersih dan nyaman bagi semua kalangan dan generasi.
class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;

  const AppText(
    this.text, {
    super.key,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.bricolageGrotesque(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}