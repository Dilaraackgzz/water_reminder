import 'package:hive_flutter/hive_flutter.dart';

// TODO: Import when models are generated
// import '../models/water_record.dart';
// import '../models/user_profile.dart';
// import '../models/achievement.dart';

class LocalStorageService {
  // Removed unused box names - we're using feature-specific storage now
  static const String _settingsBoxName = 'settings';

  // late Box<WaterRecord> _waterRecordsBox;
  // late Box<UserProfile> _userProfileBox;
  // late Box<Achievement> _achievementsBox;
  late Box<dynamic> _settingsBox;

  Future<void> initialize() async {
    await _registerAdapters();
    await _openBoxes();
  }

  Future<void> _registerAdapters() async {
    // TODO: Register adapters when models are generated
    // if (!Hive.isAdapterRegistered(0)) {
    //   Hive.registerAdapter(WaterRecordAdapter());
    // }
    // if (!Hive.isAdapterRegistered(1)) {
    //   Hive.registerAdapter(UserProfileAdapter());
    // }
    // if (!Hive.isAdapterRegistered(2)) {
    //   Hive.registerAdapter(ActivityLevelAdapter());
    // }
    // if (!Hive.isAdapterRegistered(3)) {
    //   Hive.registerAdapter(GenderAdapter());
    // }
    // if (!Hive.isAdapterRegistered(4)) {
    //   Hive.registerAdapter(AchievementAdapter());
    // }
    // if (!Hive.isAdapterRegistered(5)) {
    //   Hive.registerAdapter(AchievementTypeAdapter());
    // }
  }

  Future<void> _openBoxes() async {
    // TODO: Open typed boxes when models are generated
    // _waterRecordsBox = await Hive.openBox<WaterRecord>(_waterRecordsBoxName);
    // _userProfileBox = await Hive.openBox<UserProfile>(_userProfileBoxName);
    // _achievementsBox = await Hive.openBox<Achievement>(_achievementsBoxName);
    _settingsBox = await Hive.openBox<dynamic>(_settingsBoxName);
  }

  // TODO: Implement when models are ready
  // Water Records
  // Future<void> saveWaterRecord(WaterRecord record) async {
  //   await _waterRecordsBox.put(record.id, record);
  // }

  // List<WaterRecord> getWaterRecordsForDate(DateTime date) {
  //   final startOfDay = DateTime(date.year, date.month, date.day);
  //   final endOfDay = startOfDay.add(const Duration(days: 1));

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