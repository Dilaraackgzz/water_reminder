import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'achievement.freezed.dart';
part 'achievement.g.dart';

@freezed
@HiveType(typeId: 4)
class Achievement with _$Achievement {
  const factory Achievement({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required String description,
    @HiveField(3) required String iconName,
    @HiveField(4) required AchievementType type,
    @HiveField(5) required int targetValue,
    @HiveField(6) @Default(0) int currentValue,
    @HiveField(7) @Default(false) bool isUnlocked,
    @HiveField(8) DateTime? unlockedAt,
    @HiveField(9) @Default(10) int rewardPoints,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}

@HiveType(typeId: 5)
enum AchievementType {
  @HiveField(0)
  dailyGoal,
  @HiveField(1)
  streak,
  @HiveField(2)
  totalConsumption,
  @HiveField(3)
  consistency,
  @HiveField(4)
  milestone,
}

extension AchievementExtension on Achievement {
  double get progress {
    if (targetValue == 0) return 0.0;
    return (currentValue / targetValue).clamp(0.0, 1.0);
  }

  bool get isCompleted => currentValue >= targetValue;

  String get progressText => '$currentValue / $targetValue';

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'iconName': iconName,
      'type': type.name,
      'targetValue': targetValue,
      'currentValue': currentValue,
      'isUnlocked': isUnlocked,
      'unlockedAt': unlockedAt?.millisecondsSinceEpoch,
      'rewardPoints': rewardPoints,
    };
  }
}

/// Helper class for Firestore serialization
class AchievementMapper {
  AchievementMapper._();

  static Achievement fromFirestore(Map<String, dynamic> data) {
    final typeValue = data['type'];
    final type = typeValue is int
        ? AchievementType.values[typeValue]
        : AchievementType.values.firstWhere(
            (e) => e.name == typeValue,
            orElse: () => AchievementType.milestone,
          );

    return Achievement(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      iconName: data['iconName'] ?? '',
      type: type,
      targetValue: data['targetValue'] ?? 0,
      currentValue: data['currentValue'] ?? 0,
      isUnlocked: data['isUnlocked'] ?? false,
      unlockedAt: data['unlockedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(data['unlockedAt'])
          : null,
      rewardPoints: data['rewardPoints'] ?? 10,
    );
  }
}

class AchievementDefinitions {
  static List<Achievement> get defaultAchievements => [
        const Achievement(
          id: 'first_drop',
          title: 'achievement_first_drop',
          description: 'achievement_first_drop_desc',
          iconName: 'water_drop',
          type: AchievementType.milestone,
          targetValue: 1,
          rewardPoints: 5,
        ),
        const Achievement(
          id: 'daily_goal_1',
          title: 'achievement_daily_goal_1',
          description: 'achievement_daily_goal_1_desc',
          iconName: 'check_circle',
          type: AchievementType.dailyGoal,
          targetValue: 1,
          rewardPoints: 10,
        ),
        const Achievement(
          id: 'streak_3',
          title: 'achievement_streak_3',
          description: 'achievement_streak_3_desc',
          iconName: 'local_fire_department',
          type: AchievementType.streak,
          targetValue: 3,
          rewardPoints: 15,
        ),
        const Achievement(
          id: 'streak_7',
          title: 'achievement_streak_7',
          description: 'achievement_streak_7_desc',
          iconName: 'local_fire_department',
          type: AchievementType.streak,
          targetValue: 7,
          rewardPoints: 25,
        ),
        const Achievement(
          id: 'streak_30',
          title: 'achievement_streak_30',
          description: 'achievement_streak_30_desc',
          iconName: 'local_fire_department',
          type: AchievementType.streak,
          targetValue: 30,
          rewardPoints: 50,
        ),
        const Achievement(
          id: 'total_10l',
          title: 'achievement_total_10l',
          description: 'achievement_total_10l_desc',
          iconName: 'waves',
          type: AchievementType.totalConsumption,
          targetValue: 10000,
          rewardPoints: 20,
        ),
        const Achievement(
          id: 'total_100l',
          title: 'achievement_total_100l',
          description: 'achievement_total_100l_desc',
          iconName: 'waves',
          type: AchievementType.totalConsumption,
          targetValue: 100000,
          rewardPoints: 30,
        ),
        const Achievement(
          id: 'consistency_week',
          title: 'achievement_consistency',
          description: 'achievement_consistency_desc',
          iconName: 'event_available',
          type: AchievementType.consistency,
          targetValue: 7,
          rewardPoints: 20,
        ),
      ];
}