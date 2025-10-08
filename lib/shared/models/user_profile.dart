import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
@HiveType(typeId: 1)
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @HiveField(0) required String uid,
    @HiveField(1) required String email,
    @HiveField(2) String? displayName,
    @HiveField(3) String? photoURL,
    @HiveField(4) @Default(2000) int dailyGoalMl,
    @HiveField(5) @Default(60) int reminderIntervalMinutes,
    @HiveField(6) @Default(true) bool reminderEnabled,
    @HiveField(7) @Default('ml') String unit,
    @HiveField(8) @Default(25) int age,
    @HiveField(9) @Default(70.0) double weightKg,
    @HiveField(10) @Default(170.0) double heightCm,
    @HiveField(11) @Default(ActivityLevel.moderate) ActivityLevel activityLevel,
    @HiveField(12) @Default(Gender.other) Gender gender,
    @HiveField(13) @Default(false) bool profileCompleted,
    @HiveField(14) DateTime? createdAt,
    @HiveField(15) DateTime? updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@HiveType(typeId: 2)
enum ActivityLevel {
  @HiveField(0)
  sedentary,
  @HiveField(1)
  light,
  @HiveField(2)
  moderate,
  @HiveField(3)
  active,
  @HiveField(4)
  veryActive,
}

@HiveType(typeId: 3)
enum Gender {
  @HiveField(0)
  male,
  @HiveField(1)
  female,
  @HiveField(2)
  other,
}

extension ActivityLevelExtension on ActivityLevel {
  String get displayName {
    switch (this) {
      case ActivityLevel.sedentary:
        return 'Hareketsiz';
      case ActivityLevel.light:
        return 'Az Aktif';
      case ActivityLevel.moderate:
        return 'Orta Aktif';
      case ActivityLevel.active:
        return 'Aktif';
      case ActivityLevel.veryActive:
        return 'Çok Aktif';
    }
  }

  double get multiplier {
    switch (this) {
      case ActivityLevel.sedentary:
        return 1.0;
      case ActivityLevel.light:
        return 1.1;
      case ActivityLevel.moderate:
        return 1.2;
      case ActivityLevel.active:
        return 1.3;
      case ActivityLevel.veryActive:
        return 1.4;
    }
  }
}

extension GenderExtension on Gender {
  String get displayName {
    switch (this) {
      case Gender.male:
        return 'Erkek';
      case Gender.female:
        return 'Kadın';
      case Gender.other:
        return 'Diğer';
    }
  }
}

extension UserProfileExtension on UserProfile {
  int get calculatedDailyGoalMl {
    // Basic calculation: 35ml per kg body weight + activity level multiplier
    final baseAmount = (weightKg * 35).round();
    final adjustedAmount = (baseAmount * activityLevel.multiplier).round();

    // Ensure minimum 1500ml and maximum 4000ml
    return adjustedAmount.clamp(1500, 4000);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'dailyGoalMl': dailyGoalMl,
      'reminderIntervalMinutes': reminderIntervalMinutes,
      'reminderEnabled': reminderEnabled,
      'unit': unit,
      'age': age,
      'weightKg': weightKg,
      'heightCm': heightCm,
      'activityLevel': activityLevel.index,
      'gender': gender.index,
      'profileCompleted': profileCompleted,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  static UserProfile fromFirestore(Map<String, dynamic> data) {
    return UserProfile(
      uid: data['uid'] ?? '',
      email: data['email'] ?? '',
      displayName: data['displayName'],
      photoURL: data['photoURL'],
      dailyGoalMl: data['dailyGoalMl'] ?? 2000,
      reminderIntervalMinutes: data['reminderIntervalMinutes'] ?? 60,
      reminderEnabled: data['reminderEnabled'] ?? true,
      unit: data['unit'] ?? 'ml',
      age: data['age'] ?? 25,
      weightKg: (data['weightKg'] ?? 70.0).toDouble(),
      heightCm: (data['heightCm'] ?? 170.0).toDouble(),
      activityLevel: ActivityLevel.values[data['activityLevel'] ?? 2],
      gender: Gender.values[data['gender'] ?? 2],
      profileCompleted: data['profileCompleted'] ?? false,
      createdAt: data['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(data['createdAt'])
          : null,
      updatedAt: data['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(data['updatedAt'])
          : null,
    );
  }
}