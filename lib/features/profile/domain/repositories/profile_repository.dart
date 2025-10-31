import '../models/user_profile.dart';

/// Repository for user profile operations
abstract class ProfileRepository {
  /// Get user profile by userId
  Future<UserProfile?> getUserProfile(String userId);

  /// Save or update user profile
  Future<void> saveProfile(UserProfile profile);

  /// Update specific fields of the profile
  Future<void> updateProfile(String userId, Map<String, dynamic> updates);

  /// Delete user profile
  Future<void> deleteProfile(String userId);

  /// Calculate and update daily goal based on body metrics
  Future<int> calculateDailyGoal({
    required double weight,
    required ActivityLevel activityLevel,
  });

  /// Update daily goal (custom or calculated)
  Future<void> updateDailyGoal(String userId, int newGoal, {bool isCustom = true});
}
