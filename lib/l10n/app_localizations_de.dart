// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => 'Bleib hydriert für ein gesundes Leben';

  @override
  String get common_cancel => 'Abbrechen';

  @override
  String get common_save => 'Speichern';

  @override
  String get common_delete => 'Löschen';

  @override
  String get common_edit => 'Bearbeiten';

  @override
  String get common_add => 'Hinzufügen';

  @override
  String get common_ok => 'OK';

  @override
  String get common_yes => 'Ja';

  @override
  String get common_no => 'Nein';

  @override
  String get common_or => 'oder';

  @override
  String get common_done => 'Fertig';

  @override
  String get common_skip => 'Überspringen';

  @override
  String get common_next => 'Weiter';

  @override
  String get common_back => 'Zurück';

  @override
  String get common_continue => 'Fortfahren';

  @override
  String get common_loading => 'Laden...';

  @override
  String get common_error => 'Fehler';

  @override
  String get common_success => 'Erfolg';

  @override
  String get auth_login_title => 'Anmelden';

  @override
  String get auth_register_title => 'Registrieren';

  @override
  String get auth_email_label => 'E-Mail';

  @override
  String get auth_email_hint => 'beispiel@email.com';

  @override
  String get auth_password_label => 'Passwort';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => 'Vollständiger Name';

  @override
  String get auth_name_hint => 'Max Mustermann';

  @override
  String get auth_forgot_password => 'Passwort vergessen?';

  @override
  String get auth_dont_have_account => 'Kein Konto? ';

  @override
  String get auth_already_have_account => 'Bereits ein Konto? ';

  @override
  String get auth_sign_in_button => 'Anmelden';

  @override
  String get auth_sign_up_button => 'Registrieren';

  @override
  String get auth_sign_in_google => 'Mit Google anmelden';

  @override
  String get auth_sign_up_google => 'Mit Google registrieren';

  @override
  String get auth_logout => 'Abmelden';

  @override
  String get auth_validation_email_required => 'E-Mail ist erforderlich';

  @override
  String get auth_validation_email_invalid => 'Bitte gültige E-Mail eingeben';

  @override
  String get auth_validation_password_required => 'Passwort ist erforderlich';

  @override
  String get auth_validation_password_min_length =>
      'Passwort muss mindestens 6 Zeichen haben';

  @override
  String get auth_validation_password_mismatch => 'Passwords don\'t match';

  @override
  String get auth_validation_name_required => 'Name ist erforderlich';

  @override
  String get auth_validation_name_min_length =>
      'Name muss mindestens 2 Zeichen haben';

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
  String get auth_email_verification_title => 'E-Mail bestätigen';

  @override
  String get auth_email_verification_sent =>
      'Wir haben einen Bestätigungslink gesendet an:';

  @override
  String get auth_email_verification_instruction =>
      'Bitte überprüfen Sie Ihre E-Mail und klicken Sie auf den Bestätigungslink um fortzufahren.';

  @override
  String get auth_email_verification_not_received => 'E-Mail nicht erhalten?';

  @override
  String get auth_email_verification_resend =>
      'Bestätigungs-E-Mail erneut senden';

  @override
  String get auth_email_verification_check => 'Ich habe meine E-Mail bestätigt';

  @override
  String get auth_email_verification_success => 'E-Mail erfolgreich bestätigt!';

  @override
  String get auth_email_verification_failed =>
      'E-Mail noch nicht bestätigt. Bitte Posteingang prüfen.';

  @override
  String get auth_forgot_password_title => 'Passwort zurücksetzen';

  @override
  String get auth_forgot_password_instruction =>
      'Geben Sie Ihre E-Mail-Adresse ein und wir senden Ihnen einen Link zum Zurücksetzen Ihres Passworts.';

  @override
  String get auth_forgot_password_button => 'Link senden';

  @override
  String get auth_forgot_password_success =>
      'Zurücksetzungs-E-Mail gesendet! Prüfen Sie Ihren Posteingang.';

  @override
  String get auth_back_to_login => 'Zurück zur Anmeldung';

  @override
  String get home_title => 'Startseite';

  @override
  String get home_daily_goal => 'Tagesziel';

  @override
  String get home_today => 'Heute';

  @override
  String get home_todays_progress => 'Today\'s Progress';

  @override
  String get home_quick_add => 'Quick Add';

  @override
  String home_amount_to_go(String amount) {
    return '$amount to go!';
  }

  @override
  String get home_custom_amount => 'Benutzerdefinierte Menge';

  @override
  String get home_amount_label => 'Menge';

  @override
  String get home_add_water_success => 'Wasser erfolgreich hinzugefügt!';

  @override
  String get home_add_water_failed => 'Fehler beim Hinzufügen von Wasser';

  @override
  String get home_delete_water_confirm => 'Diesen Eintrag löschen?';

  @override
  String get home_delete_water_success => 'Eintrag gelöscht';

  @override
  String get home_no_records_today => 'Keine Einträge heute';

  @override
  String get home_start_drinking => 'Fang an Wasser zu trinken!';

  @override
  String get progress_current => 'Aktuell';

  @override
  String get progress_goal => 'Ziel';

  @override
  String get progress_remaining => 'Verbleibend';

  @override
  String get progress_completed => 'Ziel erreicht!';

  @override
  String progress_percentage(int percent) {
    return '$percent% des Tagesziels';
  }

  @override
  String get motivational_keep_going => 'Weiter so! Du machst das großartig!';

  @override
  String get motivational_almost_there => 'Fast geschafft! Noch ein bisschen!';

  @override
  String get motivational_goal_reached =>
      'Herzlichen Glückwunsch! Ziel erreicht!';

  @override
  String get motivational_good_start => 'Guter Anfang! Weiter so!';

  @override
  String get motivational_stay_hydrated => 'Bleib den ganzen Tag hydriert!';

  @override
  String get motivational_100_1 =>
      'Herzlichen Glückwunsch! Du hast dein Ziel erreicht!';

  @override
  String get motivational_100_2 => 'Tolle Arbeit! Bleib auch morgen hydriert!';

  @override
  String get motivational_100_3 => 'Du bist ein Hydrations-Champion!';

  @override
  String get motivational_100_4 =>
      'Perfekt! Behalte diese guten Gewohnheiten bei!';

  @override
  String get motivational_100_short => 'Ziel erreicht!';

  @override
  String get motivational_75_1 => 'Fast geschafft! Noch ein bisschen!';

  @override
  String get motivational_75_2 => 'Du machst das großartig! Weiter so!';

  @override
  String get motivational_75_3 => 'So nah an deinem Ziel!';

  @override
  String get motivational_75_4 => 'Fantastischer Fortschritt! Nicht aufhören!';

  @override
  String get motivational_75_short => 'Fast geschafft!';

  @override
  String get motivational_50_1 => 'Halbzeit! Du machst das super!';

  @override
  String get motivational_50_2 => 'Tolle Arbeit! Weitermachen!';

  @override
  String get motivational_50_3 => 'Du bist auf dem richtigen Weg!';

  @override
  String get motivational_50_4 => 'Guter Fortschritt! Bleib dran!';

  @override
  String get motivational_50_short => 'Halbzeit!';

  @override
  String get motivational_25_1 => 'Guter Start! Trink weiter Wasser!';

  @override
  String get motivational_25_2 => 'Du hast super angefangen!';

  @override
  String get motivational_25_3 => 'Schöner Anfang! Bleib hydriert!';

  @override
  String get motivational_25_4 => 'Weitermachen! Jeder Schluck zählt!';

  @override
  String get motivational_25_short => 'Guter Start!';

  @override
  String get motivational_0_1 =>
      'Zeit sich zu hydrieren! Dein Körper wird es dir danken!';

  @override
  String get motivational_0_2 => 'Lass uns deine Hydrations-Reise beginnen!';

  @override
  String get motivational_0_3 => 'Starte deinen Tag mit Wasser!';

  @override
  String get motivational_0_4 => 'Deine Gesundheit zählt! Fang an zu trinken!';

  @override
  String get motivational_0_short => 'Los geht\'s!';

  @override
  String get profile_title => 'Profil';

  @override
  String get profile_edit => 'Profil bearbeiten';

  @override
  String get profile_personal_info => 'Persönliche Informationen';

  @override
  String get profile_body_metrics => 'Körpermaße';

  @override
  String get profile_activity_level => 'Aktivitätsniveau';

  @override
  String get profile_name => 'Name';

  @override
  String get profile_email => 'E-Mail';

  @override
  String get profile_age => 'Alter';

  @override
  String get profile_gender => 'Geschlecht';

  @override
  String get profile_weight => 'Gewicht';

  @override
  String get profile_height => 'Größe';

  @override
  String get profile_bmi => 'BMI';

  @override
  String get profile_bmi_category => 'BMI-Kategorie';

  @override
  String get profile_daily_goal => 'Tägliches Wasserziel';

  @override
  String get profile_use_calculated_goal => 'Berechnetes Ziel verwenden';

  @override
  String get profile_custom_goal => 'Benutzerdefiniertes Ziel';

  @override
  String get profile_save_success => 'Profil erfolgreich aktualisiert';

  @override
  String get profile_save_failed => 'Profil konnte nicht aktualisiert werden';

  @override
  String get profile_user_default => 'Benutzer';

  @override
  String get gender_male => 'Männlich';

  @override
  String get gender_female => 'Weiblich';

  @override
  String get gender_other => 'Andere';

  @override
  String get activity_sedentary => 'Sitzend';

  @override
  String get activity_sedentary_desc => 'Wenig oder kein Sport';

  @override
  String get activity_light => 'Leicht aktiv';

  @override
  String get activity_light_desc => 'Leichter Sport 1-3 Tage/Woche';

  @override
  String get activity_moderate => 'Mäßig aktiv';

  @override
  String get activity_moderate_desc => 'Mäßiger Sport 3-5 Tage/Woche';

  @override
  String get activity_very_active => 'Sehr aktiv';

  @override
  String get activity_very_active_desc => 'Intensiver Sport 6-7 Tage/Woche';

  @override
  String get activity_extra_active => 'Extrem aktiv';

  @override
  String get activity_extra_active_desc =>
      'Sehr intensiver Sport & körperliche Arbeit';

  @override
  String get bmi_underweight => 'Untergewicht';

  @override
  String get bmi_normal => 'Normalgewicht';

  @override
  String get bmi_overweight => 'Übergewicht';

  @override
  String get bmi_obese => 'Fettleibig';

  @override
  String get settings_title => 'Einstellungen';

  @override
  String get settings_notifications => 'Benachrichtigungen';

  @override
  String get settings_reminders => 'Erinnerungen';

  @override
  String get settings_theme => 'Design';

  @override
  String get settings_units => 'Einheiten';

  @override
  String get settings_language => 'Sprache';

  @override
  String get settings_profile => 'Profileinstellungen';

  @override
  String get settings_daily_goal => 'Zieleinstellungen';

  @override
  String get settings_data => 'Datenverwaltung';

  @override
  String get settings_export_data => 'Daten exportieren';

  @override
  String get settings_import_data => 'Daten importieren';

  @override
  String get settings_help => 'Hilfe & Support';

  @override
  String get settings_about => 'Über';

  @override
  String get settings_enable_notifications => 'Benachrichtigungen aktivieren';

  @override
  String get settings_reminder_interval => 'Erinnerungsintervall';

  @override
  String get settings_reminder_start_time => 'Startzeit';

  @override
  String get settings_reminder_end_time => 'Endzeit';

  @override
  String get settings_test_notification => 'Testbenachrichtigung';

  @override
  String get settings_theme_light => 'Hell';

  @override
  String get settings_theme_dark => 'Dunkel';

  @override
  String get settings_theme_system => 'System';

  @override
  String get settings_unit_ml => 'Milliliter (ml)';

  @override
  String get settings_unit_floz => 'Flüssigunzen (fl oz)';

  @override
  String get settings_unit_metric => 'Metrisches System';

  @override
  String get settings_unit_imperial => 'Imperiales System';

  @override
  String get settings_subtitle => 'Passe dein Erlebnis an';

  @override
  String get settings_reminders_active => 'Wassererinnerungen sind aktiv';

  @override
  String get settings_reminders_inactive => 'Erinnerungen aktivieren';

  @override
  String get settings_minutes => 'Minuten';

  @override
  String get settings_export_subtitle => 'Sichere deine Wasserdaten';

  @override
  String get settings_import_subtitle => 'Aus Backup wiederherstellen';

  @override
  String get settings_profile_subtitle => 'Informationen aktualisieren';

  @override
  String get settings_daily_goal_subtitle => 'Verwalte dein Hydrationsziel';

  @override
  String get settings_theme_dialog_title => 'Design';

  @override
  String get settings_theme_light_mode => 'Heller Modus';

  @override
  String get settings_theme_dark_mode => 'Dunkler Modus';

  @override
  String get settings_theme_system_mode => 'System';

  @override
  String get settings_theme_light_subtitle => 'Helles Design verwenden';

  @override
  String get settings_theme_dark_subtitle => 'Dunkles Design verwenden';

  @override
  String get settings_theme_system_subtitle => 'Systemdesign folgen';

  @override
  String get settings_language_dialog_title => 'Sprache';

  @override
  String get settings_export_loading => 'Daten werden exportiert...';

  @override
  String get settings_export_success_message => 'Daten erfolgreich exportiert!';

  @override
  String settings_export_failed_message(String error) {
    return 'Export fehlgeschlagen: $error';
  }

  @override
  String get settings_import_loading => 'Daten werden importiert...';

  @override
  String get settings_import_complete => 'Import abgeschlossen';

  @override
  String get settings_import_success_subtitle => 'Erfolgreich importiert:';

  @override
  String get settings_import_water_records => 'Wassereinträge';

  @override
  String get settings_import_daily_goals => 'Tagesziele';

  @override
  String get settings_import_duplicate_skipped => 'Duplikate übersprungen';

  @override
  String settings_import_failed_message(String error) {
    return 'Import fehlgeschlagen: $error';
  }

  @override
  String get settings_reminder_interval_title => 'Erinnerungsintervall';

  @override
  String get settings_language_coming_soon => 'Demnächst';

  @override
  String get settings_export_success => 'Daten erfolgreich exportiert';

  @override
  String get settings_export_failed => 'Datenexport fehlgeschlagen';

  @override
  String get settings_import_success => 'Daten erfolgreich importiert';

  @override
  String get settings_import_failed => 'Datenimport fehlgeschlagen';

  @override
  String settings_import_stats(int imported, int skipped) {
    return '$imported Einträge importiert, $skipped Duplikate übersprungen';
  }

  @override
  String get statistics_title => 'Statistiken';

  @override
  String get statistics_weekly => 'Wöchentlich';

  @override
  String get statistics_monthly => 'Monatlich';

  @override
  String get statistics_yearly => 'Jährlich';

  @override
  String get statistics_average => 'Durchschnitt';

  @override
  String get statistics_total => 'Gesamt';

  @override
  String get statistics_best_day => 'Bester Tag';

  @override
  String get statistics_goal_achievement => 'Zielerreichung';

  @override
  String get statistics_no_data => 'Keine Daten für diesen Zeitraum';

  @override
  String get statistics_chart_label => 'Wasseraufnahme';

  @override
  String get statistics_total_intake => 'Gesamtaufnahme';

  @override
  String get statistics_total_consumed => 'Insgesamt konsumiert';

  @override
  String get statistics_daily_average => 'Täglicher Durchschnitt';

  @override
  String get statistics_goals_met => 'Ziele erreicht';

  @override
  String statistics_out_of(int count) {
    return 'von $count';
  }

  @override
  String get statistics_progress => 'Fortschritt';

  @override
  String get statistics_on_track => 'Auf Kurs!';

  @override
  String get statistics_keep_going => 'Weiter so!';

  @override
  String get statistics_daily_intake => 'Tägliche Aufnahme';

  @override
  String get statistics_below_goal => 'Unter Ziel';

  @override
  String get statistics_goal_met_label => 'Ziel erreicht';

  @override
  String get statistics_your_streak => 'Deine Serie';

  @override
  String get statistics_current => 'Aktuell';

  @override
  String get statistics_best => 'Beste';

  @override
  String get statistics_completed => 'Abgeschlossen';

  @override
  String get statistics_next_goal => 'Nächstes Ziel';

  @override
  String get statistics_days => 'Tage';

  @override
  String get achievements_title => 'Erfolge';

  @override
  String get achievements_unlocked => 'Freigeschaltet';

  @override
  String get achievements_locked => 'Gesperrt';

  @override
  String get achievements_progress => 'Fortschritt';

  @override
  String get achievements_reward_points => 'Belohnungspunkte';

  @override
  String achievements_total_points(int points) {
    return 'Gesamtpunkte: $points';
  }

  @override
  String get achievement_first_drop => 'Erster Tropfen';

  @override
  String get achievement_first_drop_desc =>
      'Protokolliere deine erste Wasseraufnahme';

  @override
  String get achievement_daily_goal_1 => 'Ziel-Erreicher';

  @override
  String get achievement_daily_goal_1_desc => 'Erreiche einmal dein Tagesziel';

  @override
  String get achievement_streak_3 => '3-Tage-Serie';

  @override
  String get achievement_streak_3_desc => 'Halte eine 3-Tage-Serie';

  @override
  String get achievement_streak_7 => 'Wochen-Krieger';

  @override
  String get achievement_streak_7_desc => 'Halte eine 7-Tage-Serie';

  @override
  String get achievement_streak_30 => 'Monats-Meister';

  @override
  String get achievement_streak_30_desc => 'Halte eine 30-Tage-Serie';

  @override
  String get achievement_total_10l => '10 Liter';

  @override
  String get achievement_total_10l_desc => 'Trinke insgesamt 10 Liter';

  @override
  String get achievement_total_100l => '100 Liter';

  @override
  String get achievement_total_100l_desc => 'Trinke insgesamt 100 Liter';

  @override
  String get achievement_consistency => 'Konstante Woche';

  @override
  String get achievement_consistency_desc =>
      'Erreiche dein Ziel 7 Tage hintereinander';

  @override
  String get reminders_title => 'Erinnerungen';

  @override
  String get reminders_active => 'Aktive Erinnerungen';

  @override
  String get reminders_pending => 'Ausstehende Benachrichtigungen';

  @override
  String get reminders_interval_30 => 'Alle 30 Minuten';

  @override
  String get reminders_interval_45 => 'Alle 45 Minuten';

  @override
  String get reminders_interval_60 => 'Jede Stunde';

  @override
  String get reminders_interval_90 => 'Alle 1,5 Stunden';

  @override
  String get reminders_interval_120 => 'Alle 2 Stunden';

  @override
  String get reminders_interval_180 => 'Alle 3 Stunden';

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
  String get notification_reminder_title => 'Zeit Wasser zu trinken!';

  @override
  String get notification_reminder_body =>
      'Bleib hydriert! Trink jetzt etwas Wasser.';

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
  String get streak_current => 'Aktuelle Serie';

  @override
  String streak_days(int days) {
    return '$days Tage';
  }

  @override
  String get streak_keep_going => 'Halte die Serie!';

  @override
  String get streak_personal_best => 'Persönlicher Rekord';

  @override
  String get streak_best => 'Rekord!';

  @override
  String get streak_longest => 'Längste';

  @override
  String get streak_next_milestone => 'Nächster Meilenstein';

  @override
  String get streak_start_today => 'Starte heute deine Serie!';

  @override
  String get streak_complete_goal =>
      'Erreiche dein Tagesziel um eine Serie aufzubauen';

  @override
  String get streak_start => 'Starte deine Serie!';

  @override
  String get streak_error => 'Seriendaten konnten nicht geladen werden';

  @override
  String get streak_day_singular => 'Tag';

  @override
  String get streak_day_plural => 'Tage';

  @override
  String get onboarding_title_1 => 'Verfolge dein Wasser';

  @override
  String get onboarding_desc_1 =>
      'Protokolliere einfach deine tägliche Wasseraufnahme mit einem Tippen';

  @override
  String get onboarding_title_2 => 'Intelligente Erinnerungen';

  @override
  String get onboarding_desc_2 =>
      'Erhalte rechtzeitige Erinnerungen um den ganzen Tag hydriert zu bleiben';

  @override
  String get onboarding_title_3 => 'Verfolge Fortschritte';

  @override
  String get onboarding_desc_3 =>
      'Sieh deine Hydrationsstatistiken und erreiche deine Ziele';

  @override
  String get onboarding_title_4 => 'Bleib gesund';

  @override
  String get onboarding_desc_4 =>
      'Baue gesunde Gewohnheiten auf und verbessere dein Wohlbefinden';

  @override
  String get onboarding_get_started => 'Loslegen';

  @override
  String get drawer_home => 'Startseite';

  @override
  String get drawer_statistics => 'Statistiken';

  @override
  String get drawer_achievements => 'Erfolge';

  @override
  String get drawer_profile => 'Profil';

  @override
  String get drawer_reminders => 'Erinnerungen';

  @override
  String get drawer_settings => 'Einstellungen';

  @override
  String get drawer_help => 'Hilfe & Support';

  @override
  String get drawer_about => 'Über';

  @override
  String get drawer_logout => 'Abmelden';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => 'Version 1.0.0';

  @override
  String get about_description =>
      'Bleib hydriert und gesund mit Aqualert. Verfolge deine tägliche Wasseraufnahme und erreiche deine Hydrationsziele!';

  @override
  String get about_copyright => '© 2024 Aqualert. Alle Rechte vorbehalten.';

  @override
  String get about_close => 'Schließen';

  @override
  String get help_title => 'Hilfe & Support';

  @override
  String get help_subtitle => 'Hilfe bekommen und mehr erfahren';

  @override
  String get help_faq => 'Häufige Fragen';

  @override
  String get help_contact => 'Kontakt';

  @override
  String get help_version => 'Version';

  @override
  String get help_app_info => 'App-Informationen';

  @override
  String get help_coming_soon => 'Hilfe & Support - Demnächst!';

  @override
  String get help_faq_section => 'FAQ';

  @override
  String get help_features_section => 'Funktionsübersicht';

  @override
  String get help_about_section => 'Über';

  @override
  String get faq_1_q => 'Wie wird mein tägliches Wasserziel berechnet?';

  @override
  String get faq_1_a =>
      'Dein tägliches Wasserziel wird basierend auf Gewicht, Größe, Alter, Geschlecht und Aktivitätsniveau mit wissenschaftlichen Formeln berechnet. Du kannst auch ein benutzerdefiniertes Ziel in den Profileinstellungen festlegen.';

  @override
  String get faq_2_q => 'Wie funktionieren Erinnerungen?';

  @override
  String get faq_2_a =>
      'Du kannst Erinnerungsintervalle (30-180 Minuten) festlegen und Start-/Endzeiten wählen. Die App sendet dir Benachrichtigungen in diesem Zeitraum um hydriert zu bleiben.';

  @override
  String get faq_3_q => 'Was sind Serien und wie funktionieren sie?';

  @override
  String get faq_3_a =>
      'Serien verfolgen aufeinanderfolgende Tage an denen du dein Tagesziel erreicht hast. Trinke jeden Tag Wasser um deine Serie zu halten und zu erhöhen!';

  @override
  String get faq_4_q => 'Wie kann ich die Maßeinheiten ändern?';

  @override
  String get faq_4_a =>
      'Gehe zu Einstellungen → Einheiten und wechsle zwischen Milliliter (ml) und Flüssigunzen (fl oz). Alle Messungen werden automatisch aktualisiert.';

  @override
  String get faq_5_q => 'Kann ich meine Tracking-Daten exportieren?';

  @override
  String get faq_5_a =>
      'Ja! Gehe zu Einstellungen → Datenverwaltung → Daten exportieren. Du kannst deine Daten als JSON-Datei teilen oder speichern und später importieren.';

  @override
  String get faq_6_q => 'Wie funktionieren Erfolge?';

  @override
  String get faq_6_a =>
      'Schließe Wasser-Tracking-Meilensteine ab um Erfolge freizuschalten und Belohnungspunkte zu verdienen. Verfolge deinen Fortschritt im Erfolge-Bildschirm.';

  @override
  String get feature_tracking_title => 'Wasserverfolgung';

  @override
  String get feature_tracking_desc =>
      'Protokolliere einfach deinen täglichen Wasserverbrauch mit Schnelltasten (250ml, 350ml, 500ml, 750ml) oder gib eine benutzerdefinierte Menge ein.';

  @override
  String get feature_reminders_title => 'Intelligente Erinnerungen';

  @override
  String get feature_reminders_desc =>
      'Lege anpassbare Erinnerungsintervalle fest und wähle aktive Stunden. Vergiss nie tagsüber Wasser zu trinken.';

  @override
  String get feature_statistics_title => 'Statistiken & Einblicke';

  @override
  String get feature_statistics_desc =>
      'Sieh deine Wasserverbrauchstrends mit wöchentlichen, monatlichen und jährlichen Diagrammen. Verfolge deinen Fortschritt über die Zeit.';

  @override
  String get feature_achievements_title => 'Erfolge & Serien';

  @override
  String get feature_achievements_desc =>
      'Verdiene Erfolge und halte tägliche Serien indem du deine Wasserziele erreichst. Bleib motiviert mit Gamification!';

  @override
  String get feature_profile_title => 'Profil & Ziele';

  @override
  String get feature_profile_desc =>
      'Richte deine persönlichen Informationen ein und lass die App dein optimales tägliches Wasserziel basierend auf deinen Körpermaßen berechnen.';

  @override
  String get help_contact_email => 'Per E-Mail kontaktieren';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => 'Unsere App bewerten';

  @override
  String get help_rate_desc =>
      'Gefällt dir Aqualert? Hinterlasse eine Bewertung!';

  @override
  String get help_build_number => 'Build';

  @override
  String get help_copyright => '© 2024 Aqualert. Alle Rechte vorbehalten.';

  @override
  String get help_made_with => 'Mit ❤️ für deine Gesundheit gemacht';

  @override
  String get error_generic =>
      'Etwas ist schief gelaufen. Bitte erneut versuchen.';

  @override
  String get error_network => 'Netzwerkfehler. Bitte Verbindung prüfen.';

  @override
  String get error_auth_failed =>
      'Authentifizierung fehlgeschlagen. Bitte erneut versuchen.';

  @override
  String get error_permission_denied => 'Berechtigung verweigert.';

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
  String get time_morning => 'Morgen';

  @override
  String get time_afternoon => 'Nachmittag';

  @override
  String get time_evening => 'Abend';

  @override
  String get time_night => 'Nacht';

  @override
  String get help_privacy_policy => 'Datenschutzrichtlinie';

  @override
  String get help_privacy_policy_desc =>
      'Unsere Datenschutzrichtlinie anzeigen';

  @override
  String get help_privacy_policy_error =>
      'Datenschutzrichtlinie konnte nicht geöffnet werden';

  @override
  String get settings_delete_account => 'Konto löschen';

  @override
  String get settings_delete_account_subtitle =>
      'Konto und alle Daten dauerhaft löschen';

  @override
  String get settings_delete_account_dialog_title => 'Konto löschen?';

  @override
  String get settings_delete_account_dialog_message =>
      'Diese Aktion kann nicht rückgängig gemacht werden. Alle Ihre Daten, einschließlich Wasseraufnahme-Verlauf, Serien und Einstellungen, werden dauerhaft gelöscht.';

  @override
  String get settings_delete_account_confirm => 'Mein Konto löschen';

  @override
  String get settings_delete_account_cancel => 'Abbrechen';

  @override
  String get settings_delete_account_success => 'Konto erfolgreich gelöscht';

  @override
  String get settings_delete_account_error =>
      'Konto konnte nicht gelöscht werden';

  @override
  String get settings_delete_account_reauth_required =>
      'Bitte melden Sie sich erneut an, um Ihr Konto zu löschen';
}
