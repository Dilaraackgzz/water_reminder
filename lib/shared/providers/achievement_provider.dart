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

/// Provider to watch all achievements (+ initialize/migrate on first load)
final achievementsProvider = StreamProvider<List<Achievement>>((ref) {
  final service = ref.watch(achievementServiceProvider);
  // Eksik başarımları Firestore'a yaz, ardından stream'i dinle
  service.initializeAchievements();
  return service.watchAchievements();
});

/// Kazanılan toplam puan — achievementsProvider'dan türetilir, anında güncellenir
final totalPointsProvider = Provider<int>((ref) {
  final achievementsAsync = ref.watch(achievementsProvider);
  return achievementsAsync.when(
    data: (achievements) => achievements
        .where((a) => a.isUnlocked)
        .fold<int>(0, (sum, a) => sum + a.rewardPoints),
    loading: () => 0,
    error: (_, __) => 0,
  );
});
