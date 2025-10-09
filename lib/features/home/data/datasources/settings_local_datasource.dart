import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/models/user_settings.dart';

class SettingsLocalDataSource {
  static const String _settingsBoxName = 'user_settings';
  static const String _settingsKey = 'current_user_settings';

  Box<Map>? _settingsBox;

  /// Initialize Hive box
  Future<void> init() async {
    _settingsBox = await Hive.openBox<Map>(_settingsBoxName);
  }

  /// Get user settings
  UserSettings? getUserSettings(String userId) {
    final json = _settingsBox?.get('${_settingsKey}_$userId');
    if (json == null) return null;
    return UserSettings.fromJson(Map<String, dynamic>.from(json));
  }

  /// Save user settings
  Future<void> saveUserSettings(UserSettings settings) async {
    await _settingsBox?.put(
      '${_settingsKey}_${settings.userId}',
      settings.toJson(),
    );
  }

  /// Watch user settings changes
  Stream<UserSettings?> watchUserSettings(String userId) {
    final key = '${_settingsKey}_$userId';
    return _settingsBox!.watch(key: key).map((_) => getUserSettings(userId));
  }
}