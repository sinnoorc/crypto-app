import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final _defaultLightColorScheme = ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final _defaultDarkColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue, brightness: Brightness.dark);

static  ThemeData lightTheme(ColorScheme? lightColorScheme) => ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        brightness: Brightness.light,
        colorScheme: lightColorScheme ?? _defaultLightColorScheme,
      );

static  ThemeData darkTheme(ColorScheme? darkColorScheme) => ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        brightness: Brightness.dark,
        colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
      );
}
