import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

enum ActivityLevel {
  sedentary,
  lightlyActive,
  moderatelyActive,
  veryActive,
  extremelyActive,
}

@freezed
class UserSettings with _$UserSettings {
  const factory UserSettings({
    required String userId,
    @Default(70.0) double weight, // Weight in kg
    @Default(170.0) double height, // Height in cm
    @Default(25) int age,
    @Default(ActivityLevel.lightlyActive) ActivityLevel activityLevel,
    @Default(2000) int customDailyGoal, // Custom daily goal in ml
    @Default(true) bool useCalculatedGoal, // Use calculated goal vs custom goal
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}

extension UserSettingsExtension on UserSettings {
  /// Calculate recommended daily water intake based on user profile
  /// Formula: Weight(kg) * 30-40ml (adjusted for activity level)
  int get calculatedDailyGoal {
    double baseAmount = weight * 35; // Base calculation

    // Adjust for activity level
    switch (activityLevel) {
      case ActivityLevel.sedentary:
        baseAmount *= 0.9;
        break;
      case ActivityLevel.lightlyActive:
        baseAmount *= 1.0;
        break;
      case ActivityLevel.moderatelyActive:
        baseAmount *= 1.1;
        break;
      case ActivityLevel.veryActive:
        baseAmount *= 1.2;
        break;
      case ActivityLevel.extremelyActive:
        baseAmount *= 1.3;
        break;
    }

    return baseAmount.round();
  }

  /// Get the active daily goal (calculated or custom)
  int get activeDailyGoal {
    return useCalculatedGoal ? calculatedDailyGoal : customDailyGoal;
  }
}