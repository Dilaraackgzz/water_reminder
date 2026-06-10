// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => 'حافظ على ترطيبك لحياة صحية';

  @override
  String get common_cancel => 'إلغاء';

  @override
  String get common_save => 'حفظ';

  @override
  String get common_delete => 'حذف';

  @override
  String get common_edit => 'تعديل';

  @override
  String get common_add => 'إضافة';

  @override
  String get common_ok => 'موافق';

  @override
  String get common_yes => 'نعم';

  @override
  String get common_no => 'لا';

  @override
  String get common_or => 'أو';

  @override
  String get common_done => 'تم';

  @override
  String get common_skip => 'تخطي';

  @override
  String get common_next => 'التالي';

  @override
  String get common_back => 'رجوع';

  @override
  String get common_continue => 'متابعة';

  @override
  String get common_loading => 'جارٍ التحميل...';

  @override
  String get common_error => 'خطأ';

  @override
  String get common_success => 'نجاح';

  @override
  String get auth_login_title => 'تسجيل الدخول';

  @override
  String get auth_register_title => 'إنشاء حساب';

  @override
  String get auth_email_label => 'البريد الإلكتروني';

  @override
  String get auth_email_hint => 'example@email.com';

  @override
  String get auth_password_label => 'كلمة المرور';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => 'الاسم الكامل';

  @override
  String get auth_name_hint => 'أحمد محمد';

  @override
  String get auth_forgot_password => 'نسيت كلمة المرور؟';

  @override
  String get auth_dont_have_account => 'ليس لديك حساب؟ ';

  @override
  String get auth_already_have_account => 'لديك حساب بالفعل؟ ';

  @override
  String get auth_sign_in_button => 'تسجيل الدخول';

  @override
  String get auth_sign_up_button => 'إنشاء حساب';

  @override
  String get auth_sign_in_google => 'تسجيل الدخول بـ Google';

  @override
  String get auth_sign_up_google => 'التسجيل بـ Google';

  @override
  String get auth_logout => 'تسجيل الخروج';

  @override
  String get auth_validation_email_required => 'البريد الإلكتروني مطلوب';

  @override
  String get auth_validation_email_invalid => 'أدخل بريداً إلكترونياً صحيحاً';

  @override
  String get auth_validation_password_required => 'كلمة المرور مطلوبة';

  @override
  String get auth_validation_password_min_length =>
      'يجب أن تكون كلمة المرور 6 أحرف على الأقل';

  @override
  String get auth_validation_password_mismatch => 'Passwords don\'t match';

  @override
  String get auth_validation_name_required => 'الاسم مطلوب';

  @override
  String get auth_validation_name_min_length =>
      'يجب أن يكون الاسم حرفين على الأقل';

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
  String get auth_email_verification_title => 'تأكيد البريد الإلكتروني';

  @override
  String get auth_email_verification_sent => 'أرسلنا رابط التأكيد إلى:';

  @override
  String get auth_email_verification_instruction =>
      'يرجى التحقق من بريدك الإلكتروني والنقر على رابط التأكيد.';

  @override
  String get auth_email_verification_not_received => 'لم تستلم البريد؟';

  @override
  String get auth_email_verification_resend => 'إعادة إرسال رابط التأكيد';

  @override
  String get auth_email_verification_check => 'لقد أكدت بريدي الإلكتروني';

  @override
  String get auth_email_verification_success => 'تم تأكيد البريد الإلكتروني!';

  @override
  String get auth_email_verification_failed =>
      'لم يتم تأكيد البريد بعد. تحقق من صندوق الوارد.';

  @override
  String get auth_forgot_password_title => 'إعادة تعيين كلمة المرور';

  @override
  String get auth_forgot_password_instruction =>
      'أدخل بريدك الإلكتروني وسنرسل لك رابط إعادة التعيين.';

  @override
  String get auth_forgot_password_button => 'إرسال رابط إعادة التعيين';

  @override
  String get auth_forgot_password_success =>
      'تم إرسال بريد إعادة تعيين كلمة المرور!';

  @override
  String get auth_back_to_login => 'العودة لتسجيل الدخول';

  @override
  String get home_title => 'الرئيسية';

  @override
  String get home_daily_goal => 'الهدف اليومي';

  @override
  String get home_today => 'اليوم';

  @override
  String get home_todays_progress => 'Today\'s Progress';

  @override
  String get home_quick_add => 'Quick Add';

  @override
  String home_amount_to_go(String amount) {
    return '$amount to go!';
  }

  @override
  String get home_custom_amount => 'كمية مخصصة';

  @override
  String get home_amount_label => 'الكمية';

  @override
  String get home_add_water_success => 'تمت إضافة الماء!';

  @override
  String get home_add_water_failed => 'فشل في إضافة الماء';

  @override
  String get home_delete_water_confirm => 'حذف هذا السجل؟';

  @override
  String get home_delete_water_success => 'تم حذف السجل';

  @override
  String get home_no_records_today => 'لا توجد سجلات اليوم';

  @override
  String get home_start_drinking => 'ابدأ بشرب الماء!';

  @override
  String get progress_current => 'الحالي';

  @override
  String get progress_goal => 'الهدف';

  @override
  String get progress_remaining => 'المتبقي';

  @override
  String get progress_completed => 'تم تحقيق الهدف!';

  @override
  String progress_percentage(int percent) {
    return '$percent% من الهدف اليومي';
  }

  @override
  String get motivational_keep_going => 'استمر! أنت تقوم بعمل رائع!';

  @override
  String get motivational_almost_there => 'اقتربت! المزيد قليلاً!';

  @override
  String get motivational_goal_reached => 'تهانينا! لقد حققت هدفك!';

  @override
  String get motivational_good_start => 'بداية رائعة! استمر!';

  @override
  String get motivational_stay_hydrated => 'حافظ على ترطيبك طوال اليوم!';

  @override
  String get motivational_100_1 => 'تهانينا! لقد حققت هدفك!';

  @override
  String get motivational_100_2 => 'عمل مذهل! ابق مرطباً غداً أيضاً!';

  @override
  String get motivational_100_3 => 'أنت بطل الترطيب!';

  @override
  String get motivational_100_4 => 'ممتاز! حافظ على العادات الجيدة!';

  @override
  String get motivational_100_short => 'تم الهدف!';

  @override
  String get motivational_75_1 => 'اقتربت! المزيد قليلاً!';

  @override
  String get motivational_75_2 => 'أنت تقوم بعمل رائع! استمر!';

  @override
  String get motivational_75_3 => 'قريب جداً من هدفك!';

  @override
  String get motivational_75_4 => 'تقدم رائع! لا تتوقف!';

  @override
  String get motivational_75_short => 'اقتربت!';

  @override
  String get motivational_50_1 => 'منتصف الطريق! رائع!';

  @override
  String get motivational_50_2 => 'عمل جيد! استمر!';

  @override
  String get motivational_50_3 => 'أنت على الطريق الصحيح!';

  @override
  String get motivational_50_4 => 'تقدم جيد! كن مستمراً!';

  @override
  String get motivational_50_short => 'النصف!';

  @override
  String get motivational_25_1 => 'بداية جيدة! استمر بشرب الماء!';

  @override
  String get motivational_25_2 => 'انطلاقة رائعة!';

  @override
  String get motivational_25_3 => 'بداية جيدة! ابق مرطباً!';

  @override
  String get motivational_25_4 => 'استمر! كل رشفة مهمة!';

  @override
  String get motivational_25_short => 'بداية جيدة!';

  @override
  String get motivational_0_1 => 'وقت الترطيب! جسمك سيشكرك!';

  @override
  String get motivational_0_2 => 'ابدأ رحلة الترطيب!';

  @override
  String get motivational_0_3 => 'ابدأ يومك بالماء!';

  @override
  String get motivational_0_4 => 'صحتك مهمة! ابدأ بالشرب!';

  @override
  String get motivational_0_short => 'لنبدأ!';

  @override
  String get profile_title => 'الملف الشخصي';

  @override
  String get profile_edit => 'تعديل';

  @override
  String get profile_personal_info => 'المعلومات الشخصية';

  @override
  String get profile_body_metrics => 'قياسات الجسم';

  @override
  String get profile_activity_level => 'مستوى النشاط';

  @override
  String get profile_name => 'الاسم';

  @override
  String get profile_email => 'البريد الإلكتروني';

  @override
  String get profile_age => 'العمر';

  @override
  String get profile_gender => 'الجنس';

  @override
  String get profile_weight => 'الوزن';

  @override
  String get profile_height => 'الطول';

  @override
  String get profile_bmi => 'مؤشر كتلة الجسم';

  @override
  String get profile_bmi_category => 'فئة مؤشر كتلة الجسم';

  @override
  String get profile_daily_goal => 'هدف الماء اليومي';

  @override
  String get profile_use_calculated_goal => 'استخدام الهدف المحسوب';

  @override
  String get profile_custom_goal => 'هدف مخصص';

  @override
  String get profile_save_success => 'تم تحديث الملف الشخصي';

  @override
  String get profile_save_failed => 'فشل في تحديث الملف الشخصي';

  @override
  String get profile_user_default => 'مستخدم';

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
  String get gender_male => 'ذكر';

  @override
  String get gender_female => 'أنثى';

  @override
  String get gender_other => 'آخر';

  @override
  String get activity_sedentary => 'خامل';

  @override
  String get activity_sedentary_desc => 'قليل أو بدون تمارين';

  @override
  String get activity_light => 'نشاط خفيف';

  @override
  String get activity_light_desc => 'تمارين خفيفة 1-3 أيام/أسبوع';

  @override
  String get activity_moderate => 'نشاط معتدل';

  @override
  String get activity_moderate_desc => 'تمارين معتدلة 3-5 أيام/أسبوع';

  @override
  String get activity_very_active => 'نشط جداً';

  @override
  String get activity_very_active_desc => 'تمارين مكثفة 6-7 أيام/أسبوع';

  @override
  String get activity_extra_active => 'نشاط مكثف';

  @override
  String get activity_extra_active_desc => 'تمارين مكثفة جداً وعمل بدني';

  @override
  String get bmi_underweight => 'نقص الوزن';

  @override
  String get bmi_normal => 'وزن طبيعي';

  @override
  String get bmi_overweight => 'زيادة الوزن';

  @override
  String get bmi_obese => 'سمنة';

  @override
  String get settings_title => 'الإعدادات';

  @override
  String get settings_notifications => 'الإشعارات';

  @override
  String get settings_reminders => 'التذكيرات';

  @override
  String get settings_theme => 'المظهر';

  @override
  String get settings_units => 'الوحدات';

  @override
  String get settings_language => 'اللغة';

  @override
  String get settings_profile => 'إعدادات الملف الشخصي';

  @override
  String get settings_daily_goal => 'إعدادات الهدف';

  @override
  String get settings_data => 'إدارة البيانات';

  @override
  String get settings_export_data => 'تصدير البيانات';

  @override
  String get settings_import_data => 'استيراد البيانات';

  @override
  String get settings_help => 'المساعدة';

  @override
  String get settings_about => 'حول التطبيق';

  @override
  String get settings_enable_notifications => 'تفعيل الإشعارات';

  @override
  String get settings_reminder_interval => 'فترة التذكير';

  @override
  String get settings_reminder_start_time => 'وقت البداية';

  @override
  String get settings_reminder_end_time => 'وقت النهاية';

  @override
  String get settings_test_notification => 'اختبار الإشعار';

  @override
  String get settings_theme_light => 'فاتح';

  @override
  String get settings_theme_dark => 'داكن';

  @override
  String get settings_theme_system => 'النظام';

  @override
  String get settings_unit_ml => 'ملليلتر (ml)';

  @override
  String get settings_unit_floz => 'أونصة سائلة (fl oz)';

  @override
  String get settings_unit_metric => 'النظام المتري';

  @override
  String get settings_unit_imperial => 'النظام الإمبراطوري';

  @override
  String get settings_subtitle => 'تخصيص تجربتك';

  @override
  String get settings_reminders_active => 'التذكيرات نشطة';

  @override
  String get settings_reminders_inactive => 'فعّل للحصول على تذكيرات';

  @override
  String get settings_minutes => 'دقائق';

  @override
  String get settings_export_subtitle => 'نسخ احتياطي للبيانات';

  @override
  String get settings_import_subtitle => 'استعادة من ملف النسخ الاحتياطي';

  @override
  String get settings_profile_subtitle => 'تحديث معلوماتك';

  @override
  String get settings_daily_goal_subtitle => 'إدارة هدف الترطيب';

  @override
  String get settings_theme_dialog_title => 'المظهر';

  @override
  String get settings_theme_light_mode => 'الوضع الفاتح';

  @override
  String get settings_theme_dark_mode => 'الوضع الداكن';

  @override
  String get settings_theme_system_mode => 'وضع النظام';

  @override
  String get settings_theme_light_subtitle => 'استخدام المظهر الفاتح';

  @override
  String get settings_theme_dark_subtitle => 'استخدام المظهر الداكن';

  @override
  String get settings_theme_system_subtitle => 'اتباع إعدادات النظام';

  @override
  String get settings_language_dialog_title => 'اللغة';

  @override
  String get settings_system_language => 'System Language';

  @override
  String get settings_use_device_language => 'Use device language';

  @override
  String get settings_export_loading => 'جارٍ التصدير...';

  @override
  String get settings_export_success_message => 'تم تصدير البيانات بنجاح!';

  @override
  String settings_export_failed_message(String error) {
    return 'فشل التصدير: $error';
  }

  @override
  String get settings_import_loading => 'جارٍ الاستيراد...';

  @override
  String get settings_import_complete => 'اكتمل الاستيراد';

  @override
  String get settings_import_success_subtitle => 'تم الاستيراد بنجاح:';

  @override
  String get settings_import_water_records => 'سجلات مياه';

  @override
  String get settings_import_daily_goals => 'أهداف يومية';

  @override
  String get settings_import_duplicate_skipped => 'سجلات مكررة تم تخطيها';

  @override
  String settings_import_failed_message(String error) {
    return 'فشل الاستيراد: $error';
  }

  @override
  String get settings_reminder_interval_title => 'فترة التذكير';

  @override
  String get settings_language_coming_soon => 'قريباً';

  @override
  String get settings_export_success => 'تم تصدير البيانات';

  @override
  String get settings_export_failed => 'فشل التصدير';

  @override
  String get settings_import_success => 'تم استيراد البيانات';

  @override
  String get settings_import_failed => 'فشل الاستيراد';

  @override
  String settings_import_stats(int imported, int skipped) {
    return 'تم استيراد $imported سجلات، تم تخطي $skipped مكررات';
  }

  @override
  String get statistics_title => 'الإحصائيات';

  @override
  String get statistics_weekly => 'أسبوعي';

  @override
  String get statistics_monthly => 'شهري';

  @override
  String get statistics_yearly => 'سنوي';

  @override
  String get statistics_average => 'المتوسط';

  @override
  String get statistics_total => 'المجموع';

  @override
  String get statistics_best_day => 'أفضل يوم';

  @override
  String get statistics_goal_achievement => 'تحقيق الهدف';

  @override
  String get statistics_no_data => 'لا توجد بيانات لهذه الفترة';

  @override
  String get statistics_chart_label => 'استهلاك الماء';

  @override
  String get statistics_total_intake => 'إجمالي الاستهلاك';

  @override
  String get statistics_total_consumed => 'المجموع المستهلك';

  @override
  String get statistics_daily_average => 'المعدل اليومي';

  @override
  String get statistics_goals_met => 'الأهداف المحققة';

  @override
  String statistics_out_of(int count) {
    return 'من $count';
  }

  @override
  String get statistics_progress => 'التقدم';

  @override
  String get statistics_on_track => 'على المسار الصحيح!';

  @override
  String get statistics_keep_going => 'استمر!';

  @override
  String get statistics_daily_intake => 'الاستهلاك اليومي';

  @override
  String get statistics_below_goal => 'تحت الهدف';

  @override
  String get statistics_goal_met_label => 'تم تحقيق الهدف';

  @override
  String get statistics_your_streak => 'سلسلتك';

  @override
  String get statistics_current => 'الحالي';

  @override
  String get statistics_best => 'الأفضل';

  @override
  String get statistics_completed => 'مكتمل';

  @override
  String get statistics_next_goal => 'الهدف التالي';

  @override
  String get statistics_days => 'أيام';

  @override
  String get achievements_title => 'الإنجازات';

  @override
  String get achievements_unlocked => 'مفتوح';

  @override
  String get achievements_locked => 'مقفل';

  @override
  String get achievements_progress => 'التقدم';

  @override
  String get achievements_reward_points => 'نقاط المكافأة';

  @override
  String achievements_total_points(int points) {
    return 'مجموع النقاط: $points';
  }

  @override
  String get achievement_first_drop => 'القطرة الأولى';

  @override
  String get achievement_first_drop_desc => 'سجل أول استهلاك للماء';

  @override
  String get achievement_daily_goal_1 => 'محقق الأهداف';

  @override
  String get achievement_daily_goal_1_desc => 'حقق هدفك اليومي مرة';

  @override
  String get achievement_streak_3 => 'سلسلة 3 أيام';

  @override
  String get achievement_streak_3_desc => 'حافظ على سلسلة 3 أيام';

  @override
  String get achievement_streak_7 => 'محارب الأسبوع';

  @override
  String get achievement_streak_7_desc => 'حافظ على سلسلة 7 أيام';

  @override
  String get achievement_streak_30 => 'سيد الشهر';

  @override
  String get achievement_streak_30_desc => 'حافظ على سلسلة 30 يوم';

  @override
  String get achievement_total_10l => '10 لترات';

  @override
  String get achievement_total_10l_desc => 'اشرب 10 لترات إجمالاً';

  @override
  String get achievement_total_100l => '100 لتر';

  @override
  String get achievement_total_100l_desc => 'اشرب 100 لتر إجمالاً';

  @override
  String get achievement_consistency => 'أسبوع الاستمرارية';

  @override
  String get achievement_consistency_desc => 'حقق هدفك 7 أيام متتالية';

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
  String get reminders_title => 'التذكيرات';

  @override
  String get reminders_active => 'التذكيرات النشطة';

  @override
  String get reminders_pending => 'الإشعارات المعلقة';

  @override
  String get reminders_interval_30 => 'كل 30 دقيقة';

  @override
  String get reminders_interval_45 => 'كل 45 دقيقة';

  @override
  String get reminders_interval_60 => 'كل ساعة';

  @override
  String get reminders_interval_90 => 'كل 1.5 ساعة';

  @override
  String get reminders_interval_120 => 'كل ساعتين';

  @override
  String get reminders_interval_180 => 'كل 3 ساعات';

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
  String get reminders_premium_custom_title => 'مميز: تذكيرات مخصصة';

  @override
  String get reminders_custom_description =>
      'أضف تذكيرات غير محدودة في أوقاتك الخاصة';

  @override
  String get reminders_custom_add_button => 'إضافة وقت مخصص';

  @override
  String reminders_custom_added(String time) {
    return 'تمت إضافة التذكير المخصص: $time';
  }

  @override
  String get notification_reminder_title => 'وقت شرب الماء!';

  @override
  String get notification_reminder_body => 'ابق مرطباً! اشرب بعض الماء الآن.';

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
  String get streak_current => 'السلسلة الحالية';

  @override
  String streak_days(int days) {
    return '$days أيام';
  }

  @override
  String get streak_keep_going => 'استمر في السلسلة!';

  @override
  String get streak_personal_best => 'أفضل شخصي';

  @override
  String get streak_best => 'الأفضل!';

  @override
  String get streak_longest => 'الأطول';

  @override
  String get streak_next_milestone => 'المعلم التالي';

  @override
  String get streak_start_today => 'ابدأ سلسلتك اليوم!';

  @override
  String get streak_complete_goal => 'أكمل هدفك اليومي لبناء سلسلة';

  @override
  String get streak_start => 'ابدأ سلسلتك!';

  @override
  String get streak_error => 'فشل في تحميل بيانات السلسلة';

  @override
  String get streak_day_singular => 'يوم';

  @override
  String get streak_day_plural => 'أيام';

  @override
  String get onboarding_title_1 => 'تتبع الماء';

  @override
  String get onboarding_desc_1 =>
      'سجل استهلاكك اليومي من الماء بسهولة بنقرة واحدة';

  @override
  String get onboarding_title_2 => 'تذكيرات ذكية';

  @override
  String get onboarding_desc_2 =>
      'احصل على تذكيرات في الوقت المناسب للبقاء مرطباً طوال اليوم';

  @override
  String get onboarding_title_3 => 'تتبع التقدم';

  @override
  String get onboarding_desc_3 => 'شاهد إحصائيات الترطيب وحقق أهدافك';

  @override
  String get onboarding_title_4 => 'ابق صحياً';

  @override
  String get onboarding_desc_4 => 'ابن عادات صحية وحسّن صحتك العامة';

  @override
  String get onboarding_get_started => 'ابدأ';

  @override
  String get drawer_home => 'الرئيسية';

  @override
  String get drawer_statistics => 'الإحصائيات';

  @override
  String get drawer_achievements => 'الإنجازات';

  @override
  String get drawer_profile => 'الملف الشخصي';

  @override
  String get drawer_reminders => 'التذكيرات';

  @override
  String get drawer_settings => 'الإعدادات';

  @override
  String get drawer_help => 'المساعدة';

  @override
  String get drawer_about => 'حول';

  @override
  String get drawer_logout => 'تسجيل الخروج';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => 'الإصدار 1.0.0';

  @override
  String get about_description =>
      'ابق مرطباً وصحياً مع Aqualert. تتبع استهلاكك اليومي من الماء وحقق أهداف الترطيب!';

  @override
  String get about_copyright => '© 2024 Aqualert. جميع الحقوق محفوظة.';

  @override
  String get about_close => 'إغلاق';

  @override
  String get help_title => 'المساعدة';

  @override
  String get help_subtitle => 'احصل على المساعدة';

  @override
  String get help_faq => 'الأسئلة الشائعة';

  @override
  String get help_contact => 'اتصل بنا';

  @override
  String get help_version => 'الإصدار';

  @override
  String get help_app_info => 'معلومات التطبيق';

  @override
  String get help_coming_soon => 'المساعدة - قريباً!';

  @override
  String get help_faq_section => 'الأسئلة الشائعة';

  @override
  String get help_features_section => 'دليل الميزات';

  @override
  String get help_about_section => 'حول';

  @override
  String get faq_1_q => 'كيف يتم حساب هدف الماء اليومي؟';

  @override
  String get faq_1_a =>
      'يتم حساب هدف الماء اليومي بناءً على وزنك وطولك وعمرك وجنسك ومستوى نشاطك باستخدام صيغ علمية. يمكنك أيضاً تعيين هدف مخصص في إعدادات الملف الشخصي.';

  @override
  String get faq_2_q => 'كيف تعمل التذكيرات؟';

  @override
  String get faq_2_a =>
      'يمكنك تعيين فترات التذكير (30-180 دقيقة) واختيار أوقات البداية/النهاية. سيرسل التطبيق إشعارات خلال هذه الفترة لمساعدتك على البقاء مرطباً.';

  @override
  String get faq_3_q => 'ما هي السلاسل وكيف تعمل؟';

  @override
  String get faq_3_a =>
      'تتتبع السلاسل الأيام المتتالية التي حققت فيها هدفك اليومي من الماء. استمر بشرب الماء يومياً للحفاظ على سلسلتك وزيادتها!';

  @override
  String get faq_4_q => 'كيف يمكنني تغيير وحدات القياس؟';

  @override
  String get faq_4_a =>
      'اذهب إلى الإعدادات ← الوحدات وبدّل بين الملليلتر (ml) والأونصة السائلة (fl oz). ستتحدث جميع القياسات تلقائياً.';

  @override
  String get faq_5_q => 'هل يمكنني تصدير بيانات تتبع الماء؟';

  @override
  String get faq_5_a =>
      'نعم! اذهب إلى الإعدادات ← إدارة البيانات ← تصدير البيانات. يمكنك مشاركة أو حفظ بياناتك كملف JSON واستيرادها لاحقاً.';

  @override
  String get faq_6_q => 'كيف تعمل الإنجازات؟';

  @override
  String get faq_6_a =>
      'أكمل معالم تتبع الماء لفتح الإنجازات وكسب نقاط المكافأة. تتبع تقدمك في شاشة الإنجازات.';

  @override
  String get feature_tracking_title => 'تتبع الماء';

  @override
  String get feature_tracking_desc =>
      'سجل استهلاكك اليومي من الماء بسهولة باستخدام أزرار الإضافة السريعة (250ml، 350ml، 500ml، 750ml) أو أدخل كمية مخصصة.';

  @override
  String get feature_reminders_title => 'تذكيرات ذكية';

  @override
  String get feature_reminders_desc =>
      'عيّن فترات تذكير قابلة للتخصيص واختر الساعات النشطة. لا تنس أبداً شرب الماء طوال اليوم.';

  @override
  String get feature_statistics_title => 'إحصائيات ورؤى';

  @override
  String get feature_statistics_desc =>
      'شاهد اتجاهات استهلاك الماء مع رسوم بيانية أسبوعية وشهرية وسنوية. تتبع تقدمك بمرور الوقت.';

  @override
  String get feature_achievements_title => 'إنجازات وسلاسل';

  @override
  String get feature_achievements_desc =>
      'اكسب إنجازات وحافظ على سلاسل يومية من خلال تحقيق أهداف الماء. ابق متحمساً مع اللعبة!';

  @override
  String get feature_profile_title => 'الملف الشخصي والأهداف';

  @override
  String get feature_profile_desc =>
      'عيّن معلوماتك الشخصية ودع التطبيق يحسب هدف الماء اليومي الأمثل بناءً على قياسات جسمك.';

  @override
  String get help_contact_email => 'تواصل عبر البريد الإلكتروني';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => 'قيّم تطبيقنا';

  @override
  String get help_rate_desc => 'هل تستمتع بـ Aqualert؟ اترك لنا تقييماً!';

  @override
  String get help_build_number => 'رقم البناء';

  @override
  String get help_copyright => '© 2024 Aqualert. جميع الحقوق محفوظة.';

  @override
  String get help_made_with => 'صنع بـ ❤️ لصحتك';

  @override
  String get error_generic => 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';

  @override
  String get error_network => 'خطأ في الشبكة. يرجى التحقق من اتصالك.';

  @override
  String get error_auth_failed => 'فشل المصادقة. يرجى المحاولة مرة أخرى.';

  @override
  String get error_permission_denied => 'تم رفض الإذن.';

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
  String get time_morning => 'الصباح';

  @override
  String get time_afternoon => 'بعد الظهر';

  @override
  String get time_evening => 'المساء';

  @override
  String get time_night => 'الليل';

  @override
  String get help_privacy_policy => 'سياسة الخصوصية';

  @override
  String get help_privacy_policy_desc => 'عرض سياسة الخصوصية';

  @override
  String get help_privacy_policy_error => 'تعذر فتح سياسة الخصوصية';

  @override
  String get settings_delete_account => 'حذف الحساب';

  @override
  String get settings_delete_account_subtitle =>
      'حذف حسابك وجميع البيانات نهائياً';

  @override
  String get settings_delete_account_dialog_title => 'حذف الحساب؟';

  @override
  String get settings_delete_account_dialog_message =>
      'لا يمكن التراجع عن هذا الإجراء. سيتم حذف جميع بياناتك بما في ذلك سجل استهلاك الماء والسلاسل والإعدادات نهائياً.';

  @override
  String get settings_delete_account_confirm => 'حذف حسابي';

  @override
  String get settings_delete_account_cancel => 'إلغاء';

  @override
  String get settings_delete_account_success => 'تم حذف الحساب بنجاح';

  @override
  String get settings_delete_account_error => 'فشل في حذف الحساب';

  @override
  String get settings_delete_account_reauth_required =>
      'يرجى تسجيل الدخول مرة أخرى لحذف حسابك';

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

  @override
  String get privacy_last_updated => 'آخر تحديث: 2 ديسمبر 2025';

  @override
  String get privacy_intro_title => 'مقدمة';

  @override
  String get privacy_intro_content =>
      'مرحباً بك في Aqualert. نحترم خصوصيتك ونلتزم بحماية بياناتك الشخصية. توضح سياسة الخصوصية هذه كيفية جمع معلوماتك واستخدامها وحمايتها عند استخدام تطبيقنا المحمول.';

  @override
  String get privacy_collect_title => 'المعلومات التي نجمعها';

  @override
  String get privacy_collect_content =>
      '• عنوان البريد الإلكتروني — لإنشاء الحساب والمصادقة\n• الاسم المعروض — اختياري، للتخصيص\n• معلومات الملف الشخصي — العمر، الوزن، الطول، الجنس، مستوى النشاط\n• سجلات تناول الماء — الكمية والطابع الزمني للاستهلاك\n• إحصائيات استخدام التطبيق — عبر Firebase Analytics\n• معلومات الجهاز — نوع الجهاز، إصدار نظام التشغيل، المعرّفات الفريدة';

  @override
  String get privacy_use_title => 'كيف نستخدم معلوماتك';

  @override
  String get privacy_use_content =>
      '• حساب أهداف يومية مخصصة لتناول الماء\n• تتبع وعرض سجل استهلاكك للماء\n• تقديم إحصاءات ورؤى حول عادات الترطيب لديك\n• إرسال إشعارات التذكير\n• مزامنة بياناتك عبر الأجهزة\n• تحسين أداء التطبيق وتجربة المستخدم';

  @override
  String get privacy_storage_title => 'تخزين البيانات والأمان';

  @override
  String get privacy_storage_content =>
      'يتم تخزين بياناتك باستخدام Firebase Authentication وCloud Firestore (خوادم Google Cloud). يتم تشفير البيانات المنقولة بين جهازك وخوادمنا باستخدام SSL/TLS. لا يمكن الوصول إلى بيانات المستخدم إلا للمستخدم المصادق عليه من خلال قواعد أمان Firebase.';

  @override
  String get privacy_third_party_title => 'خدمات الطرف الثالث';

  @override
  String get privacy_third_party_content =>
      '• Google Firebase — المصادقة، قاعدة البيانات، التحليلات، الإشعارات الفورية\n• Google Sign-In — مصادقة OAuth\n• Firebase Analytics — تحليلات استخدام التطبيق\n\nنحن لا نبيع أو نتاجر أو نؤجر معلوماتك الشخصية لأطراف ثالثة.';

  @override
  String get privacy_rights_title => 'حقوقك';

  @override
  String get privacy_rights_content =>
      '• الوصول إلى معلوماتك الشخصية وتحديثها عبر الملف الشخصي والإعدادات\n• تصدير بياناتك (سجلات الماء، الإنجازات، الإعدادات) بتنسيق JSON\n• طلب حذف حسابك وجميع البيانات المرتبطة به\n• التحكم في تفضيلات الإشعارات\n\nللحذف، تواصل معنا: dilaraacikgoz.dev@gmail.com\nبعد الحذف، ستُزال جميع البيانات الشخصية من خوادمنا خلال 30 يوماً.';

  @override
  String get privacy_children_title => 'خصوصية الأطفال';

  @override
  String get privacy_children_content =>
      'Aqualert غير مخصص للأطفال دون سن 13 عاماً. لا نجمع عن قصد معلومات شخصية من الأطفال دون سن 13 عاماً.';

  @override
  String get privacy_gdpr_title =>
      'حقوق GDPR (مستخدمو الاتحاد الأوروبي/المنطقة الاقتصادية الأوروبية)';

  @override
  String get privacy_gdpr_content =>
      '• حق الوصول إلى بياناتك الشخصية\n• حق تصحيح البيانات غير الدقيقة\n• حق المحو (\"الحق في النسيان\")\n• حق تقييد المعالجة\n• حق نقل البيانات\n• حق الاعتراض على المعالجة';

  @override
  String get privacy_kvkk_title => 'حقوق KVKK (تركيا)';

  @override
  String get privacy_kvkk_content =>
      '• معرفة ما إذا كانت بياناتك الشخصية تُعالج\n• طلب معلومات إذا كانت تُعالج\n• معرفة غرض المعالجة\n• معرفة الأطراف الثالثة التي تُنقل إليها البيانات\n• طلب تصحيح البيانات غير المكتملة أو غير الصحيحة\n• طلب حذف البيانات أو إتلافها';

  @override
  String get privacy_contact_title => 'اتصل بنا';

  @override
  String get privacy_contact_content =>
      'إذا كانت لديك أي أسئلة حول سياسة الخصوصية هذه:\n\nالبريد الإلكتروني: dilaraacikgoz.dev@gmail.com\nوقت الرد: نسعى للرد خلال 48 ساعة.';
}
