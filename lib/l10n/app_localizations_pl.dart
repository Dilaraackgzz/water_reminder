// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => 'Nawadniaj się dla zdrowego życia';

  @override
  String get common_cancel => 'Anuluj';

  @override
  String get common_save => 'Zapisz';

  @override
  String get common_delete => 'Usuń';

  @override
  String get common_edit => 'Edytuj';

  @override
  String get common_add => 'Dodaj';

  @override
  String get common_ok => 'OK';

  @override
  String get common_yes => 'Tak';

  @override
  String get common_no => 'Nie';

  @override
  String get common_or => 'lub';

  @override
  String get common_done => 'Gotowe';

  @override
  String get common_skip => 'Pomiń';

  @override
  String get common_next => 'Dalej';

  @override
  String get common_back => 'Wstecz';

  @override
  String get common_continue => 'Kontynuuj';

  @override
  String get common_loading => 'Ładowanie...';

  @override
  String get common_error => 'Błąd';

  @override
  String get common_success => 'Sukces';

  @override
  String get auth_login_title => 'Zaloguj się';

  @override
  String get auth_register_title => 'Zarejestruj się';

  @override
  String get auth_email_label => 'E-mail';

  @override
  String get auth_email_hint => 'przyklad@email.com';

  @override
  String get auth_password_label => 'Hasło';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => 'Imię i nazwisko';

  @override
  String get auth_name_hint => 'Jan Kowalski';

  @override
  String get auth_forgot_password => 'Zapomniałeś hasła?';

  @override
  String get auth_dont_have_account => 'Nie masz konta? ';

  @override
  String get auth_already_have_account => 'Masz już konto? ';

  @override
  String get auth_sign_in_button => 'Zaloguj się';

  @override
  String get auth_sign_up_button => 'Zarejestruj się';

  @override
  String get auth_sign_in_google => 'Zaloguj się przez Google';

  @override
  String get auth_sign_up_google => 'Zarejestruj się przez Google';

  @override
  String get auth_logout => 'Wyloguj się';

  @override
  String get auth_validation_email_required => 'E-mail jest wymagany';

  @override
  String get auth_validation_email_invalid => 'Wprowadź prawidłowy e-mail';

  @override
  String get auth_validation_password_required => 'Hasło jest wymagane';

  @override
  String get auth_validation_password_min_length =>
      'Hasło musi mieć co najmniej 6 znaków';

  @override
  String get auth_validation_password_mismatch => 'Passwords don\'t match';

  @override
  String get auth_validation_name_required => 'Imię jest wymagane';

  @override
  String get auth_validation_name_min_length =>
      'Imię musi mieć co najmniej 2 znaki';

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
  String get auth_email_verification_title => 'Zweryfikuj swój e-mail';

  @override
  String get auth_email_verification_sent =>
      'Wysłaliśmy link weryfikacyjny na:';

  @override
  String get auth_email_verification_instruction =>
      'Sprawdź swój e-mail i kliknij link weryfikacyjny.';

  @override
  String get auth_email_verification_not_received => 'Nie otrzymałeś e-maila?';

  @override
  String get auth_email_verification_resend => 'Wyślij ponownie';

  @override
  String get auth_email_verification_check => 'Zweryfikowałem swój e-mail';

  @override
  String get auth_email_verification_success =>
      'E-mail zweryfikowany pomyślnie!';

  @override
  String get auth_email_verification_failed =>
      'E-mail jeszcze nie zweryfikowany. Sprawdź skrzynkę odbiorczą.';

  @override
  String get auth_forgot_password_title => 'Resetuj hasło';

  @override
  String get auth_forgot_password_instruction =>
      'Wprowadź swój adres e-mail, a wyślemy Ci link do resetowania hasła.';

  @override
  String get auth_forgot_password_button => 'Wyślij link resetujący';

  @override
  String get auth_forgot_password_success =>
      'E-mail z resetowaniem hasła wysłany!';

  @override
  String get auth_back_to_login => 'Wróć do logowania';

  @override
  String get home_title => 'Strona główna';

  @override
  String get home_daily_goal => 'Dzienny cel';

  @override
  String get home_today => 'Dzisiaj';

  @override
  String get home_todays_progress => 'Today\'s Progress';

  @override
  String get home_quick_add => 'Quick Add';

  @override
  String home_amount_to_go(String amount) {
    return '$amount to go!';
  }

  @override
  String get home_custom_amount => 'Własna ilość';

  @override
  String get home_amount_label => 'Ilość';

  @override
  String get home_add_water_success => 'Woda dodana!';

  @override
  String get home_add_water_failed => 'Nie udało się dodać wody';

  @override
  String get home_delete_water_confirm => 'Usunąć ten wpis?';

  @override
  String get home_delete_water_success => 'Wpis usunięty';

  @override
  String get home_no_records_today => 'Brak wpisów na dziś';

  @override
  String get home_start_drinking => 'Zacznij pić wodę!';

  @override
  String get progress_current => 'Obecny';

  @override
  String get progress_goal => 'Cel';

  @override
  String get progress_remaining => 'Pozostało';

  @override
  String get progress_completed => 'Cel osiągnięty!';

  @override
  String progress_percentage(int percent) {
    return '$percent% dziennego celu';
  }

  @override
  String get motivational_keep_going => 'Tak trzymaj! Świetnie ci idzie!';

  @override
  String get motivational_almost_there => 'Prawie gotowe! Jeszcze trochę!';

  @override
  String get motivational_goal_reached => 'Gratulacje! Osiągnąłeś swój cel!';

  @override
  String get motivational_good_start => 'Dobry początek! Kontynuuj!';

  @override
  String get motivational_stay_hydrated => 'Nawadniaj się przez cały dzień!';

  @override
  String get motivational_100_1 => 'Gratulacje! Osiągnąłeś swój cel!';

  @override
  String get motivational_100_2 => 'Świetna robota! Jutro też się nawadniaj!';

  @override
  String get motivational_100_3 => 'Jesteś mistrzem nawadniania!';

  @override
  String get motivational_100_4 => 'Perfekcyjnie! Utrzymuj dobre nawyki!';

  @override
  String get motivational_100_short => 'Cel osiągnięty!';

  @override
  String get motivational_75_1 => 'Prawie gotowe! Jeszcze trochę!';

  @override
  String get motivational_75_2 => 'Świetnie ci idzie! Kontynuuj!';

  @override
  String get motivational_75_3 => 'Tak blisko celu!';

  @override
  String get motivational_75_4 => 'Fantastyczny postęp! Nie przestawaj!';

  @override
  String get motivational_75_short => 'Prawie gotowe!';

  @override
  String get motivational_50_1 => 'W połowie drogi! Świetnie!';

  @override
  String get motivational_50_2 => 'Dobra robota! Kontynuuj!';

  @override
  String get motivational_50_3 => 'Jesteś na dobrej drodze!';

  @override
  String get motivational_50_4 => 'Dobry postęp! Bądź konsekwentny!';

  @override
  String get motivational_50_short => 'Połowa!';

  @override
  String get motivational_25_1 => 'Dobry początek! Pij dalej wodę!';

  @override
  String get motivational_25_2 => 'Świetny start!';

  @override
  String get motivational_25_3 => 'Dobre początki! Nawadniaj się!';

  @override
  String get motivational_25_4 => 'Kontynuuj! Każdy łyk się liczy!';

  @override
  String get motivational_25_short => 'Dobry początek!';

  @override
  String get motivational_0_1 =>
      'Czas na nawadnianie! Twoje ciało ci podziękuje!';

  @override
  String get motivational_0_2 => 'Rozpocznij swoją podróż nawadniania!';

  @override
  String get motivational_0_3 => 'Zacznij dzień od wody!';

  @override
  String get motivational_0_4 => 'Twoje zdrowie jest ważne! Zacznij pić!';

  @override
  String get motivational_0_short => 'Zaczynamy!';

  @override
  String get profile_title => 'Profil';

  @override
  String get profile_edit => 'Edytuj';

  @override
  String get profile_personal_info => 'Informacje osobiste';

  @override
  String get profile_body_metrics => 'Parametry ciała';

  @override
  String get profile_activity_level => 'Poziom aktywności';

  @override
  String get profile_name => 'Imię';

  @override
  String get profile_email => 'E-mail';

  @override
  String get profile_age => 'Wiek';

  @override
  String get profile_gender => 'Płeć';

  @override
  String get profile_weight => 'Waga';

  @override
  String get profile_height => 'Wzrost';

  @override
  String get profile_bmi => 'BMI';

  @override
  String get profile_bmi_category => 'Kategoria BMI';

  @override
  String get profile_daily_goal => 'Dzienny cel wody';

  @override
  String get profile_use_calculated_goal => 'Użyj obliczonego celu';

  @override
  String get profile_custom_goal => 'Własny cel';

  @override
  String get profile_save_success => 'Profil zaktualizowany';

  @override
  String get profile_save_failed => 'Nie udało się zaktualizować profilu';

  @override
  String get profile_user_default => 'Użytkownik';

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
  String get gender_male => 'Mężczyzna';

  @override
  String get gender_female => 'Kobieta';

  @override
  String get gender_other => 'Inne';

  @override
  String get activity_sedentary => 'Siedzący tryb życia';

  @override
  String get activity_sedentary_desc => 'Mało lub brak ćwiczeń';

  @override
  String get activity_light => 'Lekka aktywność';

  @override
  String get activity_light_desc => 'Lekkie ćwiczenia 1-3 dni/tydzień';

  @override
  String get activity_moderate => 'Umiarkowana aktywność';

  @override
  String get activity_moderate_desc => 'Umiarkowane ćwiczenia 3-5 dni/tydzień';

  @override
  String get activity_very_active => 'Bardzo aktywny';

  @override
  String get activity_very_active_desc =>
      'Intensywne ćwiczenia 6-7 dni/tydzień';

  @override
  String get activity_extra_active => 'Ekstremalnie aktywny';

  @override
  String get activity_extra_active_desc =>
      'Bardzo intensywne ćwiczenia i praca fizyczna';

  @override
  String get bmi_underweight => 'Niedowaga';

  @override
  String get bmi_normal => 'Normalna waga';

  @override
  String get bmi_overweight => 'Nadwaga';

  @override
  String get bmi_obese => 'Otyłość';

  @override
  String get settings_title => 'Ustawienia';

  @override
  String get settings_notifications => 'Powiadomienia';

  @override
  String get settings_reminders => 'Przypomnienia';

  @override
  String get settings_theme => 'Motyw';

  @override
  String get settings_units => 'Jednostki';

  @override
  String get settings_language => 'Język';

  @override
  String get settings_profile => 'Ustawienia profilu';

  @override
  String get settings_daily_goal => 'Ustawienia celu';

  @override
  String get settings_data => 'Zarządzanie danymi';

  @override
  String get settings_export_data => 'Eksportuj dane';

  @override
  String get settings_import_data => 'Importuj dane';

  @override
  String get settings_help => 'Pomoc';

  @override
  String get settings_about => 'O aplikacji';

  @override
  String get settings_enable_notifications => 'Włącz powiadomienia';

  @override
  String get settings_reminder_interval => 'Interwał przypomnień';

  @override
  String get settings_reminder_start_time => 'Czas rozpoczęcia';

  @override
  String get settings_reminder_end_time => 'Czas zakończenia';

  @override
  String get settings_test_notification => 'Testowe powiadomienie';

  @override
  String get settings_theme_light => 'Jasny';

  @override
  String get settings_theme_dark => 'Ciemny';

  @override
  String get settings_theme_system => 'Systemowy';

  @override
  String get settings_unit_ml => 'Mililitry (ml)';

  @override
  String get settings_unit_floz => 'Uncje płynne (fl oz)';

  @override
  String get settings_unit_metric => 'System metryczny';

  @override
  String get settings_unit_imperial => 'System imperialny';

  @override
  String get settings_subtitle => 'Dostosuj swoje doświadczenie';

  @override
  String get settings_reminders_active => 'Przypomnienia są aktywne';

  @override
  String get settings_reminders_inactive =>
      'Włącz, aby otrzymywać przypomnienia';

  @override
  String get settings_minutes => 'minut';

  @override
  String get settings_export_subtitle => 'Utwórz kopię zapasową danych';

  @override
  String get settings_import_subtitle => 'Przywróć z pliku kopii zapasowej';

  @override
  String get settings_profile_subtitle => 'Zaktualizuj swoje informacje';

  @override
  String get settings_daily_goal_subtitle =>
      'Zarządzaj swoim celem nawadniania';

  @override
  String get settings_theme_dialog_title => 'Motyw';

  @override
  String get settings_theme_light_mode => 'Jasny motyw';

  @override
  String get settings_theme_dark_mode => 'Ciemny motyw';

  @override
  String get settings_theme_system_mode => 'Motyw systemowy';

  @override
  String get settings_theme_light_subtitle => 'Użyj jasnego motywu';

  @override
  String get settings_theme_dark_subtitle => 'Użyj ciemnego motywu';

  @override
  String get settings_theme_system_subtitle =>
      'Podążaj za ustawieniami systemu';

  @override
  String get settings_language_dialog_title => 'Język';

  @override
  String get settings_system_language => 'System Language';

  @override
  String get settings_use_device_language => 'Use device language';

  @override
  String get settings_export_loading => 'Eksportowanie danych...';

  @override
  String get settings_export_success_message =>
      'Dane wyeksportowane pomyślnie!';

  @override
  String settings_export_failed_message(String error) {
    return 'Eksport nie powiódł się: $error';
  }

  @override
  String get settings_import_loading => 'Importowanie danych...';

  @override
  String get settings_import_complete => 'Import zakończony';

  @override
  String get settings_import_success_subtitle => 'Pomyślnie zaimportowano:';

  @override
  String get settings_import_water_records => 'wpisów wody';

  @override
  String get settings_import_daily_goals => 'dziennych celów';

  @override
  String get settings_import_duplicate_skipped => 'duplikatów pominiętych';

  @override
  String settings_import_failed_message(String error) {
    return 'Import nie powiódł się: $error';
  }

  @override
  String get settings_reminder_interval_title => 'Interwał przypomnień';

  @override
  String get settings_language_coming_soon => 'Wkrótce';

  @override
  String get settings_export_success => 'Dane wyeksportowane';

  @override
  String get settings_export_failed => 'Eksport nie powiódł się';

  @override
  String get settings_import_success => 'Dane zaimportowane';

  @override
  String get settings_import_failed => 'Import nie powiódł się';

  @override
  String settings_import_stats(int imported, int skipped) {
    return 'Zaimportowano $imported wpisów, pominięto $skipped duplikatów';
  }

  @override
  String get statistics_title => 'Statystyki';

  @override
  String get statistics_weekly => 'Tygodniowe';

  @override
  String get statistics_monthly => 'Miesięczne';

  @override
  String get statistics_yearly => 'Roczne';

  @override
  String get statistics_average => 'Średnia';

  @override
  String get statistics_total => 'Suma';

  @override
  String get statistics_best_day => 'Najlepszy dzień';

  @override
  String get statistics_goal_achievement => 'Osiągnięcie celu';

  @override
  String get statistics_no_data => 'Brak danych dla tego okresu';

  @override
  String get statistics_chart_label => 'Spożycie wody';

  @override
  String get statistics_total_intake => 'Całkowite Spożycie';

  @override
  String get statistics_total_consumed => 'Łącznie spożyte';

  @override
  String get statistics_daily_average => 'Średnia dzienna';

  @override
  String get statistics_goals_met => 'Cele Osiągnięte';

  @override
  String statistics_out_of(int count) {
    return 'z $count';
  }

  @override
  String get statistics_progress => 'Postęp';

  @override
  String get statistics_on_track => 'Na dobrej drodze!';

  @override
  String get statistics_keep_going => 'Tak trzymaj!';

  @override
  String get statistics_daily_intake => 'Dzienne Spożycie';

  @override
  String get statistics_below_goal => 'Poniżej celu';

  @override
  String get statistics_goal_met_label => 'Cel osiągnięty';

  @override
  String get statistics_your_streak => 'Twoja Seria';

  @override
  String get statistics_current => 'Aktualnie';

  @override
  String get statistics_best => 'Najlepsza';

  @override
  String get statistics_completed => 'Ukończone';

  @override
  String get statistics_next_goal => 'Następny Cel';

  @override
  String get statistics_days => 'dni';

  @override
  String get achievements_title => 'Osiągnięcia';

  @override
  String get achievements_unlocked => 'Odblokowane';

  @override
  String get achievements_locked => 'Zablokowane';

  @override
  String get achievements_progress => 'Postęp';

  @override
  String get achievements_reward_points => 'Punkty nagród';

  @override
  String achievements_total_points(int points) {
    return 'Suma punktów: $points';
  }

  @override
  String get achievement_first_drop => 'Pierwsza kropla';

  @override
  String get achievement_first_drop_desc => 'Zapisz pierwsze spożycie wody';

  @override
  String get achievement_daily_goal_1 => 'Zdobywca celów';

  @override
  String get achievement_daily_goal_1_desc => 'Osiągnij dzienny cel raz';

  @override
  String get achievement_streak_3 => '3-dniowa seria';

  @override
  String get achievement_streak_3_desc => 'Utrzymaj 3-dniową serię';

  @override
  String get achievement_streak_7 => 'Wojownik tygodnia';

  @override
  String get achievement_streak_7_desc => 'Utrzymaj 7-dniową serię';

  @override
  String get achievement_streak_30 => 'Mistrz miesiąca';

  @override
  String get achievement_streak_30_desc => 'Utrzymaj 30-dniową serię';

  @override
  String get achievement_total_10l => '10 litrów';

  @override
  String get achievement_total_10l_desc => 'Wypij łącznie 10 litrów';

  @override
  String get achievement_total_100l => '100 litrów';

  @override
  String get achievement_total_100l_desc => 'Wypij łącznie 100 litrów';

  @override
  String get achievement_consistency => 'Tydzień konsekwencji';

  @override
  String get achievement_consistency_desc => 'Osiągaj cel przez 7 dni z rzędu';

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
  String get reminders_title => 'Przypomnienia';

  @override
  String get reminders_active => 'Aktywne przypomnienia';

  @override
  String get reminders_pending => 'Oczekujące powiadomienia';

  @override
  String get reminders_interval_30 => 'Co 30 minut';

  @override
  String get reminders_interval_45 => 'Co 45 minut';

  @override
  String get reminders_interval_60 => 'Co godzinę';

  @override
  String get reminders_interval_90 => 'Co 1,5 godziny';

  @override
  String get reminders_interval_120 => 'Co 2 godziny';

  @override
  String get reminders_interval_180 => 'Co 3 godziny';

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
  String get notification_reminder_title => 'Czas napić się wody!';

  @override
  String get notification_reminder_body =>
      'Nawadniaj się! Wypij teraz trochę wody.';

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
  String get streak_current => 'Obecna seria';

  @override
  String streak_days(int days) {
    return '$days dni';
  }

  @override
  String get streak_keep_going => 'Utrzymuj serię!';

  @override
  String get streak_personal_best => 'Rekord osobisty';

  @override
  String get streak_best => 'Najlepsza!';

  @override
  String get streak_longest => 'Najdłuższa';

  @override
  String get streak_next_milestone => 'Następny kamień milowy';

  @override
  String get streak_start_today => 'Zacznij swoją serię dzisiaj!';

  @override
  String get streak_complete_goal => 'Ukończ dzienny cel, aby budować serię';

  @override
  String get streak_start => 'Rozpocznij swoją serię!';

  @override
  String get streak_error => 'Nie udało się załadować danych serii';

  @override
  String get streak_day_singular => 'dzień';

  @override
  String get streak_day_plural => 'dni';

  @override
  String get onboarding_title_1 => 'Śledź swoją wodę';

  @override
  String get onboarding_desc_1 =>
      'Łatwo zapisuj dzienne spożycie wody jednym dotknięciem';

  @override
  String get onboarding_title_2 => 'Inteligentne przypomnienia';

  @override
  String get onboarding_desc_2 =>
      'Otrzymuj terminowe przypomnienia, aby nawadniać się przez cały dzień';

  @override
  String get onboarding_title_3 => 'Monitoruj postępy';

  @override
  String get onboarding_desc_3 =>
      'Przeglądaj statystyki nawadniania i osiągaj cele';

  @override
  String get onboarding_title_4 => 'Bądź zdrowy';

  @override
  String get onboarding_desc_4 =>
      'Buduj zdrowe nawyki i poprawiaj ogólne samopoczucie';

  @override
  String get onboarding_get_started => 'Rozpocznij';

  @override
  String get drawer_home => 'Strona główna';

  @override
  String get drawer_statistics => 'Statystyki';

  @override
  String get drawer_achievements => 'Osiągnięcia';

  @override
  String get drawer_profile => 'Profil';

  @override
  String get drawer_reminders => 'Przypomnienia';

  @override
  String get drawer_settings => 'Ustawienia';

  @override
  String get drawer_help => 'Pomoc';

  @override
  String get drawer_about => 'O aplikacji';

  @override
  String get drawer_logout => 'Wyloguj się';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => 'Wersja 1.0.0';

  @override
  String get about_description =>
      'Bądź nawodniony i zdrowy z Aqualert. Śledź dzienne spożycie wody i osiągaj cele nawadniania!';

  @override
  String get about_copyright => '© 2024 Aqualert. Wszelkie prawa zastrzeżone.';

  @override
  String get about_close => 'Zamknij';

  @override
  String get help_title => 'Pomoc';

  @override
  String get help_subtitle => 'Uzyskaj pomoc';

  @override
  String get help_faq => 'Najczęściej zadawane pytania';

  @override
  String get help_contact => 'Skontaktuj się z nami';

  @override
  String get help_version => 'Wersja';

  @override
  String get help_app_info => 'Informacje o aplikacji';

  @override
  String get help_coming_soon => 'Pomoc - Wkrótce!';

  @override
  String get help_faq_section => 'FAQ';

  @override
  String get help_features_section => 'Przewodnik po funkcjach';

  @override
  String get help_about_section => 'O aplikacji';

  @override
  String get faq_1_q => 'Jak obliczany jest mój dzienny cel wody?';

  @override
  String get faq_1_a =>
      'Twój dzienny cel wody jest obliczany na podstawie wagi, wzrostu, wieku, płci i poziomu aktywności przy użyciu wzorów naukowych. Możesz także ustawić własny cel w ustawieniach profilu.';

  @override
  String get faq_2_q => 'Jak działają przypomnienia?';

  @override
  String get faq_2_a =>
      'Możesz ustawić interwały przypomnień (30-180 minut) i wybrać czas rozpoczęcia/zakończenia. Aplikacja będzie wysyłać powiadomienia w tym okresie.';

  @override
  String get faq_3_q => 'Czym są serie i jak działają?';

  @override
  String get faq_3_a =>
      'Serie śledzą kolejne dni, w których osiągnąłeś dzienny cel wody. Pij wodę codziennie, aby utrzymywać i zwiększać swoją serię!';

  @override
  String get faq_4_q => 'Jak mogę zmienić jednostki miary?';

  @override
  String get faq_4_a =>
      'Przejdź do Ustawienia → Jednostki i przełącz między mililitrami (ml) a uncjami płynnymi (fl oz). Wszystkie pomiary zostaną automatycznie zaktualizowane.';

  @override
  String get faq_5_q => 'Czy mogę eksportować swoje dane?';

  @override
  String get faq_5_a =>
      'Tak! Przejdź do Ustawienia → Zarządzanie danymi → Eksportuj dane. Możesz udostępnić lub zapisać dane jako plik JSON i zaimportować je później.';

  @override
  String get faq_6_q => 'Jak działają osiągnięcia?';

  @override
  String get faq_6_a =>
      'Ukończ kamienie milowe śledzenia wody, aby odblokować osiągnięcia i zdobywać punkty nagród. Śledź swoje postępy na ekranie Osiągnięcia.';

  @override
  String get feature_tracking_title => 'Śledzenie wody';

  @override
  String get feature_tracking_desc =>
      'Łatwo zapisuj dzienne spożycie wody przyciskami szybkiego dodawania (250ml, 350ml, 500ml, 750ml) lub wprowadź własną ilość.';

  @override
  String get feature_reminders_title => 'Inteligentne przypomnienia';

  @override
  String get feature_reminders_desc =>
      'Ustaw dostosowywalne interwały przypomnień i aktywne godziny. Nigdy nie zapomnij pić wody przez cały dzień.';

  @override
  String get feature_statistics_title => 'Statystyki i spostrzeżenia';

  @override
  String get feature_statistics_desc =>
      'Przeglądaj trendy spożycia wody z wykresami tygodniowymi, miesięcznymi i rocznymi. Śledź swoje postępy w czasie.';

  @override
  String get feature_achievements_title => 'Osiągnięcia i serie';

  @override
  String get feature_achievements_desc =>
      'Zdobywaj osiągnięcia i utrzymuj dzienne serie, osiągając cele wody. Bądź zmotywowany dzięki grywalizacji!';

  @override
  String get feature_profile_title => 'Profil i cele';

  @override
  String get feature_profile_desc =>
      'Ustaw swoje dane osobowe i pozwól aplikacji obliczyć optymalny dzienny cel wody na podstawie parametrów ciała.';

  @override
  String get help_contact_email => 'Kontakt e-mailowy';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => 'Oceń naszą aplikację';

  @override
  String get help_rate_desc => 'Podoba ci się Aqualert? Zostaw recenzję!';

  @override
  String get help_build_number => 'Kompilacja';

  @override
  String get help_copyright => '© 2024 Aqualert. Wszelkie prawa zastrzeżone.';

  @override
  String get help_made_with => 'Stworzone z ❤️ dla twojego zdrowia';

  @override
  String get error_generic => 'Coś poszło nie tak. Spróbuj ponownie.';

  @override
  String get error_network => 'Błąd sieci. Sprawdź połączenie.';

  @override
  String get error_auth_failed =>
      'Uwierzytelnianie nie powiodło się. Spróbuj ponownie.';

  @override
  String get error_permission_denied => 'Odmowa dostępu.';

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
  String get time_morning => 'Rano';

  @override
  String get time_afternoon => 'Popołudnie';

  @override
  String get time_evening => 'Wieczór';

  @override
  String get time_night => 'Noc';

  @override
  String get help_privacy_policy => 'Polityka prywatności';

  @override
  String get help_privacy_policy_desc => 'Zobacz naszą politykę prywatności';

  @override
  String get help_privacy_policy_error =>
      'Nie można otworzyć polityki prywatności';

  @override
  String get settings_delete_account => 'Usuń konto';

  @override
  String get settings_delete_account_subtitle =>
      'Trwale usuń swoje konto i wszystkie dane';

  @override
  String get settings_delete_account_dialog_title => 'Usunąć konto?';

  @override
  String get settings_delete_account_dialog_message =>
      'Ta czynność nie może zostać cofnięta. Wszystkie Twoje dane, w tym historia spożycia wody, serie i ustawienia, zostaną trwale usunięte.';

  @override
  String get settings_delete_account_confirm => 'Usuń moje konto';

  @override
  String get settings_delete_account_cancel => 'Anuluj';

  @override
  String get settings_delete_account_success =>
      'Konto zostało pomyślnie usunięte';

  @override
  String get settings_delete_account_error => 'Nie udało się usunąć konta';

  @override
  String get settings_delete_account_reauth_required =>
      'Zaloguj się ponownie, aby usunąć swoje konto';

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
