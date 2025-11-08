import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:water_reminder/features/home/data/repositories/streak_repository_impl.dart';
import 'package:water_reminder/features/home/domain/models/user_streak.dart';

void main() {
  group('StreakRepository Tests', () {
    late StreakRepositoryImpl repository;
    const userId = 'test-user-id';

    setUpAll(() async {
      // Initialize Hive for testing
      Hive.init('./test/hive_test_db');

      // Register adapters if needed
      // Note: Since UserStreak uses JSON serialization, we don't need adapters
    });

    setUp(() async {
      repository = StreakRepositoryImpl();

      // Clean up any existing data
      try {
        final box = await Hive.openBox<Map>('user_streaks');
        await box.clear();
      } catch (e) {
        // Box might not exist yet, that's okay
      }
    });

    tearDown(() async {
      // Clean up after each test
      try {
        final box = await Hive.openBox<Map>('user_streaks');
        await box.clear();
        await box.close();
      } catch (e) {
        // Ignore errors during cleanup
      }
    });

    tearDownAll(() async {
      await Hive.close();
      await Hive.deleteFromDisk();
    });

    group('getUserStreak', () {
      test('should return null when no streak exists', () async {
        // Act
        final result = await repository.getUserStreak(userId);

        // Assert
        expect(result, isNull);
      });

      test('should return existing streak data', () async {
        // Arrange
        final streak = UserStreak.initial(userId);
        await repository.saveStreak(streak);

        // Act
        final result = await repository.getUserStreak(userId);

        // Assert
        expect(result, isNotNull);
        expect(result!.userId, userId);
        expect(result.currentStreak, 0);
        expect(result.longestStreak, 0);
      });
    });

    group('saveStreak and updateStreak', () {
      test('should save streak data successfully', () async {
        // Arrange
        final streak = UserStreak.initial(userId);

        // Act
        await repository.saveStreak(streak);
        final saved = await repository.getUserStreak(userId);

        // Assert
        expect(saved, isNotNull);
        expect(saved!.userId, userId);
      });

      test('should create new streak when goal completed on first day', () async {
        // Act
        final result = await repository.updateStreak(
          userId: userId,
          goalCompleted: true,
        );

        // Assert
        expect(result.userId, userId);
        expect(result.currentStreak, 1);
        expect(result.longestStreak, 1);
        expect(result.completedDates.length, 1);
      });

      test('should increment streak when goal completed next day', () async {
        // Arrange - Complete goal today
        final now = DateTime.now();
        final yesterday = now.subtract(const Duration(days: 1));

        final initialStreak = UserStreak(
          userId: userId,
          currentStreak: 1,
          longestStreak: 1,
          lastCheckDate: yesterday,
          streakStartDate: yesterday,
          completedDates: [
            DateTime(yesterday.year, yesterday.month, yesterday.day),
          ],
        );
        await repository.saveStreak(initialStreak);

        // Act - Complete goal today
        final result = await repository.updateStreak(
          userId: userId,
          goalCompleted: true,
        );

        // Assert
        expect(result.currentStreak, 2);
        expect(result.longestStreak, 2);
        expect(result.completedDates.length, 2);
      });

      test('should break streak when goal not completed next day', () async {
        // Arrange
        final now = DateTime.now();
        final yesterday = now.subtract(const Duration(days: 1));

        final initialStreak = UserStreak(
          userId: userId,
          currentStreak: 5,
          longestStreak: 5,
          lastCheckDate: yesterday,
          streakStartDate: yesterday.subtract(const Duration(days: 4)),
          completedDates: List.generate(
            5,
            (i) => yesterday.subtract(Duration(days: 4 - i)),
          ),
        );
        await repository.saveStreak(initialStreak);

        // Act - Don't complete goal today
        final result = await repository.updateStreak(
          userId: userId,
          goalCompleted: false,
        );

        // Assert
        expect(result.currentStreak, 0);
        expect(result.longestStreak, 5); // Longest should remain
      });

      test('should reset streak when multiple days missed', () async {
        // Arrange
        final now = DateTime.now();
        final threeDaysAgo = now.subtract(const Duration(days: 3));

        final initialStreak = UserStreak(
          userId: userId,
          currentStreak: 10,
          longestStreak: 10,
          lastCheckDate: threeDaysAgo,
          streakStartDate: threeDaysAgo.subtract(const Duration(days: 9)),
          completedDates: [],
        );
        await repository.saveStreak(initialStreak);

        // Act - Try to complete goal after missing days
        final result = await repository.updateStreak(
          userId: userId,
          goalCompleted: true,
        );

        // Assert - Should start new streak
        expect(result.currentStreak, 1);
        expect(result.longestStreak, 10); // Longest should remain
      });

      test('should not change streak when already checked today', () async {
        // Arrange - Complete goal today
        await repository.updateStreak(
          userId: userId,
          goalCompleted: true,
        );
        final firstUpdate = await repository.getUserStreak(userId);

        // Act - Try to update again today
        final result = await repository.updateStreak(
          userId: userId,
          goalCompleted: true,
        );

        // Assert - Streak should remain the same
        expect(result.currentStreak, firstUpdate!.currentStreak);
        expect(result.longestStreak, firstUpdate.longestStreak);
      });

      test('should update longest streak when current exceeds it', () async {
        // Arrange
        final now = DateTime.now();
        final yesterday = now.subtract(const Duration(days: 1));

        final initialStreak = UserStreak(
          userId: userId,
          currentStreak: 5,
          longestStreak: 5,
          lastCheckDate: yesterday,
          streakStartDate: yesterday.subtract(const Duration(days: 4)),
          completedDates: [],
        );
        await repository.saveStreak(initialStreak);

        // Act
        final result = await repository.updateStreak(
          userId: userId,
          goalCompleted: true,
        );

        // Assert
        expect(result.currentStreak, 6);
        expect(result.longestStreak, 6);
      });
    });

    group('resetStreak', () {
      test('should reset streak to initial state', () async {
        // Arrange - Create a streak with progress
        final streak = UserStreak(
          userId: userId,
          currentStreak: 10,
          longestStreak: 15,
          lastCheckDate: DateTime.now(),
          streakStartDate: DateTime.now().subtract(const Duration(days: 10)),
          completedDates: [],
        );
        await repository.saveStreak(streak);

        // Act
        await repository.resetStreak(userId);
        final reset = await repository.getUserStreak(userId);

        // Assert
        expect(reset, isNotNull);
        expect(reset!.currentStreak, 0);
        expect(reset.longestStreak, 0);
        expect(reset.completedDates, isEmpty);
      });
    });

    group('getStreakHistory', () {
      test('should return empty list when no history exists', () async {
        // Act
        final history = await repository.getStreakHistory(userId);

        // Assert
        expect(history, isEmpty);
      });

      test('should return completed dates from streak', () async {
        // Arrange
        final today = DateTime.now();
        final dates = [
          DateTime(today.year, today.month, today.day),
          DateTime(today.year, today.month, today.day - 1),
          DateTime(today.year, today.month, today.day - 2),
        ];

        final streak = UserStreak(
          userId: userId,
          currentStreak: 3,
          longestStreak: 3,
          lastCheckDate: today,
          streakStartDate: dates.last,
          completedDates: dates,
        );
        await repository.saveStreak(streak);

        // Act
        final history = await repository.getStreakHistory(userId);

        // Assert
        expect(history.length, 3);
        expect(history, dates);
      });
    });

    group('UserStreak Extension Tests', () {
      test('should correctly identify active streak', () {
        // Arrange - Today
        final now = DateTime.now();
        final streak = UserStreak(
          userId: userId,
          currentStreak: 5,
          longestStreak: 5,
          lastCheckDate: now,
          streakStartDate: now.subtract(const Duration(days: 4)),
        );

        // Assert
        expect(streak.isActive, true);
      });

      test('should correctly identify inactive streak', () {
        // Arrange - 3 days ago
        final now = DateTime.now();
        final threeDaysAgo = now.subtract(const Duration(days: 3));
        final streak = UserStreak(
          userId: userId,
          currentStreak: 5,
          longestStreak: 5,
          lastCheckDate: threeDaysAgo,
          streakStartDate: threeDaysAgo.subtract(const Duration(days: 4)),
        );

        // Assert
        expect(streak.isActive, false);
      });

      test('should correctly check if completed today', () {
        // Arrange
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);

        final streak = UserStreak(
          userId: userId,
          currentStreak: 1,
          longestStreak: 1,
          lastCheckDate: now,
          streakStartDate: now,
          completedDates: [today],
        );

        // Assert
        expect(streak.completedToday, true);
      });

      test('should identify streak milestones', () {
        // Arrange & Assert
        expect(UserStreak.initial(userId).copyWith(currentStreak: 1).isStreakMilestone(), true);
        expect(UserStreak.initial(userId).copyWith(currentStreak: 3).isStreakMilestone(), true);
        expect(UserStreak.initial(userId).copyWith(currentStreak: 7).isStreakMilestone(), true);
        expect(UserStreak.initial(userId).copyWith(currentStreak: 14).isStreakMilestone(), true);
        expect(UserStreak.initial(userId).copyWith(currentStreak: 30).isStreakMilestone(), true);
        expect(UserStreak.initial(userId).copyWith(currentStreak: 5).isStreakMilestone(), false);
      });

      test('should correctly identify personal best', () {
        // Arrange - Current equals longest
        final streak = UserStreak.initial(userId).copyWith(
          currentStreak: 10,
          longestStreak: 10,
        );

        // Assert
        expect(streak.isPersonalBest, true);
      });

      test('should calculate days to next milestone', () {
        // Arrange & Assert
        expect(
          UserStreak.initial(userId).copyWith(currentStreak: 1).daysToNextMilestone,
          2, // Next milestone is 3
        );
        expect(
          UserStreak.initial(userId).copyWith(currentStreak: 5).daysToNextMilestone,
          2, // Next milestone is 7
        );
        expect(
          UserStreak.initial(userId).copyWith(currentStreak: 25).daysToNextMilestone,
          5, // Next milestone is 30
        );
      });
    });
  });
}