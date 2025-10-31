import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/theme_service.dart';
import 'app_providers.dart';

/// Provider for ThemeService
final themeServiceProvider = Provider<ThemeService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return ThemeService(prefs);
});

/// State notifier for managing theme mode
class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final ThemeService _themeService;

  ThemeModeNotifier(this._themeService) : super(_themeService.getThemeMode());

  /// Set theme mode and persist it
  Future<void> setThemeMode(ThemeMode mode) async {
    await _themeService.setThemeMode(mode);
    state = mode;
  }

  /// Toggle between light and dark mode
  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await setThemeMode(newMode);
  }

  /// Set to system theme
  Future<void> useSystemTheme() async {
    await setThemeMode(ThemeMode.system);
  }
}

/// Provider for theme mode state
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  final themeService = ref.watch(themeServiceProvider);
  return ThemeModeNotifier(themeService);
});