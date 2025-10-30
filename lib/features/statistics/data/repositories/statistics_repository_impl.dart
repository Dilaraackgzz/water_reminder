import '../../../home/data/datasources/water_local_datasource.dart';
import '../../domain/models/water_statistics.dart';
import '../../domain/repositories/statistics_repository.dart';

class StatisticsRepositoryImpl implements StatisticsRepository {
  final WaterLocalDataSource _localDataSource;

  StatisticsRepositoryImpl(this._localDataSource);

  @override
  Future<WaterStatistics> getStatistics({
    required DateTime startDate,
    required DateTime endDate,
    required int targetAmount,
  }) async {
    final intakes = await _localDataSource.getWaterIntakesForDateRange(
      startDate,
      endDate,
    );

    // Group by date
    final Map<DateTime, List<int>> dailyIntakes = {};
    for (final intake in intakes) {
      final date = DateTime(
        intake.timestamp.year,
        intake.timestamp.month,
        intake.timestamp.day,
      );
      dailyIntakes.putIfAbsent(date, () => []).add(intake.amount);
    }

    // Create daily summaries
    final summaries = <DailyIntakeSummary>[];
    var currentDate = DateTime(startDate.year, startDate.month, startDate.day);
    final end = DateTime(endDate.year, endDate.month, endDate.day);

    while (currentDate.isBefore(end) || currentDate.isAtSameMomentAs(end)) {
      final dayIntakes = dailyIntakes[currentDate] ?? [];
      final totalIntake = dayIntakes.fold<int>(0, (sum, amount) => sum + amount);

      summaries.add(DailyIntakeSummary(
        date: currentDate,
        totalIntake: totalIntake,
        targetAmount: targetAmount,
        intakeCount: dayIntakes.length,
      ));

      currentDate = currentDate.add(const Duration(days: 1));
    }

    // Calculate statistics
    final totalIntake = summaries.fold<int>(
      0,
      (sum, day) => sum + day.totalIntake,
    );

    final daysTracked = summaries.where((day) => day.totalIntake > 0).length;
    final daysGoalAchieved = summaries
        .where((day) => day.totalIntake >= targetAmount)
        .length;

    final averageIntake = daysTracked > 0 ? totalIntake / daysTracked : 0.0;

    return WaterStatistics(
      startDate: startDate,
      endDate: endDate,
      totalIntake: totalIntake,
      targetAmount: targetAmount,
      averageIntake: averageIntake,
      daysTracked: daysTracked,
      daysGoalAchieved: daysGoalAchieved,
      dailySummaries: summaries,
    );
  }

  @override
  Future<WaterStatistics> getWeeklyStatistics({
    required DateTime date,
    required int targetAmount,
  }) async {
    // Get start of week (Monday)
    final startOfWeek = date.subtract(Duration(days: date.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    return getStatistics(
      startDate: startOfWeek,
      endDate: endOfWeek,
      targetAmount: targetAmount,
    );
  }

  @override
  Future<WaterStatistics> getMonthlyStatistics({
    required DateTime date,
    required int targetAmount,
  }) async {
    final startOfMonth = DateTime(date.year, date.month, 1);
    final endOfMonth = DateTime(date.year, date.month + 1, 0);

    return getStatistics(
      startDate: startOfMonth,
      endDate: endOfMonth,
      targetAmount: targetAmount,
    );
  }

  @override
  Future<WaterStatistics> getYearlyStatistics({
    required DateTime date,
    required int targetAmount,
  }) async {
    final startOfYear = DateTime(date.year, 1, 1);
    final endOfYear = DateTime(date.year, 12, 31);

    return getStatistics(
      startDate: startOfYear,
      endDate: endOfYear,
      targetAmount: targetAmount,
    );
  }
}
