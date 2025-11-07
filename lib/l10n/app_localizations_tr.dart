// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => 'Sağlıklı yaşam için su içmeyi unutma';

  @override
  String get common_cancel => 'İptal';

  @override
  String get common_save => 'Kaydet';

  @override
  String get common_delete => 'Sil';

  @override
  String get common_edit => 'Düzenle';

  @override
  String get common_add => 'Ekle';

  @override
  String get common_ok => 'Tamam';

  @override
  String get common_yes => 'Evet';

  @override
  String get common_no => 'Hayır';

  @override
  String get common_or => 'veya';

  @override
  String get common_done => 'Bitti';

  @override
  String get common_skip => 'Geç';

  @override
  String get common_next => 'İleri';

  @override
  String get common_back => 'Geri';

  @override
  String get common_continue => 'Devam Et';

  @override
  String get common_loading => 'Yükleniyor...';

  @override
  String get common_error => 'Hata';

  @override
  String get common_success => 'Başarılı';

  @override
  String get auth_login_title => 'Giriş Yap';

  @override
  String get auth_register_title => 'Kayıt Ol';

  @override
  String get auth_email_label => 'E-posta';

  @override
  String get auth_email_hint => 'ornek@email.com';

  @override
  String get auth_password_label => 'Şifre';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => 'Ad Soyad';

  @override
  String get auth_name_hint => 'Ahmet Yılmaz';

  @override
  String get auth_forgot_password => 'Şifremi Unuttum?';

  @override
  String get auth_dont_have_account => 'Hesabın yok mu? ';

  @override
  String get auth_already_have_account => 'Zaten hesabın var mı? ';

  @override
  String get auth_sign_in_button => 'Giriş Yap';

  @override
  String get auth_sign_up_button => 'Kayıt Ol';

  @override
  String get auth_sign_in_google => 'Google ile Giriş Yap';

  @override
  String get auth_sign_up_google => 'Google ile Kayıt Ol';

  @override
  String get auth_logout => 'Çıkış Yap';

  @override
  String get auth_validation_email_required => 'E-posta adresi gerekli';

  @override
  String get auth_validation_email_invalid =>
      'Geçerli bir e-posta adresi girin';

  @override
  String get auth_validation_password_required => 'Şifre gerekli';

  @override
  String get auth_validation_password_min_length =>
      'Şifre en az 6 karakter olmalı';

  @override
  String get auth_validation_name_required => 'Ad gerekli';

  @override
  String get auth_validation_name_min_length => 'Ad en az 2 karakter olmalı';

  @override
  String get auth_email_verification_title => 'E-postanı Doğrula';

  @override
  String get auth_email_verification_sent =>
      'Doğrulama bağlantısını gönderdik:';

  @override
  String get auth_email_verification_instruction =>
      'Lütfen e-postanı kontrol et ve devam etmek için doğrulama bağlantısına tıkla.';

  @override
  String get auth_email_verification_not_received => 'E-posta almadın mı?';

  @override
  String get auth_email_verification_resend => 'Doğrulama E-postası Gönder';

  @override
  String get auth_email_verification_check => 'E-postamı doğruladım';

  @override
  String get auth_email_verification_success => 'E-posta başarıyla doğrulandı!';

  @override
  String get auth_email_verification_failed =>
      'E-posta henüz doğrulanmadı. Lütfen gelen kutunu kontrol et.';

  @override
  String get auth_forgot_password_title => 'Şifre Sıfırla';

  @override
  String get auth_forgot_password_instruction =>
      'E-posta adresini gir, sana şifreni sıfırlaman için bir bağlantı gönderelim.';

  @override
  String get auth_forgot_password_button => 'Sıfırlama Bağlantısı Gönder';

  @override
  String get auth_forgot_password_success =>
      'Şifre sıfırlama e-postası gönderildi! Gelen kutunu kontrol et.';

  @override
  String get auth_back_to_login => 'Giriş Sayfasına Dön';

  @override
  String get home_title => 'Ana Sayfa';

  @override
  String get home_daily_goal => 'Günlük Hedef';

  @override
  String get home_today => 'Bugün';

  @override
  String get home_custom_amount => 'Özel Miktar';

  @override
  String get home_amount_label => 'Miktar';

  @override
  String get home_add_water_success => 'Su başarıyla eklendi!';

  @override
  String get home_add_water_failed => 'Su eklenemedi';

  @override
  String get home_delete_water_confirm => 'Bu su kaydını sil?';

  @override
  String get home_delete_water_success => 'Su kaydı silindi';

  @override
  String get home_no_records_today => 'Bugün su kaydı yok';

  @override
  String get home_start_drinking => 'Su içmeye başla!';

  @override
  String get progress_current => 'Mevcut';

  @override
  String get progress_goal => 'Hedef';

  @override
  String get progress_remaining => 'Kalan';

  @override
  String get progress_completed => 'Hedef tamamlandı!';

  @override
  String progress_percentage(int percent) {
    return 'Günlük hedefin %$percent\'i';
  }

  @override
  String get motivational_keep_going => 'Devam et! Harika gidiyorsun!';

  @override
  String get motivational_almost_there => 'Neredeyse bitti! Biraz daha!';

  @override
  String get motivational_goal_reached => 'Tebrikler! Hedefe ulaştın!';

  @override
  String get motivational_good_start => 'Harika bir başlangıç! Devam et!';

  @override
  String get motivational_stay_hydrated => 'Gün boyunca bol su iç!';

  @override
  String get profile_title => 'Profil';

  @override
  String get profile_edit => 'Profili Düzenle';

  @override
  String get profile_personal_info => 'Kişisel Bilgiler';

  @override
  String get profile_body_metrics => 'Vücut Ölçüleri';

  @override
  String get profile_activity_level => 'Aktivite Seviyesi';

  @override
  String get profile_name => 'Ad';

  @override
  String get profile_email => 'E-posta';

  @override
  String get profile_age => 'Yaş';

  @override
  String get profile_gender => 'Cinsiyet';

  @override
  String get profile_weight => 'Kilo';

  @override
  String get profile_height => 'Boy';

  @override
  String get profile_bmi => 'BMI';

  @override
  String get profile_bmi_category => 'BMI Kategorisi';

  @override
  String get profile_daily_goal => 'Günlük Su Hedefi';

  @override
  String get profile_use_calculated_goal => 'Hesaplanan Hedefi Kullan';

  @override
  String get profile_custom_goal => 'Özel Hedef';

  @override
  String get profile_save_success => 'Profil başarıyla güncellendi';

  @override
  String get profile_save_failed => 'Profil güncellenemedi';

  @override
  String get gender_male => 'Erkek';

  @override
  String get gender_female => 'Kadın';

  @override
  String get gender_other => 'Diğer';

  @override
  String get activity_sedentary => 'Hareketsiz';

  @override
  String get activity_light => 'Az Hareketli';

  @override
  String get activity_moderate => 'Orta Hareketli';

  @override
  String get activity_very_active => 'Çok Hareketli';

  @override
  String get activity_extra_active => 'Son Derece Hareketli';

  @override
  String get bmi_underweight => 'Zayıf';

  @override
  String get bmi_normal => 'Normal Kilo';

  @override
  String get bmi_overweight => 'Fazla Kilolu';

  @override
  String get bmi_obese => 'Obez';

  @override
  String get settings_title => 'Ayarlar';

  @override
  String get settings_notifications => 'Bildirimler';

  @override
  String get settings_reminders => 'Hatırlatıcılar';

  @override
  String get settings_theme => 'Tema';

  @override
  String get settings_units => 'Birimler';

  @override
  String get settings_language => 'Dil';

  @override
  String get settings_profile => 'Profil Ayarları';

  @override
  String get settings_daily_goal => 'Günlük Hedef Ayarları';

  @override
  String get settings_data => 'Veri Yönetimi';

  @override
  String get settings_export_data => 'Verileri Dışa Aktar';

  @override
  String get settings_import_data => 'Verileri İçe Aktar';

  @override
  String get settings_help => 'Yardım ve Destek';

  @override
  String get settings_about => 'Hakkında';

  @override
  String get settings_enable_notifications => 'Bildirimleri Etkinleştir';

  @override
  String get settings_reminder_interval => 'Hatırlatma Aralığı';

  @override
  String get settings_reminder_start_time => 'Başlangıç Saati';

  @override
  String get settings_reminder_end_time => 'Bitiş Saati';

  @override
  String get settings_test_notification => 'Test Bildirimi';

  @override
  String get settings_theme_light => 'Açık';

  @override
  String get settings_theme_dark => 'Koyu';

  @override
  String get settings_theme_system => 'Sistem Varsayılanı';

  @override
  String get settings_unit_ml => 'Mililitre (ml)';

  @override
  String get settings_unit_floz => 'Sıvı Ons (fl oz)';

  @override
  String get settings_language_coming_soon => 'Yakında Gelecek';

  @override
  String get settings_export_success => 'Veriler başarıyla dışa aktarıldı';

  @override
  String get settings_export_failed => 'Veriler dışa aktarılamadı';

  @override
  String get settings_import_success => 'Veriler başarıyla içe aktarıldı';

  @override
  String get settings_import_failed => 'Veriler içe aktarılamadı';

  @override
  String settings_import_stats(int imported, int skipped) {
    return '$imported kayıt içe aktarıldı, $skipped tekrarlanan atlandı';
  }

  @override
  String get statistics_title => 'İstatistikler';

  @override
  String get statistics_weekly => 'Haftalık';

  @override
  String get statistics_monthly => 'Aylık';

  @override
  String get statistics_yearly => 'Yıllık';

  @override
  String get statistics_average => 'Ortalama';

  @override
  String get statistics_total => 'Toplam';

  @override
  String get statistics_best_day => 'En İyi Gün';

  @override
  String get statistics_goal_achievement => 'Hedef Başarısı';

  @override
  String get statistics_no_data => 'Bu dönem için veri yok';

  @override
  String get statistics_chart_label => 'Su Tüketimi';

  @override
  String get achievements_title => 'Başarımlar';

  @override
  String get achievements_unlocked => 'Açıldı';

  @override
  String get achievements_locked => 'Kilitli';

  @override
  String get achievements_progress => 'İlerleme';

  @override
  String get achievements_reward_points => 'Ödül Puanları';

  @override
  String achievements_total_points(int points) {
    return 'Toplam Puan: $points';
  }

  @override
  String get achievement_first_drop => 'İlk Damla';

  @override
  String get achievement_first_drop_desc => 'İlk su kaydını ekle';

  @override
  String get achievement_daily_goal_1 => 'Hedef Başarıcı';

  @override
  String get achievement_daily_goal_1_desc => 'Günlük hedefe bir kez ulaş';

  @override
  String get achievement_streak_3 => '3 Günlük Seri';

  @override
  String get achievement_streak_3_desc => '3 günlük seriyi sürdür';

  @override
  String get achievement_streak_7 => 'Hafta Savaşçısı';

  @override
  String get achievement_streak_7_desc => '7 günlük seriyi sürdür';

  @override
  String get achievement_streak_30 => 'Ay Ustası';

  @override
  String get achievement_streak_30_desc => '30 günlük seriyi sürdür';

  @override
  String get achievement_total_10l => '10 Litre';

  @override
  String get achievement_total_10l_desc => 'Toplam 10 litre iç';

  @override
  String get achievement_total_100l => '100 Litre';

  @override
  String get achievement_total_100l_desc => 'Toplam 100 litre iç';

  @override
  String get achievement_consistency => 'Tutarlılık Haftası';

  @override
  String get achievement_consistency_desc => '7 gün üst üste hedefe ulaş';

  @override
  String get reminders_title => 'Hatırlatıcılar';

  @override
  String get reminders_active => 'Aktif Hatırlatıcılar';

  @override
  String get reminders_pending => 'Bekleyen Bildirimler';

  @override
  String get reminders_interval_30 => 'Her 30 dakikada';

  @override
  String get reminders_interval_45 => 'Her 45 dakikada';

  @override
  String get reminders_interval_60 => 'Her saatte';

  @override
  String get reminders_interval_90 => 'Her 1.5 saatte';

  @override
  String get reminders_interval_120 => 'Her 2 saatte';

  @override
  String get reminders_interval_180 => 'Her 3 saatte';

  @override
  String get notification_reminder_title => 'Su İçme Zamanı!';

  @override
  String get notification_reminder_body => 'Susuz kalma! Şimdi biraz su iç.';

  @override
  String get streak_current => 'Mevcut Seri';

  @override
  String streak_days(int days) {
    return '$days gün';
  }

  @override
  String get streak_keep_going => 'Serini sürdür!';

  @override
  String get onboarding_title_1 => 'Suyunu Takip Et';

  @override
  String get onboarding_desc_1 =>
      'Günlük su tüketimini tek dokunuşla kolayca kaydet';

  @override
  String get onboarding_title_2 => 'Akıllı Hatırlatıcılar';

  @override
  String get onboarding_desc_2 =>
      'Gün boyunca susuz kalmamak için zamanında hatırlatmalar al';

  @override
  String get onboarding_title_3 => 'İlerlemeni İzle';

  @override
  String get onboarding_desc_3 =>
      'Hidrasyon istatistiklerini gör ve hedeflerine ulaş';

  @override
  String get onboarding_title_4 => 'Sağlıklı Kal';

  @override
  String get onboarding_desc_4 =>
      'Sağlıklı alışkanlıklar geliştir ve genel sağlığını iyileştir';

  @override
  String get onboarding_get_started => 'Başlayalım';

  @override
  String get drawer_home => 'Ana Sayfa';

  @override
  String get drawer_statistics => 'İstatistikler';

  @override
  String get drawer_achievements => 'Başarımlar';

  @override
  String get drawer_profile => 'Profil';

  @override
  String get drawer_reminders => 'Hatırlatıcılar';

  @override
  String get drawer_settings => 'Ayarlar';

  @override
  String get drawer_help => 'Yardım ve Destek';

  @override
  String get help_title => 'Yardım ve Destek';

  @override
  String get help_faq => 'Sık Sorulan Sorular';

  @override
  String get help_contact => 'Bize Ulaş';

  @override
  String get help_version => 'Sürüm';

  @override
  String get error_generic => 'Bir şeyler ters gitti. Lütfen tekrar dene.';

  @override
  String get error_network => 'Ağ hatası. Lütfen bağlantını kontrol et.';

  @override
  String get error_auth_failed =>
      'Kimlik doğrulama başarısız. Lütfen tekrar dene.';

  @override
  String get error_permission_denied => 'İzin reddedildi.';

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
  String get time_morning => 'Sabah';

  @override
  String get time_afternoon => 'Öğleden Sonra';

  @override
  String get time_evening => 'Akşam';

  @override
  String get time_night => 'Gece';
}
