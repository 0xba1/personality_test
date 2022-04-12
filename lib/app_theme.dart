import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Seed color for app color scheme
const _appSeedColor = Color(0xFF347362);

/// App theme
/// [AppTheme.light] for light theme
/// [AppTheme.dark] for dark theme
class AppTheme {
  /// Light [ThemeData]
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: _appSeedColor),
      textTheme: GoogleFonts.poppinsTextTheme(),
      useMaterial3: true,
    );
  }

  /// Dark [ThemeData]
  static ThemeData get dark {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: _appSeedColor,
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      useMaterial3: true,
    );
  }
}
