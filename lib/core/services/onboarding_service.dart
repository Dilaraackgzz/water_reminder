import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';
import '../providers/app_providers.dart';

// Onboarding service provider
final onboardingServiceProvider = Provider<OnboardingService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return OnboardingService(prefs);
});

// Check if onboarding is completed
final isOnboardingCompletedProvider = Provider<bool>((ref) {
  final service = ref.watch(onboardingServiceProvider);
  return service.isOnboardingCompleted();
});

class OnboardingService {
  final SharedPreferences _prefs;

  OnboardingService(this._prefs);

  /// Check if user has completed onboarding
  bool isOnboardingCompleted() {
    return _prefs.getBool(AppConstants.onboardingCompletedKey) ?? false;
  }

  /// Mark onboarding as completed
  Future<void> completeOnboarding() async {
    await _prefs.setBool(AppConstants.onboardingCompletedKey, true);
  }

  /// Reset onboarding (for testing purposes)
  Future<void> resetOnboarding() async {
    await _prefs.remove(AppConstants.onboardingCompletedKey);
  }
}
