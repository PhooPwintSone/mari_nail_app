import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  // Prevent instantiation
  TextStyles._();

  static TextStyle heading1Semi = GoogleFonts.fredoka(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static TextStyle heading1Reg = GoogleFonts.fredoka(
    fontSize: 28,
    fontWeight: FontWeight.w400,
  );

  static TextStyle heading2Medium = GoogleFonts.fredoka(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle heading2Regular = GoogleFonts.fredoka(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static TextStyle body1Medium = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
  );

  static TextStyle body2Regular = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
  );

  static TextStyle button1Medium = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 24 / 14,
  );

  static TextStyle button2Regular = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 24 / 14,
  );

  static TextStyle textLight = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w200,
  );
  static TextStyle textNormal = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
}
