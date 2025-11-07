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

  /// Reset to system default
  Future<void> resetToSystemDefault() async {
    await _languageService.clearLocale();
    state = const Locale('tr'); // Default
  }

  /// Get current language name
  String get currentLanguageName {
    switch (state.languageCode) {
      case 'en':
        return 'English';
      case 'tr':
        return 'Türkçe';
      default:
        return 'Türkçe';
    }
  }
}

/// Provider for app locale
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  final languageService = ref.watch(languageServiceProvider);
  return LocaleNotifier(languageService);
});
