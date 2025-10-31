import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/models/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  static const String _profileBoxName = 'user_profiles';

  Box<Map>? _profileBox;

  Future<Box<Map>> get _profiles async {
    if (_profileBox == null || !_profileBox!.isOpen) {
      _profileBox = await Hive.openBox<Map>(_profileBoxName);
    }
    return _profileBox!;
  }

  @override
  Future<UserProfile?> getUserProfile(String userId) async {
    final box = await _profiles;
    final data = box.get(userId);

    if (data == null) return null;

    try {
      return UserProfile.fromJson(Map<String, dynamic>.from(data));
    } catch (e) {
      print('Error parsing profile: $e');
      return null;
    }
  }

  @override
  Future<void> saveProfile(UserProfile profile) async {
    final box = await _profiles;
    final updatedProfile = profile.copyWith(updatedAt: DateTime.now());
    await box.put(profile.userId, updatedProfile.toJson());
  }

  @override
  Future<void> updateProfile(String userId, Map<String, dynamic> updates) async {
    final profile = await getUserProfile(userId);
    if (profile == null) return;

    // Create updated profile with new values
    final updatedProfile = profile.copyWith(
      name: updates['name'] ?? profile.name,
      age: updates['age'] ?? profile.age,
      weight: updates['weight'] ?? profile.weight,
      height: updates['height'] ?? profile.height,
      gender: updates['gender'] ?? profile.gender,
      activityLevel: updates['activityLevel'] ?? profile.activityLevel,
      dailyGoal: updates['dailyGoal'] ?? profile.dailyGoal,
      isCustomGoal: updates['isCustomGoal'] ?? profile.isCustomGoal,
      photoUrl: updates['photoUrl'] ?? profile.photoUrl,
      updatedAt: DateTime.now(),
    );

    await saveProfile(updatedProfile);
  }

  @override
  Future<void> deleteProfile(String userId) async {
    final box = await _profiles;
    await box.delete(userId);
  }

  @override
  Future<int> calculateDailyGoal({
    required double weight,
    required ActivityLevel activityLevel,
  }) async {
    // Formula: weight (kg) * activity multiplier (ml/kg)
    return (weight * activityLevel.waterMultiplier).round();
  }

  @override
  Future<void> updateDailyGoal(
    String userId,
    int newGoal, {
    bool isCustom = true,
  }) async {
    await updateProfile(userId, {
      'dailyGoal': newGoal,
      'isCustomGoal': isCustom,
    });
  }
}
