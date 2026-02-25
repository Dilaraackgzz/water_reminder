// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => '保持水分，健康生活';

  @override
  String get common_cancel => '取消';

  @override
  String get common_save => '保存';

  @override
  String get common_delete => '删除';

  @override
  String get common_edit => '编辑';

  @override
  String get common_add => '添加';

  @override
  String get common_ok => '确定';

  @override
  String get common_yes => '是';

  @override
  String get common_no => '否';

  @override
  String get common_or => '或';

  @override
  String get common_done => '完成';

  @override
  String get common_skip => '跳过';

  @override
  String get common_next => '下一步';

  @override
  String get common_back => '返回';

  @override
  String get common_continue => '继续';

  @override
  String get common_loading => '加载中...';

  @override
  String get common_error => '错误';

  @override
  String get common_success => '成功';

  @override
  String get auth_login_title => '登录';

  @override
  String get auth_register_title => '注册';

  @override
  String get auth_email_label => '邮箱';

  @override
  String get auth_email_hint => 'example@email.com';

  @override
  String get auth_password_label => '密码';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => '姓名';

  @override
  String get auth_name_hint => '张三';

  @override
  String get auth_forgot_password => '忘记密码？';

  @override
  String get auth_dont_have_account => '没有账户？';

  @override
  String get auth_already_have_account => '已有账户？';

  @override
  String get auth_sign_in_button => '登录';

  @override
  String get auth_sign_up_button => '注册';

  @override
  String get auth_sign_in_google => '使用Google登录';

  @override
  String get auth_sign_up_google => '使用Google注册';

  @override
  String get auth_logout => '退出登录';

  @override
  String get auth_validation_email_required => '请输入邮箱';

  @override
  String get auth_validation_email_invalid => '请输入有效的邮箱';

  @override
  String get auth_validation_password_required => '请输入密码';

  @override
  String get auth_validation_password_min_length => '密码至少需要6个字符';

  @override
  String get auth_validation_password_mismatch => 'Passwords don\'t match';

  @override
  String get auth_validation_name_required => '请输入姓名';

  @override
  String get auth_validation_name_min_length => '姓名至少需要2个字符';

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
  String get auth_email_verification_title => '验证邮箱';

  @override
  String get auth_email_verification_sent => '我们已发送验证链接至：';

  @override
  String get auth_email_verification_instruction => '请查看邮箱并点击验证链接。';

  @override
  String get auth_email_verification_not_received => '没有收到邮件？';

  @override
  String get auth_email_verification_resend => '重新发送验证邮件';

  @override
  String get auth_email_verification_check => '我已验证邮箱';

  @override
  String get auth_email_verification_success => '邮箱验证成功！';

  @override
  String get auth_email_verification_failed => '邮箱尚未验证，请检查收件箱。';

  @override
  String get auth_forgot_password_title => '重置密码';

  @override
  String get auth_forgot_password_instruction => '输入您的邮箱地址，我们将发送密码重置链接。';

  @override
  String get auth_forgot_password_button => '发送重置链接';

  @override
  String get auth_forgot_password_success => '密码重置邮件已发送！';

  @override
  String get auth_back_to_login => '返回登录';

  @override
  String get home_title => '首页';

  @override
  String get home_daily_goal => '每日目标';

  @override
  String get home_today => '今天';

  @override
  String get home_custom_amount => '自定义量';

  @override
  String get home_amount_label => '量';

  @override
  String get home_add_water_success => '已添加饮水记录！';

  @override
  String get home_add_water_failed => '添加失败';

  @override
  String get home_delete_water_confirm => '删除此记录？';

  @override
  String get home_delete_water_success => '记录已删除';

  @override
  String get home_no_records_today => '今天没有记录';

  @override
  String get home_start_drinking => '开始喝水吧！';

  @override
  String get progress_current => '当前';

  @override
  String get progress_goal => '目标';

  @override
  String get progress_remaining => '剩余';

  @override
  String get progress_completed => '目标完成！';

  @override
  String progress_percentage(int percent) {
    return '每日目标的$percent%';
  }

  @override
  String get motivational_keep_going => '继续加油！你做得很好！';

  @override
  String get motivational_almost_there => '快到了！再坚持一下！';

  @override
  String get motivational_goal_reached => '恭喜！目标达成！';

  @override
  String get motivational_good_start => '好的开始！继续保持！';

  @override
  String get motivational_stay_hydrated => '全天保持水分摄入！';

  @override
  String get motivational_100_1 => '恭喜！目标达成！';

  @override
  String get motivational_100_2 => '太棒了！明天继续保持！';

  @override
  String get motivational_100_3 => '你是补水冠军！';

  @override
  String get motivational_100_4 => '完美！保持好习惯！';

  @override
  String get motivational_100_short => '目标达成！';

  @override
  String get motivational_75_1 => '快到了！再坚持一下！';

  @override
  String get motivational_75_2 => '做得很好！继续加油！';

  @override
  String get motivational_75_3 => '离目标很近了！';

  @override
  String get motivational_75_4 => '进展很棒！别停下！';

  @override
  String get motivational_75_short => '快到了！';

  @override
  String get motivational_50_1 => '完成一半！太棒了！';

  @override
  String get motivational_50_2 => '做得好！继续加油！';

  @override
  String get motivational_50_3 => '方向正确！';

  @override
  String get motivational_50_4 => '进展不错！保持一致！';

  @override
  String get motivational_50_short => '一半！';

  @override
  String get motivational_25_1 => '好的开始！继续喝水！';

  @override
  String get motivational_25_2 => '起步很好！';

  @override
  String get motivational_25_3 => '开始不错！保持水分！';

  @override
  String get motivational_25_4 => '继续加油！每一口都很重要！';

  @override
  String get motivational_25_short => '好的开始！';

  @override
  String get motivational_0_1 => '是时候补水了！你的身体会感谢你！';

  @override
  String get motivational_0_2 => '开始补水之旅！';

  @override
  String get motivational_0_3 => '用水开始新的一天！';

  @override
  String get motivational_0_4 => '健康很重要！开始喝水！';

  @override
  String get motivational_0_short => '开始吧！';

  @override
  String get profile_title => '个人资料';

  @override
  String get profile_edit => '编辑';

  @override
  String get profile_personal_info => '个人信息';

  @override
  String get profile_body_metrics => '身体数据';

  @override
  String get profile_activity_level => '活动水平';

  @override
  String get profile_name => '姓名';

  @override
  String get profile_email => '邮箱';

  @override
  String get profile_age => '年龄';

  @override
  String get profile_gender => '性别';

  @override
  String get profile_weight => '体重';

  @override
  String get profile_height => '身高';

  @override
  String get profile_bmi => 'BMI';

  @override
  String get profile_bmi_category => 'BMI类别';

  @override
  String get profile_daily_goal => '每日饮水目标';

  @override
  String get profile_use_calculated_goal => '使用计算目标';

  @override
  String get profile_custom_goal => '自定义目标';

  @override
  String get profile_save_success => '个人资料已更新';

  @override
  String get profile_save_failed => '更新失败';

  @override
  String get profile_user_default => '用户';

  @override
  String get gender_male => '男';

  @override
  String get gender_female => '女';

  @override
  String get gender_other => '其他';

  @override
  String get activity_sedentary => '久坐';

  @override
  String get activity_light => '轻度活动';

  @override
  String get activity_moderate => '中度活动';

  @override
  String get activity_very_active => '活跃';

  @override
  String get activity_extra_active => '非常活跃';

  @override
  String get bmi_underweight => '体重过轻';

  @override
  String get bmi_normal => '正常体重';

  @override
  String get bmi_overweight => '超重';

  @override
  String get bmi_obese => '肥胖';

  @override
  String get settings_title => '设置';

  @override
  String get settings_notifications => '通知';

  @override
  String get settings_reminders => '提醒';

  @override
  String get settings_theme => '主题';

  @override
  String get settings_units => '单位';

  @override
  String get settings_language => '语言';

  @override
  String get settings_profile => '个人资料设置';

  @override
  String get settings_daily_goal => '目标设置';

  @override
  String get settings_data => '数据管理';

  @override
  String get settings_export_data => '导出数据';

  @override
  String get settings_import_data => '导入数据';

  @override
  String get settings_help => '帮助';

  @override
  String get settings_about => '关于';

  @override
  String get settings_enable_notifications => '启用通知';

  @override
  String get settings_reminder_interval => '提醒间隔';

  @override
  String get settings_reminder_start_time => '开始时间';

  @override
  String get settings_reminder_end_time => '结束时间';

  @override
  String get settings_test_notification => '测试通知';

  @override
  String get settings_theme_light => '浅色';

  @override
  String get settings_theme_dark => '深色';

  @override
  String get settings_theme_system => '跟随系统';

  @override
  String get settings_unit_ml => '毫升 (ml)';

  @override
  String get settings_unit_floz => '液盎司 (fl oz)';

  @override
  String get settings_unit_metric => '公制';

  @override
  String get settings_unit_imperial => '英制';

  @override
  String get settings_subtitle => '自定义体验';

  @override
  String get settings_reminders_active => '提醒已启用';

  @override
  String get settings_reminders_inactive => '开启提醒';

  @override
  String get settings_minutes => '分钟';

  @override
  String get settings_export_subtitle => '备份数据';

  @override
  String get settings_import_subtitle => '从备份恢复';

  @override
  String get settings_profile_subtitle => '更新信息';

  @override
  String get settings_daily_goal_subtitle => '管理目标';

  @override
  String get settings_theme_dialog_title => '主题';

  @override
  String get settings_theme_light_mode => '浅色模式';

  @override
  String get settings_theme_dark_mode => '深色模式';

  @override
  String get settings_theme_system_mode => '跟随系统';

  @override
  String get settings_theme_light_subtitle => '使用浅色主题';

  @override
  String get settings_theme_dark_subtitle => '使用深色主题';

  @override
  String get settings_theme_system_subtitle => '跟随系统设置';

  @override
  String get settings_language_dialog_title => '语言';

  @override
  String get settings_export_loading => '导出中...';

  @override
  String get settings_export_success_message => '数据导出成功！';

  @override
  String settings_export_failed_message(String error) {
    return '导出失败: $error';
  }

  @override
  String get settings_import_loading => '导入中...';

  @override
  String get settings_import_complete => '导入完成';

  @override
  String get settings_import_success_subtitle => '成功导入:';

  @override
  String get settings_import_water_records => '条饮水记录';

  @override
  String get settings_import_daily_goals => '个每日目标';

  @override
  String get settings_import_duplicate_skipped => '条重复记录已跳过';

  @override
  String settings_import_failed_message(String error) {
    return '导入失败: $error';
  }

  @override
  String get settings_reminder_interval_title => '提醒间隔';

  @override
  String get settings_language_coming_soon => '即将推出';

  @override
  String get settings_export_success => '数据导出成功';

  @override
  String get settings_export_failed => '导出失败';

  @override
  String get settings_import_success => '数据导入成功';

  @override
  String get settings_import_failed => '导入失败';

  @override
  String settings_import_stats(int imported, int skipped) {
    return '导入$imported条记录，跳过$skipped条重复';
  }

  @override
  String get statistics_title => '统计';

  @override
  String get statistics_weekly => '每周';

  @override
  String get statistics_monthly => '每月';

  @override
  String get statistics_yearly => '每年';

  @override
  String get statistics_average => '平均';

  @override
  String get statistics_total => '总计';

  @override
  String get statistics_best_day => '最佳日';

  @override
  String get statistics_goal_achievement => '目标达成率';

  @override
  String get statistics_no_data => '此期间没有数据';

  @override
  String get statistics_chart_label => '饮水量';

  @override
  String get achievements_title => '成就';

  @override
  String get achievements_unlocked => '已解锁';

  @override
  String get achievements_locked => '未解锁';

  @override
  String get achievements_progress => '进度';

  @override
  String get achievements_reward_points => '奖励积分';

  @override
  String achievements_total_points(int points) {
    return '总积分: $points';
  }

  @override
  String get achievement_first_drop => '第一滴水';

  @override
  String get achievement_first_drop_desc => '记录第一次饮水';

  @override
  String get achievement_daily_goal_1 => '目标达成者';

  @override
  String get achievement_daily_goal_1_desc => '达成一次每日目标';

  @override
  String get achievement_streak_3 => '3天连续';

  @override
  String get achievement_streak_3_desc => '保持3天连续';

  @override
  String get achievement_streak_7 => '周冠军';

  @override
  String get achievement_streak_7_desc => '保持7天连续';

  @override
  String get achievement_streak_30 => '月度大师';

  @override
  String get achievement_streak_30_desc => '保持30天连续';

  @override
  String get achievement_total_10l => '10升';

  @override
  String get achievement_total_10l_desc => '累计饮水10升';

  @override
  String get achievement_total_100l => '100升';

  @override
  String get achievement_total_100l_desc => '累计饮水100升';

  @override
  String get achievement_consistency => '坚持一周';

  @override
  String get achievement_consistency_desc => '连续7天达成目标';

  @override
  String get reminders_title => '提醒';

  @override
  String get reminders_active => '活动提醒';

  @override
  String get reminders_pending => '待处理通知';

  @override
  String get reminders_interval_30 => '每30分钟';

  @override
  String get reminders_interval_45 => '每45分钟';

  @override
  String get reminders_interval_60 => '每小时';

  @override
  String get reminders_interval_90 => '每1.5小时';

  @override
  String get reminders_interval_120 => '每2小时';

  @override
  String get reminders_interval_180 => '每3小时';

  @override
  String get notification_reminder_title => '该喝水了！';

  @override
  String get notification_reminder_body => '保持水分！现在喝点水吧。';

  @override
  String get streak_current => '当前连续';

  @override
  String streak_days(int days) {
    return '$days天';
  }

  @override
  String get streak_keep_going => '继续保持！';

  @override
  String get streak_personal_best => '个人最佳';

  @override
  String get streak_best => '最佳！';

  @override
  String get streak_longest => '最长';

  @override
  String get streak_next_milestone => '下一个里程碑';

  @override
  String get streak_start_today => '今天开始连续！';

  @override
  String get streak_complete_goal => '完成每日目标来建立连续';

  @override
  String get streak_start => '开始连续！';

  @override
  String get streak_error => '加载数据失败';

  @override
  String get streak_day_singular => '天';

  @override
  String get streak_day_plural => '天';

  @override
  String get onboarding_title_1 => '追踪饮水';

  @override
  String get onboarding_desc_1 => '轻松记录每日饮水量';

  @override
  String get onboarding_title_2 => '智能提醒';

  @override
  String get onboarding_desc_2 => '全天获得及时的饮水提醒';

  @override
  String get onboarding_title_3 => '监控进度';

  @override
  String get onboarding_desc_3 => '查看水分统计并达成目标';

  @override
  String get onboarding_title_4 => '保持健康';

  @override
  String get onboarding_desc_4 => '养成健康习惯，改善整体健康';

  @override
  String get onboarding_get_started => '开始使用';

  @override
  String get drawer_home => '首页';

  @override
  String get drawer_statistics => '统计';

  @override
  String get drawer_achievements => '成就';

  @override
  String get drawer_profile => '个人资料';

  @override
  String get drawer_reminders => '提醒';

  @override
  String get drawer_settings => '设置';

  @override
  String get drawer_help => '帮助';

  @override
  String get drawer_about => '关于';

  @override
  String get drawer_logout => '退出登录';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => '版本 1.0.0';

  @override
  String get about_description => '使用Aqualert保持水分。追踪每日饮水量并达成目标！';

  @override
  String get about_copyright => '© 2024 Aqualert. 保留所有权利。';

  @override
  String get about_close => '关闭';

  @override
  String get help_title => '帮助';

  @override
  String get help_subtitle => '获取帮助';

  @override
  String get help_faq => '常见问题';

  @override
  String get help_contact => '联系我们';

  @override
  String get help_version => '版本';

  @override
  String get help_app_info => '应用信息';

  @override
  String get help_coming_soon => '帮助 - 即将推出！';

  @override
  String get help_faq_section => '常见问题';

  @override
  String get help_features_section => '功能指南';

  @override
  String get help_about_section => '关于';

  @override
  String get faq_1_q => '每日饮水目标是如何计算的？';

  @override
  String get faq_1_a =>
      '每日饮水目标根据您的体重、身高、年龄、性别和活动水平使用科学公式计算。您也可以在个人资料设置中设置自定义目标。';

  @override
  String get faq_2_q => '提醒如何工作？';

  @override
  String get faq_2_a => '您可以设置提醒间隔（30-180分钟）并选择开始/结束时间。应用会在此期间发送通知帮助您保持水分。';

  @override
  String get faq_3_q => '什么是连续，如何运作？';

  @override
  String get faq_3_a => '连续追踪您达成每日饮水目标的连续天数。每天喝水以保持和增加您的连续！';

  @override
  String get faq_4_q => '如何更改测量单位？';

  @override
  String get faq_4_a => '进入设置→单位，在毫升（ml）和液盎司（fl oz）之间切换。所有测量值将自动更新。';

  @override
  String get faq_5_q => '可以导出饮水数据吗？';

  @override
  String get faq_5_a => '可以！进入设置→数据管理→导出数据。您可以将数据保存为JSON文件并稍后导入。';

  @override
  String get faq_6_q => '成就如何运作？';

  @override
  String get faq_6_a => '完成饮水追踪里程碑以解锁成就并获得奖励积分。在成就页面追踪您的进度。';

  @override
  String get feature_tracking_title => '饮水追踪';

  @override
  String get feature_tracking_desc =>
      '使用快速添加按钮（250ml、350ml、500ml、750ml）或输入自定义量轻松记录每日饮水。';

  @override
  String get feature_reminders_title => '智能提醒';

  @override
  String get feature_reminders_desc => '设置可自定义的提醒间隔和活动时间。全天不忘喝水。';

  @override
  String get feature_statistics_title => '统计与洞察';

  @override
  String get feature_statistics_desc => '通过每周、每月和每年图表查看饮水趋势。追踪您的长期进度。';

  @override
  String get feature_achievements_title => '成就与连续';

  @override
  String get feature_achievements_desc => '通过达成饮水目标获得成就并保持每日连续。通过游戏化保持动力！';

  @override
  String get feature_profile_title => '个人资料与目标';

  @override
  String get feature_profile_desc => '设置个人信息，让应用根据您的身体数据计算最佳每日饮水目标。';

  @override
  String get help_contact_email => '通过邮件联系';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => '评价应用';

  @override
  String get help_rate_desc => '喜欢Aqualert？给我们留下评价！';

  @override
  String get help_build_number => '版本号';

  @override
  String get help_copyright => '© 2024 Aqualert. 保留所有权利。';

  @override
  String get help_made_with => '为您的健康用❤️制作';

  @override
  String get error_generic => '出了点问题。请重试。';

  @override
  String get error_network => '网络错误。请检查连接。';

  @override
  String get error_auth_failed => '认证失败。请重试。';

  @override
  String get error_permission_denied => '权限被拒绝。';

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
  String get time_morning => '早晨';

  @override
  String get time_afternoon => '下午';

  @override
  String get time_evening => '傍晚';

  @override
  String get time_night => '夜晚';

  @override
  String get help_privacy_policy => '隐私政策';

  @override
  String get help_privacy_policy_desc => '查看隐私政策';

  @override
  String get help_privacy_policy_error => '无法打开隐私政策';

  @override
  String get settings_delete_account => '删除账户';

  @override
  String get settings_delete_account_subtitle => '永久删除您的账户和所有数据';

  @override
  String get settings_delete_account_dialog_title => '删除账户？';

  @override
  String get settings_delete_account_dialog_message =>
      '此操作无法撤消。您的所有数据，包括饮水记录、连续记录和设置，都将被永久删除。';

  @override
  String get settings_delete_account_confirm => '删除我的账户';

  @override
  String get settings_delete_account_cancel => '取消';

  @override
  String get settings_delete_account_success => '账户删除成功';

  @override
  String get settings_delete_account_error => '删除账户失败';

  @override
  String get settings_delete_account_reauth_required => '请重新登录以删除您的账户';
}
