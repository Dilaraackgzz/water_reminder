import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh'),
  ];

  /// Application name
  ///
  /// In en, this message translates to:
  /// **'Aqualert'**
  String get appName;

  /// Application tagline
  ///
  /// In en, this message translates to:
  /// **'Stay hydrated for a healthy life'**
  String get appTagline;

  /// No description provided for @common_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get common_cancel;

  /// No description provided for @common_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get common_save;

  /// No description provided for @common_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get common_delete;

  /// No description provided for @common_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get common_edit;

  /// No description provided for @common_add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get common_add;

  /// No description provided for @common_ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get common_ok;

  /// No description provided for @common_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get common_yes;

  /// No description provided for @common_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get common_no;

  /// No description provided for @common_or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get common_or;

  /// No description provided for @common_done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get common_done;

  /// No description provided for @common_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get common_skip;

  /// No description provided for @common_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get common_next;

  /// No description provided for @common_back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get common_back;

  /// No description provided for @common_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get common_continue;

  /// No description provided for @common_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get common_loading;

  /// No description provided for @common_error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get common_error;

  /// No description provided for @common_success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get common_success;

  /// No description provided for @auth_login_title.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get auth_login_title;

  /// No description provided for @auth_register_title.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get auth_register_title;

  /// No description provided for @auth_email_label.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get auth_email_label;

  /// No description provided for @auth_email_hint.
  ///
  /// In en, this message translates to:
  /// **'example@email.com'**
  String get auth_email_hint;

  /// No description provided for @auth_password_label.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get auth_password_label;

  /// No description provided for @auth_password_hint.
  ///
  /// In en, this message translates to:
  /// **'••••••••'**
  String get auth_password_hint;

  /// No description provided for @auth_name_label.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get auth_name_label;

  /// No description provided for @auth_name_hint.
  ///
  /// In en, this message translates to:
  /// **'John Doe'**
  String get auth_name_hint;

  /// No description provided for @auth_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get auth_forgot_password;

  /// No description provided for @auth_dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get auth_dont_have_account;

  /// No description provided for @auth_already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get auth_already_have_account;

  /// No description provided for @auth_sign_in_button.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get auth_sign_in_button;

  /// No description provided for @auth_sign_up_button.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get auth_sign_up_button;

  /// No description provided for @auth_sign_in_google.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get auth_sign_in_google;

  /// No description provided for @auth_sign_up_google.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get auth_sign_up_google;

  /// No description provided for @auth_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get auth_logout;

  /// No description provided for @auth_validation_email_required.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get auth_validation_email_required;

  /// No description provided for @auth_validation_email_invalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get auth_validation_email_invalid;

  /// No description provided for @auth_validation_password_required.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get auth_validation_password_required;

  /// No description provided for @auth_validation_password_min_length.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get auth_validation_password_min_length;

  /// No description provided for @auth_validation_name_required.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get auth_validation_name_required;

  /// No description provided for @auth_validation_name_min_length.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 2 characters'**
  String get auth_validation_name_min_length;

  /// No description provided for @auth_email_verification_title.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Email'**
  String get auth_email_verification_title;

  /// No description provided for @auth_email_verification_sent.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a verification link to:'**
  String get auth_email_verification_sent;

  /// No description provided for @auth_email_verification_instruction.
  ///
  /// In en, this message translates to:
  /// **'Please check your email and click the verification link to continue.'**
  String get auth_email_verification_instruction;

  /// No description provided for @auth_email_verification_not_received.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the email?'**
  String get auth_email_verification_not_received;

  /// No description provided for @auth_email_verification_resend.
  ///
  /// In en, this message translates to:
  /// **'Resend Verification Email'**
  String get auth_email_verification_resend;

  /// No description provided for @auth_email_verification_check.
  ///
  /// In en, this message translates to:
  /// **'I\'ve verified my email'**
  String get auth_email_verification_check;

  /// No description provided for @auth_email_verification_success.
  ///
  /// In en, this message translates to:
  /// **'Email verified successfully!'**
  String get auth_email_verification_success;

  /// No description provided for @auth_email_verification_failed.
  ///
  /// In en, this message translates to:
  /// **'Email not verified yet. Please check your inbox.'**
  String get auth_email_verification_failed;

  /// No description provided for @auth_forgot_password_title.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get auth_forgot_password_title;

  /// No description provided for @auth_forgot_password_instruction.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we\'ll send you a link to reset your password.'**
  String get auth_forgot_password_instruction;

  /// No description provided for @auth_forgot_password_button.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get auth_forgot_password_button;

  /// No description provided for @auth_forgot_password_success.
  ///
  /// In en, this message translates to:
  /// **'Password reset email sent! Check your inbox.'**
  String get auth_forgot_password_success;

  /// No description provided for @auth_back_to_login.
  ///
  /// In en, this message translates to:
  /// **'Back to Sign In'**
  String get auth_back_to_login;

  /// No description provided for @home_title.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home_title;

  /// No description provided for @home_daily_goal.
  ///
  /// In en, this message translates to:
  /// **'Daily Goal'**
  String get home_daily_goal;

  /// No description provided for @home_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get home_today;

  /// No description provided for @home_custom_amount.
  ///
  /// In en, this message translates to:
  /// **'Custom Amount'**
  String get home_custom_amount;

  /// No description provided for @home_amount_label.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get home_amount_label;

  /// No description provided for @home_add_water_success.
  ///
  /// In en, this message translates to:
  /// **'Water added successfully!'**
  String get home_add_water_success;

  /// No description provided for @home_add_water_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to add water'**
  String get home_add_water_failed;

  /// No description provided for @home_delete_water_confirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this water record?'**
  String get home_delete_water_confirm;

  /// No description provided for @home_delete_water_success.
  ///
  /// In en, this message translates to:
  /// **'Water record deleted'**
  String get home_delete_water_success;

  /// No description provided for @home_no_records_today.
  ///
  /// In en, this message translates to:
  /// **'No water records today'**
  String get home_no_records_today;

  /// No description provided for @home_start_drinking.
  ///
  /// In en, this message translates to:
  /// **'Start drinking water!'**
  String get home_start_drinking;

  /// No description provided for @progress_current.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get progress_current;

  /// No description provided for @progress_goal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get progress_goal;

  /// No description provided for @progress_remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get progress_remaining;

  /// No description provided for @progress_completed.
  ///
  /// In en, this message translates to:
  /// **'Goal completed!'**
  String get progress_completed;

  /// No description provided for @progress_percentage.
  ///
  /// In en, this message translates to:
  /// **'{percent}% of daily goal'**
  String progress_percentage(int percent);

  /// No description provided for @motivational_keep_going.
  ///
  /// In en, this message translates to:
  /// **'Keep going! You\'re doing great!'**
  String get motivational_keep_going;

  /// No description provided for @motivational_almost_there.
  ///
  /// In en, this message translates to:
  /// **'Almost there! Just a bit more!'**
  String get motivational_almost_there;

  /// No description provided for @motivational_goal_reached.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You\'ve reached your goal!'**
  String get motivational_goal_reached;

  /// No description provided for @motivational_good_start.
  ///
  /// In en, this message translates to:
  /// **'Great start! Keep it up!'**
  String get motivational_good_start;

  /// No description provided for @motivational_stay_hydrated.
  ///
  /// In en, this message translates to:
  /// **'Stay hydrated throughout the day!'**
  String get motivational_stay_hydrated;

  /// No description provided for @motivational_100_1.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You\'ve reached your goal!'**
  String get motivational_100_1;

  /// No description provided for @motivational_100_2.
  ///
  /// In en, this message translates to:
  /// **'Amazing work! Stay hydrated tomorrow too!'**
  String get motivational_100_2;

  /// No description provided for @motivational_100_3.
  ///
  /// In en, this message translates to:
  /// **'You\'re a hydration champion!'**
  String get motivational_100_3;

  /// No description provided for @motivational_100_4.
  ///
  /// In en, this message translates to:
  /// **'Perfect! Keep up the great habits!'**
  String get motivational_100_4;

  /// No description provided for @motivational_100_short.
  ///
  /// In en, this message translates to:
  /// **'Goal Reached!'**
  String get motivational_100_short;

  /// No description provided for @motivational_75_1.
  ///
  /// In en, this message translates to:
  /// **'Almost there! Just a bit more to go!'**
  String get motivational_75_1;

  /// No description provided for @motivational_75_2.
  ///
  /// In en, this message translates to:
  /// **'You\'re doing great! Keep it up!'**
  String get motivational_75_2;

  /// No description provided for @motivational_75_3.
  ///
  /// In en, this message translates to:
  /// **'So close to your goal!'**
  String get motivational_75_3;

  /// No description provided for @motivational_75_4.
  ///
  /// In en, this message translates to:
  /// **'Fantastic progress! Don\'t stop now!'**
  String get motivational_75_4;

  /// No description provided for @motivational_75_short.
  ///
  /// In en, this message translates to:
  /// **'Almost there!'**
  String get motivational_75_short;

  /// No description provided for @motivational_50_1.
  ///
  /// In en, this message translates to:
  /// **'Halfway there! You\'re doing awesome!'**
  String get motivational_50_1;

  /// No description provided for @motivational_50_2.
  ///
  /// In en, this message translates to:
  /// **'Great job! Keep going!'**
  String get motivational_50_2;

  /// No description provided for @motivational_50_3.
  ///
  /// In en, this message translates to:
  /// **'You\'re on the right track!'**
  String get motivational_50_3;

  /// No description provided for @motivational_50_4.
  ///
  /// In en, this message translates to:
  /// **'Nice progress! Stay consistent!'**
  String get motivational_50_4;

  /// No description provided for @motivational_50_short.
  ///
  /// In en, this message translates to:
  /// **'Halfway!'**
  String get motivational_50_short;

  /// No description provided for @motivational_25_1.
  ///
  /// In en, this message translates to:
  /// **'Good start! Keep drinking water!'**
  String get motivational_25_1;

  /// No description provided for @motivational_25_2.
  ///
  /// In en, this message translates to:
  /// **'You\'re off to a great start!'**
  String get motivational_25_2;

  /// No description provided for @motivational_25_3.
  ///
  /// In en, this message translates to:
  /// **'Nice beginning! Stay hydrated!'**
  String get motivational_25_3;

  /// No description provided for @motivational_25_4.
  ///
  /// In en, this message translates to:
  /// **'Keep going! Every sip counts!'**
  String get motivational_25_4;

  /// No description provided for @motivational_25_short.
  ///
  /// In en, this message translates to:
  /// **'Good start!'**
  String get motivational_25_short;

  /// No description provided for @motivational_0_1.
  ///
  /// In en, this message translates to:
  /// **'Time to start hydrating! Your body will thank you!'**
  String get motivational_0_1;

  /// No description provided for @motivational_0_2.
  ///
  /// In en, this message translates to:
  /// **'Let\'s begin your hydration journey!'**
  String get motivational_0_2;

  /// No description provided for @motivational_0_3.
  ///
  /// In en, this message translates to:
  /// **'Start your day with some water!'**
  String get motivational_0_3;

  /// No description provided for @motivational_0_4.
  ///
  /// In en, this message translates to:
  /// **'Your health matters! Start drinking!'**
  String get motivational_0_4;

  /// No description provided for @motivational_0_short.
  ///
  /// In en, this message translates to:
  /// **'Let\'s begin!'**
  String get motivational_0_short;

  /// No description provided for @profile_title.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile_title;

  /// No description provided for @profile_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profile_edit;

  /// No description provided for @profile_personal_info.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get profile_personal_info;

  /// No description provided for @profile_body_metrics.
  ///
  /// In en, this message translates to:
  /// **'Body Metrics'**
  String get profile_body_metrics;

  /// No description provided for @profile_activity_level.
  ///
  /// In en, this message translates to:
  /// **'Activity Level'**
  String get profile_activity_level;

  /// No description provided for @profile_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get profile_name;

  /// No description provided for @profile_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profile_email;

  /// No description provided for @profile_age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get profile_age;

  /// No description provided for @profile_gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get profile_gender;

  /// No description provided for @profile_weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get profile_weight;

  /// No description provided for @profile_height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get profile_height;

  /// No description provided for @profile_bmi.
  ///
  /// In en, this message translates to:
  /// **'BMI'**
  String get profile_bmi;

  /// No description provided for @profile_bmi_category.
  ///
  /// In en, this message translates to:
  /// **'BMI Category'**
  String get profile_bmi_category;

  /// No description provided for @profile_daily_goal.
  ///
  /// In en, this message translates to:
  /// **'Daily Water Goal'**
  String get profile_daily_goal;

  /// No description provided for @profile_use_calculated_goal.
  ///
  /// In en, this message translates to:
  /// **'Use Calculated Goal'**
  String get profile_use_calculated_goal;

  /// No description provided for @profile_custom_goal.
  ///
  /// In en, this message translates to:
  /// **'Custom Goal'**
  String get profile_custom_goal;

  /// No description provided for @profile_save_success.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profile_save_success;

  /// No description provided for @profile_save_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update profile'**
  String get profile_save_failed;

  /// No description provided for @profile_user_default.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get profile_user_default;

  /// No description provided for @gender_male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get gender_male;

  /// No description provided for @gender_female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get gender_female;

  /// No description provided for @gender_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get gender_other;

  /// No description provided for @activity_sedentary.
  ///
  /// In en, this message translates to:
  /// **'Sedentary'**
  String get activity_sedentary;

  /// No description provided for @activity_light.
  ///
  /// In en, this message translates to:
  /// **'Lightly Active'**
  String get activity_light;

  /// No description provided for @activity_moderate.
  ///
  /// In en, this message translates to:
  /// **'Moderately Active'**
  String get activity_moderate;

  /// No description provided for @activity_very_active.
  ///
  /// In en, this message translates to:
  /// **'Very Active'**
  String get activity_very_active;

  /// No description provided for @activity_extra_active.
  ///
  /// In en, this message translates to:
  /// **'Extra Active'**
  String get activity_extra_active;

  /// No description provided for @bmi_underweight.
  ///
  /// In en, this message translates to:
  /// **'Underweight'**
  String get bmi_underweight;

  /// No description provided for @bmi_normal.
  ///
  /// In en, this message translates to:
  /// **'Normal Weight'**
  String get bmi_normal;

  /// No description provided for @bmi_overweight.
  ///
  /// In en, this message translates to:
  /// **'Overweight'**
  String get bmi_overweight;

  /// No description provided for @bmi_obese.
  ///
  /// In en, this message translates to:
  /// **'Obese'**
  String get bmi_obese;

  /// No description provided for @settings_title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings_title;

  /// No description provided for @settings_notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settings_notifications;

  /// No description provided for @settings_reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get settings_reminders;

  /// No description provided for @settings_theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settings_theme;

  /// No description provided for @settings_units.
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get settings_units;

  /// No description provided for @settings_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_language;

  /// No description provided for @settings_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile Settings'**
  String get settings_profile;

  /// No description provided for @settings_daily_goal.
  ///
  /// In en, this message translates to:
  /// **'Daily Goal Settings'**
  String get settings_daily_goal;

  /// No description provided for @settings_data.
  ///
  /// In en, this message translates to:
  /// **'Data Management'**
  String get settings_data;

  /// No description provided for @settings_export_data.
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get settings_export_data;

  /// No description provided for @settings_import_data.
  ///
  /// In en, this message translates to:
  /// **'Import Data'**
  String get settings_import_data;

  /// No description provided for @settings_help.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get settings_help;

  /// No description provided for @settings_about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settings_about;

  /// No description provided for @settings_enable_notifications.
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
  String get settings_enable_notifications;

  /// No description provided for @settings_reminder_interval.
  ///
  /// In en, this message translates to:
  /// **'Reminder Interval'**
  String get settings_reminder_interval;

  /// No description provided for @settings_reminder_start_time.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get settings_reminder_start_time;

  /// No description provided for @settings_reminder_end_time.
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get settings_reminder_end_time;

  /// No description provided for @settings_test_notification.
  ///
  /// In en, this message translates to:
  /// **'Test Notification'**
  String get settings_test_notification;

  /// No description provided for @settings_theme_light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settings_theme_light;

  /// No description provided for @settings_theme_dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settings_theme_dark;

  /// No description provided for @settings_theme_system.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get settings_theme_system;

  /// No description provided for @settings_unit_ml.
  ///
  /// In en, this message translates to:
  /// **'Milliliters (ml)'**
  String get settings_unit_ml;

  /// No description provided for @settings_unit_floz.
  ///
  /// In en, this message translates to:
  /// **'Fluid Ounces (fl oz)'**
  String get settings_unit_floz;

  /// No description provided for @settings_unit_metric.
  ///
  /// In en, this message translates to:
  /// **'Metric system'**
  String get settings_unit_metric;

  /// No description provided for @settings_unit_imperial.
  ///
  /// In en, this message translates to:
  /// **'Imperial system'**
  String get settings_unit_imperial;

  /// No description provided for @settings_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Customize your experience'**
  String get settings_subtitle;

  /// No description provided for @settings_reminders_active.
  ///
  /// In en, this message translates to:
  /// **'Water reminders are active'**
  String get settings_reminders_active;

  /// No description provided for @settings_reminders_inactive.
  ///
  /// In en, this message translates to:
  /// **'Turn on to get reminders'**
  String get settings_reminders_inactive;

  /// No description provided for @settings_minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get settings_minutes;

  /// No description provided for @settings_export_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Backup your water tracking data'**
  String get settings_export_subtitle;

  /// No description provided for @settings_import_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Restore from backup file'**
  String get settings_import_subtitle;

  /// No description provided for @settings_profile_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Update your information'**
  String get settings_profile_subtitle;

  /// No description provided for @settings_daily_goal_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your hydration goal'**
  String get settings_daily_goal_subtitle;

  /// No description provided for @settings_theme_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settings_theme_dialog_title;

  /// No description provided for @settings_theme_light_mode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get settings_theme_light_mode;

  /// No description provided for @settings_theme_dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settings_theme_dark_mode;

  /// No description provided for @settings_theme_system_mode.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get settings_theme_system_mode;

  /// No description provided for @settings_theme_light_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Use light theme'**
  String get settings_theme_light_subtitle;

  /// No description provided for @settings_theme_dark_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Use dark theme'**
  String get settings_theme_dark_subtitle;

  /// No description provided for @settings_theme_system_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Follow system theme'**
  String get settings_theme_system_subtitle;

  /// No description provided for @settings_language_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_language_dialog_title;

  /// No description provided for @settings_export_loading.
  ///
  /// In en, this message translates to:
  /// **'Exporting data...'**
  String get settings_export_loading;

  /// No description provided for @settings_export_success_message.
  ///
  /// In en, this message translates to:
  /// **'Data exported successfully!'**
  String get settings_export_success_message;

  /// No description provided for @settings_export_failed_message.
  ///
  /// In en, this message translates to:
  /// **'Export failed: {error}'**
  String settings_export_failed_message(String error);

  /// No description provided for @settings_import_loading.
  ///
  /// In en, this message translates to:
  /// **'Importing data...'**
  String get settings_import_loading;

  /// No description provided for @settings_import_complete.
  ///
  /// In en, this message translates to:
  /// **'Import Complete'**
  String get settings_import_complete;

  /// No description provided for @settings_import_success_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Imported successfully:'**
  String get settings_import_success_subtitle;

  /// No description provided for @settings_import_water_records.
  ///
  /// In en, this message translates to:
  /// **'water records'**
  String get settings_import_water_records;

  /// No description provided for @settings_import_daily_goals.
  ///
  /// In en, this message translates to:
  /// **'daily goals'**
  String get settings_import_daily_goals;

  /// No description provided for @settings_import_duplicate_skipped.
  ///
  /// In en, this message translates to:
  /// **'duplicate records skipped'**
  String get settings_import_duplicate_skipped;

  /// No description provided for @settings_import_failed_message.
  ///
  /// In en, this message translates to:
  /// **'Import failed: {error}'**
  String settings_import_failed_message(String error);

  /// No description provided for @settings_reminder_interval_title.
  ///
  /// In en, this message translates to:
  /// **'Reminder Interval'**
  String get settings_reminder_interval_title;

  /// No description provided for @settings_language_coming_soon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get settings_language_coming_soon;

  /// No description provided for @settings_export_success.
  ///
  /// In en, this message translates to:
  /// **'Data exported successfully'**
  String get settings_export_success;

  /// No description provided for @settings_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to export data'**
  String get settings_export_failed;

  /// No description provided for @settings_import_success.
  ///
  /// In en, this message translates to:
  /// **'Data imported successfully'**
  String get settings_import_success;

  /// No description provided for @settings_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to import data'**
  String get settings_import_failed;

  /// No description provided for @settings_import_stats.
  ///
  /// In en, this message translates to:
  /// **'Imported {imported} records, skipped {skipped} duplicates'**
  String settings_import_stats(int imported, int skipped);

  /// No description provided for @statistics_title.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics_title;

  /// No description provided for @statistics_weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get statistics_weekly;

  /// No description provided for @statistics_monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get statistics_monthly;

  /// No description provided for @statistics_yearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get statistics_yearly;

  /// No description provided for @statistics_average.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get statistics_average;

  /// No description provided for @statistics_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get statistics_total;

  /// No description provided for @statistics_best_day.
  ///
  /// In en, this message translates to:
  /// **'Best Day'**
  String get statistics_best_day;

  /// No description provided for @statistics_goal_achievement.
  ///
  /// In en, this message translates to:
  /// **'Goal Achievement'**
  String get statistics_goal_achievement;

  /// No description provided for @statistics_no_data.
  ///
  /// In en, this message translates to:
  /// **'No data available for this period'**
  String get statistics_no_data;

  /// No description provided for @statistics_chart_label.
  ///
  /// In en, this message translates to:
  /// **'Water Intake'**
  String get statistics_chart_label;

  /// No description provided for @achievements_title.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements_title;

  /// No description provided for @achievements_unlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get achievements_unlocked;

  /// No description provided for @achievements_locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get achievements_locked;

  /// No description provided for @achievements_progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get achievements_progress;

  /// No description provided for @achievements_reward_points.
  ///
  /// In en, this message translates to:
  /// **'Reward Points'**
  String get achievements_reward_points;

  /// No description provided for @achievements_total_points.
  ///
  /// In en, this message translates to:
  /// **'Total Points: {points}'**
  String achievements_total_points(int points);

  /// No description provided for @achievement_first_drop.
  ///
  /// In en, this message translates to:
  /// **'First Drop'**
  String get achievement_first_drop;

  /// No description provided for @achievement_first_drop_desc.
  ///
  /// In en, this message translates to:
  /// **'Log your first water intake'**
  String get achievement_first_drop_desc;

  /// No description provided for @achievement_daily_goal_1.
  ///
  /// In en, this message translates to:
  /// **'Goal Achiever'**
  String get achievement_daily_goal_1;

  /// No description provided for @achievement_daily_goal_1_desc.
  ///
  /// In en, this message translates to:
  /// **'Reach your daily goal once'**
  String get achievement_daily_goal_1_desc;

  /// No description provided for @achievement_streak_3.
  ///
  /// In en, this message translates to:
  /// **'3-Day Streak'**
  String get achievement_streak_3;

  /// No description provided for @achievement_streak_3_desc.
  ///
  /// In en, this message translates to:
  /// **'Maintain a 3-day streak'**
  String get achievement_streak_3_desc;

  /// No description provided for @achievement_streak_7.
  ///
  /// In en, this message translates to:
  /// **'Week Warrior'**
  String get achievement_streak_7;

  /// No description provided for @achievement_streak_7_desc.
  ///
  /// In en, this message translates to:
  /// **'Maintain a 7-day streak'**
  String get achievement_streak_7_desc;

  /// No description provided for @achievement_streak_30.
  ///
  /// In en, this message translates to:
  /// **'Month Master'**
  String get achievement_streak_30;

  /// No description provided for @achievement_streak_30_desc.
  ///
  /// In en, this message translates to:
  /// **'Maintain a 30-day streak'**
  String get achievement_streak_30_desc;

  /// No description provided for @achievement_total_10l.
  ///
  /// In en, this message translates to:
  /// **'10 Liters'**
  String get achievement_total_10l;

  /// No description provided for @achievement_total_10l_desc.
  ///
  /// In en, this message translates to:
  /// **'Drink 10 liters total'**
  String get achievement_total_10l_desc;

  /// No description provided for @achievement_total_100l.
  ///
  /// In en, this message translates to:
  /// **'100 Liters'**
  String get achievement_total_100l;

  /// No description provided for @achievement_total_100l_desc.
  ///
  /// In en, this message translates to:
  /// **'Drink 100 liters total'**
  String get achievement_total_100l_desc;

  /// No description provided for @achievement_consistency.
  ///
  /// In en, this message translates to:
  /// **'Consistency Week'**
  String get achievement_consistency;

  /// No description provided for @achievement_consistency_desc.
  ///
  /// In en, this message translates to:
  /// **'Reach your goal 7 days in a row'**
  String get achievement_consistency_desc;

  /// No description provided for @reminders_title.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders_title;

  /// No description provided for @reminders_active.
  ///
  /// In en, this message translates to:
  /// **'Active Reminders'**
  String get reminders_active;

  /// No description provided for @reminders_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending Notifications'**
  String get reminders_pending;

  /// No description provided for @reminders_interval_30.
  ///
  /// In en, this message translates to:
  /// **'Every 30 minutes'**
  String get reminders_interval_30;

  /// No description provided for @reminders_interval_45.
  ///
  /// In en, this message translates to:
  /// **'Every 45 minutes'**
  String get reminders_interval_45;

  /// No description provided for @reminders_interval_60.
  ///
  /// In en, this message translates to:
  /// **'Every hour'**
  String get reminders_interval_60;

  /// No description provided for @reminders_interval_90.
  ///
  /// In en, this message translates to:
  /// **'Every 1.5 hours'**
  String get reminders_interval_90;

  /// No description provided for @reminders_interval_120.
  ///
  /// In en, this message translates to:
  /// **'Every 2 hours'**
  String get reminders_interval_120;

  /// No description provided for @reminders_interval_180.
  ///
  /// In en, this message translates to:
  /// **'Every 3 hours'**
  String get reminders_interval_180;

  /// No description provided for @notification_reminder_title.
  ///
  /// In en, this message translates to:
  /// **'Time to Drink Water!'**
  String get notification_reminder_title;

  /// No description provided for @notification_reminder_body.
  ///
  /// In en, this message translates to:
  /// **'Stay hydrated! Drink some water now.'**
  String get notification_reminder_body;

  /// No description provided for @streak_current.
  ///
  /// In en, this message translates to:
  /// **'Current Streak'**
  String get streak_current;

  /// No description provided for @streak_days.
  ///
  /// In en, this message translates to:
  /// **'{days} days'**
  String streak_days(int days);

  /// No description provided for @streak_keep_going.
  ///
  /// In en, this message translates to:
  /// **'Keep the streak going!'**
  String get streak_keep_going;

  /// No description provided for @streak_personal_best.
  ///
  /// In en, this message translates to:
  /// **'Personal Best'**
  String get streak_personal_best;

  /// No description provided for @streak_best.
  ///
  /// In en, this message translates to:
  /// **'Best!'**
  String get streak_best;

  /// No description provided for @streak_longest.
  ///
  /// In en, this message translates to:
  /// **'Longest'**
  String get streak_longest;

  /// No description provided for @streak_next_milestone.
  ///
  /// In en, this message translates to:
  /// **'Next Milestone'**
  String get streak_next_milestone;

  /// No description provided for @streak_start_today.
  ///
  /// In en, this message translates to:
  /// **'Start Your Streak Today!'**
  String get streak_start_today;

  /// No description provided for @streak_complete_goal.
  ///
  /// In en, this message translates to:
  /// **'Complete your daily goal to build a streak'**
  String get streak_complete_goal;

  /// No description provided for @streak_start.
  ///
  /// In en, this message translates to:
  /// **'Start your streak!'**
  String get streak_start;

  /// No description provided for @streak_error.
  ///
  /// In en, this message translates to:
  /// **'Failed to load streak data'**
  String get streak_error;

  /// No description provided for @streak_day_singular.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get streak_day_singular;

  /// No description provided for @streak_day_plural.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get streak_day_plural;

  /// No description provided for @onboarding_title_1.
  ///
  /// In en, this message translates to:
  /// **'Track Your Water'**
  String get onboarding_title_1;

  /// No description provided for @onboarding_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Easily log your daily water intake with just a tap'**
  String get onboarding_desc_1;

  /// No description provided for @onboarding_title_2.
  ///
  /// In en, this message translates to:
  /// **'Smart Reminders'**
  String get onboarding_title_2;

  /// No description provided for @onboarding_desc_2.
  ///
  /// In en, this message translates to:
  /// **'Get timely reminders to stay hydrated throughout the day'**
  String get onboarding_desc_2;

  /// No description provided for @onboarding_title_3.
  ///
  /// In en, this message translates to:
  /// **'Monitor Progress'**
  String get onboarding_title_3;

  /// No description provided for @onboarding_desc_3.
  ///
  /// In en, this message translates to:
  /// **'View your hydration statistics and achieve your goals'**
  String get onboarding_desc_3;

  /// No description provided for @onboarding_title_4.
  ///
  /// In en, this message translates to:
  /// **'Stay Healthy'**
  String get onboarding_title_4;

  /// No description provided for @onboarding_desc_4.
  ///
  /// In en, this message translates to:
  /// **'Build healthy habits and improve your overall wellness'**
  String get onboarding_desc_4;

  /// No description provided for @onboarding_get_started.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboarding_get_started;

  /// No description provided for @drawer_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get drawer_home;

  /// No description provided for @drawer_statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get drawer_statistics;

  /// No description provided for @drawer_achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get drawer_achievements;

  /// No description provided for @drawer_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get drawer_profile;

  /// No description provided for @drawer_reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get drawer_reminders;

  /// No description provided for @drawer_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get drawer_settings;

  /// No description provided for @drawer_help.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get drawer_help;

  /// No description provided for @drawer_about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get drawer_about;

  /// No description provided for @drawer_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get drawer_logout;

  /// No description provided for @about_title.
  ///
  /// In en, this message translates to:
  /// **'Aqualert'**
  String get about_title;

  /// No description provided for @about_version.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get about_version;

  /// No description provided for @about_description.
  ///
  /// In en, this message translates to:
  /// **'Stay hydrated and healthy with Aqualert. Track your daily water intake and achieve your hydration goals!'**
  String get about_description;

  /// No description provided for @about_copyright.
  ///
  /// In en, this message translates to:
  /// **'© 2024 Aqualert. All rights reserved.'**
  String get about_copyright;

  /// No description provided for @about_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get about_close;

  /// No description provided for @help_title.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get help_title;

  /// No description provided for @help_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Get help and learn more'**
  String get help_subtitle;

  /// No description provided for @help_faq.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get help_faq;

  /// No description provided for @help_contact.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get help_contact;

  /// No description provided for @help_version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get help_version;

  /// No description provided for @help_app_info.
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get help_app_info;

  /// No description provided for @help_coming_soon.
  ///
  /// In en, this message translates to:
  /// **'Help & Support - Coming Soon!'**
  String get help_coming_soon;

  /// No description provided for @help_faq_section.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get help_faq_section;

  /// No description provided for @help_features_section.
  ///
  /// In en, this message translates to:
  /// **'Features Guide'**
  String get help_features_section;

  /// No description provided for @help_about_section.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get help_about_section;

  /// No description provided for @faq_1_q.
  ///
  /// In en, this message translates to:
  /// **'How is my daily water goal calculated?'**
  String get faq_1_q;

  /// No description provided for @faq_1_a.
  ///
  /// In en, this message translates to:
  /// **'Your daily water goal is calculated based on your weight, height, age, gender, and activity level using scientific formulas. You can also set a custom goal in Profile settings.'**
  String get faq_1_a;

  /// No description provided for @faq_2_q.
  ///
  /// In en, this message translates to:
  /// **'How do water reminders work?'**
  String get faq_2_q;

  /// No description provided for @faq_2_a.
  ///
  /// In en, this message translates to:
  /// **'You can set reminder intervals (30-180 minutes) and choose start/end times. The app will send you notifications during this period to help you stay hydrated.'**
  String get faq_2_a;

  /// No description provided for @faq_3_q.
  ///
  /// In en, this message translates to:
  /// **'What are streaks and how do they work?'**
  String get faq_3_q;

  /// No description provided for @faq_3_a.
  ///
  /// In en, this message translates to:
  /// **'Streaks track consecutive days you\'ve reached your daily water goal. Keep drinking water daily to maintain and increase your streak!'**
  String get faq_3_a;

  /// No description provided for @faq_4_q.
  ///
  /// In en, this message translates to:
  /// **'How can I change the measurement units?'**
  String get faq_4_q;

  /// No description provided for @faq_4_a.
  ///
  /// In en, this message translates to:
  /// **'Go to Settings → Units and switch between milliliters (ml) and fluid ounces (fl oz). All measurements will update automatically.'**
  String get faq_4_a;

  /// No description provided for @faq_5_q.
  ///
  /// In en, this message translates to:
  /// **'Can I export my water tracking data?'**
  String get faq_5_q;

  /// No description provided for @faq_5_a.
  ///
  /// In en, this message translates to:
  /// **'Yes! Go to Settings → Data Management → Export Data. You can share or save your data as a JSON file and import it later.'**
  String get faq_5_a;

  /// No description provided for @faq_6_q.
  ///
  /// In en, this message translates to:
  /// **'How do achievements work?'**
  String get faq_6_q;

  /// No description provided for @faq_6_a.
  ///
  /// In en, this message translates to:
  /// **'Complete water tracking milestones to unlock achievements and earn reward points. Track your progress in the Achievements screen.'**
  String get faq_6_a;

  /// No description provided for @feature_tracking_title.
  ///
  /// In en, this message translates to:
  /// **'Water Tracking'**
  String get feature_tracking_title;

  /// No description provided for @feature_tracking_desc.
  ///
  /// In en, this message translates to:
  /// **'Easily log your daily water intake with quick-add buttons (250ml, 350ml, 500ml, 750ml) or enter a custom amount.'**
  String get feature_tracking_desc;

  /// No description provided for @feature_reminders_title.
  ///
  /// In en, this message translates to:
  /// **'Smart Reminders'**
  String get feature_reminders_title;

  /// No description provided for @feature_reminders_desc.
  ///
  /// In en, this message translates to:
  /// **'Set customizable reminder intervals and choose active hours. Never forget to drink water throughout the day.'**
  String get feature_reminders_desc;

  /// No description provided for @feature_statistics_title.
  ///
  /// In en, this message translates to:
  /// **'Statistics & Insights'**
  String get feature_statistics_title;

  /// No description provided for @feature_statistics_desc.
  ///
  /// In en, this message translates to:
  /// **'View your water consumption trends with weekly, monthly, and yearly charts. Track your progress over time.'**
  String get feature_statistics_desc;

  /// No description provided for @feature_achievements_title.
  ///
  /// In en, this message translates to:
  /// **'Achievements & Streaks'**
  String get feature_achievements_title;

  /// No description provided for @feature_achievements_desc.
  ///
  /// In en, this message translates to:
  /// **'Earn achievements and maintain daily streaks by reaching your water goals. Stay motivated with gamification!'**
  String get feature_achievements_desc;

  /// No description provided for @feature_profile_title.
  ///
  /// In en, this message translates to:
  /// **'Profile & Goals'**
  String get feature_profile_title;

  /// No description provided for @feature_profile_desc.
  ///
  /// In en, this message translates to:
  /// **'Set your personal information and let the app calculate your optimal daily water goal based on your body metrics.'**
  String get feature_profile_desc;

  /// No description provided for @help_contact_email.
  ///
  /// In en, this message translates to:
  /// **'Contact via Email'**
  String get help_contact_email;

  /// No description provided for @help_contact_email_address.
  ///
  /// In en, this message translates to:
  /// **'dilaraacikgoz.dev@gmail.com'**
  String get help_contact_email_address;

  /// No description provided for @help_rate_app.
  ///
  /// In en, this message translates to:
  /// **'Rate Our App'**
  String get help_rate_app;

  /// No description provided for @help_rate_desc.
  ///
  /// In en, this message translates to:
  /// **'Enjoying Aqualert? Leave us a review!'**
  String get help_rate_desc;

  /// No description provided for @help_build_number.
  ///
  /// In en, this message translates to:
  /// **'Build'**
  String get help_build_number;

  /// No description provided for @help_copyright.
  ///
  /// In en, this message translates to:
  /// **'© 2024 Aqualert. All rights reserved.'**
  String get help_copyright;

  /// No description provided for @help_made_with.
  ///
  /// In en, this message translates to:
  /// **'Made with ❤️ for your health'**
  String get help_made_with;

  /// No description provided for @error_generic.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get error_generic;

  /// No description provided for @error_network.
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your connection.'**
  String get error_network;

  /// No description provided for @error_auth_failed.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed. Please try again.'**
  String get error_auth_failed;

  /// No description provided for @error_permission_denied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied.'**
  String get error_permission_denied;

  /// No description provided for @unit_ml.
  ///
  /// In en, this message translates to:
  /// **'ml'**
  String get unit_ml;

  /// No description provided for @unit_floz.
  ///
  /// In en, this message translates to:
  /// **'fl oz'**
  String get unit_floz;

  /// No description provided for @unit_kg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get unit_kg;

  /// No description provided for @unit_lb.
  ///
  /// In en, this message translates to:
  /// **'lb'**
  String get unit_lb;

  /// No description provided for @unit_cm.
  ///
  /// In en, this message translates to:
  /// **'cm'**
  String get unit_cm;

  /// No description provided for @unit_ft.
  ///
  /// In en, this message translates to:
  /// **'ft'**
  String get unit_ft;

  /// No description provided for @unit_liter.
  ///
  /// In en, this message translates to:
  /// **'L'**
  String get unit_liter;

  /// No description provided for @time_morning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get time_morning;

  /// No description provided for @time_afternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get time_afternoon;

  /// No description provided for @time_evening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get time_evening;

  /// No description provided for @time_night.
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get time_night;

  /// No description provided for @help_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get help_privacy_policy;

  /// No description provided for @help_privacy_policy_desc.
  ///
  /// In en, this message translates to:
  /// **'View our privacy policy'**
  String get help_privacy_policy_desc;

  /// No description provided for @help_privacy_policy_error.
  ///
  /// In en, this message translates to:
  /// **'Could not open Privacy Policy'**
  String get help_privacy_policy_error;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'it',
    'ja',
    'ko',
    'nl',
    'pl',
    'pt',
    'ru',
    'tr',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
