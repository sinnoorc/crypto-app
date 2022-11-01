import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final _defaultDarkColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue, brightness: Brightness.dark);

  static final _defaultLightColorScheme = ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static ThemeData lightTheme(ColorScheme? lightColorScheme) => ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        brightness: Brightness.light,
        colorScheme: lightColorScheme ?? _defaultLightColorScheme,
      );

  static ThemeData darkTheme(ColorScheme? darkColorScheme) => ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white54,
        ),
        brightness: Brightness.dark,
        colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
        scaffoldBackgroundColor: const Color(0xff0F0F0F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0F0F0F),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      );
}
