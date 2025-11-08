import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff0051a3),
      surfaceTint: Color(0xff005db8),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0069cf),
      onPrimaryContainer: Color(0xffe6ecff),
      secondary: Color(0xff525f77),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9ca9c4),
      onSecondaryContainer: Color(0xff313e54),
      tertiary: Color(0xff6a596c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa490a5),
      onTertiaryContainer: Color(0xff382a3b),
      error: Color(0xff590004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff820008),
      onErrorContainer: Color(0xffff8579),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff1c1b1c),
      onSurfaceVariant: Color(0xff46464b),
      outline: Color(0xff76777c),
      outlineVariant: Color(0xffc7c6cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffaac7ff),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3e),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff00458d),
      secondaryFixed: Color(0xffd6e3ff),
      onSecondaryFixed: Color(0xff0e1c31),
      secondaryFixedDim: Color(0xffbac7e3),
      onSecondaryFixedVariant: Color(0xff3a475e),
      tertiaryFixed: Color(0xfff3dbf2),
      onTertiaryFixed: Color(0xff241727),
      tertiaryFixedDim: Color(0xffd6c0d6),
      onTertiaryFixedVariant: Color(0xff524154),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xfff1eded),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00356e),
      surfaceTint: Color(0xff005db8),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0069cf),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2a364d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff616d86),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff403142),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff79677b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff590004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff820008),
      onErrorContainer: Color(0xffffc3bc),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff111111),
      onSurfaceVariant: Color(0xff35363a),
      outline: Color(0xff525257),
      outlineVariant: Color(0xff6c6d72),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffaac7ff),
      primaryFixed: Color(0xff096bd1),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0053a7),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff616d86),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff48556d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff79677b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff604f62),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c6c6),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xffebe7e7),
      surfaceContainerHigh: Color(0xffe0dcdc),
      surfaceContainerHighest: Color(0xffd4d1d1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002b5c),
      surfaceTint: Color(0xff005db8),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004891),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff202c42),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3d4961),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff362738),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff544456),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff590004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff820008),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2b2c30),
      outlineVariant: Color(0xff48494e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffaac7ff),
      primaryFixed: Color(0xff004891),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003268),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff3d4961),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff263349),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff544456),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3c2e3f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb8b8),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f0f0),
      surfaceContainer: Color(0xffe5e2e1),
      surfaceContainerHigh: Color(0xffd7d4d3),
      surfaceContainerHighest: Color(0xffc9c6c6),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffaac7ff),
      surfaceTint: Color(0xffaac7ff),
      onPrimary: Color(0xff002f64),
      primaryContainer: Color(0xff0069cf),
      onPrimaryContainer: Color(0xffe6ecff),
      secondary: Color(0xffbac7e3),
      onSecondary: Color(0xff243147),
      secondaryContainer: Color(0xff9ca9c4),
      onSecondaryContainer: Color(0xff313e54),
      tertiary: Color(0xffd6c0d6),
      onTertiary: Color(0xff3a2b3d),
      tertiaryContainer: Color(0xffa490a5),
      onTertiaryContainer: Color(0xff382a3b),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff820008),
      onErrorContainer: Color(0xffff8579),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffc7c6cb),
      outline: Color(0xff909095),
      outlineVariant: Color(0xff46464b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff005db8),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3e),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff00458d),
      secondaryFixed: Color(0xffd6e3ff),
      onSecondaryFixed: Color(0xff0e1c31),
      secondaryFixedDim: Color(0xffbac7e3),
      onSecondaryFixedVariant: Color(0xff3a475e),
      tertiaryFixed: Color(0xfff3dbf2),
      onTertiaryFixed: Color(0xff241727),
      tertiaryFixedDim: Color(0xffd6c0d6),
      onTertiaryFixedVariant: Color(0xff524154),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1c),
      surfaceContainer: Color(0xff201f20),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353435),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffcdddff),
      surfaceTint: Color(0xffaac7ff),
      onPrimary: Color(0xff002550),
      primaryContainer: Color(0xff4890f8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd0ddf9),
      onSecondary: Color(0xff19263b),
      secondaryContainer: Color(0xff9ca9c4),
      onSecondaryContainer: Color(0xff111e33),
      tertiary: Color(0xffecd5ec),
      onTertiary: Color(0xff2f2131),
      tertiaryContainer: Color(0xffa490a5),
      onTertiaryContainer: Color(0xff030006),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xfff75c51),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdddbe1),
      outline: Color(0xffb2b1b7),
      outlineVariant: Color(0xff909095),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff00478f),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff00112b),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff00356e),
      secondaryFixed: Color(0xffd6e3ff),
      onSecondaryFixed: Color(0xff041126),
      secondaryFixedDim: Color(0xffbac7e3),
      onSecondaryFixedVariant: Color(0xff2a364d),
      tertiaryFixed: Color(0xfff3dbf2),
      onTertiaryFixed: Color(0xff190c1c),
      tertiaryFixedDim: Color(0xffd6c0d6),
      onTertiaryFixedVariant: Color(0xff403142),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff454444),
      surfaceContainerLowest: Color(0xff070707),
      surfaceContainerLow: Color(0xff1e1d1e),
      surfaceContainer: Color(0xff282828),
      surfaceContainerHigh: Color(0xff333232),
      surfaceContainerHighest: Color(0xff3e3d3d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffebf0ff),
      surfaceTint: Color(0xffaac7ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffa3c3ff),
      onPrimaryContainer: Color(0xff000b20),
      secondary: Color(0xffebf0ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb6c3df),
      onSecondaryContainer: Color(0xff000b20),
      tertiary: Color(0xffffeafe),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffd2bcd2),
      onTertiaryContainer: Color(0xff130716),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea5),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff1eff5),
      outlineVariant: Color(0xffc3c2c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff00478f),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff00112b),
      secondaryFixed: Color(0xffd6e3ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffbac7e3),
      onSecondaryFixedVariant: Color(0xff041126),
      tertiaryFixed: Color(0xfff3dbf2),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd6c0d6),
      onTertiaryFixedVariant: Color(0xff190c1c),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff515050),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f20),
      surfaceContainer: Color(0xff313030),
      surfaceContainerHigh: Color(0xff3c3b3b),
      surfaceContainerHighest: Color(0xff484647),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: _buildGoogleFontsTextTheme(colorScheme),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
     appBarTheme: _buildAppBarTheme(colorScheme),
     elevatedButtonTheme: _buildElevatedButtonTheme(colorScheme),
     floatingActionButtonTheme: _buildFloatingActionButtonTheme(colorScheme),
     cardTheme: _buildCardTheme(colorScheme),
     inputDecorationTheme: _buildInputDecorationTheme(colorScheme),
  );

  static TextTheme _buildGoogleFontsTextTheme(ColorScheme colorScheme) {
    return GoogleFonts.poppinsTextTheme(
      TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
        headlineLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
        titleSmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: colorScheme.onSurface,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: colorScheme.onSurface,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      ),
    );
  }

  static AppBarTheme _buildAppBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
    );
  }

  static ElevatedButtonThemeData _buildElevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static FloatingActionButtonThemeData _buildFloatingActionButtonTheme(ColorScheme colorScheme) {
    return FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  static CardThemeData _buildCardTheme(ColorScheme colorScheme) {
    return CardThemeData(
      color: colorScheme.surface,
      shadowColor: colorScheme.shadow,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  static InputDecorationTheme _buildInputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      labelStyle: GoogleFonts.poppins(
        color: colorScheme.onSurface.withValues(alpha: 0.7),
      ),
      hintStyle: GoogleFonts.poppins(
        color: colorScheme.onSurface.withValues(alpha: 0.5),
      ),
    );
  }


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
