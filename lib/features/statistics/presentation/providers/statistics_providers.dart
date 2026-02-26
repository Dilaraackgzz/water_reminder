import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../home/data/datasources/water_local_datasource.dart';
import '../../../home/presentation/providers/home_providers.dart';
import '../../data/repositories/statistics_repository_impl.dart';
import '../../domain/models/water_statistics.dart';
import '../../domain/repositories/statistics_repository.dart';

/// DataSource singleton provider
final waterLocalDataSourceProvider = Provider<WaterLocalDataSource>((ref) {
  return WaterLocalDataSource();
});

/// Statistics repository provider
final statisticsRepositoryProvider = Provider<StatisticsRepository>((ref) {
  final dataSource = ref.watch(waterLocalDataSourceProvider);
  return StatisticsRepositoryImpl(dataSource);
});

/// Selected statistics period
enum StatisticsPeriod { week, month, year }

final selectedPeriodProvider = StateProvider<StatisticsPeriod>((ref) {
  return StatisticsPeriod.week;
});

/// Selected date for statistics
final selectedDateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

/// Helper provider to get target amount safely
final _targetAmountProvider = FutureProvider<int>((ref) async {
  final dailyGoalAsync = ref.watch(todaysDailyGoalProvider);

  return dailyGoalAsync.when(
    data: (goal) => goal.targetAmount,
    loading: () => 2000, // Default target while loading
    error: (_, __) => 2000, // Default target on error
  );
});

/// Weekly statistics provider
final weeklyStatisticsProvider = FutureProvider<WaterStatistics>((ref) async {
  final repository = ref.watch(statisticsRepositoryProvider);
  final date = ref.watch(selectedDateProvider);
  final targetAmount = await ref.watch(_targetAmountProvider.future);

  return repository.getWeeklyStatistics(
    date: date,
    targetAmount: targetAmount,
  );
});

/// Monthly statistics provider
final monthlyStatisticsProvider = FutureProvider<WaterStatistics>((ref) async {
  final repository = ref.watch(statisticsRepositoryProvider);
  final date = ref.watch(selectedDateProvider);
  final targetAmount = await ref.watch(_targetAmountProvider.future);

  return repository.getMonthlyStatistics(
    date: date,
    targetAmount: targetAmount,
  );
});

/// Yearly statistics provider
final yearlyStatisticsProvider = FutureProvider<WaterStatistics>((ref) async {
  final repository = ref.watch(statisticsRepositoryProvider);
  final date = ref.watch(selectedDateProvider);
  final targetAmount = await ref.watch(_targetAmountProvider.future);

  return repository.getYearlyStatistics(
    date: date,
    targetAmount: targetAmount,
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
      return ref.watch(yearlyStatisticsProvider.future);
  }
});
