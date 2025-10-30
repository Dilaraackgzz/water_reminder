import '../models/water_statistics.dart';

/// Repository for statistics operations
abstract class StatisticsRepository {
  /// Get statistics for a date range
  Future<WaterStatistics> getStatistics({
    required DateTime startDate,
    required DateTime endDate,
    required int targetAmount,
  });

  /// Get weekly statistics
  Future<WaterStatistics> getWeeklyStatistics({
    required DateTime date,
    required int targetAmount,
  });

  /// Get monthly statistics
  Future<WaterStatistics> getMonthlyStatistics({
    required DateTime date,
    required int targetAmount,
  });

  /// Get yearly statistics
  Future<WaterStatistics> getYearlyStatistics({
    required DateTime date,
    required int targetAmount,
  });
}
