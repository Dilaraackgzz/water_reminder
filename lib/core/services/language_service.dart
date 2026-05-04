import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static const String _languageKey = 'app_language';
  static const String _useSystemLocaleKey = 'use_system_locale';
  final SharedPreferences _prefs;

  /// All supported language codes
  static const List<String> supportedLanguageCodes = [
    'en', // English (default)
    'tr', // Turkish
    'es', // Spanish
    'fr', // French
    'de', // German
    'it', // Italian
    'pt', // Portuguese
    'ru', // Russian
    'ja', // Japanese
    'ko', // Korean
    'zh', // Chinese
    'ar', // Arabic
    'hi', // Hindi
    'nl', // Dutch
    'pl', // Polish
  ];

  LanguageService(this._prefs);

  /// Get saved locale or detect system locale with English fallback
  Locale getLocale() {
    // Check if user has explicitly set a language
    final savedLanguageCode = _prefs.getString(_languageKey);
    final useSystemLocale = _prefs.getBool(_useSystemLocaleKey) ?? true;

    if (savedLanguageCode != null && !useSystemLocale) {
      // User has set a specific language
      return Locale(savedLanguageCode);
    }

    // Try to use system locale
    final systemLocale = ui.PlatformDispatcher.instance.locale;
    if (isLocaleSupported(systemLocale)) {
      return Locale(systemLocale.languageCode);
    }

    // Fallback to English
    return const Locale('en');
  }

  /// Get system locale
  Locale getSystemLocale() {
    final systemLocale = ui.PlatformDispatcher.instance.locale;
    if (isLocaleSupported(systemLocale)) {
      return Locale(systemLocale.languageCode);
    }
    return const Locale('en');
  }

  /// Check if using system locale
  bool isUsingSystemLocale() {
    return _prefs.getBool(_useSystemLocaleKey) ?? true;
  }

  /// Save locale preference
  Future<void> setLocale(Locale locale) async {
    await _prefs.setString(_languageKey, locale.languageCode);
    await _prefs.setBool(_useSystemLocaleKey, false);
  }

  /// Use system locale
  Future<void> useSystemLocale() async {
    await _prefs.remove(_languageKey);
    await _prefs.setBool(_useSystemLocaleKey, true);
  }

  /// Clear locale preference (use system default)
  Future<void> clearLocale() async {
    await _prefs.remove(_languageKey);
    await _prefs.setBool(_useSystemLocaleKey, true);
  }

  /// Check if locale is supported
  bool isLocaleSupported(Locale locale) {
    return supportedLanguageCodes.contains(locale.languageCode);
  }

  /// Get all supported locales
  List<Locale> get supportedLocales =>
      supportedLanguageCodes.map((code) => Locale(code)).toList();

  /// Get language name from code (native name)
  static String getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'tr':
        return 'Türkçe';
      case 'es':
        return 'Español';
      case 'fr':
        return 'Français';
      case 'de':
        return 'Deutsch';
      case 'it':
        return 'Italiano';
      case 'pt':
        return 'Português';
      case 'ru':
        return 'Русский';
      case 'ja':
        return '日本語';
      case 'ko':
        return '한국어';
      case 'zh':
        return '中文';
      case 'ar':
        return 'العربية';
      case 'hi':
        return 'हिन्दी';
      case 'nl':
        return 'Nederlands';
      case 'pl':
        return 'Polski';
      default:
        return languageCode.toUpperCase();
    }
  }

  /// Get language name in English (for subtitle)
  static String getNativeLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'tr':
        return 'Turkish';
      case 'es':
        return 'Spanish';
      case 'fr':
        return 'French';
      case 'de':
        return 'German';
      case 'it':
        return 'Italian';
      case 'pt':
        return 'Portuguese';
      case 'ru':
        return 'Russian';
      case 'ja':
        return 'Japanese';
      case 'ko':
        return 'Korean';
      case 'zh':
        return 'Chinese';
      case 'ar':
        return 'Arabic';
      case 'hi':
        return 'Hindi';
      case 'nl':
        return 'Dutch';
      case 'pl':
        return 'Polish';
      default:
        return languageCode.toUpperCase();
    }
  }
}
