import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTheme {
  static final main = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColor.mainColor,
    canvasColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.whiteCard,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: AppColor.whiteCard,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: AppColor.whiteCard,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: AppColor.mainColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColor.mainColor,
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.mainColor,
      textTheme: ButtonTextTheme.primary,
      height: 54.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    textTheme: GoogleFonts.interTextTheme().copyWith(
      headline1: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
          color: AppColor.headlineBlack),
      headline2: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 18.0,
          color: AppColor.mainColor),
      headline3: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
          color: AppColor.bodyBlack),
      headline4: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
          color: AppColor.fieldText),
      headline5: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 12.0,
          color: AppColor.fieldText),
      headline6: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 10.0,
          color: AppColor.fieldText),
      bodyText1: GoogleFonts.inter(fontSize: 14.0),
      bodyText2:
          GoogleFonts.inter(fontSize: 12.0, color: AppColor.blackCaption),
      button: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16.0),
      caption: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14.0),
    ),
    primaryTextTheme: const TextTheme(
        headline6:
            TextStyle(color: AppColor.mainColor, fontWeight: FontWeight.bold)),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColor.mainColor,
      ),
    ),
    dividerColor: Colors.grey[100],
  );
}
