// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => '건강한 삶을 위한 수분 섭취';

  @override
  String get common_cancel => '취소';

  @override
  String get common_save => '저장';

  @override
  String get common_delete => '삭제';

  @override
  String get common_edit => '편집';

  @override
  String get common_add => '추가';

  @override
  String get common_ok => '확인';

  @override
  String get common_yes => '예';

  @override
  String get common_no => '아니오';

  @override
  String get common_or => '또는';

  @override
  String get common_done => '완료';

  @override
  String get common_skip => '건너뛰기';

  @override
  String get common_next => '다음';

  @override
  String get common_back => '뒤로';

  @override
  String get common_continue => '계속';

  @override
  String get common_loading => '로딩 중...';

  @override
  String get common_error => '오류';

  @override
  String get common_success => '성공';

  @override
  String get auth_login_title => '로그인';

  @override
  String get auth_register_title => '회원가입';

  @override
  String get auth_email_label => '이메일';

  @override
  String get auth_email_hint => 'example@email.com';

  @override
  String get auth_password_label => '비밀번호';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => '이름';

  @override
  String get auth_name_hint => '홍길동';

  @override
  String get auth_forgot_password => '비밀번호를 잊으셨나요?';

  @override
  String get auth_dont_have_account => '계정이 없으신가요? ';

  @override
  String get auth_already_have_account => '이미 계정이 있으신가요? ';

  @override
  String get auth_sign_in_button => '로그인';

  @override
  String get auth_sign_up_button => '회원가입';

  @override
  String get auth_sign_in_google => 'Google로 로그인';

  @override
  String get auth_sign_up_google => 'Google로 회원가입';

  @override
  String get auth_logout => '로그아웃';

  @override
  String get auth_validation_email_required => '이메일을 입력해주세요';

  @override
  String get auth_validation_email_invalid => '유효한 이메일을 입력해주세요';

  @override
  String get auth_validation_password_required => '비밀번호를 입력해주세요';

  @override
  String get auth_validation_password_min_length => '비밀번호는 6자 이상이어야 합니다';

  @override
  String get auth_validation_password_mismatch => 'Passwords don\'t match';

  @override
  String get auth_validation_name_required => '이름을 입력해주세요';

  @override
  String get auth_validation_name_min_length => '이름은 2자 이상이어야 합니다';

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
  String get auth_email_verification_title => '이메일 인증';

  @override
  String get auth_email_verification_sent => '인증 링크를 보냈습니다:';

  @override
  String get auth_email_verification_instruction => '이메일을 확인하고 인증 링크를 클릭해주세요.';

  @override
  String get auth_email_verification_not_received => '이메일을 받지 못하셨나요?';

  @override
  String get auth_email_verification_resend => '인증 이메일 재전송';

  @override
  String get auth_email_verification_check => '이메일 인증 완료';

  @override
  String get auth_email_verification_success => '이메일이 인증되었습니다!';

  @override
  String get auth_email_verification_failed =>
      '이메일이 아직 인증되지 않았습니다. 받은편지함을 확인해주세요.';

  @override
  String get auth_forgot_password_title => '비밀번호 재설정';

  @override
  String get auth_forgot_password_instruction =>
      '이메일 주소를 입력하시면 비밀번호 재설정 링크를 보내드립니다.';

  @override
  String get auth_forgot_password_button => '재설정 링크 보내기';

  @override
  String get auth_forgot_password_success => '비밀번호 재설정 이메일을 보냈습니다!';

  @override
  String get auth_back_to_login => '로그인으로 돌아가기';

  @override
  String get home_title => '홈';

  @override
  String get home_daily_goal => '일일 목표';

  @override
  String get home_today => '오늘';

  @override
  String get home_todays_progress => 'Today\'s Progress';

  @override
  String get home_quick_add => 'Quick Add';

  @override
  String home_amount_to_go(String amount) {
    return '$amount to go!';
  }

  @override
  String get home_custom_amount => '직접 입력';

  @override
  String get home_amount_label => '양';

  @override
  String get home_add_water_success => '물을 추가했습니다!';

  @override
  String get home_add_water_failed => '물 추가에 실패했습니다';

  @override
  String get home_delete_water_confirm => '이 기록을 삭제하시겠습니까?';

  @override
  String get home_delete_water_success => '기록이 삭제되었습니다';

  @override
  String get home_no_records_today => '오늘 기록이 없습니다';

  @override
  String get home_start_drinking => '물을 마시기 시작하세요!';

  @override
  String get progress_current => '현재';

  @override
  String get progress_goal => '목표';

  @override
  String get progress_remaining => '남은 양';

  @override
  String get progress_completed => '목표 달성!';

  @override
  String progress_percentage(int percent) {
    return '일일 목표의 $percent%';
  }

  @override
  String get motivational_keep_going => '계속하세요! 잘하고 있어요!';

  @override
  String get motivational_almost_there => '거의 다 왔어요! 조금만 더!';

  @override
  String get motivational_goal_reached => '축하합니다! 목표를 달성했습니다!';

  @override
  String get motivational_good_start => '좋은 시작이에요! 계속하세요!';

  @override
  String get motivational_stay_hydrated => '하루 종일 수분을 섭취하세요!';

  @override
  String get motivational_100_1 => '축하합니다! 목표를 달성했습니다!';

  @override
  String get motivational_100_2 => '대단해요! 내일도 계속하세요!';

  @override
  String get motivational_100_3 => '수분 섭취 챔피언이에요!';

  @override
  String get motivational_100_4 => '완벽해요! 좋은 습관을 유지하세요!';

  @override
  String get motivational_100_short => '목표 달성!';

  @override
  String get motivational_75_1 => '거의 다 왔어요! 조금만 더!';

  @override
  String get motivational_75_2 => '잘하고 있어요! 계속하세요!';

  @override
  String get motivational_75_3 => '목표에 거의 도달했어요!';

  @override
  String get motivational_75_4 => '훌륭한 진행 상황! 멈추지 마세요!';

  @override
  String get motivational_75_short => '거의 다 왔어요!';

  @override
  String get motivational_50_1 => '절반 달성! 멋져요!';

  @override
  String get motivational_50_2 => '잘하고 있어요! 계속하세요!';

  @override
  String get motivational_50_3 => '올바른 방향으로 가고 있어요!';

  @override
  String get motivational_50_4 => '좋은 진행 상황! 꾸준히 하세요!';

  @override
  String get motivational_50_short => '절반!';

  @override
  String get motivational_25_1 => '좋은 시작! 물을 계속 마시세요!';

  @override
  String get motivational_25_2 => '좋은 출발이에요!';

  @override
  String get motivational_25_3 => '좋은 시작! 수분을 섭취하세요!';

  @override
  String get motivational_25_4 => '계속하세요! 한 모금 한 모금이 중요해요!';

  @override
  String get motivational_25_short => '좋은 시작!';

  @override
  String get motivational_0_1 => '수분 섭취 시간! 몸이 고마워할 거예요!';

  @override
  String get motivational_0_2 => '수분 섭취 여정을 시작하세요!';

  @override
  String get motivational_0_3 => '물로 하루를 시작하세요!';

  @override
  String get motivational_0_4 => '건강이 중요해요! 마시기 시작하세요!';

  @override
  String get motivational_0_short => '시작해요!';

  @override
  String get profile_title => '프로필';

  @override
  String get profile_edit => '편집';

  @override
  String get profile_personal_info => '개인 정보';

  @override
  String get profile_body_metrics => '신체 정보';

  @override
  String get profile_activity_level => '활동 수준';

  @override
  String get profile_name => '이름';

  @override
  String get profile_email => '이메일';

  @override
  String get profile_age => '나이';

  @override
  String get profile_gender => '성별';

  @override
  String get profile_weight => '체중';

  @override
  String get profile_height => '키';

  @override
  String get profile_bmi => 'BMI';

  @override
  String get profile_bmi_category => 'BMI 카테고리';

  @override
  String get profile_daily_goal => '일일 수분 목표';

  @override
  String get profile_use_calculated_goal => '계산된 목표 사용';

  @override
  String get profile_custom_goal => '직접 설정';

  @override
  String get profile_save_success => '프로필이 업데이트되었습니다';

  @override
  String get profile_save_failed => '프로필 업데이트에 실패했습니다';

  @override
  String get profile_user_default => '사용자';

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
  String get gender_male => '남성';

  @override
  String get gender_female => '여성';

  @override
  String get gender_other => '기타';

  @override
  String get activity_sedentary => '앉아서 생활';

  @override
  String get activity_sedentary_desc => '거의 또는 전혀 운동하지 않음';

  @override
  String get activity_light => '가벼운 활동';

  @override
  String get activity_light_desc => '주 1-3일 가벼운 운동';

  @override
  String get activity_moderate => '보통 활동';

  @override
  String get activity_moderate_desc => '주 3-5일 중간 강도 운동';

  @override
  String get activity_very_active => '활발한 활동';

  @override
  String get activity_very_active_desc => '주 6-7일 고강도 운동';

  @override
  String get activity_extra_active => '매우 활발한 활동';

  @override
  String get activity_extra_active_desc => '매우 고강도 운동 및 육체 노동';

  @override
  String get bmi_underweight => '저체중';

  @override
  String get bmi_normal => '정상 체중';

  @override
  String get bmi_overweight => '과체중';

  @override
  String get bmi_obese => '비만';

  @override
  String get settings_title => '설정';

  @override
  String get settings_notifications => '알림';

  @override
  String get settings_reminders => '리마인더';

  @override
  String get settings_theme => '테마';

  @override
  String get settings_units => '단위';

  @override
  String get settings_language => '언어';

  @override
  String get settings_profile => '프로필 설정';

  @override
  String get settings_daily_goal => '목표 설정';

  @override
  String get settings_data => '데이터 관리';

  @override
  String get settings_export_data => '데이터 내보내기';

  @override
  String get settings_import_data => '데이터 가져오기';

  @override
  String get settings_help => '도움말';

  @override
  String get settings_about => '앱 정보';

  @override
  String get settings_enable_notifications => '알림 활성화';

  @override
  String get settings_reminder_interval => '리마인더 간격';

  @override
  String get settings_reminder_start_time => '시작 시간';

  @override
  String get settings_reminder_end_time => '종료 시간';

  @override
  String get settings_test_notification => '알림 테스트';

  @override
  String get settings_theme_light => '라이트';

  @override
  String get settings_theme_dark => '다크';

  @override
  String get settings_theme_system => '시스템 설정';

  @override
  String get settings_unit_ml => '밀리리터 (ml)';

  @override
  String get settings_unit_floz => '액량 온스 (fl oz)';

  @override
  String get settings_unit_metric => '미터법';

  @override
  String get settings_unit_imperial => '야드파운드법';

  @override
  String get settings_subtitle => '앱 사용자화';

  @override
  String get settings_reminders_active => '리마인더가 활성화되었습니다';

  @override
  String get settings_reminders_inactive => '리마인더를 켜세요';

  @override
  String get settings_minutes => '분';

  @override
  String get settings_export_subtitle => '데이터 백업';

  @override
  String get settings_import_subtitle => '백업에서 복원';

  @override
  String get settings_profile_subtitle => '정보 업데이트';

  @override
  String get settings_daily_goal_subtitle => '목표 관리';

  @override
  String get settings_theme_dialog_title => '테마';

  @override
  String get settings_theme_light_mode => '라이트 모드';

  @override
  String get settings_theme_dark_mode => '다크 모드';

  @override
  String get settings_theme_system_mode => '시스템 설정';

  @override
  String get settings_theme_light_subtitle => '라이트 테마 사용';

  @override
  String get settings_theme_dark_subtitle => '다크 테마 사용';

  @override
  String get settings_theme_system_subtitle => '시스템 설정 따르기';

  @override
  String get settings_language_dialog_title => '언어';

  @override
  String get settings_system_language => 'System Language';

  @override
  String get settings_use_device_language => 'Use device language';

  @override
  String get settings_export_loading => '내보내는 중...';

  @override
  String get settings_export_success_message => '데이터를 내보냈습니다!';

  @override
  String settings_export_failed_message(String error) {
    return '내보내기 실패: $error';
  }

  @override
  String get settings_import_loading => '가져오는 중...';

  @override
  String get settings_import_complete => '가져오기 완료';

  @override
  String get settings_import_success_subtitle => '성공적으로 가져왔습니다:';

  @override
  String get settings_import_water_records => '개의 수분 기록';

  @override
  String get settings_import_daily_goals => '개의 일일 목표';

  @override
  String get settings_import_duplicate_skipped => '개의 중복 건너뜀';

  @override
  String settings_import_failed_message(String error) {
    return '가져오기 실패: $error';
  }

  @override
  String get settings_reminder_interval_title => '리마인더 간격';

  @override
  String get settings_language_coming_soon => '곧 출시';

  @override
  String get settings_export_success => '데이터를 내보냈습니다';

  @override
  String get settings_export_failed => '내보내기에 실패했습니다';

  @override
  String get settings_import_success => '데이터를 가져왔습니다';

  @override
  String get settings_import_failed => '가져오기에 실패했습니다';

  @override
  String settings_import_stats(int imported, int skipped) {
    return '$imported개 가져옴, $skipped개 중복 건너뜀';
  }

  @override
  String get statistics_title => '통계';

  @override
  String get statistics_weekly => '주간';

  @override
  String get statistics_monthly => '월간';

  @override
  String get statistics_yearly => '연간';

  @override
  String get statistics_average => '평균';

  @override
  String get statistics_total => '총합';

  @override
  String get statistics_best_day => '최고 기록일';

  @override
  String get statistics_goal_achievement => '목표 달성률';

  @override
  String get statistics_no_data => '이 기간의 데이터가 없습니다';

  @override
  String get statistics_chart_label => '수분 섭취량';

  @override
  String get statistics_total_intake => '총 섭취량';

  @override
  String get statistics_total_consumed => '총 소비량';

  @override
  String get statistics_daily_average => '일일 평균';

  @override
  String get statistics_goals_met => '달성한 목표';

  @override
  String statistics_out_of(int count) {
    return '$count일 중';
  }

  @override
  String get statistics_progress => '진행률';

  @override
  String get statistics_on_track => '순조로워요!';

  @override
  String get statistics_keep_going => '계속 해보세요!';

  @override
  String get statistics_daily_intake => '일일 섭취량';

  @override
  String get statistics_below_goal => '목표 미달';

  @override
  String get statistics_goal_met_label => '목표 달성';

  @override
  String get statistics_your_streak => '내 연속 기록';

  @override
  String get statistics_current => '현재';

  @override
  String get statistics_best => '최고';

  @override
  String get statistics_completed => '완료';

  @override
  String get statistics_next_goal => '다음 목표';

  @override
  String get statistics_days => '일';

  @override
  String get achievements_title => '업적';

  @override
  String get achievements_unlocked => '해제됨';

  @override
  String get achievements_locked => '잠김';

  @override
  String get achievements_progress => '진행 상황';

  @override
  String get achievements_reward_points => '보상 포인트';

  @override
  String achievements_total_points(int points) {
    return '총 포인트: $points';
  }

  @override
  String get achievement_first_drop => '첫 번째 물방울';

  @override
  String get achievement_first_drop_desc => '첫 번째 수분 섭취 기록';

  @override
  String get achievement_daily_goal_1 => '목표 달성자';

  @override
  String get achievement_daily_goal_1_desc => '일일 목표 달성';

  @override
  String get achievement_streak_3 => '3일 연속';

  @override
  String get achievement_streak_3_desc => '3일 연속 달성';

  @override
  String get achievement_streak_7 => '주간 전사';

  @override
  String get achievement_streak_7_desc => '7일 연속 달성';

  @override
  String get achievement_streak_30 => '월간 마스터';

  @override
  String get achievement_streak_30_desc => '30일 연속 달성';

  @override
  String get achievement_total_10l => '10리터';

  @override
  String get achievement_total_10l_desc => '총 10리터 달성';

  @override
  String get achievement_total_100l => '100리터';

  @override
  String get achievement_total_100l_desc => '총 100리터 달성';

  @override
  String get achievement_consistency => '꾸준한 한 주';

  @override
  String get achievement_consistency_desc => '7일 연속 목표 달성';

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
  String get reminders_title => '리마인더';

  @override
  String get reminders_active => '활성 리마인더';

  @override
  String get reminders_pending => '대기 중인 알림';

  @override
  String get reminders_interval_30 => '30분마다';

  @override
  String get reminders_interval_45 => '45분마다';

  @override
  String get reminders_interval_60 => '1시간마다';

  @override
  String get reminders_interval_90 => '1.5시간마다';

  @override
  String get reminders_interval_120 => '2시간마다';

  @override
  String get reminders_interval_180 => '3시간마다';

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
  String get notification_reminder_title => '물 마실 시간이에요!';

  @override
  String get notification_reminder_body => '수분을 섭취하세요! 지금 물을 마시세요.';

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
  String get streak_current => '현재 연속';

  @override
  String streak_days(int days) {
    return '$days일';
  }

  @override
  String get streak_keep_going => '연속을 이어가세요!';

  @override
  String get streak_personal_best => '개인 최고';

  @override
  String get streak_best => '최고!';

  @override
  String get streak_longest => '최장';

  @override
  String get streak_next_milestone => '다음 목표';

  @override
  String get streak_start_today => '오늘부터 연속을 시작하세요!';

  @override
  String get streak_complete_goal => '일일 목표를 달성하여 연속을 만드세요';

  @override
  String get streak_start => '연속을 시작하세요!';

  @override
  String get streak_error => '데이터 로딩에 실패했습니다';

  @override
  String get streak_day_singular => '일';

  @override
  String get streak_day_plural => '일';

  @override
  String get onboarding_title_1 => '물 기록하기';

  @override
  String get onboarding_desc_1 => '탭 한 번으로 쉽게 일일 수분 섭취를 기록하세요';

  @override
  String get onboarding_title_2 => '스마트 리마인더';

  @override
  String get onboarding_desc_2 => '하루 종일 수분 섭취를 상기시켜 드립니다';

  @override
  String get onboarding_title_3 => '진행 상황 확인';

  @override
  String get onboarding_desc_3 => '수분 섭취 통계를 보고 목표를 달성하세요';

  @override
  String get onboarding_title_4 => '건강 유지';

  @override
  String get onboarding_desc_4 => '건강한 습관을 만들고 전반적인 건강을 개선하세요';

  @override
  String get onboarding_get_started => '시작하기';

  @override
  String get drawer_home => '홈';

  @override
  String get drawer_statistics => '통계';

  @override
  String get drawer_achievements => '업적';

  @override
  String get drawer_profile => '프로필';

  @override
  String get drawer_reminders => '리마인더';

  @override
  String get drawer_settings => '설정';

  @override
  String get drawer_help => '도움말';

  @override
  String get drawer_about => '앱 정보';

  @override
  String get drawer_logout => '로그아웃';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => '버전 1.0.0';

  @override
  String get about_description =>
      'Aqualert로 수분 섭취를 관리하세요. 일일 수분 섭취를 기록하고 목표를 달성하세요!';

  @override
  String get about_copyright => '© 2024 Aqualert. All rights reserved.';

  @override
  String get about_close => '닫기';

  @override
  String get help_title => '도움말';

  @override
  String get help_subtitle => '도움 받기';

  @override
  String get help_faq => '자주 묻는 질문';

  @override
  String get help_contact => '문의하기';

  @override
  String get help_version => '버전';

  @override
  String get help_app_info => '앱 정보';

  @override
  String get help_coming_soon => '도움말 - 곧 출시!';

  @override
  String get help_faq_section => 'FAQ';

  @override
  String get help_features_section => '기능 가이드';

  @override
  String get help_about_section => '앱 정보';

  @override
  String get faq_1_q => '일일 수분 목표는 어떻게 계산되나요?';

  @override
  String get faq_1_a =>
      '일일 수분 목표는 체중, 키, 나이, 성별, 활동 수준을 기반으로 과학적 공식으로 계산됩니다. 프로필 설정에서 직접 목표를 설정할 수도 있습니다.';

  @override
  String get faq_2_q => '리마인더는 어떻게 작동하나요?';

  @override
  String get faq_2_a =>
      '리마인더 간격(30-180분)과 시작/종료 시간을 설정할 수 있습니다. 앱이 이 기간 동안 알림을 보내 수분 섭취를 상기시켜 줍니다.';

  @override
  String get faq_3_q => '연속이란 무엇이며 어떻게 작동하나요?';

  @override
  String get faq_3_a => '연속은 일일 목표를 달성한 연속 일수를 추적합니다. 매일 물을 마셔서 연속을 유지하고 늘리세요!';

  @override
  String get faq_4_q => '측정 단위를 어떻게 변경하나요?';

  @override
  String get faq_4_a =>
      '설정 → 단위로 가서 밀리리터(ml)와 액량 온스(fl oz) 사이를 전환하세요. 모든 측정값이 자동으로 업데이트됩니다.';

  @override
  String get faq_5_q => '데이터를 내보낼 수 있나요?';

  @override
  String get faq_5_a =>
      '네! 설정 → 데이터 관리 → 데이터 내보내기로 가세요. 데이터를 JSON 파일로 공유하거나 저장하고 나중에 가져올 수 있습니다.';

  @override
  String get faq_6_q => '업적은 어떻게 작동하나요?';

  @override
  String get faq_6_a =>
      '수분 기록 마일스톤을 완료하면 업적이 해제되고 보상 포인트를 얻습니다. 업적 화면에서 진행 상황을 확인하세요.';

  @override
  String get feature_tracking_title => '수분 기록';

  @override
  String get feature_tracking_desc =>
      '빠른 추가 버튼(250ml, 350ml, 500ml, 750ml) 또는 직접 입력으로 쉽게 일일 수분 섭취를 기록하세요.';

  @override
  String get feature_reminders_title => '스마트 리마인더';

  @override
  String get feature_reminders_desc =>
      '사용자 정의 리마인더 간격과 활성 시간을 설정하세요. 하루 종일 물 마시는 것을 잊지 마세요.';

  @override
  String get feature_statistics_title => '통계 및 인사이트';

  @override
  String get feature_statistics_desc =>
      '주간, 월간, 연간 차트로 수분 섭취 추세를 확인하세요. 시간에 따른 진행 상황을 추적하세요.';

  @override
  String get feature_achievements_title => '업적 및 연속';

  @override
  String get feature_achievements_desc =>
      '수분 목표를 달성하여 업적을 획득하고 일일 연속을 유지하세요. 게이미피케이션으로 동기 부여!';

  @override
  String get feature_profile_title => '프로필 및 목표';

  @override
  String get feature_profile_desc =>
      '개인 정보를 설정하면 앱이 신체 지표를 기반으로 최적의 일일 수분 목표를 계산합니다.';

  @override
  String get help_contact_email => '이메일로 문의';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => '앱 평가하기';

  @override
  String get help_rate_desc => 'Aqualert가 마음에 드시나요? 리뷰를 남겨주세요!';

  @override
  String get help_build_number => '빌드';

  @override
  String get help_copyright => '© 2024 Aqualert. All rights reserved.';

  @override
  String get help_made_with => '당신의 건강을 위해 ❤️로 만들었습니다';

  @override
  String get error_generic => '문제가 발생했습니다. 다시 시도해주세요.';

  @override
  String get error_network => '네트워크 오류. 연결을 확인해주세요.';

  @override
  String get error_auth_failed => '인증에 실패했습니다. 다시 시도해주세요.';

  @override
  String get error_permission_denied => '권한이 거부되었습니다.';

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
  String get time_morning => '아침';

  @override
  String get time_afternoon => '오후';

  @override
  String get time_evening => '저녁';

  @override
  String get time_night => '밤';

  @override
  String get help_privacy_policy => '개인정보 처리방침';

  @override
  String get help_privacy_policy_desc => '개인정보 처리방침 보기';

  @override
  String get help_privacy_policy_error => '개인정보 처리방침을 열 수 없습니다';

  @override
  String get settings_delete_account => '계정 삭제';

  @override
  String get settings_delete_account_subtitle => '계정과 모든 데이터를 영구적으로 삭제';

  @override
  String get settings_delete_account_dialog_title => '계정을 삭제하시겠습니까?';

  @override
  String get settings_delete_account_dialog_message =>
      '이 작업은 취소할 수 없습니다. 수분 섭취 기록, 연속 기록, 설정을 포함한 모든 데이터가 영구적으로 삭제됩니다.';

  @override
  String get settings_delete_account_confirm => '내 계정 삭제';

  @override
  String get settings_delete_account_cancel => '취소';

  @override
  String get settings_delete_account_success => '계정이 성공적으로 삭제되었습니다';

  @override
  String get settings_delete_account_error => '계정 삭제에 실패했습니다';

  @override
  String get settings_delete_account_reauth_required => '계정을 삭제하려면 다시 로그인해주세요';

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
