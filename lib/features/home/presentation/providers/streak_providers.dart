import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/streak_repository_impl.dart';
import '../../domain/models/user_streak.dart';
import '../../domain/repositories/streak_repository.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

/// Provider for streak repository
final streakRepositoryProvider = Provider<StreakRepository>((ref) {
  return StreakRepositoryImpl();
});

/// Provider for current user's streak
final userStreakProvider = FutureProvider<UserStreak?>((ref) async {
  final authState = ref.watch(authStateProvider);
  final streakRepository = ref.watch(streakRepositoryProvider);

  return authState.when(
    data: (user) async {
      if (user == null) return null;
      return await streakRepository.getUserStreak(user.uid);
    },
    loading: () => null,
    error: (_, __) => null,
  );
});

/// Provider to update streak
final updateStreakProvider = FutureProvider.family<UserStreak, bool>((ref, goalCompleted) async {
  final authState = ref.watch(authStateProvider);
  final streakRepository = ref.watch(streakRepositoryProvider);

  return await authState.when(
    data: (user) async {
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final updatedStreak = await streakRepository.updateStreak(
        userId: user.uid,
        goalCompleted: goalCompleted,
      );

      // Refresh the user streak provider
      ref.invalidate(userStreakProvider);

      return updatedStreak;
    },
    loading: () => throw Exception('Loading user data'),
    error: (error, stack) => throw error,
  );
});

/// Provider to reset streak
final resetStreakProvider = FutureProvider<void>((ref) async {
  final authState = ref.watch(authStateProvider);
  final streakRepository = ref.watch(streakRepositoryProvider);

  return authState.when(
    data: (user) async {
      if (user == null) {
        throw Exception('User not authenticated');
      }

      await streakRepository.resetStreak(user.uid);

      // Refresh the user streak provider
      ref.invalidate(userStreakProvider);
    },
    loading: () => throw Exception('Loading user data'),
    error: (error, stack) => throw error,
  );
});

/// Provider for streak history
final streakHistoryProvider = FutureProvider<List<DateTime>>((ref) async {
  final authState = ref.watch(authStateProvider);
  final streakRepository = ref.watch(streakRepositoryProvider);

  return authState.when(
    data: (user) async {
      if (user == null) return [];
      return await streakRepository.getStreakHistory(user.uid);
    },
    loading: () => [],
    error: (_, __) => [],
  );
});
