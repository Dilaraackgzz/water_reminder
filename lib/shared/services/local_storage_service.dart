import 'package:hive_flutter/hive_flutter.dart';

/// Local storage service using Hive
/// Note: This service is minimal as feature-specific storage is implemented
/// in respective data sources (WaterLocalDataSource, etc.)
class LocalStorageService {
  static const String _settingsBoxName = 'settings';

  late Box<dynamic> _settingsBox;

  Future<void> initialize() async {
    await _registerAdapters();
    await _openBoxes();
  }

  Future<void> _registerAdapters() async {
    // No custom adapters needed - using JSON serialization
    // Feature-specific data sources handle their own storage
  }

  Future<void> _openBoxes() async {
    _settingsBox = await Hive.openBox<dynamic>(_settingsBoxName);
  }

  // Feature-specific methods moved to respective data sources:
  // - WaterLocalDataSource for water records
  // - StreakDataSource for streak data
  // - SettingsLocalDataSource for user settings

  //   return _waterRecordsBox.values
  //       .where((record) =>
  //           record.timestamp.isAfter(startOfDay) &&
  //           record.timestamp.isBefore(endOfDay))
  //       .toList();
  // }

  // List<WaterRecord> getAllWaterRecords() {
  //   return _waterRecordsBox.values.toList();
  // }

  // Future<void> deleteWaterRecord(String id) async {
  //   await _waterRecordsBox.delete(id);
  // }

  // User Profile
  // Future<void> saveUserProfile(UserProfile profile) async {
  //   await _userProfileBox.put('profile', profile);
  // }

  // UserProfile? getUserProfile() {
  //   return _userProfileBox.get('profile');
  // }

  // Future<void> deleteUserProfile() async {
  //   await _userProfileBox.delete('profile');
  // }

  // Achievements
  // Future<void> saveAchievement(Achievement achievement) async {
  //   await _achievementsBox.put(achievement.id, achievement);
  // }

  // List<Achievement> getAllAchievements() {
  //   return _achievementsBox.values.toList();
  // }

  // Achievement? getAchievement(String id) async {
  //   return _achievementsBox.get(id);
  // }

  // Settings
  Future<void> saveSetting(String key, dynamic value) async {
    await _settingsBox.put(key, value);
  }

  T? getSetting<T>(String key, {T? defaultValue}) {
    return _settingsBox.get(key, defaultValue: defaultValue) as T?;
  }

  Future<void> deleteSetting(String key) async {
    await _settingsBox.delete(key);
  }

  // Clear all data
  Future<void> clearAllData() async {
    // await _waterRecordsBox.clear();
    // await _userProfileBox.clear();
    // await _achievementsBox.clear();
    await _settingsBox.clear();
  }

  // Close boxes
  Future<void> dispose() async {
    // await _waterRecordsBox.close();
    // await _userProfileBox.close();
    // await _achievementsBox.close();
    await _settingsBox.close();
  }
}