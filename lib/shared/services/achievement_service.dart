import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    final achievementsRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('achievements');

    // Check if achievements already exist
    final existing = await achievementsRef.limit(1).get();
    if (existing.docs.isNotEmpty) return;

    // Create default achievements
    final batch = _firestore.batch();
    for (final achievement in AchievementDefinitions.defaultAchievements) {
      final docRef = achievementsRef.doc(achievement.id);
      batch.set(docRef, achievement.toFirestore());
    }
    await batch.commit();
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
            .map((doc) => AchievementExtension.fromFirestore(doc.data()))
            .toList());
  }

  /// Update achievement progress
  Future<void> updateProgress(
    String achievementId,
    int newValue, {
    bool increment = false,
  }) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    final docRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('achievements')
        .doc(achievementId);

    final doc = await docRef.get();
    if (!doc.exists) return;

    final achievement = AchievementExtension.fromFirestore(doc.data()!);

    // Don't update if already unlocked
    if (achievement.isUnlocked) return;

    final updatedValue = increment ? achievement.currentValue + newValue : newValue;
    final isNowUnlocked = updatedValue >= achievement.targetValue;

    await docRef.update({
      'currentValue': updatedValue,
      if (isNowUnlocked) ...{
        'isUnlocked': true,
        'unlockedAt': DateTime.now().millisecondsSinceEpoch,
      },
    });
  }

  /// Check and update achievements based on water intake
  Future<List<Achievement>> checkAchievements({
    required int totalIntake,
    required int currentStreak,
    required bool goalReached,
    required int consecutiveDays,
  }) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return [];

    final newlyUnlocked = <Achievement>[];

    // Check first water record
    if (totalIntake > 0) {
      await updateProgress('first_drop', 1);
    }

    // Check daily goal
    if (goalReached) {
      final doc = await _firestore
          .collection('users')
          .doc(userId)
          .collection('achievements')
          .doc('daily_goal_1')
          .get();

      if (doc.exists) {
        final achievement = AchievementExtension.fromFirestore(doc.data()!);
        if (!achievement.isUnlocked) {
          await updateProgress('daily_goal_1', 1);
          newlyUnlocked.add(achievement.copyWith(isUnlocked: true));
        }
      }
    }

    // Check streaks
    for (final streakTarget in [3, 7, 30]) {
      if (currentStreak >= streakTarget) {
        await updateProgress('streak_$streakTarget', currentStreak);
      }
    }

    // Check total consumption
    for (final target in [10000, 100000]) {
      await updateProgress('total_${target ~/ 1000}l', totalIntake);
    }

    // Check consistency
    await updateProgress('consistency_week', consecutiveDays);

    return newlyUnlocked;
  }

  /// Get unlocked achievements count
  Future<int> getUnlockedCount() async {
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
  }

  /// Get total reward points earned
  Future<int> getTotalPoints() async {
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
  }
}
