import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../models/achievement.dart';

/// Service for managing user achievements
class AchievementService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  AchievementService({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _firestore = firestore,
        _auth = auth;

  /// Initialize achievements for a new user
  Future<void> initializeAchievements() async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) return;

      final achievementsRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('achievements');

      // Mevcut başarımların ID'lerini al
      final existing = await achievementsRef.get();
      final existingIds = existing.docs.map((d) => d.id).toSet();

      // Yalnızca eksik olan başarımları ekle (yeni kullanıcı veya migration)
      final missing = AchievementDefinitions.defaultAchievements
          .where((a) => !existingIds.contains(a.id))
          .toList();

      if (missing.isEmpty) return;

      final batch = _firestore.batch();
      for (final achievement in missing) {
        final docRef = achievementsRef.doc(achievement.id);
        batch.set(docRef, achievement.toFirestore());
      }
      await batch.commit();
    } catch (e, stackTrace) {
      debugPrint('AchievementService.initializeAchievements error: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  /// Get all achievements for current user
  Stream<List<Achievement>> watchAchievements() {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return Stream.value([]);

    return _firestore
        .collection('users')
        .doc(userId)
        .collection('achievements')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AchievementMapper.fromFirestore(doc.data()))
            .toList())
        .handleError((error, stackTrace) {
      debugPrint('AchievementService.watchAchievements error: $error');
      debugPrint('Stack trace: $stackTrace');
      return <Achievement>[];
    });
  }

  /// Update achievement progress
  Future<bool> updateProgress(
    String achievementId,
    int newValue, {
    bool increment = false,
  }) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) return false;

      final docRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('achievements')
          .doc(achievementId);

      final doc = await docRef.get();
      if (!doc.exists) return false;

      final achievement = AchievementMapper.fromFirestore(doc.data()!);

      // Don't update if already unlocked
      if (achievement.isUnlocked) return false;

      final updatedValue = increment ? achievement.currentValue + newValue : newValue;
      final isNowUnlocked = updatedValue >= achievement.targetValue;

      await docRef.update({
        'currentValue': updatedValue,
        if (isNowUnlocked) ...{
          'isUnlocked': true,
          'unlockedAt': DateTime.now().millisecondsSinceEpoch,
        },
      });

      return isNowUnlocked;
    } catch (e, stackTrace) {
      debugPrint('AchievementService.updateProgress error: $e');
      debugPrint('Stack trace: $stackTrace');
      return false;
    }
  }

  /// Check and update achievements based on water intake
  Future<List<Achievement>> checkAchievements({
    required int totalIntake,
    required int currentStreak,
    required bool goalReached,
    required int consecutiveDays,
  }) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) return [];

      final newlyUnlocked = <Achievement>[];

      // Check first water record
      if (totalIntake > 0) {
        final unlocked = await updateProgress('first_drop', 1);
        if (unlocked) {
          final achievement = await _getAchievement(userId, 'first_drop');
          if (achievement != null) newlyUnlocked.add(achievement);
        }
      }

      // Check daily goal
      if (goalReached) {
        for (final goalId in ['daily_goal_1', 'daily_goal_5', 'daily_goal_10', 'daily_goal_30']) {
          final unlocked = await updateProgress(goalId, 1, increment: true);
          if (unlocked) {
            final achievement = await _getAchievement(userId, goalId);
            if (achievement != null) newlyUnlocked.add(achievement);
          }
        }
      }

      // Check streaks
      for (final streakTarget in [3, 7, 14, 30, 60]) {
        if (currentStreak >= streakTarget) {
          final unlocked = await updateProgress('streak_$streakTarget', currentStreak);
          if (unlocked) {
            final achievement = await _getAchievement(userId, 'streak_$streakTarget');
            if (achievement != null) newlyUnlocked.add(achievement);
          }
        }
      }

      // Check total consumption
      for (final target in [1000, 5000, 10000, 50000, 100000]) {
        final achievementId = 'total_${target ~/ 1000}l';
        final unlocked = await updateProgress(achievementId, totalIntake);
        if (unlocked) {
          final achievement = await _getAchievement(userId, achievementId);
          if (achievement != null) newlyUnlocked.add(achievement);
        }
      }

      // Check consistency
      for (final target in ['consistency_week', 'consistency_month']) {
        final targetDays = target == 'consistency_week' ? 7 : 30;
        if (consecutiveDays >= targetDays) {
          final unlocked = await updateProgress(target, consecutiveDays);
          if (unlocked) {
            final achievement = await _getAchievement(userId, target);
            if (achievement != null) newlyUnlocked.add(achievement);
          }
        }
      }

      return newlyUnlocked;
    } catch (e, stackTrace) {
      debugPrint('AchievementService.checkAchievements error: $e');
      debugPrint('Stack trace: $stackTrace');
      return [];
    }
  }

  /// Helper to get a single achievement
  Future<Achievement?> _getAchievement(String userId, String achievementId) async {
    try {
      final doc = await _firestore
          .collection('users')
          .doc(userId)
          .collection('achievements')
          .doc(achievementId)
          .get();

      if (!doc.exists) return null;
      return AchievementMapper.fromFirestore(doc.data()!);
    } catch (e) {
      debugPrint('AchievementService._getAchievement error: $e');
      return null;
    }
  }

  /// Get unlocked achievements count
  Future<int> getUnlockedCount() async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) return 0;

      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('achievements')
          .where('isUnlocked', isEqualTo: true)
          .count()
          .get();

      return snapshot.count ?? 0;
    } catch (e, stackTrace) {
      debugPrint('AchievementService.getUnlockedCount error: $e');
      debugPrint('Stack trace: $stackTrace');
      return 0;
    }
  }

  /// Get total reward points earned
  Future<int> getTotalPoints() async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) return 0;

      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('achievements')
          .where('isUnlocked', isEqualTo: true)
          .get();

      return snapshot.docs.fold<int>(
        0,
        (total, doc) => total + ((doc.data()['rewardPoints'] as int?) ?? 0),
      );
    } catch (e, stackTrace) {
      debugPrint('AchievementService.getTotalPoints error: $e');
      debugPrint('Stack trace: $stackTrace');
      return 0;
    }
  }
}
