import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Saya memilih Bricolage Grotesque karena hurufnya tebal dan menarik perhatian,
// cocok untuk selera anak muda. Warna krem, hitam, lime, dan oranye dipilih agar
// tampilannya cerah dan santai, sesuai suasana kantin.
class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppText(
    this.text, {
    super.key,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.bricolageGrotesque(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}