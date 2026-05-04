class AppConstants {
  static const String appName = 'Aqualert';
  static const String appVersion = '1.0.0';

  // Water consumption constants
  static const int defaultDailyGoalMl = 2000;
  static const int minDailyGoalMl = 500;
  static const int maxDailyGoalMl = 5000;

  // Quick add amounts in ml
  static const List<int> quickAddAmounts = [250, 350, 500, 750];

  // Reminder constants
  static const int defaultReminderIntervalMinutes = 60;
  static const int minReminderIntervalMinutes = 15;
  static const int maxReminderIntervalMinutes = 480;

  // Animation durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 300);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 600);
  static const Duration longAnimationDuration = Duration(milliseconds: 1000);

  // Local storage keys
  static const String userPrefsKey = 'user_preferences';
  static const String waterDataKey = 'water_data';
  static const String themeKey = 'theme_mode';
  static const String premiumThemeKey = 'premium_theme_variant';
  static const String onboardingCompletedKey = 'onboarding_completed';

  // Firebase collection names
  static const String usersCollection = 'users';
  static const String waterRecordsCollection = 'water_records';
  static const String achievementsCollection = 'achievements';

  // Notification IDs
  static const int waterReminderNotificationId = 1000;
  static const int streakNotificationId = 1001;
  static const int goalReachedNotificationId = 1002;
}