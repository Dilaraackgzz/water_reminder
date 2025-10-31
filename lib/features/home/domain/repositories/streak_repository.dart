import '../models/user_streak.dart';

/// Repository for streak operations
abstract class StreakRepository {
  /// Get user's current streak
  Future<UserStreak?> getUserStreak(String userId);

  /// Update streak after goal completion
  Future<UserStreak> updateStreak({
    required String userId,
    required bool goalCompleted,
  });

  /// Save streak data
  Future<void> saveStreak(UserStreak streak);

  /// Reset streak (for testing or manual reset)
  Future<void> resetStreak(String userId);

  /// Get streak history (completed dates)
  Future<List<DateTime>> getStreakHistory(String userId);
}
