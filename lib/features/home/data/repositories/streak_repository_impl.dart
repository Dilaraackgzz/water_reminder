import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/models/user_streak.dart';
import '../../domain/repositories/streak_repository.dart';

class StreakRepositoryImpl implements StreakRepository {
  static const String _streakBoxName = 'user_streaks';

  Box<Map>? _streakBox;

  Future<Box<Map>> get _streaks async {
    if (_streakBox == null || !_streakBox!.isOpen) {
      _streakBox = await Hive.openBox<Map>(_streakBoxName);
    }
    return _streakBox!;
  }

  @override
  Future<UserStreak?> getUserStreak(String userId) async {
    final box = await _streaks;
    final data = box.get(userId);

    if (data == null) return null;

    return UserStreak.fromJson(Map<String, dynamic>.from(data));
  }

  @override
  Future<UserStreak> updateStreak({
    required String userId,
    required bool goalCompleted,
  }) async {
    // Get current streak or create new
    UserStreak streak = await getUserStreak(userId) ??
        UserStreak.initial(userId);

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastCheck = DateTime(
      streak.lastCheckDate.year,
      streak.lastCheckDate.month,
      streak.lastCheckDate.day,
    );

    // Calculate days difference
    final daysDifference = today.difference(lastCheck).inDays;

    // Already checked today
    if (daysDifference == 0) {
      // Just update completion status for today
      if (goalCompleted && !streak.completedToday) {
        final updatedDates = [...streak.completedDates, today];
        streak = streak.copyWith(
          completedDates: updatedDates,
          lastCheckDate: now,
        );
      }
      await saveStreak(streak);
      return streak;
    }

    // Yesterday was checked
    if (daysDifference == 1) {
      if (goalCompleted) {
        // Continue streak
        final newStreak = streak.currentStreak + 1;
        final updatedDates = [...streak.completedDates, today];

        streak = streak.copyWith(
          currentStreak: newStreak,
          longestStreak: newStreak > streak.longestStreak
              ? newStreak
              : streak.longestStreak,
          lastCheckDate: now,
          completedDates: updatedDates,
        );
      } else {
        // Streak broken
        streak = streak.copyWith(
          currentStreak: 0,
          lastCheckDate: now,
          streakStartDate: now,
        );
      }
    } else {
      // More than 1 day passed - streak broken
      if (goalCompleted) {
        // Start new streak
        streak = streak.copyWith(
          currentStreak: 1,
          lastCheckDate: now,
          streakStartDate: now,
          completedDates: [today],
        );
      } else {
        // Reset streak
        streak = streak.copyWith(
          currentStreak: 0,
          lastCheckDate: now,
          streakStartDate: now,
          completedDates: [],
        );
      }
    }

    await saveStreak(streak);
    return streak;
  }

  @override
  Future<void> saveStreak(UserStreak streak) async {
    final box = await _streaks;
    await box.put(streak.userId, streak.toJson());
  }

  @override
  Future<void> resetStreak(String userId) async {
    final streak = UserStreak.initial(userId);
    await saveStreak(streak);
  }

  @override
  Future<List<DateTime>> getStreakHistory(String userId) async {
    final streak = await getUserStreak(userId);
    return streak?.completedDates ?? [];
  }
}
