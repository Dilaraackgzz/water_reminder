// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => 'स्वस्थ जीवन के लिए हाइड्रेटेड रहें';

  @override
  String get common_cancel => 'रद्द करें';

  @override
  String get common_save => 'सहेजें';

  @override
  String get common_delete => 'हटाएं';

  @override
  String get common_edit => 'संपादित करें';

  @override
  String get common_add => 'जोड़ें';

  @override
  String get common_ok => 'ठीक है';

  @override
  String get common_yes => 'हाँ';

  @override
  String get common_no => 'नहीं';

  @override
  String get common_or => 'या';

  @override
  String get common_done => 'हो गया';

  @override
  String get common_skip => 'छोड़ें';

  @override
  String get common_next => 'अगला';

  @override
  String get common_back => 'वापस';

  @override
  String get common_continue => 'जारी रखें';

  @override
  String get common_loading => 'लोड हो रहा है...';

  @override
  String get common_error => 'त्रुटि';

  @override
  String get common_success => 'सफल';

  @override
  String get auth_login_title => 'साइन इन';

  @override
  String get auth_register_title => 'साइन अप';

  @override
  String get auth_email_label => 'ईमेल';

  @override
  String get auth_email_hint => 'example@email.com';

  @override
  String get auth_password_label => 'पासवर्ड';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => 'पूरा नाम';

  @override
  String get auth_name_hint => 'राहुल शर्मा';

  @override
  String get auth_forgot_password => 'पासवर्ड भूल गए?';

  @override
  String get auth_dont_have_account => 'खाता नहीं है? ';

  @override
  String get auth_already_have_account => 'पहले से खाता है? ';

  @override
  String get auth_sign_in_button => 'साइन इन';

  @override
  String get auth_sign_up_button => 'साइन अप';

  @override
  String get auth_sign_in_google => 'Google से साइन इन करें';

  @override
  String get auth_sign_up_google => 'Google से साइन अप करें';

  @override
  String get auth_logout => 'लॉग आउट';

  @override
  String get auth_validation_email_required => 'ईमेल आवश्यक है';

  @override
  String get auth_validation_email_invalid => 'कृपया वैध ईमेल दर्ज करें';

  @override
  String get auth_validation_password_required => 'पासवर्ड आवश्यक है';

  @override
  String get auth_validation_password_min_length =>
      'पासवर्ड कम से कम 6 अक्षरों का होना चाहिए';

  @override
  String get auth_validation_password_mismatch => 'Passwords don\'t match';

  @override
  String get auth_validation_name_required => 'नाम आवश्यक है';

  @override
  String get auth_validation_name_min_length =>
      'नाम कम से कम 2 अक्षरों का होना चाहिए';

  @override
  String get auth_confirm_password_label => 'Confirm Password';

  @override
  String get auth_confirm_password_hint => 'Re-enter your password';

  @override
  String auth_resend_countdown(int seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String get auth_verification_check_failed =>
      'Failed to check verification status';

  @override
  String get auth_verification_send_failed =>
      'Failed to send verification email';

  @override
  String get auth_signout_failed => 'Failed to sign out';

  @override
  String get auth_email_verification_title => 'अपना ईमेल सत्यापित करें';

  @override
  String get auth_email_verification_sent => 'हमने सत्यापन लिंक भेजा है:';

  @override
  String get auth_email_verification_instruction =>
      'कृपया अपना ईमेल जांचें और सत्यापन लिंक पर क्लिक करें।';

  @override
  String get auth_email_verification_not_received => 'ईमेल नहीं मिला?';

  @override
  String get auth_email_verification_resend => 'सत्यापन ईमेल पुनः भेजें';

  @override
  String get auth_email_verification_check =>
      'मैंने अपना ईमेल सत्यापित कर लिया';

  @override
  String get auth_email_verification_success => 'ईमेल सफलतापूर्वक सत्यापित!';

  @override
  String get auth_email_verification_failed =>
      'ईमेल अभी तक सत्यापित नहीं हुआ। कृपया इनबॉक्स जांचें।';

  @override
  String get auth_forgot_password_title => 'पासवर्ड रीसेट करें';

  @override
  String get auth_forgot_password_instruction =>
      'अपना ईमेल पता दर्ज करें और हम आपको पासवर्ड रीसेट लिंक भेजेंगे।';

  @override
  String get auth_forgot_password_button => 'रीसेट लिंक भेजें';

  @override
  String get auth_forgot_password_success => 'पासवर्ड रीसेट ईमेल भेजा गया!';

  @override
  String get auth_back_to_login => 'साइन इन पर वापस जाएं';

  @override
  String get home_title => 'होम';

  @override
  String get home_daily_goal => 'दैनिक लक्ष्य';

  @override
  String get home_today => 'आज';

  @override
  String get home_todays_progress => 'Today\'s Progress';

  @override
  String get home_quick_add => 'Quick Add';

  @override
  String home_amount_to_go(String amount) {
    return '$amount to go!';
  }

  @override
  String get home_custom_amount => 'कस्टम मात्रा';

  @override
  String get home_amount_label => 'मात्रा';

  @override
  String get home_add_water_success => 'पानी जोड़ा गया!';

  @override
  String get home_add_water_failed => 'पानी जोड़ने में विफल';

  @override
  String get home_delete_water_confirm => 'यह रिकॉर्ड हटाएं?';

  @override
  String get home_delete_water_success => 'रिकॉर्ड हटाया गया';

  @override
  String get home_no_records_today => 'आज कोई रिकॉर्ड नहीं';

  @override
  String get home_start_drinking => 'पानी पीना शुरू करें!';

  @override
  String get progress_current => 'वर्तमान';

  @override
  String get progress_goal => 'लक्ष्य';

  @override
  String get progress_remaining => 'शेष';

  @override
  String get progress_completed => 'लक्ष्य पूरा!';

  @override
  String progress_percentage(int percent) {
    return 'दैनिक लक्ष्य का $percent%';
  }

  @override
  String get motivational_keep_going => 'जारी रखें! आप बहुत अच्छा कर रहे हैं!';

  @override
  String get motivational_almost_there => 'लगभग पहुंच गए! बस थोड़ा और!';

  @override
  String get motivational_goal_reached => 'बधाई! आपने अपना लक्ष्य हासिल किया!';

  @override
  String get motivational_good_start => 'अच्छी शुरुआत! जारी रखें!';

  @override
  String get motivational_stay_hydrated => 'दिन भर हाइड्रेटेड रहें!';

  @override
  String get motivational_100_1 => 'बधाई! आपने अपना लक्ष्य हासिल किया!';

  @override
  String get motivational_100_2 => 'शानदार! कल भी हाइड्रेटेड रहें!';

  @override
  String get motivational_100_3 => 'आप हाइड्रेशन चैंपियन हैं!';

  @override
  String get motivational_100_4 => 'बिल्कुल सही! अच्छी आदतें जारी रखें!';

  @override
  String get motivational_100_short => 'लक्ष्य पूरा!';

  @override
  String get motivational_75_1 => 'लगभग पहुंच गए! बस थोड़ा और!';

  @override
  String get motivational_75_2 => 'आप बहुत अच्छा कर रहे हैं! जारी रखें!';

  @override
  String get motivational_75_3 => 'अपने लक्ष्य के बहुत करीब!';

  @override
  String get motivational_75_4 => 'शानदार प्रगति! अभी मत रुकें!';

  @override
  String get motivational_75_short => 'लगभग पहुंच गए!';

  @override
  String get motivational_50_1 => 'आधा रास्ता! बहुत बढ़िया!';

  @override
  String get motivational_50_2 => 'अच्छा काम! जारी रखें!';

  @override
  String get motivational_50_3 => 'आप सही रास्ते पर हैं!';

  @override
  String get motivational_50_4 => 'अच्छी प्रगति! लगातार रहें!';

  @override
  String get motivational_50_short => 'आधा!';

  @override
  String get motivational_25_1 => 'अच्छी शुरुआत! पानी पीते रहें!';

  @override
  String get motivational_25_2 => 'शानदार शुरुआत!';

  @override
  String get motivational_25_3 => 'अच्छी शुरुआत! हाइड्रेटेड रहें!';

  @override
  String get motivational_25_4 => 'जारी रखें! हर घूंट मायने रखती है!';

  @override
  String get motivational_25_short => 'अच्छी शुरुआत!';

  @override
  String get motivational_0_1 =>
      'हाइड्रेट करने का समय! आपका शरीर धन्यवाद देगा!';

  @override
  String get motivational_0_2 => 'अपनी हाइड्रेशन यात्रा शुरू करें!';

  @override
  String get motivational_0_3 => 'अपने दिन की शुरुआत पानी से करें!';

  @override
  String get motivational_0_4 =>
      'आपका स्वास्थ्य महत्वपूर्ण है! पीना शुरू करें!';

  @override
  String get motivational_0_short => 'शुरू करें!';

  @override
  String get profile_title => 'प्रोफाइल';

  @override
  String get profile_edit => 'संपादित करें';

  @override
  String get profile_personal_info => 'व्यक्तिगत जानकारी';

  @override
  String get profile_body_metrics => 'शारीरिक माप';

  @override
  String get profile_activity_level => 'गतिविधि स्तर';

  @override
  String get profile_name => 'नाम';

  @override
  String get profile_email => 'ईमेल';

  @override
  String get profile_age => 'उम्र';

  @override
  String get profile_gender => 'लिंग';

  @override
  String get profile_weight => 'वजन';

  @override
  String get profile_height => 'ऊंचाई';

  @override
  String get profile_bmi => 'BMI';

  @override
  String get profile_bmi_category => 'BMI श्रेणी';

  @override
  String get profile_daily_goal => 'दैनिक पानी का लक्ष्य';

  @override
  String get profile_use_calculated_goal => 'गणना किए गए लक्ष्य का उपयोग करें';

  @override
  String get profile_custom_goal => 'कस्टम लक्ष्य';

  @override
  String get profile_save_success => 'प्रोफाइल अपडेट हुई';

  @override
  String get profile_save_failed => 'प्रोफाइल अपडेट विफल';

  @override
  String get profile_user_default => 'उपयोगकर्ता';

  @override
  String get profile_validation_name_required => 'Name is required';

  @override
  String get profile_validation_age_invalid => 'Age must be between 1 and 120';

  @override
  String get profile_validation_weight_invalid =>
      'Weight must be between 10 and 500 kg';

  @override
  String get profile_validation_height_invalid =>
      'Height must be between 50 and 300 cm';

  @override
  String get gender_male => 'पुरुष';

  @override
  String get gender_female => 'महिला';

  @override
  String get gender_other => 'अन्य';

  @override
  String get activity_sedentary => 'गतिहीन';

  @override
  String get activity_sedentary_desc => 'कम या कोई व्यायाम नहीं';

  @override
  String get activity_light => 'हल्की गतिविधि';

  @override
  String get activity_light_desc => 'सप्ताह में 1-3 दिन हल्का व्यायाम';

  @override
  String get activity_moderate => 'मध्यम गतिविधि';

  @override
  String get activity_moderate_desc => 'सप्ताह में 3-5 दिन मध्यम व्यायाम';

  @override
  String get activity_very_active => 'बहुत सक्रिय';

  @override
  String get activity_very_active_desc => 'सप्ताह में 6-7 दिन तीव्र व्यायाम';

  @override
  String get activity_extra_active => 'अत्यधिक सक्रिय';

  @override
  String get activity_extra_active_desc => 'बहुत तीव्र व्यायाम और शारीरिक काम';

  @override
  String get bmi_underweight => 'कम वजन';

  @override
  String get bmi_normal => 'सामान्य वजन';

  @override
  String get bmi_overweight => 'अधिक वजन';

  @override
  String get bmi_obese => 'मोटापा';

  @override
  String get settings_title => 'सेटिंग्स';

  @override
  String get settings_notifications => 'नोटिफिकेशन';

  @override
  String get settings_reminders => 'रिमाइंडर';

  @override
  String get settings_theme => 'थीम';

  @override
  String get settings_units => 'इकाइयां';

  @override
  String get settings_language => 'भाषा';

  @override
  String get settings_profile => 'प्रोफाइल सेटिंग्स';

  @override
  String get settings_daily_goal => 'लक्ष्य सेटिंग्स';

  @override
  String get settings_data => 'डेटा प्रबंधन';

  @override
  String get settings_export_data => 'डेटा निर्यात करें';

  @override
  String get settings_import_data => 'डेटा आयात करें';

  @override
  String get settings_help => 'सहायता';

  @override
  String get settings_about => 'ऐप के बारे में';

  @override
  String get settings_enable_notifications => 'नोटिफिकेशन सक्षम करें';

  @override
  String get settings_reminder_interval => 'रिमाइंडर अंतराल';

  @override
  String get settings_reminder_start_time => 'शुरुआत का समय';

  @override
  String get settings_reminder_end_time => 'समाप्ति का समय';

  @override
  String get settings_test_notification => 'टेस्ट नोटिफिकेशन';

  @override
  String get settings_theme_light => 'लाइट';

  @override
  String get settings_theme_dark => 'डार्क';

  @override
  String get settings_theme_system => 'सिस्टम डिफॉल्ट';

  @override
  String get settings_unit_ml => 'मिलीलीटर (ml)';

  @override
  String get settings_unit_floz => 'फ्लुइड आउंस (fl oz)';

  @override
  String get settings_unit_metric => 'मीट्रिक प्रणाली';

  @override
  String get settings_unit_imperial => 'इम्पीरियल प्रणाली';

  @override
  String get settings_subtitle => 'अपना अनुभव कस्टमाइज़ करें';

  @override
  String get settings_reminders_active => 'रिमाइंडर सक्रिय हैं';

  @override
  String get settings_reminders_inactive => 'रिमाइंडर पाने के लिए चालू करें';

  @override
  String get settings_minutes => 'मिनट';

  @override
  String get settings_export_subtitle => 'अपने डेटा का बैकअप लें';

  @override
  String get settings_import_subtitle => 'बैकअप फाइल से रिस्टोर करें';

  @override
  String get settings_profile_subtitle => 'अपनी जानकारी अपडेट करें';

  @override
  String get settings_daily_goal_subtitle =>
      'अपने हाइड्रेशन लक्ष्य को प्रबंधित करें';

  @override
  String get settings_theme_dialog_title => 'थीम';

  @override
  String get settings_theme_light_mode => 'लाइट मोड';

  @override
  String get settings_theme_dark_mode => 'डार्क मोड';

  @override
  String get settings_theme_system_mode => 'सिस्टम डिफॉल्ट';

  @override
  String get settings_theme_light_subtitle => 'लाइट थीम का उपयोग करें';

  @override
  String get settings_theme_dark_subtitle => 'डार्क थीम का उपयोग करें';

  @override
  String get settings_theme_system_subtitle => 'सिस्टम थीम का पालन करें';

  @override
  String get settings_language_dialog_title => 'भाषा';

  @override
  String get settings_system_language => 'System Language';

  @override
  String get settings_use_device_language => 'Use device language';

  @override
  String get settings_export_loading => 'डेटा निर्यात हो रहा है...';

  @override
  String get settings_export_success_message => 'डेटा सफलतापूर्वक निर्यात हुआ!';

  @override
  String settings_export_failed_message(String error) {
    return 'निर्यात विफल: $error';
  }

  @override
  String get settings_import_loading => 'डेटा आयात हो रहा है...';

  @override
  String get settings_import_complete => 'आयात पूर्ण';

  @override
  String get settings_import_success_subtitle => 'सफलतापूर्वक आयात:';

  @override
  String get settings_import_water_records => 'पानी के रिकॉर्ड';

  @override
  String get settings_import_daily_goals => 'दैनिक लक्ष्य';

  @override
  String get settings_import_duplicate_skipped => 'डुप्लीकेट रिकॉर्ड छोड़े गए';

  @override
  String settings_import_failed_message(String error) {
    return 'आयात विफल: $error';
  }

  @override
  String get settings_reminder_interval_title => 'रिमाइंडर अंतराल';

  @override
  String get settings_language_coming_soon => 'जल्द आ रहा है';

  @override
  String get settings_export_success => 'डेटा निर्यात हुआ';

  @override
  String get settings_export_failed => 'निर्यात विफल';

  @override
  String get settings_import_success => 'डेटा आयात हुआ';

  @override
  String get settings_import_failed => 'आयात विफल';

  @override
  String settings_import_stats(int imported, int skipped) {
    return '$imported रिकॉर्ड आयात, $skipped डुप्लीकेट छोड़े गए';
  }

  @override
  String get statistics_title => 'आंकड़े';

  @override
  String get statistics_weekly => 'साप्ताहिक';

  @override
  String get statistics_monthly => 'मासिक';

  @override
  String get statistics_yearly => 'वार्षिक';

  @override
  String get statistics_average => 'औसत';

  @override
  String get statistics_total => 'कुल';

  @override
  String get statistics_best_day => 'सर्वश्रेष्ठ दिन';

  @override
  String get statistics_goal_achievement => 'लक्ष्य उपलब्धि';

  @override
  String get statistics_no_data => 'इस अवधि के लिए कोई डेटा नहीं';

  @override
  String get statistics_chart_label => 'पानी का सेवन';

  @override
  String get statistics_total_intake => 'कुल सेवन';

  @override
  String get statistics_total_consumed => 'कुल उपभोग';

  @override
  String get statistics_daily_average => 'दैनिक औसत';

  @override
  String get statistics_goals_met => 'लक्ष्य पूरे हुए';

  @override
  String statistics_out_of(int count) {
    return '$count में से';
  }

  @override
  String get statistics_progress => 'प्रगति';

  @override
  String get statistics_on_track => 'सही रास्ते पर!';

  @override
  String get statistics_keep_going => 'जारी रखें!';

  @override
  String get statistics_daily_intake => 'दैनिक सेवन';

  @override
  String get statistics_below_goal => 'लक्ष्य से नीचे';

  @override
  String get statistics_goal_met_label => 'लक्ष्य प्राप्त';

  @override
  String get statistics_your_streak => 'आपकी लकीर';

  @override
  String get statistics_current => 'वर्तमान';

  @override
  String get statistics_best => 'सर्वश्रेष्ठ';

  @override
  String get statistics_completed => 'पूर्ण';

  @override
  String get statistics_next_goal => 'अगला लक्ष्य';

  @override
  String get statistics_days => 'दिन';

  @override
  String get achievements_title => 'उपलब्धियां';

  @override
  String get achievements_unlocked => 'अनलॉक';

  @override
  String get achievements_locked => 'लॉक';

  @override
  String get achievements_progress => 'प्रगति';

  @override
  String get achievements_reward_points => 'रिवॉर्ड पॉइंट्स';

  @override
  String achievements_total_points(int points) {
    return 'कुल पॉइंट्स: $points';
  }

  @override
  String get achievement_first_drop => 'पहली बूंद';

  @override
  String get achievement_first_drop_desc => 'अपना पहला पानी का सेवन दर्ज करें';

  @override
  String get achievement_daily_goal_1 => 'लक्ष्य प्राप्तकर्ता';

  @override
  String get achievement_daily_goal_1_desc =>
      'एक बार दैनिक लक्ष्य प्राप्त करें';

  @override
  String get achievement_streak_3 => '3-दिन की स्ट्रीक';

  @override
  String get achievement_streak_3_desc => '3-दिन की स्ट्रीक बनाए रखें';

  @override
  String get achievement_streak_7 => 'सप्ताह योद्धा';

  @override
  String get achievement_streak_7_desc => '7-दिन की स्ट्रीक बनाए रखें';

  @override
  String get achievement_streak_30 => 'माह मास्टर';

  @override
  String get achievement_streak_30_desc => '30-दिन की स्ट्रीक बनाए रखें';

  @override
  String get achievement_total_10l => '10 लीटर';

  @override
  String get achievement_total_10l_desc => 'कुल 10 लीटर पिएं';

  @override
  String get achievement_total_100l => '100 लीटर';

  @override
  String get achievement_total_100l_desc => 'कुल 100 लीटर पिएं';

  @override
  String get achievement_consistency => 'निरंतरता सप्ताह';

  @override
  String get achievement_consistency_desc => 'लगातार 7 दिन लक्ष्य प्राप्त करें';

  @override
  String get achievement_consistency_month => 'Monthly Consistency';

  @override
  String get achievement_consistency_month_desc =>
      'Reach your goal consistently for 30 days';

  @override
  String get achievement_daily_goal_5 => '5 Goals Reached';

  @override
  String get achievement_daily_goal_5_desc => 'Reached your daily goal 5 times';

  @override
  String get achievement_daily_goal_10 => '10 Goals Reached';

  @override
  String get achievement_daily_goal_10_desc =>
      'Reached your daily goal 10 times';

  @override
  String get achievement_daily_goal_30 => '30 Goals Reached';

  @override
  String get achievement_daily_goal_30_desc =>
      'Reached your daily goal 30 times';

  @override
  String get achievement_streak_14 => '14-Day Streak';

  @override
  String get achievement_streak_14_desc => 'Drank water 14 days in a row';

  @override
  String get achievement_streak_60 => '60-Day Streak';

  @override
  String get achievement_streak_60_desc => 'Drank water 60 days in a row';

  @override
  String get achievement_total_1l => 'First Liter';

  @override
  String get achievement_total_1l_desc =>
      'Consumed a total of 1 liter of water';

  @override
  String get achievement_total_5l => '5 Liters';

  @override
  String get achievement_total_5l_desc =>
      'Consumed a total of 5 liters of water';

  @override
  String get achievement_total_50l => '50 Liters';

  @override
  String get achievement_total_50l_desc =>
      'Consumed a total of 50 liters of water';

  @override
  String get reminders_title => 'रिमाइंडर';

  @override
  String get reminders_active => 'सक्रिय रिमाइंडर';

  @override
  String get reminders_pending => 'लंबित नोटिफिकेशन';

  @override
  String get reminders_interval_30 => 'हर 30 मिनट';

  @override
  String get reminders_interval_45 => 'हर 45 मिनट';

  @override
  String get reminders_interval_60 => 'हर घंटे';

  @override
  String get reminders_interval_90 => 'हर 1.5 घंटे';

  @override
  String get reminders_interval_120 => 'हर 2 घंटे';

  @override
  String get reminders_interval_180 => 'हर 3 घंटे';

  @override
  String get reminders_reschedule => 'Reschedule Reminders';

  @override
  String get reminders_reschedule_subtitle =>
      'Update all pending notifications';

  @override
  String get reminders_cancel_all => 'Cancel All Reminders';

  @override
  String get reminders_cancel_all_subtitle =>
      'Remove all pending notifications';

  @override
  String get reminders_schedule_success => 'Reminders scheduled successfully';

  @override
  String get reminders_cancel_success => 'All reminders cancelled';

  @override
  String get reminders_info_message =>
      'Reminders help you stay hydrated throughout the day. Customize your schedule in Settings.';

  @override
  String get reminders_schedule_info => 'Current Schedule';

  @override
  String get notification_reminder_title => 'पानी पीने का समय!';

  @override
  String get notification_reminder_body =>
      'हाइड्रेटेड रहें! अभी कुछ पानी पिएं।';

  @override
  String get notification_title_1 => 'Time to Hydrate!';

  @override
  String get notification_title_2 => 'Water Break!';

  @override
  String get notification_title_3 => 'Stay Hydrated!';

  @override
  String get notification_title_4 => 'Drink Some Water!';

  @override
  String get notification_title_5 => 'Hydration Time!';

  @override
  String get notification_title_6 => 'Water Reminder!';

  @override
  String get notification_title_7 => 'Take Care of Yourself!';

  @override
  String get notification_body_1 =>
      'Time to drink some water! Your body needs hydration.';

  @override
  String get notification_body_2 =>
      'Don\'t forget to stay hydrated throughout the day!';

  @override
  String get notification_body_3 =>
      'A quick water break can boost your energy!';

  @override
  String get notification_body_4 =>
      'Your health matters! Take a moment to drink water.';

  @override
  String get notification_body_5 =>
      'Keep your body happy with some refreshing water!';

  @override
  String get notification_body_6 => 'Stay healthy and hydrated! Drink up!';

  @override
  String get notification_body_7 =>
      'Time for a water break! You\'re doing great!';

  @override
  String get notification_body_8 =>
      'Remember to drink water regularly for better health!';

  @override
  String get streak_current => 'वर्तमान स्ट्रीक';

  @override
  String streak_days(int days) {
    return '$days दिन';
  }

  @override
  String get streak_keep_going => 'स्ट्रीक जारी रखें!';

  @override
  String get streak_personal_best => 'व्यक्तिगत सर्वश्रेष्ठ';

  @override
  String get streak_best => 'सर्वश्रेष्ठ!';

  @override
  String get streak_longest => 'सबसे लंबी';

  @override
  String get streak_next_milestone => 'अगला माइलस्टोन';

  @override
  String get streak_start_today => 'आज अपनी स्ट्रीक शुरू करें!';

  @override
  String get streak_complete_goal =>
      'स्ट्रीक बनाने के लिए दैनिक लक्ष्य पूरा करें';

  @override
  String get streak_start => 'अपनी स्ट्रीक शुरू करें!';

  @override
  String get streak_error => 'स्ट्रीक डेटा लोड करने में विफल';

  @override
  String get streak_day_singular => 'दिन';

  @override
  String get streak_day_plural => 'दिन';

  @override
  String get onboarding_title_1 => 'अपना पानी ट्रैक करें';

  @override
  String get onboarding_desc_1 =>
      'एक टैप से आसानी से अपने दैनिक पानी के सेवन को दर्ज करें';

  @override
  String get onboarding_title_2 => 'स्मार्ट रिमाइंडर';

  @override
  String get onboarding_desc_2 =>
      'दिन भर हाइड्रेटेड रहने के लिए समय पर रिमाइंडर पाएं';

  @override
  String get onboarding_title_3 => 'प्रगति देखें';

  @override
  String get onboarding_desc_3 =>
      'अपने हाइड्रेशन आंकड़े देखें और लक्ष्य प्राप्त करें';

  @override
  String get onboarding_title_4 => 'स्वस्थ रहें';

  @override
  String get onboarding_desc_4 =>
      'स्वस्थ आदतें बनाएं और समग्र स्वास्थ्य में सुधार करें';

  @override
  String get onboarding_get_started => 'शुरू करें';

  @override
  String get drawer_home => 'होम';

  @override
  String get drawer_statistics => 'आंकड़े';

  @override
  String get drawer_achievements => 'उपलब्धियां';

  @override
  String get drawer_profile => 'प्रोफाइल';

  @override
  String get drawer_reminders => 'रिमाइंडर';

  @override
  String get drawer_settings => 'सेटिंग्स';

  @override
  String get drawer_help => 'सहायता';

  @override
  String get drawer_about => 'ऐप के बारे में';

  @override
  String get drawer_logout => 'लॉग आउट';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => 'संस्करण 1.0.0';

  @override
  String get about_description =>
      'Aqualert के साथ हाइड्रेटेड और स्वस्थ रहें। अपने दैनिक पानी के सेवन को ट्रैक करें और लक्ष्य प्राप्त करें!';

  @override
  String get about_copyright => '© 2024 Aqualert. सर्वाधिकार सुरक्षित।';

  @override
  String get about_close => 'बंद करें';

  @override
  String get help_title => 'सहायता';

  @override
  String get help_subtitle => 'मदद प्राप्त करें';

  @override
  String get help_faq => 'अक्सर पूछे जाने वाले प्रश्न';

  @override
  String get help_contact => 'संपर्क करें';

  @override
  String get help_version => 'संस्करण';

  @override
  String get help_app_info => 'ऐप जानकारी';

  @override
  String get help_coming_soon => 'सहायता - जल्द आ रहा है!';

  @override
  String get help_faq_section => 'FAQ';

  @override
  String get help_features_section => 'फीचर गाइड';

  @override
  String get help_about_section => 'बारे में';

  @override
  String get faq_1_q => 'मेरा दैनिक पानी का लक्ष्य कैसे गणना किया जाता है?';

  @override
  String get faq_1_a =>
      'आपका दैनिक पानी का लक्ष्य वजन, ऊंचाई, उम्र, लिंग और गतिविधि स्तर के आधार पर वैज्ञानिक सूत्रों का उपयोग करके गणना किया जाता है। आप प्रोफाइल सेटिंग्स में कस्टम लक्ष्य भी सेट कर सकते हैं।';

  @override
  String get faq_2_q => 'रिमाइंडर कैसे काम करते हैं?';

  @override
  String get faq_2_a =>
      'आप रिमाइंडर अंतराल (30-180 मिनट) और शुरुआत/समाप्ति समय सेट कर सकते हैं। ऐप इस अवधि के दौरान नोटिफिकेशन भेजेगा।';

  @override
  String get faq_3_q => 'स्ट्रीक क्या हैं और कैसे काम करती हैं?';

  @override
  String get faq_3_a =>
      'स्ट्रीक लगातार दिनों को ट्रैक करती हैं जब आपने दैनिक लक्ष्य प्राप्त किया। स्ट्रीक बनाए रखने के लिए रोज़ पानी पिएं!';

  @override
  String get faq_4_q => 'मैं माप इकाइयां कैसे बदल सकता हूं?';

  @override
  String get faq_4_a =>
      'सेटिंग्स → इकाइयां पर जाएं और मिलीलीटर (ml) और फ्लुइड आउंस (fl oz) के बीच स्विच करें। सभी माप स्वचालित रूप से अपडेट होंगे।';

  @override
  String get faq_5_q => 'क्या मैं अपना डेटा निर्यात कर सकता हूं?';

  @override
  String get faq_5_a =>
      'हाँ! सेटिंग्स → डेटा प्रबंधन → डेटा निर्यात करें पर जाएं। आप अपना डेटा JSON फाइल के रूप में शेयर या सेव कर सकते हैं।';

  @override
  String get faq_6_q => 'उपलब्धियां कैसे काम करती हैं?';

  @override
  String get faq_6_a =>
      'पानी ट्रैकिंग माइलस्टोन पूरे करें उपलब्धियां अनलॉक करने और रिवॉर्ड पॉइंट्स कमाने के लिए। उपलब्धियां स्क्रीन पर प्रगति देखें।';

  @override
  String get feature_tracking_title => 'पानी ट्रैकिंग';

  @override
  String get feature_tracking_desc =>
      'क्विक-एड बटन (250ml, 350ml, 500ml, 750ml) या कस्टम मात्रा से आसानी से दैनिक पानी सेवन दर्ज करें।';

  @override
  String get feature_reminders_title => 'स्मार्ट रिमाइंडर';

  @override
  String get feature_reminders_desc =>
      'कस्टमाइज़ेबल रिमाइंडर अंतराल और सक्रिय घंटे सेट करें। दिन भर पानी पीना न भूलें।';

  @override
  String get feature_statistics_title => 'आंकड़े और इनसाइट्स';

  @override
  String get feature_statistics_desc =>
      'साप्ताहिक, मासिक और वार्षिक चार्ट के साथ पानी सेवन के रुझान देखें। समय के साथ प्रगति ट्रैक करें।';

  @override
  String get feature_achievements_title => 'उपलब्धियां और स्ट्रीक';

  @override
  String get feature_achievements_desc =>
      'पानी के लक्ष्य प्राप्त करके उपलब्धियां कमाएं और दैनिक स्ट्रीक बनाए रखें। गेमिफिकेशन से प्रेरित रहें!';

  @override
  String get feature_profile_title => 'प्रोफाइल और लक्ष्य';

  @override
  String get feature_profile_desc =>
      'अपनी व्यक्तिगत जानकारी सेट करें और ऐप को अपने शारीरिक माप के आधार पर इष्टतम दैनिक पानी लक्ष्य की गणना करने दें।';

  @override
  String get help_contact_email => 'ईमेल से संपर्क करें';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => 'ऐप रेट करें';

  @override
  String get help_rate_desc => 'Aqualert पसंद है? हमें रिव्यू दें!';

  @override
  String get help_build_number => 'बिल्ड';

  @override
  String get help_copyright => '© 2024 Aqualert. सर्वाधिकार सुरक्षित।';

  @override
  String get help_made_with => 'आपके स्वास्थ्य के लिए ❤️ से बनाया गया';

  @override
  String get error_generic => 'कुछ गलत हो गया। कृपया पुनः प्रयास करें।';

  @override
  String get error_network => 'नेटवर्क त्रुटि। कृपया अपना कनेक्शन जांचें।';

  @override
  String get error_auth_failed => 'प्रमाणीकरण विफल। कृपया पुनः प्रयास करें।';

  @override
  String get error_permission_denied => 'अनुमति अस्वीकृत।';

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
  String get time_morning => 'सुबह';

  @override
  String get time_afternoon => 'दोपहर';

  @override
  String get time_evening => 'शाम';

  @override
  String get time_night => 'रात';

  @override
  String get help_privacy_policy => 'गोपनीयता नीति';

  @override
  String get help_privacy_policy_desc => 'गोपनीयता नीति देखें';

  @override
  String get help_privacy_policy_error => 'गोपनीयता नीति खोलने में असमर्थ';

  @override
  String get settings_delete_account => 'खाता हटाएं';

  @override
  String get settings_delete_account_subtitle =>
      'अपना खाता और सारा डेटा स्थायी रूप से हटाएं';

  @override
  String get settings_delete_account_dialog_title => 'खाता हटाएं?';

  @override
  String get settings_delete_account_dialog_message =>
      'यह क्रिया पूर्ववत नहीं की जा सकती। पानी सेवन इतिहास, स्ट्रीक और सेटिंग्स सहित आपका सारा डेटा स्थायी रूप से हटा दिया जाएगा।';

  @override
  String get settings_delete_account_confirm => 'मेरा खाता हटाएं';

  @override
  String get settings_delete_account_cancel => 'रद्द करें';

  @override
  String get settings_delete_account_success => 'खाता सफलतापूर्वक हटाया गया';

  @override
  String get settings_delete_account_error => 'खाता हटाने में विफल';

  @override
  String get settings_delete_account_reauth_required =>
      'अपना खाता हटाने के लिए कृपया फिर से साइन इन करें';

  @override
  String get settings_premium_section => 'Premium';

  @override
  String get settings_premium_upgrade => 'Upgrade to Premium';

  @override
  String get settings_premium_upgrade_subtitle => 'Unlock all features';

  @override
  String get settings_premium_active => 'Premium Active ✓';

  @override
  String get settings_premium_restore => 'Restore Purchase';

  @override
  String get settings_premium_restore_subtitle =>
      'Already purchased? Tap to restore';
}
