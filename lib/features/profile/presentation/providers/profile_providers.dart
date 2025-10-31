import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/models/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

/// Provider for profile repository
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl();
});

/// Provider for current user's profile
final userProfileProvider = FutureProvider<UserProfile?>((ref) async {
  final authState = ref.watch(authStateProvider);
  final profileRepository = ref.watch(profileRepositoryProvider);

  return authState.when(
    data: (user) async {
      if (user == null) return null;

      var profile = await profileRepository.getUserProfile(user.uid);

      // Create initial profile if not exists
      if (profile == null) {
        profile = UserProfile.initial(user.uid);
        await profileRepository.saveProfile(profile);
      }

      return profile;
    },
    loading: () => null,
    error: (_, __) => null,
  );
});

/// Provider for profile controller
final profileControllerProvider = Provider<ProfileController>((ref) {
  return ProfileController(ref);
});

/// Controller for profile operations
class ProfileController {
  final Ref _ref;

  ProfileController(this._ref);

  /// Update profile with new data
  Future<void> updateProfile(UserProfile profile) async {
    final repository = _ref.read(profileRepositoryProvider);
    await repository.saveProfile(profile);

    // Refresh the user profile provider
    _ref.invalidate(userProfileProvider);
  }

  /// Update only daily goal
  Future<void> updateDailyGoal(String userId, int newGoal, {bool isCustom = true}) async {
    final repository = _ref.read(profileRepositoryProvider);
    await repository.updateDailyGoal(userId, newGoal, isCustom: isCustom);

    // Refresh the user profile provider
    _ref.invalidate(userProfileProvider);
  }

  /// Calculate recommended daily goal
  Future<int> calculateDailyGoal({
    required double weight,
    required ActivityLevel activityLevel,
  }) async {
    final repository = _ref.read(profileRepositoryProvider);
    return await repository.calculateDailyGoal(
      weight: weight,
      activityLevel: activityLevel,
    );
  }

  /// Apply calculated goal to profile
  Future<void> applyCalculatedGoal(UserProfile profile) async {
    final calculatedGoal = await calculateDailyGoal(
      weight: profile.weight,
      activityLevel: profile.activityLevel,
    );

    final updatedProfile = profile.copyWith(
      dailyGoal: calculatedGoal,
      isCustomGoal: false,
      updatedAt: DateTime.now(),
    );

    await updateProfile(updatedProfile);
  }
}
