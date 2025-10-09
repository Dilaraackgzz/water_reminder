import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_goal.freezed.dart';
part 'daily_goal.g.dart';

@freezed
class DailyGoal with _$DailyGoal {
  const factory DailyGoal({
    required String userId,
    required int targetAmount, // Target amount in ml
    required DateTime date,
    @Default(0) int currentAmount, // Current consumed amount in ml
  }) = _DailyGoal;

  factory DailyGoal.fromJson(Map<String, dynamic> json) =>
      _$DailyGoalFromJson(json);
}

extension DailyGoalExtension on DailyGoal {
  /// Calculate progress percentage (0-100)
  double get progressPercentage {
    if (targetAmount == 0) return 0;
    return (currentAmount / targetAmount * 100).clamp(0, 100);
  }

  /// Check if daily goal is achieved
  bool get isGoalAchieved => currentAmount >= targetAmount;

  /// Get remaining amount to reach goal
  int get remainingAmount {
    final remaining = targetAmount - currentAmount;
    return remaining > 0 ? remaining : 0;
  }
}