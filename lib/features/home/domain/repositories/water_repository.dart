import '../models/water_intake.dart';
import '../models/daily_goal.dart';

abstract class WaterRepository {
  /// Add a new water intake entry
  Future<void> addWaterIntake(WaterIntake intake);

  /// Get all water intakes for a specific date
  Future<List<WaterIntake>> getWaterIntakesForDate(DateTime date);

  /// Get water intakes for a date range
  Future<List<WaterIntake>> getWaterIntakesForDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  /// Delete a water intake entry
  Future<void> deleteWaterIntake(String intakeId);

  /// Get today's daily goal
  Future<DailyGoal> getTodaysDailyGoal();

  /// Get daily goal for a specific date
  Future<DailyGoal?> getDailyGoalForDate(DateTime date);

  /// Update daily goal progress
  Future<void> updateDailyGoal(DailyGoal goal);

  /// Stream of today's water intakes
  Stream<List<WaterIntake>> watchTodaysWaterIntakes();

  /// Stream of today's daily goal
  Stream<DailyGoal> watchTodaysDailyGoal();

  /// Firestore'dan yerel depolamaya veri senkronize et
  Future<void> syncFromCloud();
}