import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/app_providers.dart';
import '../services/achievement_service.dart';
import '../models/achievement.dart';

/// Provider for AchievementService
final achievementServiceProvider = Provider<AchievementService>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final auth = ref.watch(firebaseAuthProvider);
  return AchievementService(firestore: firestore, auth: auth);
});

/// Provider to watch all achievements
final achievementsProvider = StreamProvider<List<Achievement>>((ref) {
  final service = ref.watch(achievementServiceProvider);
  return service.watchAchievements();
});

/// Provider for total points earned
final totalPointsProvider = FutureProvider<int>((ref) async {
  final service = ref.watch(achievementServiceProvider);
  return await service.getTotalPoints();
});
