import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static const String _languageKey = 'app_language';
  final SharedPreferences _prefs;

  LanguageService(this._prefs);

  /// Get saved locale or return system default
  Locale getLocale() {
    final languageCode = _prefs.getString(_languageKey);
    if (languageCode != null) {
      return Locale(languageCode);
    }
    // Return default (system will handle)
    return const Locale('tr'); // Default to Turkish
  }

  /// Save locale preference
  Future<void> setLocale(Locale locale) async {
    await _prefs.setString(_languageKey, locale.languageCode);
  }

  /// Clear locale preference (use system default)
  Future<void> clearLocale() async {
    await _prefs.remove(_languageKey);
  }

  /// Check if locale is supported
  bool isLocaleSupported(Locale locale) {
    return ['en', 'tr'].contains(locale.languageCode);
  }

  /// Get all supported locales
  List<Locale> get supportedLocales => const [
        Locale('en'), // English
        Locale('tr'), // Turkish
      ];
}
