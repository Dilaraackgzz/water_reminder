import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import '../../domain/models/water_intake.dart';
import '../../../../shared/providers/achievement_provider.dart';
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

    // Su eklenmeden önceki hedef durumunu kaydet
    final wasGoalReachedBefore = _ref.read(progressPercentageProvider) >= 100.0;

    final repository = _ref.read(waterRepositoryProvider);
    final intake = WaterIntake(
      id: _uuid.v4(),
      userId: _currentUserId,
      amount: amount,
      timestamp: DateTime.now(),
      note: note,
    );

    await repository.addWaterIntake(intake);

    await _updateStreakAfterIntake();
    // goalJustReached: bu su eklemesiyle ilk kez %100'e ulaşıldı mı?
    final goalJustReached = !wasGoalReachedBefore &&
        _ref.read(progressPercentageProvider) >= 100.0;
    await _checkAchievements(goalJustReached: goalJustReached);
  }

  /// Update streak based on daily goal completion
  Future<void> _updateStreakAfterIntake() async {
    try {
      final progressPercentage = _ref.read(progressPercentageProvider);
      final goalCompleted = progressPercentage >= 100.0;

      final streakRepository = _ref.read(streakRepositoryProvider);
      await streakRepository.updateStreak(
        userId: _currentUserId,
        goalCompleted: goalCompleted,
      );

      _ref.invalidate(userStreakProvider);
    } catch (e) {
      debugPrint("Failed to update streak: $e");
    }
  }

  /// Su eklendikten sonra başarımları kontrol et ve Firestore'u güncelle
  Future<void> _checkAchievements({required bool goalJustReached}) async {
    try {
      // Tüm zamanların toplam tüketimi (ml)
      final localDataSource = _ref.read(waterLocalDataSourceProvider);
      final allIntakes = await localDataSource.getAllWaterIntakes();
      final totalIntake = allIntakes.fold<int>(0, (sum, i) => sum + i.amount);

      // Streak verisi
      final streakRepo = _ref.read(streakRepositoryProvider);
      final streak = await streakRepo.getUserStreak(_currentUserId);
      final currentStreak = streak?.currentStreak ?? 0;

      final achievementService = _ref.read(achievementServiceProvider);
      await achievementService.checkAchievements(
        totalIntake: totalIntake,
        currentStreak: currentStreak,
        goalReached: goalJustReached,
        consecutiveDays: currentStreak,
      );
    } catch (e) {
      debugPrint("Failed to check achievements: $e");
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