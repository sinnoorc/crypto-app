import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true, 
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        brightness: Brightness.light,
      );
}
