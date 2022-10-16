import 'package:dop_case/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class WorldClockThemeData {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: IconThemeData(color: WorldClockColors.dark),
        titleTextStyle: TextStyle(color: WorldClockColors.dark),
        color: WorldClockColors.lightBlue),
    scaffoldBackgroundColor: WorldClockColors.lightBG,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 14.5),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(99),
          borderSide: const BorderSide(color: WorldClockColors.strokeBlue),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(99),
          borderSide: const BorderSide(color: WorldClockColors.strokeBlue),
        ),
        hintStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: WorldClockColors.dark,
        )),
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: WorldClockColors.dark,
          fontSize: 32,
          fontWeight: FontWeight.w600),
      headline2: TextStyle(
          color: WorldClockColors.dark,
          fontSize: 15,
          fontWeight: FontWeight.w600),
      caption: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: WorldClockColors.dark,
      ),
      headline3: TextStyle(
        fontSize: 79,
        fontWeight: FontWeight.w600,
        color: WorldClockColors.dark,
      ),
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: WorldClockColors.dark,
      ),
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: WorldClockColors.dark,
      ),
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: WorldClockColors.dark,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondaryContainer: Colors.white,
        secondary: WorldClockColors.dark,
        brightness: Brightness.light),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
        color: WorldClockColors.dark2),
    scaffoldBackgroundColor: WorldClockColors.dark,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 14.5),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(99),
          borderSide: const BorderSide(color: WorldClockColors.strokeBlue),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(99),
          borderSide: const BorderSide(color: WorldClockColors.strokeBlue),
        ),
        hintStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: WorldClockColors.dark,
        )),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
      headline2: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      caption: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      headline3: TextStyle(
        fontSize: 79,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondaryContainer: WorldClockColors.dark2,
      secondary: Colors.white,
      brightness: Brightness.dark,
    ),
  );
}
