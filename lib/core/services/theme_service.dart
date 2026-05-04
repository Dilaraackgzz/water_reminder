import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';
import '../themes/app_theme.dart';

/// Service for managing theme mode persistence
class ThemeService {
  final SharedPreferences _prefs;

  ThemeService(this._prefs);

  /// Get the current theme mode from storage
  ThemeMode getThemeMode() {
    final themeModeString = _prefs.getString(AppConstants.themeKey);

    if (themeModeString == null) {
      return ThemeMode.system; // Default to system theme
    }

    return ThemeMode.values.firstWhere(
      (mode) => mode.name == themeModeString,
      orElse: () => ThemeMode.system,
    );
  }

  /// Save theme mode to storage
  Future<void> setThemeMode(ThemeMode mode) async {
    await _prefs.setString(AppConstants.themeKey, mode.name);
  }

  /// Check if dark mode is currently active based on system settings
  bool isDarkModeActive(BuildContext context) {
    final themeMode = getThemeMode();

    if (themeMode == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness == Brightness.dark;
    }

    return themeMode == ThemeMode.dark;
  }

  PremiumThemeVariant getPremiumThemeVariant() {
    final value = _prefs.getString(AppConstants.premiumThemeKey);
    return PremiumThemeVariant.values.firstWhere(
      (v) => v.name == value,
      orElse: () => PremiumThemeVariant.standard,
    );
  }

  Future<void> setPremiumThemeVariant(PremiumThemeVariant variant) async {
    await _prefs.setString(AppConstants.premiumThemeKey, variant.name);
  }
}