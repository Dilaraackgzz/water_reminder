// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => 'Stay hydrated for a healthy life';

  @override
  String get common_cancel => 'Cancel';

  @override
  String get common_save => 'Save';

  @override
  String get common_delete => 'Delete';

  @override
  String get common_edit => 'Edit';

  @override
  String get common_add => 'Add';

  @override
  String get common_ok => 'OK';

  @override
  String get common_yes => 'Yes';

  @override
  String get common_no => 'No';

  @override
  String get common_or => 'or';

  @override
  String get common_done => 'Done';

  @override
  String get common_skip => 'Skip';

  @override
  String get common_next => 'Next';

  @override
  String get common_back => 'Back';

  @override
  String get common_continue => 'Continue';

  @override
  String get common_loading => 'Loading...';

  @override
  String get common_error => 'Error';

  @override
  String get common_success => 'Success';

  @override
  String get auth_login_title => 'Sign In';

  @override
  String get auth_register_title => 'Sign Up';

  @override
  String get auth_email_label => 'Email';

  @override
  String get auth_email_hint => 'example@email.com';

  @override
  String get auth_password_label => 'Password';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => 'Full Name';

  @override
  String get auth_name_hint => 'John Doe';

  @override
  String get auth_forgot_password => 'Forgot Password?';

  @override
  String get auth_dont_have_account => 'Don\'t have an account? ';

  @override
  String get auth_already_have_account => 'Already have an account? ';

  @override
  String get auth_sign_in_button => 'Sign In';

  @override
  String get auth_sign_up_button => 'Sign Up';

  @override
  String get auth_sign_in_google => 'Sign in with Google';

  @override
  String get auth_sign_up_google => 'Sign up with Google';

  @override
  String get auth_logout => 'Logout';

  @override
  String get auth_validation_email_required => 'Email is required';

  @override
  String get auth_validation_email_invalid => 'Please enter a valid email';

  @override
  String get auth_validation_password_required => 'Password is required';

  @override
  String get auth_validation_password_min_length =>
      'Password must be at least 6 characters';

  @override
  String get auth_validation_name_required => 'Name is required';

  @override
  String get auth_validation_name_min_length =>
      'Name must be at least 2 characters';

  @override
  String get auth_email_verification_title => 'Verify Your Email';

  @override
  String get auth_email_verification_sent =>
      'We\'ve sent a verification link to:';

  @override
  String get auth_email_verification_instruction =>
      'Please check your email and click the verification link to continue.';

  @override
  String get auth_email_verification_not_received =>
      'Didn\'t receive the email?';

  @override
  String get auth_email_verification_resend => 'Resend Verification Email';

  @override
  String get auth_email_verification_check => 'I\'ve verified my email';

  @override
  String get auth_email_verification_success => 'Email verified successfully!';

  @override
  String get auth_email_verification_failed =>
      'Email not verified yet. Please check your inbox.';

  @override
  String get auth_forgot_password_title => 'Reset Password';

  @override
  String get auth_forgot_password_instruction =>
      'Enter your email address and we\'ll send you a link to reset your password.';

  @override
  String get auth_forgot_password_button => 'Send Reset Link';

  @override
  String get auth_forgot_password_success =>
      'Password reset email sent! Check your inbox.';

  @override
  String get auth_back_to_login => 'Back to Sign In';

  @override
  String get home_title => 'Home';

  @override
  String get home_daily_goal => 'Daily Goal';

  @override
  String get home_today => 'Today';

  @override
  String get home_custom_amount => 'Custom Amount';

  @override
  String get home_amount_label => 'Amount';

  @override
  String get home_add_water_success => 'Water added successfully!';

  @override
  String get home_add_water_failed => 'Failed to add water';

  @override
  String get home_delete_water_confirm => 'Delete this water record?';

  @override
  String get home_delete_water_success => 'Water record deleted';

  @override
  String get home_no_records_today => 'No water records today';

  @override
  String get home_start_drinking => 'Start drinking water!';

  @override
  String get progress_current => 'Current';

  @override
  String get progress_goal => 'Goal';

  @override
  String get progress_remaining => 'Remaining';

  @override
  String get progress_completed => 'Goal completed!';

  @override
  String progress_percentage(int percent) {
    return '$percent% of daily goal';
  }

  @override
  String get motivational_keep_going => 'Keep going! You\'re doing great!';

  @override
  String get motivational_almost_there => 'Almost there! Just a bit more!';

  @override
  String get motivational_goal_reached =>
      'Congratulations! You\'ve reached your goal!';

  @override
  String get motivational_good_start => 'Great start! Keep it up!';

  @override
  String get motivational_stay_hydrated => 'Stay hydrated throughout the day!';

  @override
  String get motivational_100_1 =>
      'Congratulations! You\'ve reached your goal!';

  @override
  String get motivational_100_2 => 'Amazing work! Stay hydrated tomorrow too!';

  @override
  String get motivational_100_3 => 'You\'re a hydration champion!';

  @override
  String get motivational_100_4 => 'Perfect! Keep up the great habits!';

  @override
  String get motivational_100_short => 'Goal Reached!';

  @override
  String get motivational_75_1 => 'Almost there! Just a bit more to go!';

  @override
  String get motivational_75_2 => 'You\'re doing great! Keep it up!';

  @override
  String get motivational_75_3 => 'So close to your goal!';

  @override
  String get motivational_75_4 => 'Fantastic progress! Don\'t stop now!';

  @override
  String get motivational_75_short => 'Almost there!';

  @override
  String get motivational_50_1 => 'Halfway there! You\'re doing awesome!';

  @override
  String get motivational_50_2 => 'Great job! Keep going!';

  @override
  String get motivational_50_3 => 'You\'re on the right track!';

  @override
  String get motivational_50_4 => 'Nice progress! Stay consistent!';

  @override
  String get motivational_50_short => 'Halfway!';

  @override
  String get motivational_25_1 => 'Good start! Keep drinking water!';

  @override
  String get motivational_25_2 => 'You\'re off to a great start!';

  @override
  String get motivational_25_3 => 'Nice beginning! Stay hydrated!';

  @override
  String get motivational_25_4 => 'Keep going! Every sip counts!';

  @override
  String get motivational_25_short => 'Good start!';

  @override
  String get motivational_0_1 =>
      'Time to start hydrating! Your body will thank you!';

  @override
  String get motivational_0_2 => 'Let\'s begin your hydration journey!';

  @override
  String get motivational_0_3 => 'Start your day with some water!';

  @override
  String get motivational_0_4 => 'Your health matters! Start drinking!';

  @override
  String get motivational_0_short => 'Let\'s begin!';

  @override
  String get profile_title => 'Profile';

  @override
  String get profile_edit => 'Edit Profile';

  @override
  String get profile_personal_info => 'Personal Information';

  @override
  String get profile_body_metrics => 'Body Metrics';

  @override
  String get profile_activity_level => 'Activity Level';

  @override
  String get profile_name => 'Name';

  @override
  String get profile_email => 'Email';

  @override
  String get profile_age => 'Age';

  @override
  String get profile_gender => 'Gender';

  @override
  String get profile_weight => 'Weight';

  @override
  String get profile_height => 'Height';

  @override
  String get profile_bmi => 'BMI';

  @override
  String get profile_bmi_category => 'BMI Category';

  @override
  String get profile_daily_goal => 'Daily Water Goal';

  @override
  String get profile_use_calculated_goal => 'Use Calculated Goal';

  @override
  String get profile_custom_goal => 'Custom Goal';

  @override
  String get profile_save_success => 'Profile updated successfully';

  @override
  String get profile_save_failed => 'Failed to update profile';

  @override
  String get profile_user_default => 'User';

  @override
  String get gender_male => 'Male';

  @override
  String get gender_female => 'Female';

  @override
  String get gender_other => 'Other';

  @override
  String get activity_sedentary => 'Sedentary';

  @override
  String get activity_light => 'Lightly Active';

  @override
  String get activity_moderate => 'Moderately Active';

  @override
  String get activity_very_active => 'Very Active';

  @override
  String get activity_extra_active => 'Extra Active';

  @override
  String get bmi_underweight => 'Underweight';

  @override
  String get bmi_normal => 'Normal Weight';

  @override
  String get bmi_overweight => 'Overweight';

  @override
  String get bmi_obese => 'Obese';

  @override
  String get settings_title => 'Settings';

  @override
  String get settings_notifications => 'Notifications';

  @override
  String get settings_reminders => 'Reminders';

  @override
  String get settings_theme => 'Theme';

  @override
  String get settings_units => 'Units';

  @override
  String get settings_language => 'Language';

  @override
  String get settings_profile => 'Profile Settings';

  @override
  String get settings_daily_goal => 'Daily Goal Settings';

  @override
  String get settings_data => 'Data Management';

  @override
  String get settings_export_data => 'Export Data';

  @override
  String get settings_import_data => 'Import Data';

  @override
  String get settings_help => 'Help & Support';

  @override
  String get settings_about => 'About';

  @override
  String get settings_enable_notifications => 'Enable Notifications';

  @override
  String get settings_reminder_interval => 'Reminder Interval';

  @override
  String get settings_reminder_start_time => 'Start Time';

  @override
  String get settings_reminder_end_time => 'End Time';

  @override
  String get settings_test_notification => 'Test Notification';

  @override
  String get settings_theme_light => 'Light';

  @override
  String get settings_theme_dark => 'Dark';

  @override
  String get settings_theme_system => 'System Default';

  @override
  String get settings_unit_ml => 'Milliliters (ml)';

  @override
  String get settings_unit_floz => 'Fluid Ounces (fl oz)';

  @override
  String get settings_unit_metric => 'Metric system';

  @override
  String get settings_unit_imperial => 'Imperial system';

  @override
  String get settings_subtitle => 'Customize your experience';

  @override
  String get settings_reminders_active => 'Water reminders are active';

  @override
  String get settings_reminders_inactive => 'Turn on to get reminders';

  @override
  String get settings_minutes => 'minutes';

  @override
  String get settings_export_subtitle => 'Backup your water tracking data';

  @override
  String get settings_import_subtitle => 'Restore from backup file';

  @override
  String get settings_profile_subtitle => 'Update your information';

  @override
  String get settings_daily_goal_subtitle => 'Manage your hydration goal';

  @override
  String get settings_theme_dialog_title => 'Theme';

  @override
  String get settings_theme_light_mode => 'Light Mode';

  @override
  String get settings_theme_dark_mode => 'Dark Mode';

  @override
  String get settings_theme_system_mode => 'System Default';

  @override
  String get settings_theme_light_subtitle => 'Use light theme';

  @override
  String get settings_theme_dark_subtitle => 'Use dark theme';

  @override
  String get settings_theme_system_subtitle => 'Follow system theme';

  @override
  String get settings_language_dialog_title => 'Language';

  @override
  String get settings_export_loading => 'Exporting data...';

  @override
  String get settings_export_success_message => 'Data exported successfully!';

  @override
  String settings_export_failed_message(String error) {
    return 'Export failed: $error';
  }

  @override
  String get settings_import_loading => 'Importing data...';

  @override
  String get settings_import_complete => 'Import Complete';

  @override
  String get settings_import_success_subtitle => 'Imported successfully:';

  @override
  String get settings_import_water_records => 'water records';

  @override
  String get settings_import_daily_goals => 'daily goals';

  @override
  String get settings_import_duplicate_skipped => 'duplicate records skipped';

  @override
  String settings_import_failed_message(String error) {
    return 'Import failed: $error';
  }

  @override
  String get settings_reminder_interval_title => 'Reminder Interval';

  @override
  String get settings_language_coming_soon => 'Coming Soon';

  @override
  String get settings_export_success => 'Data exported successfully';

  @override
  String get settings_export_failed => 'Failed to export data';

  @override
  String get settings_import_success => 'Data imported successfully';

  @override
  String get settings_import_failed => 'Failed to import data';

  @override
  String settings_import_stats(int imported, int skipped) {
    return 'Imported $imported records, skipped $skipped duplicates';
  }

  @override
  String get statistics_title => 'Statistics';

  @override
  String get statistics_weekly => 'Weekly';

  @override
  String get statistics_monthly => 'Monthly';

  @override
  String get statistics_yearly => 'Yearly';

  @override
  String get statistics_average => 'Average';

  @override
  String get statistics_total => 'Total';

  @override
  String get statistics_best_day => 'Best Day';

  @override
  String get statistics_goal_achievement => 'Goal Achievement';

  @override
  String get statistics_no_data => 'No data available for this period';

  @override
  String get statistics_chart_label => 'Water Intake';

  @override
  String get achievements_title => 'Achievements';

  @override
  String get achievements_unlocked => 'Unlocked';

  @override
  String get achievements_locked => 'Locked';

  @override
  String get achievements_progress => 'Progress';

  @override
  String get achievements_reward_points => 'Reward Points';

  @override
  String achievements_total_points(int points) {
    return 'Total Points: $points';
  }

  @override
  String get achievement_first_drop => 'First Drop';

  @override
  String get achievement_first_drop_desc => 'Log your first water intake';

  @override
  String get achievement_daily_goal_1 => 'Goal Achiever';

  @override
  String get achievement_daily_goal_1_desc => 'Reach your daily goal once';

  @override
  String get achievement_streak_3 => '3-Day Streak';

  @override
  String get achievement_streak_3_desc => 'Maintain a 3-day streak';

  @override
  String get achievement_streak_7 => 'Week Warrior';

  @override
  String get achievement_streak_7_desc => 'Maintain a 7-day streak';

  @override
  String get achievement_streak_30 => 'Month Master';

  @override
  String get achievement_streak_30_desc => 'Maintain a 30-day streak';

  @override
  String get achievement_total_10l => '10 Liters';

  @override
  String get achievement_total_10l_desc => 'Drink 10 liters total';

  @override
  String get achievement_total_100l => '100 Liters';

  @override
  String get achievement_total_100l_desc => 'Drink 100 liters total';

  @override
  String get achievement_consistency => 'Consistency Week';

  @override
  String get achievement_consistency_desc => 'Reach your goal 7 days in a row';

  @override
  String get reminders_title => 'Reminders';

  @override
  String get reminders_active => 'Active Reminders';

  @override
  String get reminders_pending => 'Pending Notifications';

  @override
  String get reminders_interval_30 => 'Every 30 minutes';

  @override
  String get reminders_interval_45 => 'Every 45 minutes';

  @override
  String get reminders_interval_60 => 'Every hour';

  @override
  String get reminders_interval_90 => 'Every 1.5 hours';

  @override
  String get reminders_interval_120 => 'Every 2 hours';

  @override
  String get reminders_interval_180 => 'Every 3 hours';

  @override
  String get notification_reminder_title => 'Time to Drink Water!';

  @override
  String get notification_reminder_body =>
      'Stay hydrated! Drink some water now.';

  @override
  String get streak_current => 'Current Streak';

  @override
  String streak_days(int days) {
    return '$days days';
  }

  @override
  String get streak_keep_going => 'Keep the streak going!';

  @override
  String get streak_personal_best => 'Personal Best';

  @override
  String get streak_best => 'Best!';

  @override
  String get streak_longest => 'Longest';

  @override
  String get streak_next_milestone => 'Next Milestone';

  @override
  String get streak_start_today => 'Start Your Streak Today!';

  @override
  String get streak_complete_goal =>
      'Complete your daily goal to build a streak';

  @override
  String get streak_start => 'Start your streak!';

  @override
  String get streak_error => 'Failed to load streak data';

  @override
  String get streak_day_singular => 'day';

  @override
  String get streak_day_plural => 'days';

  @override
  String get onboarding_title_1 => 'Track Your Water';

  @override
  String get onboarding_desc_1 =>
      'Easily log your daily water intake with just a tap';

  @override
  String get onboarding_title_2 => 'Smart Reminders';

  @override
  String get onboarding_desc_2 =>
      'Get timely reminders to stay hydrated throughout the day';

  @override
  String get onboarding_title_3 => 'Monitor Progress';

  @override
  String get onboarding_desc_3 =>
      'View your hydration statistics and achieve your goals';

  @override
  String get onboarding_title_4 => 'Stay Healthy';

  @override
  String get onboarding_desc_4 =>
      'Build healthy habits and improve your overall wellness';

  @override
  String get onboarding_get_started => 'Get Started';

  @override
  String get drawer_home => 'Home';

  @override
  String get drawer_statistics => 'Statistics';

  @override
  String get drawer_achievements => 'Achievements';

  @override
  String get drawer_profile => 'Profile';

  @override
  String get drawer_reminders => 'Reminders';

  @override
  String get drawer_settings => 'Settings';

  @override
  String get drawer_help => 'Help & Support';

  @override
  String get drawer_about => 'About';

  @override
  String get drawer_logout => 'Logout';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => 'Version 1.0.0';

  @override
  String get about_description =>
      'Stay hydrated and healthy with Aqualert. Track your daily water intake and achieve your hydration goals!';

  @override
  String get about_copyright => '© 2024 Aqualert. All rights reserved.';

  @override
  String get about_close => 'Close';

  @override
  String get help_title => 'Help & Support';

  @override
  String get help_subtitle => 'Get help and learn more';

  @override
  String get help_faq => 'Frequently Asked Questions';

  @override
  String get help_contact => 'Contact Us';

  @override
  String get help_version => 'Version';

  @override
  String get help_app_info => 'App Information';

  @override
  String get help_coming_soon => 'Help & Support - Coming Soon!';

  @override
  String get help_faq_section => 'FAQs';

  @override
  String get help_features_section => 'Features Guide';

  @override
  String get help_about_section => 'About';

  @override
  String get faq_1_q => 'How is my daily water goal calculated?';

  @override
  String get faq_1_a =>
      'Your daily water goal is calculated based on your weight, height, age, gender, and activity level using scientific formulas. You can also set a custom goal in Profile settings.';

  @override
  String get faq_2_q => 'How do water reminders work?';

  @override
  String get faq_2_a =>
      'You can set reminder intervals (30-180 minutes) and choose start/end times. The app will send you notifications during this period to help you stay hydrated.';

  @override
  String get faq_3_q => 'What are streaks and how do they work?';

  @override
  String get faq_3_a =>
      'Streaks track consecutive days you\'ve reached your daily water goal. Keep drinking water daily to maintain and increase your streak!';

  @override
  String get faq_4_q => 'How can I change the measurement units?';

  @override
  String get faq_4_a =>
      'Go to Settings → Units and switch between milliliters (ml) and fluid ounces (fl oz). All measurements will update automatically.';

  @override
  String get faq_5_q => 'Can I export my water tracking data?';

  @override
  String get faq_5_a =>
      'Yes! Go to Settings → Data Management → Export Data. You can share or save your data as a JSON file and import it later.';

  @override
  String get faq_6_q => 'How do achievements work?';

  @override
  String get faq_6_a =>
      'Complete water tracking milestones to unlock achievements and earn reward points. Track your progress in the Achievements screen.';

  @override
  String get feature_tracking_title => 'Water Tracking';

  @override
  String get feature_tracking_desc =>
      'Easily log your daily water intake with quick-add buttons (250ml, 350ml, 500ml, 750ml) or enter a custom amount.';

  @override
  String get feature_reminders_title => 'Smart Reminders';

  @override
  String get feature_reminders_desc =>
      'Set customizable reminder intervals and choose active hours. Never forget to drink water throughout the day.';

  @override
  String get feature_statistics_title => 'Statistics & Insights';

  @override
  String get feature_statistics_desc =>
      'View your water consumption trends with weekly, monthly, and yearly charts. Track your progress over time.';

  @override
  String get feature_achievements_title => 'Achievements & Streaks';

  @override
  String get feature_achievements_desc =>
      'Earn achievements and maintain daily streaks by reaching your water goals. Stay motivated with gamification!';

  @override
  String get feature_profile_title => 'Profile & Goals';

  @override
  String get feature_profile_desc =>
      'Set your personal information and let the app calculate your optimal daily water goal based on your body metrics.';

  @override
  String get help_contact_email => 'Contact via Email';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => 'Rate Our App';

  @override
  String get help_rate_desc => 'Enjoying Aqualert? Leave us a review!';

  @override
  String get help_build_number => 'Build';

  @override
  String get help_copyright => '© 2024 Aqualert. All rights reserved.';

  @override
  String get help_made_with => 'Made with ❤️ for your health';

  @override
  String get error_generic => 'Something went wrong. Please try again.';

  @override
  String get error_network => 'Network error. Please check your connection.';

  @override
  String get error_auth_failed => 'Authentication failed. Please try again.';

  @override
  String get error_permission_denied => 'Permission denied.';

  @override
  String get unit_ml => 'ml';

  @override
  String get unit_floz => 'fl oz';

  @override
  String get unit_kg => 'kg';

  @override
  String get unit_lb => 'lb';

  @override
  String get unit_cm => 'cm';

  @override
  String get unit_ft => 'ft';

  @override
  String get unit_liter => 'L';

  @override
  String get time_morning => 'Morning';

  @override
  String get time_afternoon => 'Afternoon';

  @override
  String get time_evening => 'Evening';

  @override
  String get time_night => 'Night';

  @override
  String get help_privacy_policy => 'Privacy Policy';

  @override
  String get help_privacy_policy_desc => 'View our privacy policy';

  @override
  String get help_privacy_policy_error => 'Could not open Privacy Policy';
}
