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
  String get auth_validation_password_mismatch => 'Şifreler eşleşmiyor';

  @override
  String get auth_validation_name_required => 'Ad gerekli';

  @override
  String get auth_validation_name_min_length => 'Ad en az 2 karakter olmalı';

  @override
  String get auth_confirm_password_label => 'Şifre Tekrar';

  @override
  String get auth_confirm_password_hint => 'Şifrenizi tekrar girin';

  @override
  String auth_resend_countdown(int seconds) {
    return '$seconds saniye sonra tekrar gönder';
  }

  @override
  String get auth_verification_check_failed =>
      'Doğrulama durumu kontrol edilemedi';

  @override
  String get auth_verification_send_failed =>
      'Doğrulama e-postası gönderilemedi';

  @override
  String get auth_signout_failed => 'Çıkış yapılamadı';

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
  String get home_todays_progress => 'Bugünkü İlerleme';

  @override
  String get home_quick_add => 'Hızlı Ekle';

  @override
  String home_amount_to_go(String amount) {
    return '$amount kaldı!';
  }

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
  String get motivational_100_1 => 'Tebrikler! Hedefe ulaştın!';

  @override
  String get motivational_100_2 => 'Harika iş! Yarın da susuz kalma!';

  @override
  String get motivational_100_3 => 'Hidrasyon şampiyonusun!';

  @override
  String get motivational_100_4 => 'Mükemmel! Bu harika alışkanlığını sürdür!';

  @override
  String get motivational_100_short => 'Hedefe Ulaşıldı!';

  @override
  String get motivational_75_1 => 'Neredeyse bitti! Biraz daha!';

  @override
  String get motivational_75_2 => 'Harika gidiyorsun! Devam et!';

  @override
  String get motivational_75_3 => 'Hedefe çok yakınsın!';

  @override
  String get motivational_75_4 => 'Fantastik ilerleme! Şimdi durma!';

  @override
  String get motivational_75_short => 'Neredeyse bitti!';

  @override
  String get motivational_50_1 => 'Yarıladın! Harika gidiyorsun!';

  @override
  String get motivational_50_2 => 'Harika iş! Devam et!';

  @override
  String get motivational_50_3 => 'Doğru yoldasın!';

  @override
  String get motivational_50_4 => 'Güzel ilerleme! Tutarlı ol!';

  @override
  String get motivational_50_short => 'Yarıda!';

  @override
  String get motivational_25_1 => 'İyi bir başlangıç! Su içmeye devam et!';

  @override
  String get motivational_25_2 => 'Harika bir başlangıç yaptın!';

  @override
  String get motivational_25_3 => 'Güzel başlangıç! Susuz kalma!';

  @override
  String get motivational_25_4 => 'Devam et! Her yudum önemli!';

  @override
  String get motivational_25_short => 'İyi başlangıç!';

  @override
  String get motivational_0_1 =>
      'Hidrasyon zamanı! Vücudun sana teşekkür edecek!';

  @override
  String get motivational_0_2 => 'Hadi hidrasyon yolculuğuna başlayalım!';

  @override
  String get motivational_0_3 => 'Güne biraz suyla başla!';

  @override
  String get motivational_0_4 => 'Sağlığın önemli! İçmeye başla!';

  @override
  String get motivational_0_short => 'Hadi başlayalım!';

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
  String get profile_user_default => 'Kullanıcı';

  @override
  String get profile_validation_name_required => 'Ad gerekli';

  @override
  String get profile_validation_age_invalid => 'Yaş 1 ile 120 arasında olmalı';

  @override
  String get profile_validation_weight_invalid =>
      'Kilo 10 ile 500 kg arasında olmalı';

  @override
  String get profile_validation_height_invalid =>
      'Boy 50 ile 300 cm arasında olmalı';

  @override
  String get gender_male => 'Erkek';

  @override
  String get gender_female => 'Kadın';

  @override
  String get gender_other => 'Diğer';

  @override
  String get activity_sedentary => 'Hareketsiz';

  @override
  String get activity_sedentary_desc => 'Çok az veya hiç egzersiz yok';

  @override
  String get activity_light => 'Az Hareketli';

  @override
  String get activity_light_desc => 'Haftada 1-3 gün hafif egzersiz';

  @override
  String get activity_moderate => 'Orta Hareketli';

  @override
  String get activity_moderate_desc => 'Haftada 3-5 gün orta düzey egzersiz';

  @override
  String get activity_very_active => 'Çok Hareketli';

  @override
  String get activity_very_active_desc => 'Haftada 6-7 gün yoğun egzersiz';

  @override
  String get activity_extra_active => 'Son Derece Hareketli';

  @override
  String get activity_extra_active_desc => 'Çok yoğun egzersiz ve fiziksel iş';

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
  String get settings_unit_metric => 'Metrik sistem';

  @override
  String get settings_unit_imperial => 'İngiliz sistemi';

  @override
  String get settings_subtitle => 'Deneyimini özelleştir';

  @override
  String get settings_reminders_active => 'Su hatırlatıcıları aktif';

  @override
  String get settings_reminders_inactive =>
      'Hatırlatıcıları açmak için etkinleştir';

  @override
  String get settings_minutes => 'dakika';

  @override
  String get settings_export_subtitle => 'Su takip verilerini yedekle';

  @override
  String get settings_import_subtitle => 'Yedek dosyadan geri yükle';

  @override
  String get settings_profile_subtitle => 'Bilgilerini güncelle';

  @override
  String get settings_daily_goal_subtitle => 'Su hedefini yönet';

  @override
  String get settings_theme_dialog_title => 'Tema';

  @override
  String get settings_theme_light_mode => 'Açık Mod';

  @override
  String get settings_theme_dark_mode => 'Koyu Mod';

  @override
  String get settings_theme_system_mode => 'Sistem Varsayılanı';

  @override
  String get settings_theme_light_subtitle => 'Açık tema kullan';

  @override
  String get settings_theme_dark_subtitle => 'Koyu tema kullan';

  @override
  String get settings_theme_system_subtitle => 'Sistem temasını takip et';

  @override
  String get settings_language_dialog_title => 'Dil';

  @override
  String get settings_system_language => 'Sistem Dili';

  @override
  String get settings_use_device_language => 'Cihaz dilini kullan';

  @override
  String get settings_export_loading => 'Veriler dışa aktarılıyor...';

  @override
  String get settings_export_success_message =>
      'Veriler başarıyla dışa aktarıldı!';

  @override
  String settings_export_failed_message(String error) {
    return 'Dışa aktarma başarısız: $error';
  }

  @override
  String get settings_import_loading => 'Veriler içe aktarılıyor...';

  @override
  String get settings_import_complete => 'İçe Aktarma Tamamlandı';

  @override
  String get settings_import_success_subtitle => 'Başarıyla içe aktarıldı:';

  @override
  String get settings_import_water_records => 'su kaydı';

  @override
  String get settings_import_daily_goals => 'günlük hedef';

  @override
  String get settings_import_duplicate_skipped => 'tekrarlanan kayıt atlandı';

  @override
  String settings_import_failed_message(String error) {
    return 'İçe aktarma başarısız: $error';
  }

  @override
  String get settings_reminder_interval_title => 'Hatırlatma Aralığı';

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
  String get statistics_total_intake => 'Toplam Tüketim';

  @override
  String get statistics_total_consumed => 'Toplam tüketilen';

  @override
  String get statistics_daily_average => 'Günlük ortalama';

  @override
  String get statistics_goals_met => 'Hedefe Ulaşılan';

  @override
  String statistics_out_of(int count) {
    return '$count günden';
  }

  @override
  String get statistics_progress => 'İlerleme';

  @override
  String get statistics_on_track => 'Yolunda!';

  @override
  String get statistics_keep_going => 'Devam et!';

  @override
  String get statistics_daily_intake => 'Günlük Tüketim';

  @override
  String get statistics_below_goal => 'Hedefin Altında';

  @override
  String get statistics_goal_met_label => 'Hedefe Ulaşıldı';

  @override
  String get statistics_your_streak => 'Serin';

  @override
  String get statistics_current => 'Mevcut';

  @override
  String get statistics_best => 'En İyi';

  @override
  String get statistics_completed => 'Tamamlanan';

  @override
  String get statistics_next_goal => 'Sonraki Hedef';

  @override
  String get statistics_days => 'gün';

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
  String get achievement_consistency_month => 'Aylık Tutarlılık';

  @override
  String get achievement_consistency_month_desc =>
      '30 gün boyunca hedefini tutarlı şekilde karşıladın';

  @override
  String get achievement_daily_goal_5 => '5 Hedef Tamamlandı';

  @override
  String get achievement_daily_goal_5_desc => '5 kez günlük hedefine ulaştın';

  @override
  String get achievement_daily_goal_10 => '10 Hedef Tamamlandı';

  @override
  String get achievement_daily_goal_10_desc => '10 kez günlük hedefine ulaştın';

  @override
  String get achievement_daily_goal_30 => '30 Hedef Tamamlandı';

  @override
  String get achievement_daily_goal_30_desc => '30 kez günlük hedefine ulaştın';

  @override
  String get achievement_streak_14 => '14 Günlük Seri';

  @override
  String get achievement_streak_14_desc => '14 gün art arda su içtin';

  @override
  String get achievement_streak_60 => '60 Günlük Seri';

  @override
  String get achievement_streak_60_desc => '60 gün art arda su içtin';

  @override
  String get achievement_total_1l => 'İlk Litre';

  @override
  String get achievement_total_1l_desc => 'Toplamda 1 litre su içtin';

  @override
  String get achievement_total_5l => '5 Litre';

  @override
  String get achievement_total_5l_desc => 'Toplamda 5 litre su içtin';

  @override
  String get achievement_total_50l => '50 Litre';

  @override
  String get achievement_total_50l_desc => 'Toplamda 50 litre su içtin';

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
  String get reminders_reschedule => 'Hatırlatıcıları Yeniden Planla';

  @override
  String get reminders_reschedule_subtitle =>
      'Bekleyen tüm bildirimleri güncelle';

  @override
  String get reminders_cancel_all => 'Tüm Hatırlatıcıları İptal Et';

  @override
  String get reminders_cancel_all_subtitle =>
      'Bekleyen tüm bildirimleri kaldır';

  @override
  String get reminders_schedule_success => 'Hatırlatıcılar başarıyla planlandı';

  @override
  String get reminders_cancel_success => 'Tüm hatırlatıcılar iptal edildi';

  @override
  String get reminders_info_message =>
      'Hatırlatıcılar gün boyunca su içmenize yardımcı olur. Programınızı Ayarlar\'dan özelleştirin.';

  @override
  String get reminders_schedule_info => 'Mevcut Program';

  @override
  String get reminders_premium_custom_title =>
      'Premium: Özel Saatli Hatırlatıcılar';

  @override
  String get reminders_custom_description =>
      'Sınırsız, kendi saatlerinle hatırlatıcı ekle';

  @override
  String get reminders_custom_add_button => 'Özel Saat Ekle';

  @override
  String reminders_custom_added(String time) {
    return 'Özel hatırlatıcı eklendi: $time';
  }

  @override
  String get notification_reminder_title => 'Su İçme Zamanı!';

  @override
  String get notification_reminder_body => 'Susuz kalma! Şimdi biraz su iç.';

  @override
  String get notification_title_1 => 'Su İçme Zamanı!';

  @override
  String get notification_title_2 => 'Su Molası!';

  @override
  String get notification_title_3 => 'Susuz Kalma!';

  @override
  String get notification_title_4 => 'Biraz Su İç!';

  @override
  String get notification_title_5 => 'Hidrasyon Vakti!';

  @override
  String get notification_title_6 => 'Su Hatırlatıcısı!';

  @override
  String get notification_title_7 => 'Kendine İyi Bak!';

  @override
  String get notification_body_1 =>
      'Su içme zamanı! Vücudunun hidrasyon ihtiyacı var.';

  @override
  String get notification_body_2 => 'Gün boyunca su içmeyi unutma!';

  @override
  String get notification_body_3 => 'Kısa bir su molası enerjini artırabilir!';

  @override
  String get notification_body_4 =>
      'Sağlığın önemli! Bir dakikanı ayırıp su iç.';

  @override
  String get notification_body_5 => 'Vücudunu ferahlatıcı bir su ile mutlu et!';

  @override
  String get notification_body_6 => 'Sağlıklı ve susuz kal! Haydi iç!';

  @override
  String get notification_body_7 => 'Su molası zamanı! Harika gidiyorsun!';

  @override
  String get notification_body_8 =>
      'Düzenli su içmeyi unutma, sağlığın için önemli!';

  @override
  String get streak_current => 'Mevcut Seri';

  @override
  String streak_days(int days) {
    return '$days gün';
  }

  @override
  String get streak_keep_going => 'Serini sürdür!';

  @override
  String get streak_personal_best => 'Kişisel Rekor';

  @override
  String get streak_best => 'Rekor!';

  @override
  String get streak_longest => 'En Uzun';

  @override
  String get streak_next_milestone => 'Sonraki Kilometre Taşı';

  @override
  String get streak_start_today => 'Bugün Serini Başlat!';

  @override
  String get streak_complete_goal =>
      'Seri oluşturmak için günlük hedefinize ulaşın';

  @override
  String get streak_start => 'Serini başlat!';

  @override
  String get streak_error => 'Seri verileri yüklenemedi';

  @override
  String get streak_day_singular => 'gün';

  @override
  String get streak_day_plural => 'gün';

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
  String get drawer_about => 'Hakkında';

  @override
  String get drawer_logout => 'Çıkış Yap';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => 'Sürüm 1.0.0';

  @override
  String get about_description =>
      'Aqualert ile sağlıklı kal ve susuz kalma. Günlük su tüketimini takip et ve hidrasyon hedeflerine ulaş!';

  @override
  String get about_copyright => '© 2024 Aqualert. Tüm hakları saklıdır.';

  @override
  String get about_close => 'Kapat';

  @override
  String get help_title => 'Yardım ve Destek';

  @override
  String get help_subtitle => 'Yardım alın ve daha fazlasını öğrenin';

  @override
  String get help_faq => 'Sık Sorulan Sorular';

  @override
  String get help_contact => 'Bize Ulaş';

  @override
  String get help_version => 'Sürüm';

  @override
  String get help_app_info => 'Uygulama Bilgileri';

  @override
  String get help_coming_soon => 'Yardım ve Destek - Yakında Gelecek!';

  @override
  String get help_faq_section => 'Sık Sorulan Sorular';

  @override
  String get help_features_section => 'Özellikler Rehberi';

  @override
  String get help_about_section => 'Hakkında';

  @override
  String get faq_1_q => 'Günlük su hedefim nasıl hesaplanıyor?';

  @override
  String get faq_1_a =>
      'Günlük su hedefiniz kilo, boy, yaş, cinsiyet ve aktivite seviyenize göre bilimsel formüller kullanılarak hesaplanır. Profil ayarlarından özel hedef de belirleyebilirsiniz.';

  @override
  String get faq_2_q => 'Su hatırlatıcıları nasıl çalışır?';

  @override
  String get faq_2_a =>
      'Hatırlatma aralıkları (30-180 dakika) belirleyip başlangıç/bitiş saatleri seçebilirsiniz. Uygulama bu dönemde susuz kalmamanız için bildirim gönderir.';

  @override
  String get faq_3_q => 'Seriler nedir ve nasıl çalışır?';

  @override
  String get faq_3_a =>
      'Seriler, günlük su hedefinize ulaştığınız ardışık günleri takip eder. Serinizi sürdürmek ve artırmak için her gün su içmeye devam edin!';

  @override
  String get faq_4_q => 'Ölçü birimlerini nasıl değiştirebilirim?';

  @override
  String get faq_4_a =>
      'Ayarlar → Birimler bölümünden mililitre (ml) ve sıvı ons (fl oz) arasında geçiş yapabilirsiniz. Tüm ölçümler otomatik güncellenir.';

  @override
  String get faq_5_q => 'Su takip verilerimi dışa aktarabilir miyim?';

  @override
  String get faq_5_a =>
      'Evet! Ayarlar → Veri Yönetimi → Verileri Dışa Aktar\'a gidin. Verilerinizi JSON dosyası olarak paylaşabilir veya kaydedip sonra içe aktarabilirsiniz.';

  @override
  String get faq_6_q => 'Başarımlar nasıl çalışır?';

  @override
  String get faq_6_a =>
      'Su takip kilometre taşlarını tamamlayarak başarımların kilidini açın ve ödül puanları kazanın. İlerlemelerinizi Başarımlar ekranından takip edin.';

  @override
  String get feature_tracking_title => 'Su Takibi';

  @override
  String get feature_tracking_desc =>
      'Hızlı ekleme butonları (250ml, 350ml, 500ml, 750ml) veya özel miktar girerek günlük su tüketiminizi kolayca kaydedin.';

  @override
  String get feature_reminders_title => 'Akıllı Hatırlatıcılar';

  @override
  String get feature_reminders_desc =>
      'Özelleştirilebilir hatırlatma aralıkları belirleyin ve aktif saatleri seçin. Gün boyunca su içmeyi asla unutmayın.';

  @override
  String get feature_statistics_title => 'İstatistikler ve İçgörüler';

  @override
  String get feature_statistics_desc =>
      'Haftalık, aylık ve yıllık grafiklerle su tüketim trendlerinizi görüntüleyin. Zaman içindeki ilerlemenizi takip edin.';

  @override
  String get feature_achievements_title => 'Başarımlar ve Seriler';

  @override
  String get feature_achievements_desc =>
      'Su hedeflerinize ulaşarak başarımlar kazanın ve günlük serilerinizi sürdürün. Oyunlaştırma ile motive kalın!';

  @override
  String get feature_profile_title => 'Profil ve Hedefler';

  @override
  String get feature_profile_desc =>
      'Kişisel bilgilerinizi girin ve uygulamanın vücut ölçülerinize göre optimal günlük su hedefinizi hesaplamasını sağlayın.';

  @override
  String get help_contact_email => 'E-posta ile İletişim';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => 'Uygulamayı Değerlendir';

  @override
  String get help_rate_desc => 'Aqualert\'i beğendiniz mi? Bize yorum bırakın!';

  @override
  String get help_build_number => 'Yapı';

  @override
  String get help_copyright => '© 2024 Aqualert. Tüm hakları saklıdır.';

  @override
  String get help_made_with => 'Sağlığınız için ❤️ ile yapıldı';

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

  @override
  String get help_privacy_policy => 'Gizlilik Politikası';

  @override
  String get help_privacy_policy_desc => 'Gizlilik politikamızı görüntüle';

  @override
  String get help_privacy_policy_error => 'Gizlilik Politikası açılamadı';

  @override
  String get settings_delete_account => 'Hesabı Sil';

  @override
  String get settings_delete_account_subtitle =>
      'Hesabınızı ve tüm verilerinizi kalıcı olarak silin';

  @override
  String get settings_delete_account_dialog_title => 'Hesabı Sil?';

  @override
  String get settings_delete_account_dialog_message =>
      'Bu işlem geri alınamaz. Su tüketimi geçmişi, seriler ve ayarlar dahil tüm verileriniz kalıcı olarak silinecektir.';

  @override
  String get settings_delete_account_confirm => 'Hesabımı Sil';

  @override
  String get settings_delete_account_cancel => 'İptal';

  @override
  String get settings_delete_account_success => 'Hesap başarıyla silindi';

  @override
  String get settings_delete_account_error => 'Hesap silinemedi';

  @override
  String get settings_delete_account_reauth_required =>
      'Hesabınızı silmek için lütfen tekrar giriş yapın';

  @override
  String get settings_premium_section => 'Premium';

  @override
  String get settings_premium_upgrade => 'Premium\'a Geç';

  @override
  String get settings_premium_upgrade_subtitle =>
      'Tüm özelliklerin kilidini aç';

  @override
  String get settings_premium_active => 'Premium Aktif ✓';

  @override
  String get settings_premium_restore => 'Satın Alımı Geri Yükle';

  @override
  String get settings_premium_restore_subtitle =>
      'Daha önce satın aldın mı? Geri yükle';

  @override
  String get privacy_last_updated => 'Son Güncelleme: 2 Aralık 2025';

  @override
  String get privacy_intro_title => 'Giriş';

  @override
  String get privacy_intro_content =>
      'Aqualert\'e hoş geldiniz. Gizliliğinize saygı duyuyor ve kişisel verilerinizi korumaya kararlıyız. Bu Gizlilik Politikası, mobil uygulamamızı kullandığınızda bilgilerinizi nasıl topladığımızı, kullandığımızı ve koruduğumuzu açıklamaktadır.';

  @override
  String get privacy_collect_title => 'Topladığımız Bilgiler';

  @override
  String get privacy_collect_content =>
      '• E-posta Adresi — hesap oluşturma ve kimlik doğrulama için\n• Görünen Ad — isteğe bağlı, kişiselleştirme için\n• Profil Bilgileri — yaş, kilo, boy, cinsiyet, aktivite düzeyi\n• Su Tüketim Kayıtları — tüketim miktarı ve zaman damgası\n• Uygulama Kullanım İstatistikleri — Firebase Analytics aracılığıyla\n• Cihaz Bilgileri — cihaz türü, işletim sistemi sürümü, benzersiz tanımlayıcılar';

  @override
  String get privacy_use_title => 'Bilgilerinizi Nasıl Kullanıyoruz';

  @override
  String get privacy_use_content =>
      '• Kişiselleştirilmiş günlük su içme hedefleri hesaplama\n• Su tüketim geçmişinizi takip etme ve görüntüleme\n• Hidrasyon alışkanlıklarınız hakkında istatistik ve öngörüler sunma\n• Hatırlatma bildirimleri gönderme\n• Verilerinizi cihazlar arasında senkronize etme\n• Uygulama performansını ve kullanıcı deneyimini geliştirme';

  @override
  String get privacy_storage_title => 'Veri Depolama ve Güvenlik';

  @override
  String get privacy_storage_content =>
      'Verileriniz Firebase Authentication ve Cloud Firestore (Google Cloud sunucuları) kullanılarak depolanmaktadır. Cihazınız ile sunucularımız arasında iletilen veriler SSL/TLS kullanılarak şifrelenmektedir. Kullanıcı verilerine yalnızca kimliği doğrulanmış kullanıcı Firebase Güvenlik Kuralları aracılığıyla erişebilmektedir.';

  @override
  String get privacy_third_party_title => 'Üçüncü Taraf Hizmetler';

  @override
  String get privacy_third_party_content =>
      '• Google Firebase — kimlik doğrulama, veritabanı, analitik, push bildirimleri\n• Google Sign-In — OAuth kimlik doğrulama\n• Firebase Analytics — uygulama kullanım analitiği\n\nKişisel bilgilerinizi üçüncü taraflara SATMIYORUZ, takas etmiyor veya kiralamıyoruz.';

  @override
  String get privacy_rights_title => 'Haklarınız';

  @override
  String get privacy_rights_content =>
      '• Kişisel bilgilerinize Profil ve Ayarlar üzerinden erişme ve güncelleme\n• Verilerinizi (su kayıtları, başarımlar, ayarlar) JSON formatında dışa aktarma\n• Hesabınızın ve tüm ilgili verilerin silinmesini talep etme\n• Bildirim tercihlerini kontrol etme\n\nVeri silme için bize ulaşın: dilaraacikgoz.dev@gmail.com\nSilme işlemi sonrasında tüm kişisel veriler 30 gün içinde sunucularımızdan kaldırılacaktır.';

  @override
  String get privacy_children_title => 'Çocukların Gizliliği';

  @override
  String get privacy_children_content =>
      'Aqualert, 13 yaşın altındaki çocuklar için tasarlanmamıştır. 13 yaşın altındaki çocuklardan bilerek kişisel bilgi toplamıyoruz.';

  @override
  String get privacy_gdpr_title => 'GDPR Hakları (AB/AEA Kullanıcıları)';

  @override
  String get privacy_gdpr_content =>
      '• Kişisel verilerinize Erişim hakkı\n• Yanlış verilerin Düzeltilmesi hakkı\n• Silme hakkı (\"unutulma hakkı\")\n• İşlemeyi Kısıtlama hakkı\n• Veri Taşınabilirliği hakkı\n• İşlemeye İtiraz hakkı';

  @override
  String get privacy_kvkk_title => 'KVKK Hakları (Türkiye)';

  @override
  String get privacy_kvkk_content =>
      '• Kişisel verilerinizin işlenip işlenmediğini öğrenme\n• İşlenmişse buna ilişkin bilgi talep etme\n• İşlenme amacını ve amacına uygun kullanılıp kullanılmadığını öğrenme\n• Eksik veya yanlış işlenmişse düzeltilmesini isteme\n• Silinmesini veya yok edilmesini isteme\n• Kişisel verilerin aktarıldığı üçüncü kişileri bilme';

  @override
  String get privacy_contact_title => 'Bize Ulaşın';

  @override
  String get privacy_contact_content =>
      'Bu Gizlilik Politikası hakkında sorularınız varsa:\n\nE-posta: dilaraacikgoz.dev@gmail.com\nYanıt Süresi: 48 saat içinde yanıt vermeyi hedefliyoruz.';
}
