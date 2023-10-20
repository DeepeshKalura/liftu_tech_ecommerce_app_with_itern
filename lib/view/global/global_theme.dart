import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTheme {
  static final _textTheme = TextTheme(
    labelMedium: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF979599),
      height: 0,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      height: 0,
    ),
  );
  static const _appBar = AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );
  static const _scaffoldColor = Colors.white;

  static final themeData = ThemeData(
    textTheme: _textTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: _scaffoldColor,
    appBarTheme: _appBar,
  );
}
