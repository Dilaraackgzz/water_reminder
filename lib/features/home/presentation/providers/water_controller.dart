import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import '../../domain/models/water_intake.dart';
import 'home_providers.dart';
import 'streak_providers.dart';

final waterControllerProvider = Provider<WaterController>((ref) {
  return WaterController(ref);
});

class WaterController {
  final Ref _ref;
  final _uuid = const Uuid();

  WaterController(this._ref);

  String get _currentUserId => FirebaseAuth.instance.currentUser?.uid ?? '';

  /// Add water intake
  Future<void> addWater(int amount, {String? note}) async {
    if (amount <= 0) return;

    final repository = _ref.read(waterRepositoryProvider);

    final intake = WaterIntake(
      id: _uuid.v4(),
      userId: _currentUserId,
      amount: amount,
      timestamp: DateTime.now(),
      note: note,
    );

    await repository.addWaterIntake(intake);

    // Update streak based on goal completion
    await _updateStreakAfterIntake();
  }

  /// Update streak based on daily goal completion
  Future<void> _updateStreakAfterIntake() async {
    try {
      // Get current progress percentage
      final progressPercentage = _ref.read(progressPercentageProvider);

      // Check if daily goal is completed (>= 100%)
      final goalCompleted = progressPercentage >= 100.0;

      // Update streak
      final streakRepository = _ref.read(streakRepositoryProvider);
      await streakRepository.updateStreak(
        userId: _currentUserId,
        goalCompleted: goalCompleted,
      );

      // Refresh the user streak provider
      _ref.invalidate(userStreakProvider);
    } catch (e) {
      // Silent fail - don't let streak update failures affect water intake
      debugPrint("Failed to update streak: $e");
    }
  }

  /// Delete water intake
  Future<void> deleteWater(String intakeId) async {
    final repository = _ref.read(waterRepositoryProvider);
    await repository.deleteWaterIntake(intakeId);
  }

  /// Quick add methods
  Future<void> addSmallGlass() => addWater(250); // 250ml
  Future<void> addMediumGlass() => addWater(500); // 500ml
  Future<void> addLargeGlass() => addWater(750); // 750ml
  Future<void> addBottle() => addWater(1000); // 1L
}