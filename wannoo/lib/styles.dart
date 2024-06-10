import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wannoo/Constants.dart';

class TypographyStyle {
  static TextStyle xsFont = GoogleFonts.inter(
    textStyle:  TextStyle(
      fontSize: globalFontsize.font_xs,
      fontWeight: FontWeight.w500,
      color: themeColor.colorTextPrimary,
    ),
  );

  static TextStyle sFont = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: globalFontsize.font_s,
      fontWeight: FontWeight.w500,
      color: themeColor.colorTextPrimary,
    ),
  );
  static TextStyle mdFont = GoogleFonts.inter(
  textStyle: const TextStyle(
    fontSize: globalFontsize.font_md,
    fontWeight: FontWeight.w500,
    color: themeColor.colorTextPrimary,
  ),
);
  static TextStyle l1Font = GoogleFonts.inter(
  textStyle: const TextStyle(
    fontSize: globalFontsize.font_l1,
    fontWeight: FontWeight.w500,
    color: themeColor.colorTextPrimary,
  ),
);
  static TextStyle l2Font = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: globalFontsize.font_l2,
      fontWeight: FontWeight.w500,
      color: themeColor.colorTextPrimary,
    ),
  );
  static TextStyle xlFont = GoogleFonts.inter(
  textStyle: const TextStyle(
    fontSize: globalFontsize.font_xl,
    fontWeight: FontWeight.w500,
    color: themeColor.colorTextPrimary,
  ),
);
  static TextStyle xxlFont = GoogleFonts.inter(
  textStyle: const TextStyle(
    fontSize: globalFontsize.font_xxl,
    fontWeight: FontWeight.w500,
    color: themeColor.colorTextPrimary,
  ),
);
}