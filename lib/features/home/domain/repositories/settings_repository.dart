import '../models/user_settings.dart';

abstract class SettingsRepository {
  /// Get user settings
  Future<UserSettings> getUserSettings();

  /// Update user settings
  Future<void> updateUserSettings(UserSettings settings);

  /// Stream of user settings changes
  Stream<UserSettings> watchUserSettings();
}