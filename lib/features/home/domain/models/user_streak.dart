import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_streak.freezed.dart';
part 'user_streak.g.dart';

/// User streak model for tracking consecutive days
@freezed
class UserStreak with _$UserStreak {
  const factory UserStreak({
    required String userId,
    required int currentStreak,
    required int longestStreak,
    required DateTime lastCheckDate,
    required DateTime streakStartDate,
    @Default([]) List<DateTime> completedDates,
  }) = _UserStreak;

  factory UserStreak.fromJson(Map<String, dynamic> json) =>
      _$UserStreakFromJson(json);

  /// Create initial streak
  factory UserStreak.initial(String userId) {
    final now = DateTime.now();
    return UserStreak(
      userId: userId,
      currentStreak: 0,
      longestStreak: 0,
      lastCheckDate: now,
      streakStartDate: now,
      completedDates: [],
    );
  }
}

/// Extension for streak calculations and helpers
extension UserStreakX on UserStreak {
  /// Check if streak is active (completed today or yesterday)
  bool get isActive {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastCheck = DateTime(
      lastCheckDate.year,
      lastCheckDate.month,
      lastCheckDate.day,
    );

    final difference = today.difference(lastCheck).inDays;
    return difference <= 1;
  }

  /// Check if goal was completed today
  bool get completedToday {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return completedDates.any((date) {
      final checkDate = DateTime(date.year, date.month, date.day);
      return checkDate.isAtSameMomentAs(today);
    });
  }

  /// Get streak emoji based on current streak
  String get streakEmoji {
    if (currentStreak >= 30) return '🔥💪';
    if (currentStreak >= 14) return '🔥✨';
    if (currentStreak >= 7) return '🔥';
    if (currentStreak >= 3) return '⚡';
    return '💧';
  }

  /// Get motivational message based on streak
  String get streakMessage {
    if (currentStreak == 0) return 'Start your streak today!';
    if (currentStreak == 1) return 'Great start! Keep it up!';
    if (currentStreak < 7) return '$currentStreak days strong!';
    if (currentStreak == 7) return '1 week streak! Amazing!';
    if (currentStreak < 30) return '$currentStreak days in a row!';
    if (currentStreak == 30) return '30 days! You\'re a champion!';
    return '$currentStreak days! Legendary!';
  }

  /// Check if reached a milestone (for notifications/achievements)
  bool isStreakMilestone() {
    return [1, 3, 7, 14, 30, 60, 90, 100].contains(currentStreak);
  }

  /// Get milestone achievement text
  String getMilestoneText() {
    switch (currentStreak) {
      case 1:
        return '🎉 First Day Complete!';
      case 3:
        return '⚡ 3 Day Streak!';
      case 7:
        return '🔥 One Week Streak!';
      case 14:
        return '✨ Two Week Streak!';
      case 30:
        return '🏆 30 Day Champion!';
      case 60:
        return '💎 60 Day Master!';
      case 90:
        return '👑 90 Day Legend!';
      case 100:
        return '🌟 100 Day Hero!';
      default:
        return '🎊 Keep Going!';
    }
  }

  /// Get progress to next milestone
  int get daysToNextMilestone {
    const milestones = [1, 3, 7, 14, 30, 60, 90, 100];

    for (final milestone in milestones) {
      if (currentStreak < milestone) {
        return milestone - currentStreak;
      }
    }

    // After 100, next milestone is every 100 days
    final nextHundred = ((currentStreak ~/ 100) + 1) * 100;
    return nextHundred - currentStreak;
  }

  /// Get personal best indicator
  bool get isPersonalBest {
    return currentStreak > 0 && currentStreak == longestStreak;
  }
}
