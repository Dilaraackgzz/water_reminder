import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// Gender enum
enum Gender {
  male,
  female,
  other;

  String get displayName {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.other:
        return 'Other';
    }
  }
}

/// Activity level enum
enum ActivityLevel {
  sedentary,
  light,
  moderate,
  active,
  veryActive;

  String get displayName {
    switch (this) {
      case ActivityLevel.sedentary:
        return 'Sedentary';
      case ActivityLevel.light:
        return 'Light';
      case ActivityLevel.moderate:
        return 'Moderate';
      case ActivityLevel.active:
        return 'Active';
      case ActivityLevel.veryActive:
        return 'Very Active';
    }
  }

  String get description {
    switch (this) {
      case ActivityLevel.sedentary:
        return 'Little or no exercise';
      case ActivityLevel.light:
        return 'Light exercise 1-3 days/week';
      case ActivityLevel.moderate:
        return 'Moderate exercise 3-5 days/week';
      case ActivityLevel.active:
        return 'Heavy exercise 6-7 days/week';
      case ActivityLevel.veryActive:
        return 'Very heavy exercise & physical job';
    }
  }

  /// Water intake multiplier (ml per kg of body weight)
  double get waterMultiplier {
    switch (this) {
      case ActivityLevel.sedentary:
        return 30.0;
      case ActivityLevel.light:
        return 33.0;
      case ActivityLevel.moderate:
        return 35.0;
      case ActivityLevel.active:
        return 38.0;
      case ActivityLevel.veryActive:
        return 40.0;
    }
  }
}

/// User profile model
@freezed
class UserProfile with _$UserProfile {
  const UserProfile._(); // Private constructor for custom getters

  const factory UserProfile({
    required String userId,
    required String name,
    required int age,
    required double weight, // kg
    required double height, // cm
    required Gender gender,
    required ActivityLevel activityLevel,
    required int dailyGoal, // ml
    @Default(false) bool isCustomGoal,
    String? photoUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  /// Create initial profile with default values
  factory UserProfile.initial(String userId) {
    final now = DateTime.now();
    return UserProfile(
      userId: userId,
      name: '',
      age: 25,
      weight: 70.0,
      height: 170.0,
      gender: Gender.other,
      activityLevel: ActivityLevel.moderate,
      dailyGoal: 2500, // Default 2.5L
      isCustomGoal: false,
      createdAt: now,
      updatedAt: now,
    );
  }
}

/// Extension for profile calculations and helpers
extension UserProfileX on UserProfile {
  /// Calculate recommended daily water goal based on body metrics
  int get calculatedDailyGoal {
    return (weight * activityLevel.waterMultiplier).round();
  }

  /// Get BMI (Body Mass Index)
  double get bmi {
    final heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  /// Get BMI category
  String get bmiCategory {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  /// Check if profile is complete
  bool get isComplete {
    return name.isNotEmpty && age > 0 && weight > 0 && height > 0;
  }

  /// Get display name (first name only if available)
  String get displayName {
    if (name.isEmpty) return 'User';
    final parts = name.split(' ');
    return parts.first;
  }

  /// Get goal in liters (formatted)
  String get dailyGoalInLiters {
    return (dailyGoal / 1000).toStringAsFixed(1);
  }
}
