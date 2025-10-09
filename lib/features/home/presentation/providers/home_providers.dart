import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/water_repository.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../data/datasources/water_local_datasource.dart';
import '../../data/datasources/settings_local_datasource.dart';
import '../../data/repositories/water_repository_impl.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../domain/models/water_intake.dart';
import '../../domain/models/daily_goal.dart';
import '../../domain/models/user_settings.dart';

// Data source providers - simple singletons
final waterLocalDataSourceProvider = Provider<WaterLocalDataSource>((ref) {
  return WaterLocalDataSource();
});

final settingsLocalDataSourceProvider = Provider<SettingsLocalDataSource>((ref) {
  return SettingsLocalDataSource();
});

// Repository providers
final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepositoryImpl(
    localDataSource: ref.watch(settingsLocalDataSourceProvider),
    auth: FirebaseAuth.instance,
  );
});

final waterRepositoryProvider = Provider<WaterRepository>((ref) {
  return WaterRepositoryImpl(
    localDataSource: ref.watch(waterLocalDataSourceProvider),
    settingsRepository: ref.watch(settingsRepositoryProvider),
    auth: FirebaseAuth.instance,
  );
});

// Stream providers
final todaysDailyGoalProvider = StreamProvider<DailyGoal>((ref) {
  final repository = ref.watch(waterRepositoryProvider);
  return repository.watchTodaysDailyGoal();
});

final todaysWaterIntakesProvider = StreamProvider<List<WaterIntake>>((ref) {
  final repository = ref.watch(waterRepositoryProvider);
  return repository.watchTodaysWaterIntakes();
});

final userSettingsProvider = StreamProvider<UserSettings>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return repository.watchUserSettings();
});

// Computed providers
final todaysTotalIntakeProvider = Provider<int>((ref) {
  final intakesAsync = ref.watch(todaysWaterIntakesProvider);
  return intakesAsync.when(
    data: (intakes) => intakes.fold<int>(0, (sum, intake) => sum + intake.amount),
    loading: () => 0,
    error: (_, __) => 0,
  );
});

final progressPercentageProvider = Provider<double>((ref) {
  final goalAsync = ref.watch(todaysDailyGoalProvider);
  return goalAsync.when(
    data: (goal) => goal.progressPercentage,
    loading: () => 0.0,
    error: (_, __) => 0.0,
  );
});