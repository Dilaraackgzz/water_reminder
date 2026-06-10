// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => 'Blijf gehydrateerd voor een gezond leven';

  @override
  String get common_cancel => 'Annuleren';

  @override
  String get common_save => 'Opslaan';

  @override
  String get common_delete => 'Verwijderen';

  @override
  String get common_edit => 'Bewerken';

  @override
  String get common_add => 'Toevoegen';

  @override
  String get common_ok => 'OK';

  @override
  String get common_yes => 'Ja';

  @override
  String get common_no => 'Nee';

  @override
  String get common_or => 'of';

  @override
  String get common_done => 'Klaar';

  @override
  String get common_skip => 'Overslaan';

  @override
  String get common_next => 'Volgende';

  @override
  String get common_back => 'Terug';

  @override
  String get common_continue => 'Doorgaan';

  @override
  String get common_loading => 'Laden...';

  @override
  String get common_error => 'Fout';

  @override
  String get common_success => 'Succes';

  @override
  String get auth_login_title => 'Inloggen';

  @override
  String get auth_register_title => 'Registreren';

  @override
  String get auth_email_label => 'E-mail';

  @override
  String get auth_email_hint => 'voorbeeld@email.com';

  @override
  String get auth_password_label => 'Wachtwoord';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => 'Volledige naam';

  @override
  String get auth_name_hint => 'Jan Jansen';

  @override
  String get auth_forgot_password => 'Wachtwoord vergeten?';

  @override
  String get auth_dont_have_account => 'Geen account? ';

  @override
  String get auth_already_have_account => 'Heb je al een account? ';

  @override
  String get auth_sign_in_button => 'Inloggen';

  @override
  String get auth_sign_up_button => 'Registreren';

  @override
  String get auth_sign_in_google => 'Inloggen met Google';

  @override
  String get auth_sign_up_google => 'Registreren met Google';

  @override
  String get auth_logout => 'Uitloggen';

  @override
  String get auth_validation_email_required => 'E-mail is verplicht';

  @override
  String get auth_validation_email_invalid => 'Voer een geldig e-mailadres in';

  @override
  String get auth_validation_password_required => 'Wachtwoord is verplicht';

  @override
  String get auth_validation_password_min_length =>
      'Wachtwoord moet minimaal 6 tekens bevatten';

  @override
  String get auth_validation_password_mismatch => 'Passwords don\'t match';

  @override
  String get auth_validation_name_required => 'Naam is verplicht';

  @override
  String get auth_validation_name_min_length =>
      'Naam moet minimaal 2 tekens bevatten';

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
  String get auth_email_verification_title => 'Verifieer je e-mail';

  @override
  String get auth_email_verification_sent =>
      'We hebben een verificatielink gestuurd naar:';

  @override
  String get auth_email_verification_instruction =>
      'Controleer je e-mail en klik op de verificatielink.';

  @override
  String get auth_email_verification_not_received => 'E-mail niet ontvangen?';

  @override
  String get auth_email_verification_resend =>
      'Verificatie-e-mail opnieuw verzenden';

  @override
  String get auth_email_verification_check => 'Ik heb mijn e-mail geverifieerd';

  @override
  String get auth_email_verification_success =>
      'E-mail succesvol geverifieerd!';

  @override
  String get auth_email_verification_failed =>
      'E-mail nog niet geverifieerd. Controleer je inbox.';

  @override
  String get auth_forgot_password_title => 'Wachtwoord resetten';

  @override
  String get auth_forgot_password_instruction =>
      'Voer je e-mailadres in en we sturen je een link om je wachtwoord te resetten.';

  @override
  String get auth_forgot_password_button => 'Resetlink verzenden';

  @override
  String get auth_forgot_password_success =>
      'Wachtwoord reset e-mail verzonden!';

  @override
  String get auth_back_to_login => 'Terug naar inloggen';

  @override
  String get home_title => 'Home';

  @override
  String get home_daily_goal => 'Dagelijks doel';

  @override
  String get home_today => 'Vandaag';

  @override
  String get home_todays_progress => 'Today\'s Progress';

  @override
  String get home_quick_add => 'Quick Add';

  @override
  String home_amount_to_go(String amount) {
    return '$amount to go!';
  }

  @override
  String get home_custom_amount => 'Aangepaste hoeveelheid';

  @override
  String get home_amount_label => 'Hoeveelheid';

  @override
  String get home_add_water_success => 'Water toegevoegd!';

  @override
  String get home_add_water_failed => 'Kon water niet toevoegen';

  @override
  String get home_delete_water_confirm => 'Dit record verwijderen?';

  @override
  String get home_delete_water_success => 'Record verwijderd';

  @override
  String get home_no_records_today => 'Geen records vandaag';

  @override
  String get home_start_drinking => 'Begin met water drinken!';

  @override
  String get progress_current => 'Huidig';

  @override
  String get progress_goal => 'Doel';

  @override
  String get progress_remaining => 'Resterend';

  @override
  String get progress_completed => 'Doel behaald!';

  @override
  String progress_percentage(int percent) {
    return '$percent% van dagelijks doel';
  }

  @override
  String get motivational_keep_going => 'Ga zo door! Je doet het geweldig!';

  @override
  String get motivational_almost_there => 'Bijna daar! Nog even!';

  @override
  String get motivational_goal_reached =>
      'Gefeliciteerd! Je hebt je doel bereikt!';

  @override
  String get motivational_good_start => 'Goede start! Ga zo door!';

  @override
  String get motivational_stay_hydrated => 'Blijf de hele dag gehydrateerd!';

  @override
  String get motivational_100_1 => 'Gefeliciteerd! Je hebt je doel bereikt!';

  @override
  String get motivational_100_2 => 'Geweldig! Blijf morgen ook gehydrateerd!';

  @override
  String get motivational_100_3 => 'Je bent een hydratatie-kampioen!';

  @override
  String get motivational_100_4 => 'Perfect! Houd de goede gewoonten vol!';

  @override
  String get motivational_100_short => 'Doel bereikt!';

  @override
  String get motivational_75_1 => 'Bijna daar! Nog even!';

  @override
  String get motivational_75_2 => 'Je doet het geweldig! Ga zo door!';

  @override
  String get motivational_75_3 => 'Zo dicht bij je doel!';

  @override
  String get motivational_75_4 => 'Fantastische vooruitgang! Stop niet nu!';

  @override
  String get motivational_75_short => 'Bijna daar!';

  @override
  String get motivational_50_1 => 'Halverwege! Geweldig!';

  @override
  String get motivational_50_2 => 'Goed bezig! Ga zo door!';

  @override
  String get motivational_50_3 => 'Je bent op de goede weg!';

  @override
  String get motivational_50_4 => 'Goede vooruitgang! Blijf consistent!';

  @override
  String get motivational_50_short => 'Halverwege!';

  @override
  String get motivational_25_1 => 'Goede start! Blijf water drinken!';

  @override
  String get motivational_25_2 => 'Geweldige start!';

  @override
  String get motivational_25_3 => 'Goed begin! Blijf gehydrateerd!';

  @override
  String get motivational_25_4 => 'Ga zo door! Elke slok telt!';

  @override
  String get motivational_25_short => 'Goede start!';

  @override
  String get motivational_0_1 =>
      'Tijd om te hydrateren! Je lichaam zal je dankbaar zijn!';

  @override
  String get motivational_0_2 => 'Begin je hydratatie-reis!';

  @override
  String get motivational_0_3 => 'Begin je dag met water!';

  @override
  String get motivational_0_4 =>
      'Je gezondheid is belangrijk! Begin met drinken!';

  @override
  String get motivational_0_short => 'Laten we beginnen!';

  @override
  String get profile_title => 'Profiel';

  @override
  String get profile_edit => 'Bewerken';

  @override
  String get profile_personal_info => 'Persoonlijke informatie';

  @override
  String get profile_body_metrics => 'Lichaamsgegevens';

  @override
  String get profile_activity_level => 'Activiteitsniveau';

  @override
  String get profile_name => 'Naam';

  @override
  String get profile_email => 'E-mail';

  @override
  String get profile_age => 'Leeftijd';

  @override
  String get profile_gender => 'Geslacht';

  @override
  String get profile_weight => 'Gewicht';

  @override
  String get profile_height => 'Lengte';

  @override
  String get profile_bmi => 'BMI';

  @override
  String get profile_bmi_category => 'BMI-categorie';

  @override
  String get profile_daily_goal => 'Dagelijks waterdoel';

  @override
  String get profile_use_calculated_goal => 'Berekend doel gebruiken';

  @override
  String get profile_custom_goal => 'Aangepast doel';

  @override
  String get profile_save_success => 'Profiel bijgewerkt';

  @override
  String get profile_save_failed => 'Kon profiel niet bijwerken';

  @override
  String get profile_user_default => 'Gebruiker';

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
  String get gender_male => 'Man';

  @override
  String get gender_female => 'Vrouw';

  @override
  String get gender_other => 'Anders';

  @override
  String get activity_sedentary => 'Zittend';

  @override
  String get activity_sedentary_desc => 'Weinig of geen beweging';

  @override
  String get activity_light => 'Licht actief';

  @override
  String get activity_light_desc => 'Lichte beweging 1-3 dagen/week';

  @override
  String get activity_moderate => 'Matig actief';

  @override
  String get activity_moderate_desc => 'Matige beweging 3-5 dagen/week';

  @override
  String get activity_very_active => 'Zeer actief';

  @override
  String get activity_very_active_desc => 'Intensieve beweging 6-7 dagen/week';

  @override
  String get activity_extra_active => 'Extra actief';

  @override
  String get activity_extra_active_desc =>
      'Zeer intensieve beweging en fysiek werk';

  @override
  String get bmi_underweight => 'Ondergewicht';

  @override
  String get bmi_normal => 'Normaal gewicht';

  @override
  String get bmi_overweight => 'Overgewicht';

  @override
  String get bmi_obese => 'Obesitas';

  @override
  String get settings_title => 'Instellingen';

  @override
  String get settings_notifications => 'Meldingen';

  @override
  String get settings_reminders => 'Herinneringen';

  @override
  String get settings_theme => 'Thema';

  @override
  String get settings_units => 'Eenheden';

  @override
  String get settings_language => 'Taal';

  @override
  String get settings_profile => 'Profielinstellingen';

  @override
  String get settings_daily_goal => 'Doelinstellingen';

  @override
  String get settings_data => 'Gegevensbeheer';

  @override
  String get settings_export_data => 'Gegevens exporteren';

  @override
  String get settings_import_data => 'Gegevens importeren';

  @override
  String get settings_help => 'Help';

  @override
  String get settings_about => 'Over';

  @override
  String get settings_enable_notifications => 'Meldingen inschakelen';

  @override
  String get settings_reminder_interval => 'Herinneringsinterval';

  @override
  String get settings_reminder_start_time => 'Starttijd';

  @override
  String get settings_reminder_end_time => 'Eindtijd';

  @override
  String get settings_test_notification => 'Testmelding';

  @override
  String get settings_theme_light => 'Licht';

  @override
  String get settings_theme_dark => 'Donker';

  @override
  String get settings_theme_system => 'Systeemstandaard';

  @override
  String get settings_unit_ml => 'Milliliter (ml)';

  @override
  String get settings_unit_floz => 'Fluid ounces (fl oz)';

  @override
  String get settings_unit_metric => 'Metrisch systeem';

  @override
  String get settings_unit_imperial => 'Imperiaal systeem';

  @override
  String get settings_subtitle => 'Pas je ervaring aan';

  @override
  String get settings_reminders_active => 'Herinneringen zijn actief';

  @override
  String get settings_reminders_inactive => 'Schakel in voor herinneringen';

  @override
  String get settings_minutes => 'minuten';

  @override
  String get settings_export_subtitle => 'Maak een back-up van je gegevens';

  @override
  String get settings_import_subtitle => 'Herstel vanuit back-upbestand';

  @override
  String get settings_profile_subtitle => 'Werk je informatie bij';

  @override
  String get settings_daily_goal_subtitle => 'Beheer je hydratiedoel';

  @override
  String get settings_theme_dialog_title => 'Thema';

  @override
  String get settings_theme_light_mode => 'Lichte modus';

  @override
  String get settings_theme_dark_mode => 'Donkere modus';

  @override
  String get settings_theme_system_mode => 'Systeemstandaard';

  @override
  String get settings_theme_light_subtitle => 'Gebruik licht thema';

  @override
  String get settings_theme_dark_subtitle => 'Gebruik donker thema';

  @override
  String get settings_theme_system_subtitle => 'Volg systeemthema';

  @override
  String get settings_language_dialog_title => 'Taal';

  @override
  String get settings_system_language => 'System Language';

  @override
  String get settings_use_device_language => 'Use device language';

  @override
  String get settings_export_loading => 'Gegevens exporteren...';

  @override
  String get settings_export_success_message =>
      'Gegevens succesvol geëxporteerd!';

  @override
  String settings_export_failed_message(String error) {
    return 'Export mislukt: $error';
  }

  @override
  String get settings_import_loading => 'Gegevens importeren...';

  @override
  String get settings_import_complete => 'Import voltooid';

  @override
  String get settings_import_success_subtitle => 'Succesvol geïmporteerd:';

  @override
  String get settings_import_water_records => 'waterrecords';

  @override
  String get settings_import_daily_goals => 'dagelijkse doelen';

  @override
  String get settings_import_duplicate_skipped => 'duplicaten overgeslagen';

  @override
  String settings_import_failed_message(String error) {
    return 'Import mislukt: $error';
  }

  @override
  String get settings_reminder_interval_title => 'Herinneringsinterval';

  @override
  String get settings_language_coming_soon => 'Binnenkort beschikbaar';

  @override
  String get settings_export_success => 'Gegevens geëxporteerd';

  @override
  String get settings_export_failed => 'Export mislukt';

  @override
  String get settings_import_success => 'Gegevens geïmporteerd';

  @override
  String get settings_import_failed => 'Import mislukt';

  @override
  String settings_import_stats(int imported, int skipped) {
    return '$imported records geïmporteerd, $skipped duplicaten overgeslagen';
  }

  @override
  String get statistics_title => 'Statistieken';

  @override
  String get statistics_weekly => 'Wekelijks';

  @override
  String get statistics_monthly => 'Maandelijks';

  @override
  String get statistics_yearly => 'Jaarlijks';

  @override
  String get statistics_average => 'Gemiddeld';

  @override
  String get statistics_total => 'Totaal';

  @override
  String get statistics_best_day => 'Beste dag';

  @override
  String get statistics_goal_achievement => 'Doelbereik';

  @override
  String get statistics_no_data => 'Geen gegevens voor deze periode';

  @override
  String get statistics_chart_label => 'Waterinname';

  @override
  String get statistics_total_intake => 'Totale Inname';

  @override
  String get statistics_total_consumed => 'Totaal geconsumeerd';

  @override
  String get statistics_daily_average => 'Dagelijks gemiddelde';

  @override
  String get statistics_goals_met => 'Doelen Behaald';

  @override
  String statistics_out_of(int count) {
    return 'van $count';
  }

  @override
  String get statistics_progress => 'Voortgang';

  @override
  String get statistics_on_track => 'Op schema!';

  @override
  String get statistics_keep_going => 'Ga zo door!';

  @override
  String get statistics_daily_intake => 'Dagelijkse Inname';

  @override
  String get statistics_below_goal => 'Onder doel';

  @override
  String get statistics_goal_met_label => 'Doel behaald';

  @override
  String get statistics_your_streak => 'Jouw Reeks';

  @override
  String get statistics_current => 'Huidig';

  @override
  String get statistics_best => 'Beste';

  @override
  String get statistics_completed => 'Voltooid';

  @override
  String get statistics_next_goal => 'Volgend Doel';

  @override
  String get statistics_days => 'dagen';

  @override
  String get achievements_title => 'Prestaties';

  @override
  String get achievements_unlocked => 'Ontgrendeld';

  @override
  String get achievements_locked => 'Vergrendeld';

  @override
  String get achievements_progress => 'Voortgang';

  @override
  String get achievements_reward_points => 'Beloningspunten';

  @override
  String achievements_total_points(int points) {
    return 'Totaal punten: $points';
  }

  @override
  String get achievement_first_drop => 'Eerste druppel';

  @override
  String get achievement_first_drop_desc => 'Log je eerste waterinname';

  @override
  String get achievement_daily_goal_1 => 'Doelbereiker';

  @override
  String get achievement_daily_goal_1_desc =>
      'Bereik je dagelijkse doel één keer';

  @override
  String get achievement_streak_3 => '3-daagse reeks';

  @override
  String get achievement_streak_3_desc => 'Houd een 3-daagse reeks vol';

  @override
  String get achievement_streak_7 => 'Week-krijger';

  @override
  String get achievement_streak_7_desc => 'Houd een 7-daagse reeks vol';

  @override
  String get achievement_streak_30 => 'Maand-meester';

  @override
  String get achievement_streak_30_desc => 'Houd een 30-daagse reeks vol';

  @override
  String get achievement_total_10l => '10 liter';

  @override
  String get achievement_total_10l_desc => 'Drink in totaal 10 liter';

  @override
  String get achievement_total_100l => '100 liter';

  @override
  String get achievement_total_100l_desc => 'Drink in totaal 100 liter';

  @override
  String get achievement_consistency => 'Consistentie-week';

  @override
  String get achievement_consistency_desc => 'Bereik je doel 7 dagen op rij';

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
  String get reminders_title => 'Herinneringen';

  @override
  String get reminders_active => 'Actieve herinneringen';

  @override
  String get reminders_pending => 'Wachtende meldingen';

  @override
  String get reminders_interval_30 => 'Elke 30 minuten';

  @override
  String get reminders_interval_45 => 'Elke 45 minuten';

  @override
  String get reminders_interval_60 => 'Elk uur';

  @override
  String get reminders_interval_90 => 'Elke 1,5 uur';

  @override
  String get reminders_interval_120 => 'Elke 2 uur';

  @override
  String get reminders_interval_180 => 'Elke 3 uur';

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
  String get reminders_premium_custom_title =>
      'Premium: Aangepaste herinneringen';

  @override
  String get reminders_custom_description =>
      'Voeg onbeperkte herinneringen toe op eigen tijden';

  @override
  String get reminders_custom_add_button => 'Aangepaste tijd toevoegen';

  @override
  String reminders_custom_added(String time) {
    return 'Aangepaste herinnering toegevoegd: $time';
  }

  @override
  String get notification_reminder_title => 'Tijd om water te drinken!';

  @override
  String get notification_reminder_body =>
      'Blijf gehydrateerd! Drink nu wat water.';

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
  String get streak_current => 'Huidige reeks';

  @override
  String streak_days(int days) {
    return '$days dagen';
  }

  @override
  String get streak_keep_going => 'Houd de reeks vol!';

  @override
  String get streak_personal_best => 'Persoonlijk record';

  @override
  String get streak_best => 'Beste!';

  @override
  String get streak_longest => 'Langste';

  @override
  String get streak_next_milestone => 'Volgende mijlpaal';

  @override
  String get streak_start_today => 'Begin vandaag je reeks!';

  @override
  String get streak_complete_goal =>
      'Voltooi je dagelijkse doel om een reeks op te bouwen';

  @override
  String get streak_start => 'Begin je reeks!';

  @override
  String get streak_error => 'Kon reeksgegevens niet laden';

  @override
  String get streak_day_singular => 'dag';

  @override
  String get streak_day_plural => 'dagen';

  @override
  String get onboarding_title_1 => 'Volg je water';

  @override
  String get onboarding_desc_1 =>
      'Log eenvoudig je dagelijkse waterinname met één tik';

  @override
  String get onboarding_title_2 => 'Slimme herinneringen';

  @override
  String get onboarding_desc_2 =>
      'Krijg tijdige herinneringen om de hele dag gehydrateerd te blijven';

  @override
  String get onboarding_title_3 => 'Volg voortgang';

  @override
  String get onboarding_desc_3 =>
      'Bekijk je hydratiestatistieken en bereik je doelen';

  @override
  String get onboarding_title_4 => 'Blijf gezond';

  @override
  String get onboarding_desc_4 =>
      'Bouw gezonde gewoonten op en verbeter je algehele welzijn';

  @override
  String get onboarding_get_started => 'Aan de slag';

  @override
  String get drawer_home => 'Home';

  @override
  String get drawer_statistics => 'Statistieken';

  @override
  String get drawer_achievements => 'Prestaties';

  @override
  String get drawer_profile => 'Profiel';

  @override
  String get drawer_reminders => 'Herinneringen';

  @override
  String get drawer_settings => 'Instellingen';

  @override
  String get drawer_help => 'Help';

  @override
  String get drawer_about => 'Over';

  @override
  String get drawer_logout => 'Uitloggen';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => 'Versie 1.0.0';

  @override
  String get about_description =>
      'Blijf gehydrateerd en gezond met Aqualert. Volg je dagelijkse waterinname en bereik je hydratiedoelen!';

  @override
  String get about_copyright => '© 2024 Aqualert. Alle rechten voorbehouden.';

  @override
  String get about_close => 'Sluiten';

  @override
  String get help_title => 'Help';

  @override
  String get help_subtitle => 'Krijg hulp';

  @override
  String get help_faq => 'Veelgestelde vragen';

  @override
  String get help_contact => 'Neem contact op';

  @override
  String get help_version => 'Versie';

  @override
  String get help_app_info => 'App-informatie';

  @override
  String get help_coming_soon => 'Help - Binnenkort beschikbaar!';

  @override
  String get help_faq_section => 'FAQ';

  @override
  String get help_features_section => 'Functies gids';

  @override
  String get help_about_section => 'Over';

  @override
  String get faq_1_q => 'Hoe wordt mijn dagelijkse waterdoel berekend?';

  @override
  String get faq_1_a =>
      'Je dagelijkse waterdoel wordt berekend op basis van je gewicht, lengte, leeftijd, geslacht en activiteitsniveau met wetenschappelijke formules. Je kunt ook een aangepast doel instellen in Profielinstellingen.';

  @override
  String get faq_2_q => 'Hoe werken herinneringen?';

  @override
  String get faq_2_a =>
      'Je kunt herinneringsintervallen (30-180 minuten) en start/eindtijden instellen. De app stuurt je meldingen gedurende deze periode.';

  @override
  String get faq_3_q => 'Wat zijn reeksen en hoe werken ze?';

  @override
  String get faq_3_a =>
      'Reeksen volgen opeenvolgende dagen waarop je je dagelijkse waterdoel hebt bereikt. Blijf elke dag water drinken om je reeks te behouden en te vergroten!';

  @override
  String get faq_4_q => 'Hoe kan ik de meeteenheden wijzigen?';

  @override
  String get faq_4_a =>
      'Ga naar Instellingen → Eenheden en schakel tussen milliliter (ml) en fluid ounces (fl oz). Alle metingen worden automatisch bijgewerkt.';

  @override
  String get faq_5_q => 'Kan ik mijn watertrackinggegevens exporteren?';

  @override
  String get faq_5_a =>
      'Ja! Ga naar Instellingen → Gegevensbeheer → Gegevens exporteren. Je kunt je gegevens delen of opslaan als JSON-bestand en later importeren.';

  @override
  String get faq_6_q => 'Hoe werken prestaties?';

  @override
  String get faq_6_a =>
      'Voltooi watertracking-mijlpalen om prestaties te ontgrendelen en beloningspunten te verdienen. Volg je voortgang in het Prestaties-scherm.';

  @override
  String get feature_tracking_title => 'Water tracking';

  @override
  String get feature_tracking_desc =>
      'Log eenvoudig je dagelijkse waterinname met snelle toevoegknoppen (250ml, 350ml, 500ml, 750ml) of voer een aangepaste hoeveelheid in.';

  @override
  String get feature_reminders_title => 'Slimme herinneringen';

  @override
  String get feature_reminders_desc =>
      'Stel aanpasbare herinneringsintervallen en actieve uren in. Vergeet nooit om de hele dag water te drinken.';

  @override
  String get feature_statistics_title => 'Statistieken en inzichten';

  @override
  String get feature_statistics_desc =>
      'Bekijk je waterconsumptietrends met wekelijkse, maandelijkse en jaarlijkse grafieken. Volg je voortgang in de tijd.';

  @override
  String get feature_achievements_title => 'Prestaties en reeksen';

  @override
  String get feature_achievements_desc =>
      'Verdien prestaties en behoud dagelijkse reeksen door je waterdoelen te bereiken. Blijf gemotiveerd met gamification!';

  @override
  String get feature_profile_title => 'Profiel en doelen';

  @override
  String get feature_profile_desc =>
      'Stel je persoonlijke informatie in en laat de app je optimale dagelijkse waterdoel berekenen op basis van je lichaamsgegevens.';

  @override
  String get help_contact_email => 'Contact via e-mail';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => 'Beoordeel onze app';

  @override
  String get help_rate_desc =>
      'Geniet je van Aqualert? Laat een recensie achter!';

  @override
  String get help_build_number => 'Build';

  @override
  String get help_copyright => '© 2024 Aqualert. Alle rechten voorbehouden.';

  @override
  String get help_made_with => 'Gemaakt met ❤️ voor je gezondheid';

  @override
  String get error_generic => 'Er is iets misgegaan. Probeer het opnieuw.';

  @override
  String get error_network => 'Netwerkfout. Controleer je verbinding.';

  @override
  String get error_auth_failed => 'Authenticatie mislukt. Probeer het opnieuw.';

  @override
  String get error_permission_denied => 'Toestemming geweigerd.';

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
  String get time_morning => 'Ochtend';

  @override
  String get time_afternoon => 'Middag';

  @override
  String get time_evening => 'Avond';

  @override
  String get time_night => 'Nacht';

  @override
  String get help_privacy_policy => 'Privacybeleid';

  @override
  String get help_privacy_policy_desc => 'Bekijk ons privacybeleid';

  @override
  String get help_privacy_policy_error => 'Kon privacybeleid niet openen';

  @override
  String get settings_delete_account => 'Account verwijderen';

  @override
  String get settings_delete_account_subtitle =>
      'Verwijder je account en alle gegevens permanent';

  @override
  String get settings_delete_account_dialog_title => 'Account verwijderen?';

  @override
  String get settings_delete_account_dialog_message =>
      'Deze actie kan niet ongedaan worden gemaakt. Al je gegevens, inclusief waterinname-geschiedenis, reeksen en instellingen, worden permanent verwijderd.';

  @override
  String get settings_delete_account_confirm => 'Mijn account verwijderen';

  @override
  String get settings_delete_account_cancel => 'Annuleren';

  @override
  String get settings_delete_account_success => 'Account succesvol verwijderd';

  @override
  String get settings_delete_account_error => 'Kon account niet verwijderen';

  @override
  String get settings_delete_account_reauth_required =>
      'Log opnieuw in om je account te verwijderen';

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
  String get privacy_last_updated => 'Laatst bijgewerkt: 2 december 2025';

  @override
  String get privacy_intro_title => 'Inleiding';

  @override
  String get privacy_intro_content =>
      'Welkom bij Aqualert. Wij respecteren uw privacy en zijn toegewijd aan het beschermen van uw persoonlijke gegevens. Dit Privacybeleid legt uit hoe wij uw informatie verzamelen, gebruiken en beschermen wanneer u onze mobiele app gebruikt.';

  @override
  String get privacy_collect_title => 'Informatie die wij verzamelen';

  @override
  String get privacy_collect_content =>
      '• E-mailadres — voor het aanmaken van een account en authenticatie\n• Weergavenaam — optioneel, voor personalisatie\n• Profielinformatie — leeftijd, gewicht, lengte, geslacht, activiteitsniveau\n• Water inname records — hoeveelheid en tijdstempel van consumptie\n• App gebruiksstatistieken — via Firebase Analytics\n• Apparaatinformatie — apparaattype, OS-versie, unieke identificatoren';

  @override
  String get privacy_use_title => 'Hoe wij uw informatie gebruiken';

  @override
  String get privacy_use_content =>
      '• Gepersonaliseerde dagelijkse waterdoelen berekenen\n• Uw waterconsumptiegeschiedenis bijhouden en weergeven\n• Statistieken en inzichten over uw hydratatiehabbits bieden\n• Herinneringsnotificaties sturen\n• Uw gegevens synchroniseren op alle apparaten\n• App-prestaties en gebruikerservaring verbeteren';

  @override
  String get privacy_storage_title => 'Gegevensopslag en beveiliging';

  @override
  String get privacy_storage_content =>
      'Uw gegevens worden opgeslagen met Firebase Authentication en Cloud Firestore (Google Cloud-servers). Gegevens die worden verzonden tussen uw apparaat en onze servers zijn versleuteld met SSL/TLS. Gebruikersgegevens zijn alleen toegankelijk voor de geauthenticeerde gebruiker via Firebase-beveiligingsregels.';

  @override
  String get privacy_third_party_title => 'Diensten van derden';

  @override
  String get privacy_third_party_content =>
      '• Google Firebase — authenticatie, database, analyses, pushmeldingen\n• Google Sign-In — OAuth-authenticatie\n• Firebase Analytics — app-gebruiksanalyses\n\nWij VERKOPEN, verhandelen of verhuren uw persoonlijke informatie NIET aan derden.';

  @override
  String get privacy_rights_title => 'Uw rechten';

  @override
  String get privacy_rights_content =>
      '• Toegang tot en bijwerken van uw persoonlijke informatie via Profiel & Instellingen\n• Uw gegevens (waterrecords, prestaties, instellingen) exporteren in JSON-formaat\n• Verzoek tot verwijdering van uw account en alle bijbehorende gegevens\n• Meldingsvoorkeuren beheren\n\nVoor gegevensverwijdering, neem contact op: dilaraacikgoz.dev@gmail.com\nNa verwijdering worden alle persoonlijke gegevens binnen 30 dagen van onze servers verwijderd.';

  @override
  String get privacy_children_title => 'Privacy van kinderen';

  @override
  String get privacy_children_content =>
      'Aqualert is niet bedoeld voor kinderen onder de 13 jaar. Wij verzamelen niet bewust persoonlijke informatie van kinderen onder de 13 jaar.';

  @override
  String get privacy_gdpr_title => 'AVG-rechten (EU/EER-gebruikers)';

  @override
  String get privacy_gdpr_content =>
      '• Recht op toegang tot uw persoonlijke gegevens\n• Recht op rectificatie van onjuiste gegevens\n• Recht op verwijdering (\"recht om vergeten te worden\")\n• Recht op beperking van de verwerking\n• Recht op gegevensportabiliteit\n• Recht van bezwaar tegen verwerking';

  @override
  String get privacy_kvkk_title => 'KVKK-rechten (Turkije)';

  @override
  String get privacy_kvkk_content =>
      '• Weten of uw persoonlijke gegevens worden verwerkt\n• Informatie opvragen als ze worden verwerkt\n• Het doel van de verwerking kennen\n• Derden kennen aan wie gegevens worden doorgegeven\n• Correctie van onvolledige of onjuiste gegevens verzoeken\n• Verwijdering of vernietiging van gegevens verzoeken';

  @override
  String get privacy_contact_title => 'Neem contact op';

  @override
  String get privacy_contact_content =>
      'Als u vragen heeft over dit Privacybeleid:\n\nE-mail: dilaraacikgoz.dev@gmail.com\nReactietijd: Wij streven ernaar binnen 48 uur te reageren.';
}
