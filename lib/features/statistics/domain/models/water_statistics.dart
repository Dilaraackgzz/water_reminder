import 'package:freezed_annotation/freezed_annotation.dart';

part 'water_statistics.freezed.dart';
part 'water_statistics.g.dart';

/// Statistics model for water intake analysis
@freezed
class WaterStatistics with _$WaterStatistics {
  const factory WaterStatistics({
    required DateTime startDate,
    required DateTime endDate,
    required int totalIntake,
    required int targetAmount,
    required double averageIntake,
    required int daysTracked,
    required int daysGoalAchieved,
    required List<DailyIntakeSummary> dailySummaries,
  }) = _WaterStatistics;

  factory WaterStatistics.fromJson(Map<String, dynamic> json) =>
      _$WaterStatisticsFromJson(json);
}

/// Daily intake summary for charts
@freezed
class DailyIntakeSummary with _$DailyIntakeSummary {
  const factory DailyIntakeSummary({
    required DateTime date,
    required int totalIntake,
    required int targetAmount,
    required int intakeCount,
  }) = _DailyIntakeSummary;

  factory DailyIntakeSummary.fromJson(Map<String, dynamic> json) =>
      _$DailyIntakeSummaryFromJson(json);
}

/// Extension for statistics calculations
extension WaterStatisticsX on WaterStatistics {
  /// Calculate achievement percentage
  double get achievementPercentage {
    if (daysTracked == 0) return 0;
    return (daysGoalAchieved / daysTracked) * 100;
  }

  /// Check if on track
  bool get isOnTrack {
    return averageIntake >= targetAmount * 0.8;
  }

  /// Get best day
  DailyIntakeSummary? get bestDay {
    if (dailySummaries.isEmpty) return null;
    return dailySummaries.reduce((a, b) =>
      a.totalIntake > b.totalIntake ? a : b
    );
  }

  /// Get worst day
  DailyIntakeSummary? get worstDay {
    if (dailySummaries.isEmpty) return null;
    return dailySummaries.reduce((a, b) =>
      a.totalIntake < b.totalIntake ? a : b
    );
  }
}
