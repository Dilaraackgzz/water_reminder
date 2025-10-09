import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/models/user_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_local_datasource.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource _localDataSource;
  final FirebaseAuth _auth;

  SettingsRepositoryImpl({
    required SettingsLocalDataSource localDataSource,
    required FirebaseAuth auth,
  })  : _localDataSource = localDataSource,
        _auth = auth;

  String get _currentUserId => _auth.currentUser?.uid ?? '';

  @override
  Future<UserSettings> getUserSettings() async {
    var settings = _localDataSource.getUserSettings(_currentUserId);

    // If no settings exist, create default settings
    if (settings == null) {
      settings = UserSettings(userId: _currentUserId);
      await _localDataSource.saveUserSettings(settings);
    }

    return settings;
  }

  @override
  Future<void> updateUserSettings(UserSettings settings) async {
    await _localDataSource.saveUserSettings(settings);
  }

  @override
  Stream<UserSettings> watchUserSettings() {
    return _localDataSource.watchUserSettings(_currentUserId).asyncMap((settings) async {
      if (settings != null) return settings;

      // Create default settings if they don't exist
      return await getUserSettings();
    });
  }
}