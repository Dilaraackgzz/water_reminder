// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => '健康的な生活のために水分補給を';

  @override
  String get common_cancel => 'キャンセル';

  @override
  String get common_save => '保存';

  @override
  String get common_delete => '削除';

  @override
  String get common_edit => '編集';

  @override
  String get common_add => '追加';

  @override
  String get common_ok => 'OK';

  @override
  String get common_yes => 'はい';

  @override
  String get common_no => 'いいえ';

  @override
  String get common_or => 'または';

  @override
  String get common_done => '完了';

  @override
  String get common_skip => 'スキップ';

  @override
  String get common_next => '次へ';

  @override
  String get common_back => '戻る';

  @override
  String get common_continue => '続ける';

  @override
  String get common_loading => '読み込み中...';

  @override
  String get common_error => 'エラー';

  @override
  String get common_success => '成功';

  @override
  String get auth_login_title => 'サインイン';

  @override
  String get auth_register_title => 'サインアップ';

  @override
  String get auth_email_label => 'メールアドレス';

  @override
  String get auth_email_hint => 'example@email.com';

  @override
  String get auth_password_label => 'パスワード';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => '氏名';

  @override
  String get auth_name_hint => '山田太郎';

  @override
  String get auth_forgot_password => 'パスワードをお忘れですか？';

  @override
  String get auth_dont_have_account => 'アカウントをお持ちでないですか？';

  @override
  String get auth_already_have_account => 'すでにアカウントをお持ちですか？';

  @override
  String get auth_sign_in_button => 'サインイン';

  @override
  String get auth_sign_up_button => 'サインアップ';

  @override
  String get auth_sign_in_google => 'Googleでサインイン';

  @override
  String get auth_sign_up_google => 'Googleでサインアップ';

  @override
  String get auth_logout => 'ログアウト';

  @override
  String get auth_validation_email_required => 'メールアドレスを入力してください';

  @override
  String get auth_validation_email_invalid => '有効なメールアドレスを入力してください';

  @override
  String get auth_validation_password_required => 'パスワードを入力してください';

  @override
  String get auth_validation_password_min_length => 'パスワードは6文字以上必要です';

  @override
  String get auth_validation_name_required => '名前を入力してください';

  @override
  String get auth_validation_name_min_length => '名前は2文字以上必要です';

  @override
  String get auth_email_verification_title => 'メール確認';

  @override
  String get auth_email_verification_sent => '確認リンクを送信しました：';

  @override
  String get auth_email_verification_instruction => 'メールを確認し、確認リンクをクリックしてください。';

  @override
  String get auth_email_verification_not_received => 'メールが届きませんでしたか？';

  @override
  String get auth_email_verification_resend => '確認メールを再送信';

  @override
  String get auth_email_verification_check => 'メールを確認しました';

  @override
  String get auth_email_verification_success => 'メールが確認されました！';

  @override
  String get auth_email_verification_failed => 'メールはまだ確認されていません。受信箱を確認してください。';

  @override
  String get auth_forgot_password_title => 'パスワードリセット';

  @override
  String get auth_forgot_password_instruction =>
      'メールアドレスを入力すると、パスワードリセットリンクを送信します。';

  @override
  String get auth_forgot_password_button => 'リセットリンクを送信';

  @override
  String get auth_forgot_password_success => 'パスワードリセットメールを送信しました！';

  @override
  String get auth_back_to_login => 'サインインに戻る';

  @override
  String get home_title => 'ホーム';

  @override
  String get home_daily_goal => '1日の目標';

  @override
  String get home_today => '今日';

  @override
  String get home_custom_amount => 'カスタム量';

  @override
  String get home_amount_label => '量';

  @override
  String get home_add_water_success => '水を追加しました！';

  @override
  String get home_add_water_failed => '水の追加に失敗しました';

  @override
  String get home_delete_water_confirm => 'この記録を削除しますか？';

  @override
  String get home_delete_water_success => '記録を削除しました';

  @override
  String get home_no_records_today => '今日の記録はありません';

  @override
  String get home_start_drinking => '水を飲み始めましょう！';

  @override
  String get progress_current => '現在';

  @override
  String get progress_goal => '目標';

  @override
  String get progress_remaining => '残り';

  @override
  String get progress_completed => '目標達成！';

  @override
  String progress_percentage(int percent) {
    return '1日の目標の$percent%';
  }

  @override
  String get motivational_keep_going => '頑張って！素晴らしいです！';

  @override
  String get motivational_almost_there => 'もう少し！頑張って！';

  @override
  String get motivational_goal_reached => 'おめでとうございます！目標達成！';

  @override
  String get motivational_good_start => '良いスタート！続けましょう！';

  @override
  String get motivational_stay_hydrated => '一日中水分補給を！';

  @override
  String get motivational_100_1 => 'おめでとうございます！目標達成！';

  @override
  String get motivational_100_2 => '素晴らしい！明日も頑張りましょう！';

  @override
  String get motivational_100_3 => '水分補給のチャンピオンです！';

  @override
  String get motivational_100_4 => '完璧！良い習慣を続けましょう！';

  @override
  String get motivational_100_short => '目標達成！';

  @override
  String get motivational_75_1 => 'もう少し！頑張って！';

  @override
  String get motivational_75_2 => '素晴らしい！続けましょう！';

  @override
  String get motivational_75_3 => '目標まであと少し！';

  @override
  String get motivational_75_4 => '素晴らしい進捗！止まらないで！';

  @override
  String get motivational_75_short => 'もう少し！';

  @override
  String get motivational_50_1 => '半分達成！素晴らしい！';

  @override
  String get motivational_50_2 => '良い調子！続けましょう！';

  @override
  String get motivational_50_3 => '順調です！';

  @override
  String get motivational_50_4 => '良い進捗！一貫性を保ちましょう！';

  @override
  String get motivational_50_short => '半分！';

  @override
  String get motivational_25_1 => '良いスタート！水を飲み続けましょう！';

  @override
  String get motivational_25_2 => '素晴らしいスタート！';

  @override
  String get motivational_25_3 => '良い始まり！水分補給を！';

  @override
  String get motivational_25_4 => '続けましょう！一口一口が大切！';

  @override
  String get motivational_25_short => '良いスタート！';

  @override
  String get motivational_0_1 => '水分補給の時間！体が喜びます！';

  @override
  String get motivational_0_2 => '水分補給の旅を始めましょう！';

  @override
  String get motivational_0_3 => '水で一日を始めましょう！';

  @override
  String get motivational_0_4 => '健康が大切！飲み始めましょう！';

  @override
  String get motivational_0_short => '始めましょう！';

  @override
  String get profile_title => 'プロフィール';

  @override
  String get profile_edit => '編集';

  @override
  String get profile_personal_info => '個人情報';

  @override
  String get profile_body_metrics => '身体データ';

  @override
  String get profile_activity_level => '活動レベル';

  @override
  String get profile_name => '名前';

  @override
  String get profile_email => 'メール';

  @override
  String get profile_age => '年齢';

  @override
  String get profile_gender => '性別';

  @override
  String get profile_weight => '体重';

  @override
  String get profile_height => '身長';

  @override
  String get profile_bmi => 'BMI';

  @override
  String get profile_bmi_category => 'BMIカテゴリー';

  @override
  String get profile_daily_goal => '1日の水分目標';

  @override
  String get profile_use_calculated_goal => '計算された目標を使用';

  @override
  String get profile_custom_goal => 'カスタム目標';

  @override
  String get profile_save_success => 'プロフィールを更新しました';

  @override
  String get profile_save_failed => 'プロフィールの更新に失敗しました';

  @override
  String get profile_user_default => 'ユーザー';

  @override
  String get gender_male => '男性';

  @override
  String get gender_female => '女性';

  @override
  String get gender_other => 'その他';

  @override
  String get activity_sedentary => '座りがち';

  @override
  String get activity_light => '軽い運動';

  @override
  String get activity_moderate => '適度な運動';

  @override
  String get activity_very_active => '活発';

  @override
  String get activity_extra_active => '非常に活発';

  @override
  String get bmi_underweight => '低体重';

  @override
  String get bmi_normal => '標準体重';

  @override
  String get bmi_overweight => '過体重';

  @override
  String get bmi_obese => '肥満';

  @override
  String get settings_title => '設定';

  @override
  String get settings_notifications => '通知';

  @override
  String get settings_reminders => 'リマインダー';

  @override
  String get settings_theme => 'テーマ';

  @override
  String get settings_units => '単位';

  @override
  String get settings_language => '言語';

  @override
  String get settings_profile => 'プロフィール設定';

  @override
  String get settings_daily_goal => '目標設定';

  @override
  String get settings_data => 'データ管理';

  @override
  String get settings_export_data => 'データをエクスポート';

  @override
  String get settings_import_data => 'データをインポート';

  @override
  String get settings_help => 'ヘルプ';

  @override
  String get settings_about => 'アプリについて';

  @override
  String get settings_enable_notifications => '通知を有効にする';

  @override
  String get settings_reminder_interval => 'リマインダー間隔';

  @override
  String get settings_reminder_start_time => '開始時間';

  @override
  String get settings_reminder_end_time => '終了時間';

  @override
  String get settings_test_notification => '通知テスト';

  @override
  String get settings_theme_light => 'ライト';

  @override
  String get settings_theme_dark => 'ダーク';

  @override
  String get settings_theme_system => 'システム設定';

  @override
  String get settings_unit_ml => 'ミリリットル (ml)';

  @override
  String get settings_unit_floz => '液量オンス (fl oz)';

  @override
  String get settings_unit_metric => 'メートル法';

  @override
  String get settings_unit_imperial => 'ヤード・ポンド法';

  @override
  String get settings_subtitle => 'アプリをカスタマイズ';

  @override
  String get settings_reminders_active => 'リマインダーが有効です';

  @override
  String get settings_reminders_inactive => 'リマインダーを有効にする';

  @override
  String get settings_minutes => '分';

  @override
  String get settings_export_subtitle => 'データをバックアップ';

  @override
  String get settings_import_subtitle => 'バックアップから復元';

  @override
  String get settings_profile_subtitle => '情報を更新';

  @override
  String get settings_daily_goal_subtitle => '目標を管理';

  @override
  String get settings_theme_dialog_title => 'テーマ';

  @override
  String get settings_theme_light_mode => 'ライトモード';

  @override
  String get settings_theme_dark_mode => 'ダークモード';

  @override
  String get settings_theme_system_mode => 'システム設定';

  @override
  String get settings_theme_light_subtitle => 'ライトテーマを使用';

  @override
  String get settings_theme_dark_subtitle => 'ダークテーマを使用';

  @override
  String get settings_theme_system_subtitle => 'システム設定に従う';

  @override
  String get settings_language_dialog_title => '言語';

  @override
  String get settings_export_loading => 'エクスポート中...';

  @override
  String get settings_export_success_message => 'データをエクスポートしました！';

  @override
  String settings_export_failed_message(String error) {
    return 'エクスポート失敗: $error';
  }

  @override
  String get settings_import_loading => 'インポート中...';

  @override
  String get settings_import_complete => 'インポート完了';

  @override
  String get settings_import_success_subtitle => 'インポート成功:';

  @override
  String get settings_import_water_records => '件の水記録';

  @override
  String get settings_import_daily_goals => '件の目標';

  @override
  String get settings_import_duplicate_skipped => '件の重複をスキップ';

  @override
  String settings_import_failed_message(String error) {
    return 'インポート失敗: $error';
  }

  @override
  String get settings_reminder_interval_title => 'リマインダー間隔';

  @override
  String get settings_language_coming_soon => '近日公開';

  @override
  String get settings_export_success => 'データをエクスポートしました';

  @override
  String get settings_export_failed => 'エクスポートに失敗しました';

  @override
  String get settings_import_success => 'データをインポートしました';

  @override
  String get settings_import_failed => 'インポートに失敗しました';

  @override
  String settings_import_stats(int imported, int skipped) {
    return '$imported件をインポート、$skipped件の重複をスキップ';
  }

  @override
  String get statistics_title => '統計';

  @override
  String get statistics_weekly => '週間';

  @override
  String get statistics_monthly => '月間';

  @override
  String get statistics_yearly => '年間';

  @override
  String get statistics_average => '平均';

  @override
  String get statistics_total => '合計';

  @override
  String get statistics_best_day => '最高記録日';

  @override
  String get statistics_goal_achievement => '目標達成率';

  @override
  String get statistics_no_data => 'この期間のデータはありません';

  @override
  String get statistics_chart_label => '水分摂取量';

  @override
  String get achievements_title => '実績';

  @override
  String get achievements_unlocked => '解除済み';

  @override
  String get achievements_locked => '未解除';

  @override
  String get achievements_progress => '進捗';

  @override
  String get achievements_reward_points => '報酬ポイント';

  @override
  String achievements_total_points(int points) {
    return '合計ポイント: $points';
  }

  @override
  String get achievement_first_drop => '最初の一滴';

  @override
  String get achievement_first_drop_desc => '初めての水分記録';

  @override
  String get achievement_daily_goal_1 => '目標達成者';

  @override
  String get achievement_daily_goal_1_desc => '1日の目標を達成';

  @override
  String get achievement_streak_3 => '3日連続';

  @override
  String get achievement_streak_3_desc => '3日間の連続達成';

  @override
  String get achievement_streak_7 => '週間戦士';

  @override
  String get achievement_streak_7_desc => '7日間の連続達成';

  @override
  String get achievement_streak_30 => '月間マスター';

  @override
  String get achievement_streak_30_desc => '30日間の連続達成';

  @override
  String get achievement_total_10l => '10リットル';

  @override
  String get achievement_total_10l_desc => '合計10リットル達成';

  @override
  String get achievement_total_100l => '100リットル';

  @override
  String get achievement_total_100l_desc => '合計100リットル達成';

  @override
  String get achievement_consistency => '一貫性の週';

  @override
  String get achievement_consistency_desc => '7日連続で目標達成';

  @override
  String get reminders_title => 'リマインダー';

  @override
  String get reminders_active => '有効なリマインダー';

  @override
  String get reminders_pending => '保留中の通知';

  @override
  String get reminders_interval_30 => '30分ごと';

  @override
  String get reminders_interval_45 => '45分ごと';

  @override
  String get reminders_interval_60 => '1時間ごと';

  @override
  String get reminders_interval_90 => '1.5時間ごと';

  @override
  String get reminders_interval_120 => '2時間ごと';

  @override
  String get reminders_interval_180 => '3時間ごと';

  @override
  String get notification_reminder_title => '水を飲む時間です！';

  @override
  String get notification_reminder_body => '水分補給を忘れずに！';

  @override
  String get streak_current => '現在の連続';

  @override
  String streak_days(int days) {
    return '$days日';
  }

  @override
  String get streak_keep_going => '連続を続けましょう！';

  @override
  String get streak_personal_best => '自己ベスト';

  @override
  String get streak_best => '最高！';

  @override
  String get streak_longest => '最長';

  @override
  String get streak_next_milestone => '次のマイルストーン';

  @override
  String get streak_start_today => '今日から連続を始めよう！';

  @override
  String get streak_complete_goal => '目標達成で連続を作ろう';

  @override
  String get streak_start => '連続を始めよう！';

  @override
  String get streak_error => 'データの読み込みに失敗しました';

  @override
  String get streak_day_singular => '日';

  @override
  String get streak_day_plural => '日';

  @override
  String get onboarding_title_1 => '水分を記録';

  @override
  String get onboarding_desc_1 => 'タップするだけで簡単に水分摂取を記録';

  @override
  String get onboarding_title_2 => 'スマートリマインダー';

  @override
  String get onboarding_desc_2 => '一日中水分補給を忘れないようにリマインド';

  @override
  String get onboarding_title_3 => '進捗を確認';

  @override
  String get onboarding_desc_3 => '水分補給の統計を見て目標を達成';

  @override
  String get onboarding_title_4 => '健康を維持';

  @override
  String get onboarding_desc_4 => '健康的な習慣を身につけよう';

  @override
  String get onboarding_get_started => '始める';

  @override
  String get drawer_home => 'ホーム';

  @override
  String get drawer_statistics => '統計';

  @override
  String get drawer_achievements => '実績';

  @override
  String get drawer_profile => 'プロフィール';

  @override
  String get drawer_reminders => 'リマインダー';

  @override
  String get drawer_settings => '設定';

  @override
  String get drawer_help => 'ヘルプ';

  @override
  String get drawer_about => 'アプリについて';

  @override
  String get drawer_logout => 'ログアウト';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => 'バージョン 1.0.0';

  @override
  String get about_description => 'Aqualertで水分補給を管理。毎日の水分摂取を記録して目標を達成しましょう！';

  @override
  String get about_copyright => '© 2024 Aqualert. All rights reserved.';

  @override
  String get about_close => '閉じる';

  @override
  String get help_title => 'ヘルプ';

  @override
  String get help_subtitle => 'サポートを受ける';

  @override
  String get help_faq => 'よくある質問';

  @override
  String get help_contact => 'お問い合わせ';

  @override
  String get help_version => 'バージョン';

  @override
  String get help_app_info => 'アプリ情報';

  @override
  String get help_coming_soon => 'ヘルプ - 近日公開！';

  @override
  String get help_faq_section => 'FAQ';

  @override
  String get help_features_section => '機能ガイド';

  @override
  String get help_about_section => 'アプリについて';

  @override
  String get faq_1_q => '1日の水分目標はどのように計算されますか？';

  @override
  String get faq_1_a =>
      '体重、身長、年齢、性別、活動レベルに基づいて科学的な計算式で算出されます。プロフィール設定でカスタム目標も設定できます。';

  @override
  String get faq_2_q => 'リマインダーはどのように機能しますか？';

  @override
  String get faq_2_a => 'リマインダー間隔（30〜180分）と開始/終了時間を設定できます。この期間中にアプリが通知を送信します。';

  @override
  String get faq_3_q => '連続とは何ですか？';

  @override
  String get faq_3_a => '連続は、毎日の目標を達成した連続日数を追跡します。毎日水を飲んで連続を増やしましょう！';

  @override
  String get faq_4_q => '単位を変更するには？';

  @override
  String get faq_4_a =>
      '設定→単位でミリリットル（ml）と液量オンス（fl oz）を切り替えられます。すべての測定値が自動的に更新されます。';

  @override
  String get faq_5_q => 'データをエクスポートできますか？';

  @override
  String get faq_5_a => 'はい！設定→データ管理→データをエクスポートでJSONファイルとして保存し、後でインポートできます。';

  @override
  String get faq_6_q => '実績はどのように機能しますか？';

  @override
  String get faq_6_a =>
      '水分記録のマイルストーンを達成すると実績が解除され、報酬ポイントを獲得できます。実績画面で進捗を確認できます。';

  @override
  String get feature_tracking_title => '水分記録';

  @override
  String get feature_tracking_desc =>
      'クイック追加ボタン（250ml、350ml、500ml、750ml）またはカスタム量で簡単に水分摂取を記録できます。';

  @override
  String get feature_reminders_title => 'スマートリマインダー';

  @override
  String get feature_reminders_desc => 'リマインダー間隔と有効時間を設定。一日中水分補給を忘れません。';

  @override
  String get feature_statistics_title => '統計と分析';

  @override
  String get feature_statistics_desc => '週間、月間、年間のチャートで水分摂取のトレンドを確認できます。';

  @override
  String get feature_achievements_title => '実績と連続';

  @override
  String get feature_achievements_desc =>
      '目標を達成して実績を獲得し、連続を維持しましょう。ゲーミフィケーションでモチベーションアップ！';

  @override
  String get feature_profile_title => 'プロフィールと目標';

  @override
  String get feature_profile_desc => '個人情報を設定すると、アプリが最適な1日の水分目標を計算します。';

  @override
  String get help_contact_email => 'メールで連絡';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => 'アプリを評価';

  @override
  String get help_rate_desc => 'Aqualertを気に入りましたか？レビューをお願いします！';

  @override
  String get help_build_number => 'ビルド';

  @override
  String get help_copyright => '© 2024 Aqualert. All rights reserved.';

  @override
  String get help_made_with => 'あなたの健康のために❤️で作られました';

  @override
  String get error_generic => 'エラーが発生しました。もう一度お試しください。';

  @override
  String get error_network => 'ネットワークエラー。接続を確認してください。';

  @override
  String get error_auth_failed => '認証に失敗しました。もう一度お試しください。';

  @override
  String get error_permission_denied => '権限が拒否されました。';

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
  String get time_morning => '朝';

  @override
  String get time_afternoon => '午後';

  @override
  String get time_evening => '夕方';

  @override
  String get time_night => '夜';

  @override
  String get help_privacy_policy => 'プライバシーポリシー';

  @override
  String get help_privacy_policy_desc => 'プライバシーポリシーを表示';

  @override
  String get help_privacy_policy_error => 'プライバシーポリシーを開けませんでした';
}
