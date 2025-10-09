import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/models/water_intake.dart';
import '../../domain/models/daily_goal.dart';

class WaterLocalDataSource {
  static const String _waterIntakesBoxName = 'water_intakes';
  static const String _dailyGoalsBoxName = 'daily_goals';

  // Lazy-loaded boxes
  static Box<Map>? _waterIntakesBox;
  static Box<Map>? _dailyGoalsBox;

  /// Get or open water intakes box
  Future<Box<Map>> get _waterIntakes async {
    if (_waterIntakesBox == null || !_waterIntakesBox!.isOpen) {
      _waterIntakesBox = await Hive.openBox<Map>(_waterIntakesBoxName);
    }
    return _waterIntakesBox!;
  }

  /// Get or open daily goals box
  Future<Box<Map>> get _dailyGoals async {
    if (_dailyGoalsBox == null || !_dailyGoalsBox!.isOpen) {
      _dailyGoalsBox = await Hive.openBox<Map>(_dailyGoalsBoxName);
    }
    return _dailyGoalsBox!;
  }

  /// Add water intake
  Future<void> addWaterIntake(WaterIntake intake) async {
    final box = await _waterIntakes;
    await box.put(intake.id, intake.toJson());
  }

  /// Get all water intakes
  Future<List<WaterIntake>> getAllWaterIntakes() async {
    final box = await _waterIntakes;
    final intakes = box.values.toList();
    return intakes
        .map((json) => WaterIntake.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  /// Get water intakes for a specific date
  Future<List<WaterIntake>> getWaterIntakesForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final allIntakes = await getAllWaterIntakes();
    return allIntakes
        .where((intake) =>
            intake.timestamp.isAfter(startOfDay) &&
            intake.timestamp.isBefore(endOfDay))
        .toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  /// Get water intakes for date range
  Future<List<WaterIntake>> getWaterIntakesForDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final allIntakes = await getAllWaterIntakes();
    return allIntakes
        .where((intake) =>
            intake.timestamp.isAfter(startDate) &&
            intake.timestamp.isBefore(endDate))
        .toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  /// Delete water intake
  Future<void> deleteWaterIntake(String intakeId) async {
    final box = await _waterIntakes;
    await box.delete(intakeId);
  }

  /// Save daily goal
  Future<void> saveDailyGoal(DailyGoal goal) async {
    final box = await _dailyGoals;
    final key = _getDailyGoalKey(goal.date);
    await box.put(key, goal.toJson());
  }

  /// Get daily goal for a specific date
  Future<DailyGoal?> getDailyGoalForDate(DateTime date) async {
    final box = await _dailyGoals;
    final key = _getDailyGoalKey(date);
    final json = box.get(key);
    if (json == null) return null;
    return DailyGoal.fromJson(Map<String, dynamic>.from(json));
  }

  /// Watch water intakes changes
  Stream<List<WaterIntake>> watchWaterIntakes() async* {
    final box = await _waterIntakes;
    yield* box.watch().asyncMap((_) => getAllWaterIntakes());
  }

  /// Watch daily goals changes
  Stream<DailyGoal?> watchDailyGoalForDate(DateTime date) async* {
    final box = await _dailyGoals;
    final key = _getDailyGoalKey(date);
    yield* box.watch(key: key).asyncMap((_) => getDailyGoalForDate(date));
  }

  String _getDailyGoalKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}