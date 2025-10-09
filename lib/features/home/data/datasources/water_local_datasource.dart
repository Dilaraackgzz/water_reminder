import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/models/water_intake.dart';
import '../../domain/models/daily_goal.dart';

class WaterLocalDataSource {
  static const String _waterIntakesBoxName = 'water_intakes';
  static const String _dailyGoalsBoxName = 'daily_goals';

  Box<Map>? _waterIntakesBox;
  Box<Map>? _dailyGoalsBox;

  /// Initialize Hive boxes
  Future<void> init() async {
    _waterIntakesBox = await Hive.openBox<Map>(_waterIntakesBoxName);
    _dailyGoalsBox = await Hive.openBox<Map>(_dailyGoalsBoxName);
  }

  /// Add water intake
  Future<void> addWaterIntake(WaterIntake intake) async {
    await _waterIntakesBox?.put(intake.id, intake.toJson());
  }

  /// Get all water intakes
  List<WaterIntake> getAllWaterIntakes() {
    final intakes = _waterIntakesBox?.values.toList() ?? [];
    return intakes
        .map((json) => WaterIntake.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  /// Get water intakes for a specific date
  List<WaterIntake> getWaterIntakesForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return getAllWaterIntakes()
        .where((intake) =>
            intake.timestamp.isAfter(startOfDay) &&
            intake.timestamp.isBefore(endOfDay))
        .toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  /// Get water intakes for date range
  List<WaterIntake> getWaterIntakesForDateRange(
    DateTime startDate,
    DateTime endDate,
  ) {
    return getAllWaterIntakes()
        .where((intake) =>
            intake.timestamp.isAfter(startDate) &&
            intake.timestamp.isBefore(endDate))
        .toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  /// Delete water intake
  Future<void> deleteWaterIntake(String intakeId) async {
    await _waterIntakesBox?.delete(intakeId);
  }

  /// Save daily goal
  Future<void> saveDailyGoal(DailyGoal goal) async {
    final key = _getDailyGoalKey(goal.date);
    await _dailyGoalsBox?.put(key, goal.toJson());
  }

  /// Get daily goal for a specific date
  DailyGoal? getDailyGoalForDate(DateTime date) {
    final key = _getDailyGoalKey(date);
    final json = _dailyGoalsBox?.get(key);
    if (json == null) return null;
    return DailyGoal.fromJson(Map<String, dynamic>.from(json));
  }

  /// Watch water intakes changes
  Stream<List<WaterIntake>> watchWaterIntakes() {
    return _waterIntakesBox!.watch().map((_) => getAllWaterIntakes());
  }

  /// Watch daily goals changes
  Stream<DailyGoal?> watchDailyGoalForDate(DateTime date) {
    final key = _getDailyGoalKey(date);
    return _dailyGoalsBox!.watch(key: key).map((_) => getDailyGoalForDate(date));
  }

  String _getDailyGoalKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}