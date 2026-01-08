import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:water_reminder/shared/models/achievement.dart';
import 'package:water_reminder/shared/services/achievement_service.dart';

void main() {
  group('AchievementService Tests', () {
    late FakeFirebaseFirestore fakeFirestore;
    late MockFirebaseAuth mockAuth;
    late AchievementService achievementService;
    late String userId;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      mockAuth = MockFirebaseAuth(
        mockUser: MockUser(
          uid: 'test-user-id',
          email: 'test@example.com',
        ),
        signedIn: true,
      );
      userId = mockAuth.currentUser!.uid;
      achievementService = AchievementService(
        firestore: fakeFirestore,
        auth: mockAuth,
      );
    });

    group('initializeAchievements', () {
      test('should create default achievements for new user', () async {
        // Act
        await achievementService.initializeAchievements();

        // Assert
        final snapshot = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .get();

        expect(snapshot.docs.length, AchievementDefinitions.defaultAchievements.length);
      });

      test('should not recreate achievements if they already exist', () async {
        // Arrange - Initialize once
        await achievementService.initializeAchievements();

        final firstSnapshot = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .get();

        // Act - Try to initialize again
        await achievementService.initializeAchievements();

        final secondSnapshot = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .get();

        // Assert - Should still have the same count
        expect(secondSnapshot.docs.length, firstSnapshot.docs.length);
      });

      test('should create all achievement types', () async {
        // Act
        await achievementService.initializeAchievements();

        // Assert
        final snapshot = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .get();

        final achievements = snapshot.docs
            .map((doc) => AchievementExtension.fromFirestore(doc.data()))
            .toList();

        // Check that we have different types
        final types = achievements.map((a) => a.type).toSet();
        expect(types.contains(AchievementType.milestone), true);
        expect(types.contains(AchievementType.dailyGoal), true);
        expect(types.contains(AchievementType.streak), true);
        expect(types.contains(AchievementType.totalConsumption), true);
        expect(types.contains(AchievementType.consistency), true);
      });
    });

    group('watchAchievements', () {
      test('should return stream of achievements', () async {
        // Arrange
        await achievementService.initializeAchievements();

        // Act
        final stream = achievementService.watchAchievements();

        // Assert
        await expectLater(
          stream,
          emits(predicate<List<Achievement>>((list) => list.isNotEmpty)),
        );
      });

      test('should return empty stream when user not authenticated', () async {
        // Arrange - Create service with unauthenticated user
        final unauthAuth = MockFirebaseAuth(signedIn: false);
        final unauthService = AchievementService(
          firestore: fakeFirestore,
          auth: unauthAuth,
        );

        // Act
        final stream = unauthService.watchAchievements();

        // Assert
        await expectLater(stream, emits([]));
      });
    });

    group('updateProgress', () {
      setUp(() async {
        await achievementService.initializeAchievements();
      });

      test('should update achievement progress', () async {
        // Act
        await achievementService.updateProgress('first_drop', 1);

        // Assert
        final doc = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .doc('first_drop')
            .get();

        final achievement = AchievementExtension.fromFirestore(doc.data()!);
        expect(achievement.currentValue, 1);
      });

      test('should unlock achievement when target reached', () async {
        // Act
        await achievementService.updateProgress('first_drop', 1);

        // Assert
        final doc = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .doc('first_drop')
            .get();

        final achievement = AchievementExtension.fromFirestore(doc.data()!);
        expect(achievement.isUnlocked, true);
        expect(achievement.unlockedAt, isNotNull);
      });

      test('should increment progress when increment is true', () async {
        // Arrange - Set initial value
        await achievementService.updateProgress('total_10l', 1000);

        // Act - Increment by 500
        await achievementService.updateProgress('total_10l', 500, increment: true);

        // Assert
        final doc = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .doc('total_10l')
            .get();

        final achievement = AchievementExtension.fromFirestore(doc.data()!);
        expect(achievement.currentValue, 1500);
      });

      test('should not update already unlocked achievement', () async {
        // Arrange - Unlock achievement
        await achievementService.updateProgress('first_drop', 1);

        // Get unlocked timestamp
        final firstDoc = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .doc('first_drop')
            .get();
        final firstUnlockTime = firstDoc.data()!['unlockedAt'];

        // Wait a bit
        await Future.delayed(const Duration(milliseconds: 10));

        // Act - Try to update again
        await achievementService.updateProgress('first_drop', 2);

        // Assert - Should not change
        final secondDoc = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .doc('first_drop')
            .get();

        expect(secondDoc.data()!['currentValue'], 1);
        expect(secondDoc.data()!['unlockedAt'], firstUnlockTime);
      });

      test('should not update if achievement does not exist', () async {
        // Act - Try to update non-existent achievement
        await achievementService.updateProgress('non_existent', 10);

        // Assert - Should complete without errors
        final doc = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .doc('non_existent')
            .get();

        expect(doc.exists, false);
      });
    });

    group('checkAchievements', () {
      setUp(() async {
        await achievementService.initializeAchievements();
      });

      test('should unlock first drop achievement on first water intake', () async {
        // Act
        await achievementService.checkAchievements(
          totalIntake: 250,
          currentStreak: 0,
          goalReached: false,
          consecutiveDays: 1,
        );

        // Assert
        final doc = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .doc('first_drop')
            .get();

        final achievement = AchievementExtension.fromFirestore(doc.data()!);
        expect(achievement.currentValue, greaterThanOrEqualTo(1));
      });

      test('should unlock daily goal achievement when goal reached', () async {
        // Act
        await achievementService.checkAchievements(
          totalIntake: 2000,
          currentStreak: 1,
          goalReached: true,
          consecutiveDays: 1,
        );

        // Assert
        final doc = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .doc('daily_goal_1')
            .get();

        final achievement = AchievementExtension.fromFirestore(doc.data()!);
        expect(achievement.currentValue, greaterThanOrEqualTo(1));
      });

      test('should update streak achievements', () async {
        // Act - 3 day streak
        await achievementService.checkAchievements(
          totalIntake: 2000,
          currentStreak: 3,
          goalReached: true,
          consecutiveDays: 3,
        );

        // Assert
        final doc = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .doc('streak_3')
            .get();

        final achievement = AchievementExtension.fromFirestore(doc.data()!);
        expect(achievement.currentValue, greaterThanOrEqualTo(3));
      });

      test('should update total consumption achievements', () async {
        // Act
        await achievementService.checkAchievements(
          totalIntake: 5000,
          currentStreak: 0,
          goalReached: false,
          consecutiveDays: 1,
        );

        // Assert
        final doc = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .doc('total_10l')
            .get();

        final achievement = AchievementExtension.fromFirestore(doc.data()!);
        expect(achievement.currentValue, 5000);
      });

      test('should update consistency achievement', () async {
        // Act
        await achievementService.checkAchievements(
          totalIntake: 1000,
          currentStreak: 0,
          goalReached: false,
          consecutiveDays: 5,
        );

        // Assert
        final doc = await fakeFirestore
            .collection('users')
            .doc(userId)
            .collection('achievements')
            .doc('consistency_week')
            .get();

        final achievement = AchievementExtension.fromFirestore(doc.data()!);
        expect(achievement.currentValue, 5);
      });
    });

    group('getUnlockedCount', () {
      setUp(() async {
        await achievementService.initializeAchievements();
      });

      test('should return 0 when no achievements unlocked', () async {
        // Act
        final count = await achievementService.getUnlockedCount();

        // Assert
        expect(count, 0);
      });

      test('should return correct count of unlocked achievements', () async {
        // Arrange - Unlock some achievements
        await achievementService.updateProgress('first_drop', 1);
        await achievementService.updateProgress('daily_goal_1', 1);

        // Act
        final count = await achievementService.getUnlockedCount();

        // Assert
        expect(count, 2);
      });
    });

    group('getTotalPoints', () {
      setUp(() async {
        await achievementService.initializeAchievements();
      });

      test('should return 0 when no achievements unlocked', () async {
        // Act
        final points = await achievementService.getTotalPoints();

        // Assert
        expect(points, 0);
      });

      test('should calculate total reward points correctly', () async {
        // Arrange - Unlock achievements
        await achievementService.updateProgress('first_drop', 1); // 5 points
        await achievementService.updateProgress('daily_goal_1', 1); // 10 points

        // Act
        final points = await achievementService.getTotalPoints();

        // Assert
        expect(points, 15); // 5 + 10
      });
    });

    group('Achievement Extension Tests', () {
      test('should calculate progress percentage correctly', () {
        // Arrange
        final achievement = const Achievement(
          id: 'test',
          title: 'Test',
          description: 'Test achievement',
          iconName: 'test',
          type: AchievementType.totalConsumption,
          targetValue: 100,
          currentValue: 50,
        );

        // Assert
        expect(achievement.progress, 0.5);
      });

      test('should clamp progress to 1.0 when exceeded', () {
        // Arrange
        final achievement = const Achievement(
          id: 'test',
          title: 'Test',
          description: 'Test achievement',
          iconName: 'test',
          type: AchievementType.totalConsumption,
          targetValue: 100,
          currentValue: 150,
        );

        // Assert
        expect(achievement.progress, 1.0);
      });

      test('should identify completed achievements', () {
        // Arrange
        final achievement = const Achievement(
          id: 'test',
          title: 'Test',
          description: 'Test achievement',
          iconName: 'test',
          type: AchievementType.totalConsumption,
          targetValue: 100,
          currentValue: 100,
        );

        // Assert
        expect(achievement.isCompleted, true);
      });

      test('should format progress text correctly', () {
        // Arrange
        final achievement = const Achievement(
          id: 'test',
          title: 'Test',
          description: 'Test achievement',
          iconName: 'test',
          type: AchievementType.totalConsumption,
          targetValue: 100,
          currentValue: 75,
        );

        // Assert
        expect(achievement.progressText, '75 / 100');
      });
    });
  });
}