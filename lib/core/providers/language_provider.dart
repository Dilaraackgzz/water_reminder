import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/language_service.dart';
import 'app_providers.dart';

/// Provider for LanguageService
final languageServiceProvider = Provider<LanguageService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return LanguageService(prefs);
});

/// StateNotifier for managing app locale
class LocaleNotifier extends StateNotifier<Locale> {
  final LanguageService _languageService;

  LocaleNotifier(this._languageService) : super(_languageService.getLocale());

  /// Change app locale
  Future<void> changeLocale(Locale newLocale) async {
    if (_languageService.isLocaleSupported(newLocale)) {
      await _languageService.setLocale(newLocale);
      state = newLocale;
    }
  }

  /// Use system locale
  Future<void> useSystemLocale() async {
    await _languageService.useSystemLocale();
    state = _languageService.getSystemLocale();
  }

  /// Reset to system default
  Future<void> resetToSystemDefault() async {
    await _languageService.clearLocale();
    state = _languageService.getSystemLocale();
  }

  /// Check if using system locale
  bool get isUsingSystemLocale => _languageService.isUsingSystemLocale();

  /// Get current language name (shows "System" if using system locale)
  String get currentLanguageName {
    if (_languageService.isUsingSystemLocale()) {
      return 'System (${LanguageService.getLanguageName(state.languageCode)})';
    }
    return LanguageService.getLanguageName(state.languageCode);
  }

  /// Get all supported locales
  List<Locale> get supportedLocales => _languageService.supportedLocales;
}

/// Provider for app locale
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  final languageService = ref.watch(languageServiceProvider);
  return LocaleNotifier(languageService);
});
