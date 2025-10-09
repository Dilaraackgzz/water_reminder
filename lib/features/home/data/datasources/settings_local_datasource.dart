import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/models/user_settings.dart';

class SettingsLocalDataSource {
  static const String _settingsBoxName = 'user_settings';
  static const String _settingsKey = 'current_user_settings';

  // Lazy-loaded box
  static Box<Map>? _settingsBox;

  /// Get or open settings box
  Future<Box<Map>> get _settings async {
    if (_settingsBox == null || !_settingsBox!.isOpen) {
      _settingsBox = await Hive.openBox<Map>(_settingsBoxName);
    }
    return _settingsBox!;
  }

  /// Get user settings
  Future<UserSettings?> getUserSettings(String userId) async {
    final box = await _settings;
    final json = box.get('${_settingsKey}_$userId');
    if (json == null) return null;
    return UserSettings.fromJson(Map<String, dynamic>.from(json));
  }

  /// Save user settings
  Future<void> saveUserSettings(UserSettings settings) async {
    final box = await _settings;
    await box.put(
      '${_settingsKey}_${settings.userId}',
      settings.toJson(),
    );
  }

  /// Watch user settings changes
  Stream<UserSettings?> watchUserSettings(String userId) async* {
    final box = await _settings;
    final key = '${_settingsKey}_$userId';
    yield* box.watch(key: key).asyncMap((_) => getUserSettings(userId));
  }
}