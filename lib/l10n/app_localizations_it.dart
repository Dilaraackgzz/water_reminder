// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => 'Resta idratato per una vita sana';

  @override
  String get common_cancel => 'Annulla';

  @override
  String get common_save => 'Salva';

  @override
  String get common_delete => 'Elimina';

  @override
  String get common_edit => 'Modifica';

  @override
  String get common_add => 'Aggiungi';

  @override
  String get common_ok => 'OK';

  @override
  String get common_yes => 'Sì';

  @override
  String get common_no => 'No';

  @override
  String get common_or => 'o';

  @override
  String get common_done => 'Fatto';

  @override
  String get common_skip => 'Salta';

  @override
  String get common_next => 'Avanti';

  @override
  String get common_back => 'Indietro';

  @override
  String get common_continue => 'Continua';

  @override
  String get common_loading => 'Caricamento...';

  @override
  String get common_error => 'Errore';

  @override
  String get common_success => 'Successo';

  @override
  String get auth_login_title => 'Accedi';

  @override
  String get auth_register_title => 'Registrati';

  @override
  String get auth_email_label => 'E-mail';

  @override
  String get auth_email_hint => 'esempio@email.com';

  @override
  String get auth_password_label => 'Password';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => 'Nome completo';

  @override
  String get auth_name_hint => 'Mario Rossi';

  @override
  String get auth_forgot_password => 'Password dimenticata?';

  @override
  String get auth_dont_have_account => 'Non hai un account? ';

  @override
  String get auth_already_have_account => 'Hai già un account? ';

  @override
  String get auth_sign_in_button => 'Accedi';

  @override
  String get auth_sign_up_button => 'Registrati';

  @override
  String get auth_sign_in_google => 'Accedi con Google';

  @override
  String get auth_sign_up_google => 'Registrati con Google';

  @override
  String get auth_logout => 'Esci';

  @override
  String get auth_validation_email_required => 'L\'e-mail è obbligatoria';

  @override
  String get auth_validation_email_invalid => 'Inserisci un\'e-mail valida';

  @override
  String get auth_validation_password_required => 'La password è obbligatoria';

  @override
  String get auth_validation_password_min_length =>
      'La password deve avere almeno 6 caratteri';

  @override
  String get auth_validation_password_mismatch => 'Passwords don\'t match';

  @override
  String get auth_validation_name_required => 'Il nome è obbligatorio';

  @override
  String get auth_validation_name_min_length =>
      'Il nome deve avere almeno 2 caratteri';

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
  String get auth_email_verification_title => 'Verifica la tua e-mail';

  @override
  String get auth_email_verification_sent =>
      'Abbiamo inviato un link di verifica a:';

  @override
  String get auth_email_verification_instruction =>
      'Controlla la tua e-mail e clicca sul link di verifica per continuare.';

  @override
  String get auth_email_verification_not_received =>
      'Non hai ricevuto l\'e-mail?';

  @override
  String get auth_email_verification_resend => 'Reinvia e-mail di verifica';

  @override
  String get auth_email_verification_check => 'Ho verificato la mia e-mail';

  @override
  String get auth_email_verification_success =>
      'E-mail verificata con successo!';

  @override
  String get auth_email_verification_failed =>
      'E-mail non ancora verificata. Controlla la tua casella di posta.';

  @override
  String get auth_forgot_password_title => 'Reimposta password';

  @override
  String get auth_forgot_password_instruction =>
      'Inserisci il tuo indirizzo e-mail e ti invieremo un link per reimpostare la password.';

  @override
  String get auth_forgot_password_button => 'Invia link';

  @override
  String get auth_forgot_password_success =>
      'E-mail di reimpostazione inviata! Controlla la tua casella di posta.';

  @override
  String get auth_back_to_login => 'Torna all\'accesso';

  @override
  String get home_title => 'Home';

  @override
  String get home_daily_goal => 'Obiettivo giornaliero';

  @override
  String get home_today => 'Oggi';

  @override
  String get home_todays_progress => 'Today\'s Progress';

  @override
  String get home_quick_add => 'Quick Add';

  @override
  String home_amount_to_go(String amount) {
    return '$amount to go!';
  }

  @override
  String get home_custom_amount => 'Quantità personalizzata';

  @override
  String get home_amount_label => 'Quantità';

  @override
  String get home_add_water_success => 'Acqua aggiunta con successo!';

  @override
  String get home_add_water_failed => 'Impossibile aggiungere acqua';

  @override
  String get home_delete_water_confirm => 'Eliminare questo record?';

  @override
  String get home_delete_water_success => 'Record eliminato';

  @override
  String get home_no_records_today => 'Nessun record oggi';

  @override
  String get home_start_drinking => 'Inizia a bere acqua!';

  @override
  String get progress_current => 'Attuale';

  @override
  String get progress_goal => 'Obiettivo';

  @override
  String get progress_remaining => 'Rimanente';

  @override
  String get progress_completed => 'Obiettivo raggiunto!';

  @override
  String progress_percentage(int percent) {
    return '$percent% dell\'obiettivo giornaliero';
  }

  @override
  String get motivational_keep_going =>
      'Continua così! Stai andando alla grande!';

  @override
  String get motivational_almost_there => 'Quasi finito! Ancora un po\'!';

  @override
  String get motivational_goal_reached =>
      'Congratulazioni! Hai raggiunto il tuo obiettivo!';

  @override
  String get motivational_good_start => 'Buon inizio! Continua così!';

  @override
  String get motivational_stay_hydrated =>
      'Resta idratato durante la giornata!';

  @override
  String get motivational_100_1 =>
      'Congratulazioni! Hai raggiunto il tuo obiettivo!';

  @override
  String get motivational_100_2 =>
      'Lavoro incredibile! Resta idratato anche domani!';

  @override
  String get motivational_100_3 => 'Sei un campione dell\'idratazione!';

  @override
  String get motivational_100_4 => 'Perfetto! Mantieni queste buone abitudini!';

  @override
  String get motivational_100_short => 'Obiettivo Raggiunto!';

  @override
  String get motivational_75_1 => 'Quasi finito! Ancora un po\'!';

  @override
  String get motivational_75_2 => 'Stai andando alla grande! Continua!';

  @override
  String get motivational_75_3 => 'Così vicino al tuo obiettivo!';

  @override
  String get motivational_75_4 => 'Progresso fantastico! Non fermarti ora!';

  @override
  String get motivational_75_short => 'Quasi finito!';

  @override
  String get motivational_50_1 => 'A metà strada! Stai andando benissimo!';

  @override
  String get motivational_50_2 => 'Ottimo lavoro! Continua!';

  @override
  String get motivational_50_3 => 'Sei sulla strada giusta!';

  @override
  String get motivational_50_4 => 'Buon progresso! Resta costante!';

  @override
  String get motivational_50_short => 'A metà!';

  @override
  String get motivational_25_1 => 'Buon inizio! Continua a bere acqua!';

  @override
  String get motivational_25_2 => 'Hai iniziato benissimo!';

  @override
  String get motivational_25_3 => 'Bell\'inizio! Resta idratato!';

  @override
  String get motivational_25_4 => 'Continua! Ogni sorso conta!';

  @override
  String get motivational_25_short => 'Buon inizio!';

  @override
  String get motivational_0_1 =>
      'È ora di idratarsi! Il tuo corpo ti ringrazierà!';

  @override
  String get motivational_0_2 => 'Iniziamo il tuo viaggio di idratazione!';

  @override
  String get motivational_0_3 => 'Inizia la giornata con dell\'acqua!';

  @override
  String get motivational_0_4 => 'La tua salute conta! Inizia a bere!';

  @override
  String get motivational_0_short => 'Iniziamo!';

  @override
  String get profile_title => 'Profilo';

  @override
  String get profile_edit => 'Modifica profilo';

  @override
  String get profile_personal_info => 'Informazioni personali';

  @override
  String get profile_body_metrics => 'Metriche corporee';

  @override
  String get profile_activity_level => 'Livello di attività';

  @override
  String get profile_name => 'Nome';

  @override
  String get profile_email => 'E-mail';

  @override
  String get profile_age => 'Età';

  @override
  String get profile_gender => 'Genere';

  @override
  String get profile_weight => 'Peso';

  @override
  String get profile_height => 'Altezza';

  @override
  String get profile_bmi => 'IMC';

  @override
  String get profile_bmi_category => 'Categoria IMC';

  @override
  String get profile_daily_goal => 'Obiettivo giornaliero d\'acqua';

  @override
  String get profile_use_calculated_goal => 'Usa obiettivo calcolato';

  @override
  String get profile_custom_goal => 'Obiettivo personalizzato';

  @override
  String get profile_save_success => 'Profilo aggiornato con successo';

  @override
  String get profile_save_failed => 'Impossibile aggiornare il profilo';

  @override
  String get profile_user_default => 'Utente';

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
  String get gender_male => 'Maschio';

  @override
  String get gender_female => 'Femmina';

  @override
  String get gender_other => 'Altro';

  @override
  String get activity_sedentary => 'Sedentario';

  @override
  String get activity_sedentary_desc => 'Poco o nessun esercizio';

  @override
  String get activity_light => 'Leggermente attivo';

  @override
  String get activity_light_desc => 'Esercizio leggero 1-3 giorni/settimana';

  @override
  String get activity_moderate => 'Moderatamente attivo';

  @override
  String get activity_moderate_desc =>
      'Esercizio moderato 3-5 giorni/settimana';

  @override
  String get activity_very_active => 'Molto attivo';

  @override
  String get activity_very_active_desc =>
      'Esercizio intenso 6-7 giorni/settimana';

  @override
  String get activity_extra_active => 'Extra attivo';

  @override
  String get activity_extra_active_desc =>
      'Esercizio molto intenso e lavoro fisico';

  @override
  String get bmi_underweight => 'Sottopeso';

  @override
  String get bmi_normal => 'Peso normale';

  @override
  String get bmi_overweight => 'Sovrappeso';

  @override
  String get bmi_obese => 'Obeso';

  @override
  String get settings_title => 'Impostazioni';

  @override
  String get settings_notifications => 'Notifiche';

  @override
  String get settings_reminders => 'Promemoria';

  @override
  String get settings_theme => 'Tema';

  @override
  String get settings_units => 'Unità';

  @override
  String get settings_language => 'Lingua';

  @override
  String get settings_profile => 'Impostazioni profilo';

  @override
  String get settings_daily_goal => 'Impostazioni obiettivo';

  @override
  String get settings_data => 'Gestione dati';

  @override
  String get settings_export_data => 'Esporta dati';

  @override
  String get settings_import_data => 'Importa dati';

  @override
  String get settings_help => 'Aiuto e supporto';

  @override
  String get settings_about => 'Informazioni';

  @override
  String get settings_enable_notifications => 'Abilita notifiche';

  @override
  String get settings_reminder_interval => 'Intervallo promemoria';

  @override
  String get settings_reminder_start_time => 'Ora di inizio';

  @override
  String get settings_reminder_end_time => 'Ora di fine';

  @override
  String get settings_test_notification => 'Test notifica';

  @override
  String get settings_theme_light => 'Chiaro';

  @override
  String get settings_theme_dark => 'Scuro';

  @override
  String get settings_theme_system => 'Sistema';

  @override
  String get settings_unit_ml => 'Millilitri (ml)';

  @override
  String get settings_unit_floz => 'Once liquide (fl oz)';

  @override
  String get settings_unit_metric => 'Sistema metrico';

  @override
  String get settings_unit_imperial => 'Sistema imperiale';

  @override
  String get settings_subtitle => 'Personalizza la tua esperienza';

  @override
  String get settings_reminders_active => 'Promemoria acqua attivi';

  @override
  String get settings_reminders_inactive => 'Attiva i promemoria';

  @override
  String get settings_minutes => 'minuti';

  @override
  String get settings_export_subtitle => 'Backup dei tuoi dati sull\'acqua';

  @override
  String get settings_import_subtitle => 'Ripristina da backup';

  @override
  String get settings_profile_subtitle => 'Aggiorna le tue informazioni';

  @override
  String get settings_daily_goal_subtitle =>
      'Gestisci il tuo obiettivo di idratazione';

  @override
  String get settings_theme_dialog_title => 'Tema';

  @override
  String get settings_theme_light_mode => 'Modalità chiara';

  @override
  String get settings_theme_dark_mode => 'Modalità scura';

  @override
  String get settings_theme_system_mode => 'Sistema';

  @override
  String get settings_theme_light_subtitle => 'Usa tema chiaro';

  @override
  String get settings_theme_dark_subtitle => 'Usa tema scuro';

  @override
  String get settings_theme_system_subtitle => 'Segui tema di sistema';

  @override
  String get settings_language_dialog_title => 'Lingua';

  @override
  String get settings_system_language => 'System Language';

  @override
  String get settings_use_device_language => 'Use device language';

  @override
  String get settings_export_loading => 'Esportazione dati...';

  @override
  String get settings_export_success_message => 'Dati esportati con successo!';

  @override
  String settings_export_failed_message(String error) {
    return 'Esportazione fallita: $error';
  }

  @override
  String get settings_import_loading => 'Importazione dati...';

  @override
  String get settings_import_complete => 'Importazione completata';

  @override
  String get settings_import_success_subtitle => 'Importato con successo:';

  @override
  String get settings_import_water_records => 'record d\'acqua';

  @override
  String get settings_import_daily_goals => 'obiettivi giornalieri';

  @override
  String get settings_import_duplicate_skipped => 'duplicati saltati';

  @override
  String settings_import_failed_message(String error) {
    return 'Importazione fallita: $error';
  }

  @override
  String get settings_reminder_interval_title => 'Intervallo promemoria';

  @override
  String get settings_language_coming_soon => 'Prossimamente';

  @override
  String get settings_export_success => 'Dati esportati con successo';

  @override
  String get settings_export_failed => 'Esportazione dati fallita';

  @override
  String get settings_import_success => 'Dati importati con successo';

  @override
  String get settings_import_failed => 'Importazione dati fallita';

  @override
  String settings_import_stats(int imported, int skipped) {
    return 'Importati $imported record, saltati $skipped duplicati';
  }

  @override
  String get statistics_title => 'Statistiche';

  @override
  String get statistics_weekly => 'Settimanale';

  @override
  String get statistics_monthly => 'Mensile';

  @override
  String get statistics_yearly => 'Annuale';

  @override
  String get statistics_average => 'Media';

  @override
  String get statistics_total => 'Totale';

  @override
  String get statistics_best_day => 'Giorno migliore';

  @override
  String get statistics_goal_achievement => 'Raggiungimento obiettivo';

  @override
  String get statistics_no_data => 'Nessun dato per questo periodo';

  @override
  String get statistics_chart_label => 'Consumo d\'acqua';

  @override
  String get statistics_total_intake => 'Assunzione Totale';

  @override
  String get statistics_total_consumed => 'Totale consumato';

  @override
  String get statistics_daily_average => 'Media giornaliera';

  @override
  String get statistics_goals_met => 'Obiettivi Raggiunti';

  @override
  String statistics_out_of(int count) {
    return 'su $count';
  }

  @override
  String get statistics_progress => 'Progresso';

  @override
  String get statistics_on_track => 'In pista!';

  @override
  String get statistics_keep_going => 'Continua così!';

  @override
  String get statistics_daily_intake => 'Assunzione Giornaliera';

  @override
  String get statistics_below_goal => 'Sotto l\'obiettivo';

  @override
  String get statistics_goal_met_label => 'Obiettivo raggiunto';

  @override
  String get statistics_your_streak => 'La Tua Serie';

  @override
  String get statistics_current => 'Attuale';

  @override
  String get statistics_best => 'Migliore';

  @override
  String get statistics_completed => 'Completati';

  @override
  String get statistics_next_goal => 'Prossimo Obiettivo';

  @override
  String get statistics_days => 'giorni';

  @override
  String get achievements_title => 'Obiettivi';

  @override
  String get achievements_unlocked => 'Sbloccato';

  @override
  String get achievements_locked => 'Bloccato';

  @override
  String get achievements_progress => 'Progresso';

  @override
  String get achievements_reward_points => 'Punti premio';

  @override
  String achievements_total_points(int points) {
    return 'Punti totali: $points';
  }

  @override
  String get achievement_first_drop => 'Prima goccia';

  @override
  String get achievement_first_drop_desc =>
      'Registra il tuo primo consumo d\'acqua';

  @override
  String get achievement_daily_goal_1 => 'Raggiungitore di obiettivi';

  @override
  String get achievement_daily_goal_1_desc =>
      'Raggiungi il tuo obiettivo giornaliero una volta';

  @override
  String get achievement_streak_3 => 'Serie di 3 giorni';

  @override
  String get achievement_streak_3_desc => 'Mantieni una serie di 3 giorni';

  @override
  String get achievement_streak_7 => 'Guerriero della settimana';

  @override
  String get achievement_streak_7_desc => 'Mantieni una serie di 7 giorni';

  @override
  String get achievement_streak_30 => 'Maestro del mese';

  @override
  String get achievement_streak_30_desc => 'Mantieni una serie di 30 giorni';

  @override
  String get achievement_total_10l => '10 Litri';

  @override
  String get achievement_total_10l_desc => 'Bevi 10 litri in totale';

  @override
  String get achievement_total_100l => '100 Litri';

  @override
  String get achievement_total_100l_desc => 'Bevi 100 litri in totale';

  @override
  String get achievement_consistency => 'Settimana costante';

  @override
  String get achievement_consistency_desc =>
      'Raggiungi l\'obiettivo per 7 giorni consecutivi';

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
  String get reminders_title => 'Promemoria';

  @override
  String get reminders_active => 'Promemoria attivi';

  @override
  String get reminders_pending => 'Notifiche in sospeso';

  @override
  String get reminders_interval_30 => 'Ogni 30 minuti';

  @override
  String get reminders_interval_45 => 'Ogni 45 minuti';

  @override
  String get reminders_interval_60 => 'Ogni ora';

  @override
  String get reminders_interval_90 => 'Ogni 1,5 ore';

  @override
  String get reminders_interval_120 => 'Ogni 2 ore';

  @override
  String get reminders_interval_180 => 'Ogni 3 ore';

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
  String get notification_reminder_title => 'È ora di bere acqua!';

  @override
  String get notification_reminder_body =>
      'Resta idratato! Bevi un po\' d\'acqua ora.';

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
  String get streak_current => 'Serie attuale';

  @override
  String streak_days(int days) {
    return '$days giorni';
  }

  @override
  String get streak_keep_going => 'Mantieni la serie!';

  @override
  String get streak_personal_best => 'Record personale';

  @override
  String get streak_best => 'Record!';

  @override
  String get streak_longest => 'Più lunga';

  @override
  String get streak_next_milestone => 'Prossimo traguardo';

  @override
  String get streak_start_today => 'Inizia la tua serie oggi!';

  @override
  String get streak_complete_goal =>
      'Completa l\'obiettivo giornaliero per costruire una serie';

  @override
  String get streak_start => 'Inizia la tua serie!';

  @override
  String get streak_error => 'Impossibile caricare i dati della serie';

  @override
  String get streak_day_singular => 'giorno';

  @override
  String get streak_day_plural => 'giorni';

  @override
  String get onboarding_title_1 => 'Traccia la tua acqua';

  @override
  String get onboarding_desc_1 =>
      'Registra facilmente il tuo consumo giornaliero con un tocco';

  @override
  String get onboarding_title_2 => 'Promemoria intelligenti';

  @override
  String get onboarding_desc_2 =>
      'Ricevi promemoria tempestivi per restare idratato tutto il giorno';

  @override
  String get onboarding_title_3 => 'Monitora i progressi';

  @override
  String get onboarding_desc_3 =>
      'Visualizza le statistiche di idratazione e raggiungi i tuoi obiettivi';

  @override
  String get onboarding_title_4 => 'Resta in salute';

  @override
  String get onboarding_desc_4 =>
      'Costruisci abitudini sane e migliora il tuo benessere';

  @override
  String get onboarding_get_started => 'Inizia';

  @override
  String get drawer_home => 'Home';

  @override
  String get drawer_statistics => 'Statistiche';

  @override
  String get drawer_achievements => 'Obiettivi';

  @override
  String get drawer_profile => 'Profilo';

  @override
  String get drawer_reminders => 'Promemoria';

  @override
  String get drawer_settings => 'Impostazioni';

  @override
  String get drawer_help => 'Aiuto e supporto';

  @override
  String get drawer_about => 'Informazioni';

  @override
  String get drawer_logout => 'Esci';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => 'Versione 1.0.0';

  @override
  String get about_description =>
      'Resta idratato e in salute con Aqualert. Traccia il tuo consumo giornaliero d\'acqua e raggiungi i tuoi obiettivi di idratazione!';

  @override
  String get about_copyright => '© 2024 Aqualert. Tutti i diritti riservati.';

  @override
  String get about_close => 'Chiudi';

  @override
  String get help_title => 'Aiuto e supporto';

  @override
  String get help_subtitle => 'Ottieni aiuto e scopri di più';

  @override
  String get help_faq => 'Domande frequenti';

  @override
  String get help_contact => 'Contattaci';

  @override
  String get help_version => 'Versione';

  @override
  String get help_app_info => 'Informazioni app';

  @override
  String get help_coming_soon => 'Aiuto e supporto - Prossimamente!';

  @override
  String get help_faq_section => 'FAQ';

  @override
  String get help_features_section => 'Guida alle funzionalità';

  @override
  String get help_about_section => 'Informazioni';

  @override
  String get faq_1_q =>
      'Come viene calcolato il mio obiettivo giornaliero d\'acqua?';

  @override
  String get faq_1_a =>
      'Il tuo obiettivo giornaliero viene calcolato in base a peso, altezza, età, genere e livello di attività utilizzando formule scientifiche. Puoi anche impostare un obiettivo personalizzato nelle impostazioni del profilo.';

  @override
  String get faq_2_q => 'Come funzionano i promemoria?';

  @override
  String get faq_2_a =>
      'Puoi impostare intervalli di promemoria (30-180 minuti) e scegliere orari di inizio/fine. L\'app ti invierà notifiche durante questo periodo per aiutarti a restare idratato.';

  @override
  String get faq_3_q => 'Cosa sono le serie e come funzionano?';

  @override
  String get faq_3_a =>
      'Le serie tracciano i giorni consecutivi in cui hai raggiunto l\'obiettivo giornaliero. Continua a bere acqua ogni giorno per mantenere e aumentare la tua serie!';

  @override
  String get faq_4_q => 'Come posso cambiare le unità di misura?';

  @override
  String get faq_4_a =>
      'Vai in Impostazioni → Unità e passa tra millilitri (ml) e once liquide (fl oz). Tutte le misure si aggiorneranno automaticamente.';

  @override
  String get faq_5_q => 'Posso esportare i miei dati di tracciamento?';

  @override
  String get faq_5_a =>
      'Sì! Vai in Impostazioni → Gestione dati → Esporta dati. Puoi condividere o salvare i tuoi dati come file JSON e importarli in seguito.';

  @override
  String get faq_6_q => 'Come funzionano gli obiettivi?';

  @override
  String get faq_6_a =>
      'Completa le tappe di tracciamento dell\'acqua per sbloccare obiettivi e guadagnare punti premio. Segui i tuoi progressi nella schermata Obiettivi.';

  @override
  String get feature_tracking_title => 'Tracciamento acqua';

  @override
  String get feature_tracking_desc =>
      'Registra facilmente il tuo consumo giornaliero con pulsanti rapidi (250ml, 350ml, 500ml, 750ml) o inserisci una quantità personalizzata.';

  @override
  String get feature_reminders_title => 'Promemoria intelligenti';

  @override
  String get feature_reminders_desc =>
      'Imposta intervalli di promemoria personalizzabili e scegli le ore attive. Non dimenticare mai di bere acqua durante il giorno.';

  @override
  String get feature_statistics_title => 'Statistiche e approfondimenti';

  @override
  String get feature_statistics_desc =>
      'Visualizza le tendenze del tuo consumo d\'acqua con grafici settimanali, mensili e annuali. Traccia i tuoi progressi nel tempo.';

  @override
  String get feature_achievements_title => 'Obiettivi e serie';

  @override
  String get feature_achievements_desc =>
      'Guadagna obiettivi e mantieni serie giornaliere raggiungendo i tuoi traguardi d\'acqua. Resta motivato con la gamification!';

  @override
  String get feature_profile_title => 'Profilo e obiettivi';

  @override
  String get feature_profile_desc =>
      'Imposta le tue informazioni personali e lascia che l\'app calcoli il tuo obiettivo giornaliero ottimale d\'acqua in base alle tue metriche corporee.';

  @override
  String get help_contact_email => 'Contatta via e-mail';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => 'Valuta la nostra app';

  @override
  String get help_rate_desc => 'Ti piace Aqualert? Lasciaci una recensione!';

  @override
  String get help_build_number => 'Build';

  @override
  String get help_copyright => '© 2024 Aqualert. Tutti i diritti riservati.';

  @override
  String get help_made_with => 'Fatto con ❤️ per la tua salute';

  @override
  String get error_generic => 'Qualcosa è andato storto. Riprova.';

  @override
  String get error_network => 'Errore di rete. Controlla la connessione.';

  @override
  String get error_auth_failed => 'Autenticazione fallita. Riprova.';

  @override
  String get error_permission_denied => 'Permesso negato.';

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
  String get time_morning => 'Mattina';

  @override
  String get time_afternoon => 'Pomeriggio';

  @override
  String get time_evening => 'Sera';

  @override
  String get time_night => 'Notte';

  @override
  String get help_privacy_policy => 'Informativa sulla privacy';

  @override
  String get help_privacy_policy_desc =>
      'Visualizza la nostra informativa sulla privacy';

  @override
  String get help_privacy_policy_error =>
      'Impossibile aprire l\'informativa sulla privacy';

  @override
  String get settings_delete_account => 'Elimina account';

  @override
  String get settings_delete_account_subtitle =>
      'Elimina permanentemente il tuo account e tutti i dati';

  @override
  String get settings_delete_account_dialog_title => 'Eliminare l\'account?';

  @override
  String get settings_delete_account_dialog_message =>
      'Questa azione non può essere annullata. Tutti i tuoi dati, inclusa la cronologia del consumo d\'acqua, le serie e le impostazioni, verranno eliminati permanentemente.';

  @override
  String get settings_delete_account_confirm => 'Elimina il mio account';

  @override
  String get settings_delete_account_cancel => 'Annulla';

  @override
  String get settings_delete_account_success =>
      'Account eliminato con successo';

  @override
  String get settings_delete_account_error =>
      'Impossibile eliminare l\'account';

  @override
  String get settings_delete_account_reauth_required =>
      'Effettua nuovamente l\'accesso per eliminare il tuo account';

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
