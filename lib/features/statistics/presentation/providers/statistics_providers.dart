import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../home/data/datasources/water_local_datasource.dart';
import '../../../home/presentation/providers/home_providers.dart';
import '../../data/repositories/statistics_repository_impl.dart';
import '../../domain/models/water_statistics.dart';
import '../../domain/repositories/statistics_repository.dart';

/// Statistics repository provider
final statisticsRepositoryProvider = Provider<StatisticsRepository>((ref) {
  final dataSource = WaterLocalDataSource();
  return StatisticsRepositoryImpl(dataSource);
});

/// Selected statistics period (daily, weekly, monthly)
enum StatisticsPeriod { week, month, year }

final selectedPeriodProvider = StateProvider<StatisticsPeriod>((ref) {
  return StatisticsPeriod.week;
});

/// Selected date for statistics
final selectedDateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

/// Weekly statistics provider
final weeklyStatisticsProvider = FutureProvider<WaterStatistics>((ref) async {
  final repository = ref.watch(statisticsRepositoryProvider);
  final date = ref.watch(selectedDateProvider);
  final dailyGoalAsync = ref.watch(todaysDailyGoalProvider);

  return dailyGoalAsync.when(
    data: (goal) async {
      return await repository.getWeeklyStatistics(
        date: date,
        targetAmount: goal.targetAmount,
      );
    },
    loading: () => throw Exception('Loading goal...'),
    error: (error, stack) => throw error,
  );
});

/// Monthly statistics provider
final monthlyStatisticsProvider = FutureProvider<WaterStatistics>((ref) async {
  final repository = ref.watch(statisticsRepositoryProvider);
  final date = ref.watch(selectedDateProvider);
  final dailyGoalAsync = ref.watch(todaysDailyGoalProvider);

  return dailyGoalAsync.when(
    data: (goal) async {
      return await repository.getMonthlyStatistics(
        date: date,
        targetAmount: goal.targetAmount,
      );
    },
    loading: () => throw Exception('Loading goal...'),
    error: (error, stack) => throw error,
  );
});

/// Current statistics based on selected period
final currentStatisticsProvider = FutureProvider<WaterStatistics>((ref) async {
  final period = ref.watch(selectedPeriodProvider);

  switch (period) {
    case StatisticsPeriod.week:
      return ref.watch(weeklyStatisticsProvider.future);
    case StatisticsPeriod.month:
      return ref.watch(monthlyStatisticsProvider.future);
    case StatisticsPeriod.year:
      final repository = ref.watch(statisticsRepositoryProvider);
      final date = ref.watch(selectedDateProvider);
      final dailyGoalAsync = ref.watch(todaysDailyGoalProvider);
      return dailyGoalAsync.when(
        data: (goal) async {
          return await repository.getYearlyStatistics(
            date: date,
            targetAmount: goal.targetAmount,
          );
        },
        loading: () => throw Exception('Loading goal...'),
        error: (error, stack) => throw error,
      );
  }
});
