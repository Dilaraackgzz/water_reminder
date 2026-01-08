import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme.dart';

/// AppTheme - Wrapper around MaterialTheme for backward compatibility
///
/// This class provides easy access to Material Theme Builder generated themes
/// with custom water-themed accent colors and Google Fonts Poppins integration.
class AppTheme {
  // Legacy color constants for backward compatibility
  static const Color primaryBlue = Color(0xFF7EBFBA);
  static const Color lightBlue = Color(0xffA3D5D0);
  static const Color darkBlue = Color(0xFF5FA8A3);
  static const Color accentBlue = Color(0xFF8FC9C4);

  static const Color successGreen = Color(0xFF81C784);
  static const Color warningOrange = Color(0xFFFFB74D);
  static const Color errorRed = Color(0xffD67B79);

  static const Color surfaceLight = Color(0xffF8FAFA);
  static const Color surfaceDark = Color(0xff1A2224);

  // Water-themed custom accent color (soft teal)
  static const Color waterAccent = Color(0xFF7EBFBA);

  // Create MaterialTheme instance with Google Fonts
  static final MaterialTheme _materialTheme = MaterialTheme(
    GoogleFonts.poppinsTextTheme(),
  );

  /// Light theme with Material Theme Builder color scheme
  static ThemeData get lightTheme {
    final theme = _materialTheme.light();

    // Override with water accent color for specific use cases
    return theme.copyWith(
      // Keep the Material Theme Builder primary colors
      // but add water accent as a fallback for custom widgets
      extensions: [
        _WaterThemeExtension(accentColor: waterAccent),
      ],
    );
  }

  /// Dark theme with Material Theme Builder color scheme
  static ThemeData get darkTheme {
    final theme = _materialTheme.dark();

    return theme.copyWith(
      extensions: [
        _WaterThemeExtension(accentColor: waterAccent),
      ],
    );
  }

  /// Light High Contrast theme for accessibility
  static ThemeData get lightHighContrastTheme {
    final theme = _materialTheme.lightHighContrast();

    return theme.copyWith(
      extensions: [
        _WaterThemeExtension(accentColor: waterAccent),
      ],
    );
  }

  /// Dark High Contrast theme for accessibility
  static ThemeData get darkHighContrastTheme {
    final theme = _materialTheme.darkHighContrast();

    return theme.copyWith(
      extensions: [
        _WaterThemeExtension(accentColor: waterAccent),
      ],
    );
  }

  /// Light Medium Contrast theme
  static ThemeData get lightMediumContrastTheme {
    final theme = _materialTheme.lightMediumContrast();

    return theme.copyWith(
      extensions: [
        _WaterThemeExtension(accentColor: waterAccent),
      ],
    );
  }

  /// Dark Medium Contrast theme
  static ThemeData get darkMediumContrastTheme {
    final theme = _materialTheme.darkMediumContrast();

    return theme.copyWith(
      extensions: [
        _WaterThemeExtension(accentColor: waterAccent),
      ],
    );
  }
}

/// Theme extension for water-specific accent color
class _WaterThemeExtension extends ThemeExtension<_WaterThemeExtension> {
  final Color accentColor;

  const _WaterThemeExtension({required this.accentColor});

  @override
  ThemeExtension<_WaterThemeExtension> copyWith({Color? accentColor}) {
    return _WaterThemeExtension(
      accentColor: accentColor ?? this.accentColor,
    );
  }

  @override
  ThemeExtension<_WaterThemeExtension> lerp(
    covariant ThemeExtension<_WaterThemeExtension>? other,
    double t,
  ) {
    if (other is! _WaterThemeExtension) return this;
    return _WaterThemeExtension(
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
    );
  }
}

/// Extension to easily access water accent color from BuildContext
extension WaterThemeExtensions on BuildContext {
  Color get waterAccent {
    final extension = Theme.of(this).extension<_WaterThemeExtension>();
    return extension?.accentColor ?? AppTheme.waterAccent;
  }
}
