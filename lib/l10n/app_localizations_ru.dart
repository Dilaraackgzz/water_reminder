// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => 'Оставайтесь гидратированными для здоровой жизни';

  @override
  String get common_cancel => 'Отмена';

  @override
  String get common_save => 'Сохранить';

  @override
  String get common_delete => 'Удалить';

  @override
  String get common_edit => 'Редактировать';

  @override
  String get common_add => 'Добавить';

  @override
  String get common_ok => 'ОК';

  @override
  String get common_yes => 'Да';

  @override
  String get common_no => 'Нет';

  @override
  String get common_or => 'или';

  @override
  String get common_done => 'Готово';

  @override
  String get common_skip => 'Пропустить';

  @override
  String get common_next => 'Далее';

  @override
  String get common_back => 'Назад';

  @override
  String get common_continue => 'Продолжить';

  @override
  String get common_loading => 'Загрузка...';

  @override
  String get common_error => 'Ошибка';

  @override
  String get common_success => 'Успешно';

  @override
  String get auth_login_title => 'Вход';

  @override
  String get auth_register_title => 'Регистрация';

  @override
  String get auth_email_label => 'Email';

  @override
  String get auth_email_hint => 'example@email.com';

  @override
  String get auth_password_label => 'Пароль';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => 'Полное имя';

  @override
  String get auth_name_hint => 'Иван Иванов';

  @override
  String get auth_forgot_password => 'Забыли пароль?';

  @override
  String get auth_dont_have_account => 'Нет аккаунта? ';

  @override
  String get auth_already_have_account => 'Уже есть аккаунт? ';

  @override
  String get auth_sign_in_button => 'Войти';

  @override
  String get auth_sign_up_button => 'Зарегистрироваться';

  @override
  String get auth_sign_in_google => 'Войти через Google';

  @override
  String get auth_sign_up_google => 'Регистрация через Google';

  @override
  String get auth_logout => 'Выйти';

  @override
  String get auth_validation_email_required => 'Требуется email';

  @override
  String get auth_validation_email_invalid => 'Введите корректный email';

  @override
  String get auth_validation_password_required => 'Требуется пароль';

  @override
  String get auth_validation_password_min_length =>
      'Пароль должен быть не менее 6 символов';

  @override
  String get auth_validation_password_mismatch => 'Passwords don\'t match';

  @override
  String get auth_validation_name_required => 'Требуется имя';

  @override
  String get auth_validation_name_min_length =>
      'Имя должно быть не менее 2 символов';

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
  String get auth_email_verification_title => 'Подтвердите Email';

  @override
  String get auth_email_verification_sent =>
      'Мы отправили ссылку для подтверждения на:';

  @override
  String get auth_email_verification_instruction =>
      'Проверьте почту и нажмите на ссылку для подтверждения.';

  @override
  String get auth_email_verification_not_received => 'Не получили письмо?';

  @override
  String get auth_email_verification_resend => 'Отправить повторно';

  @override
  String get auth_email_verification_check => 'Я подтвердил email';

  @override
  String get auth_email_verification_success => 'Email успешно подтвержден!';

  @override
  String get auth_email_verification_failed =>
      'Email еще не подтвержден. Проверьте почту.';

  @override
  String get auth_forgot_password_title => 'Сброс пароля';

  @override
  String get auth_forgot_password_instruction =>
      'Введите email, и мы отправим ссылку для сброса пароля.';

  @override
  String get auth_forgot_password_button => 'Отправить ссылку';

  @override
  String get auth_forgot_password_success =>
      'Письмо для сброса пароля отправлено!';

  @override
  String get auth_back_to_login => 'Вернуться к входу';

  @override
  String get home_title => 'Главная';

  @override
  String get home_daily_goal => 'Дневная цель';

  @override
  String get home_today => 'Сегодня';

  @override
  String get home_todays_progress => 'Today\'s Progress';

  @override
  String get home_quick_add => 'Quick Add';

  @override
  String home_amount_to_go(String amount) {
    return '$amount to go!';
  }

  @override
  String get home_custom_amount => 'Другое количество';

  @override
  String get home_amount_label => 'Количество';

  @override
  String get home_add_water_success => 'Вода добавлена!';

  @override
  String get home_add_water_failed => 'Не удалось добавить воду';

  @override
  String get home_delete_water_confirm => 'Удалить эту запись?';

  @override
  String get home_delete_water_success => 'Запись удалена';

  @override
  String get home_no_records_today => 'Сегодня нет записей';

  @override
  String get home_start_drinking => 'Начните пить воду!';

  @override
  String get progress_current => 'Текущий';

  @override
  String get progress_goal => 'Цель';

  @override
  String get progress_remaining => 'Осталось';

  @override
  String get progress_completed => 'Цель достигнута!';

  @override
  String progress_percentage(int percent) {
    return '$percent% от дневной цели';
  }

  @override
  String get motivational_keep_going => 'Продолжайте! Вы молодец!';

  @override
  String get motivational_almost_there => 'Почти готово! Еще немного!';

  @override
  String get motivational_goal_reached => 'Поздравляем! Вы достигли цели!';

  @override
  String get motivational_good_start => 'Отличное начало! Продолжайте!';

  @override
  String get motivational_stay_hydrated =>
      'Поддерживайте гидратацию весь день!';

  @override
  String get motivational_100_1 => 'Поздравляем! Вы достигли цели!';

  @override
  String get motivational_100_2 => 'Отличная работа! Продолжайте завтра!';

  @override
  String get motivational_100_3 => 'Вы чемпион по гидратации!';

  @override
  String get motivational_100_4 => 'Идеально! Сохраняйте привычку!';

  @override
  String get motivational_100_short => 'Цель достигнута!';

  @override
  String get motivational_75_1 => 'Почти готово! Еще немного!';

  @override
  String get motivational_75_2 => 'Отлично! Продолжайте!';

  @override
  String get motivational_75_3 => 'Так близко к цели!';

  @override
  String get motivational_75_4 => 'Фантастический прогресс!';

  @override
  String get motivational_75_short => 'Почти готово!';

  @override
  String get motivational_50_1 => 'Половина пути! Вы молодец!';

  @override
  String get motivational_50_2 => 'Отличная работа! Продолжайте!';

  @override
  String get motivational_50_3 => 'Вы на правильном пути!';

  @override
  String get motivational_50_4 => 'Хороший прогресс!';

  @override
  String get motivational_50_short => 'Половина!';

  @override
  String get motivational_25_1 => 'Хорошее начало! Пейте воду!';

  @override
  String get motivational_25_2 => 'Отличный старт!';

  @override
  String get motivational_25_3 => 'Хорошее начало! Пейте больше!';

  @override
  String get motivational_25_4 => 'Продолжайте! Каждый глоток важен!';

  @override
  String get motivational_25_short => 'Хорошее начало!';

  @override
  String get motivational_0_1 => 'Время пить воду! Ваше тело скажет спасибо!';

  @override
  String get motivational_0_2 => 'Начните путь к гидратации!';

  @override
  String get motivational_0_3 => 'Начните день со стакана воды!';

  @override
  String get motivational_0_4 => 'Ваше здоровье важно! Начните пить!';

  @override
  String get motivational_0_short => 'Начнем!';

  @override
  String get profile_title => 'Профиль';

  @override
  String get profile_edit => 'Редактировать';

  @override
  String get profile_personal_info => 'Личная информация';

  @override
  String get profile_body_metrics => 'Параметры тела';

  @override
  String get profile_activity_level => 'Уровень активности';

  @override
  String get profile_name => 'Имя';

  @override
  String get profile_email => 'Email';

  @override
  String get profile_age => 'Возраст';

  @override
  String get profile_gender => 'Пол';

  @override
  String get profile_weight => 'Вес';

  @override
  String get profile_height => 'Рост';

  @override
  String get profile_bmi => 'ИМТ';

  @override
  String get profile_bmi_category => 'Категория ИМТ';

  @override
  String get profile_daily_goal => 'Дневная норма воды';

  @override
  String get profile_use_calculated_goal => 'Использовать расчетную цель';

  @override
  String get profile_custom_goal => 'Своя цель';

  @override
  String get profile_save_success => 'Профиль обновлен';

  @override
  String get profile_save_failed => 'Не удалось обновить профиль';

  @override
  String get profile_user_default => 'Пользователь';

  @override
  String get gender_male => 'Мужской';

  @override
  String get gender_female => 'Женский';

  @override
  String get gender_other => 'Другой';

  @override
  String get activity_sedentary => 'Сидячий';

  @override
  String get activity_sedentary_desc => 'Мало или нет физических упражнений';

  @override
  String get activity_light => 'Легкая активность';

  @override
  String get activity_light_desc => 'Легкие упражнения 1-3 дня/неделю';

  @override
  String get activity_moderate => 'Умеренная активность';

  @override
  String get activity_moderate_desc => 'Умеренные упражнения 3-5 дней/неделю';

  @override
  String get activity_very_active => 'Высокая активность';

  @override
  String get activity_very_active_desc =>
      'Интенсивные упражнения 6-7 дней/неделю';

  @override
  String get activity_extra_active => 'Очень высокая активность';

  @override
  String get activity_extra_active_desc =>
      'Очень интенсивные упражнения и физическая работа';

  @override
  String get bmi_underweight => 'Недостаточный вес';

  @override
  String get bmi_normal => 'Нормальный вес';

  @override
  String get bmi_overweight => 'Избыточный вес';

  @override
  String get bmi_obese => 'Ожирение';

  @override
  String get settings_title => 'Настройки';

  @override
  String get settings_notifications => 'Уведомления';

  @override
  String get settings_reminders => 'Напоминания';

  @override
  String get settings_theme => 'Тема';

  @override
  String get settings_units => 'Единицы';

  @override
  String get settings_language => 'Язык';

  @override
  String get settings_profile => 'Настройки профиля';

  @override
  String get settings_daily_goal => 'Настройки цели';

  @override
  String get settings_data => 'Управление данными';

  @override
  String get settings_export_data => 'Экспорт данных';

  @override
  String get settings_import_data => 'Импорт данных';

  @override
  String get settings_help => 'Помощь';

  @override
  String get settings_about => 'О приложении';

  @override
  String get settings_enable_notifications => 'Включить уведомления';

  @override
  String get settings_reminder_interval => 'Интервал напоминаний';

  @override
  String get settings_reminder_start_time => 'Время начала';

  @override
  String get settings_reminder_end_time => 'Время окончания';

  @override
  String get settings_test_notification => 'Тест уведомления';

  @override
  String get settings_theme_light => 'Светлая';

  @override
  String get settings_theme_dark => 'Темная';

  @override
  String get settings_theme_system => 'Системная';

  @override
  String get settings_unit_ml => 'Миллилитры (мл)';

  @override
  String get settings_unit_floz => 'Жидкие унции (fl oz)';

  @override
  String get settings_unit_metric => 'Метрическая система';

  @override
  String get settings_unit_imperial => 'Имперская система';

  @override
  String get settings_subtitle => 'Настройте приложение';

  @override
  String get settings_reminders_active => 'Напоминания активны';

  @override
  String get settings_reminders_inactive => 'Включите напоминания';

  @override
  String get settings_minutes => 'минут';

  @override
  String get settings_export_subtitle => 'Резервная копия данных';

  @override
  String get settings_import_subtitle => 'Восстановить из файла';

  @override
  String get settings_profile_subtitle => 'Обновите информацию';

  @override
  String get settings_daily_goal_subtitle => 'Управление целью';

  @override
  String get settings_theme_dialog_title => 'Тема';

  @override
  String get settings_theme_light_mode => 'Светлая тема';

  @override
  String get settings_theme_dark_mode => 'Темная тема';

  @override
  String get settings_theme_system_mode => 'Системная тема';

  @override
  String get settings_theme_light_subtitle => 'Светлая тема';

  @override
  String get settings_theme_dark_subtitle => 'Темная тема';

  @override
  String get settings_theme_system_subtitle => 'Следовать системе';

  @override
  String get settings_language_dialog_title => 'Язык';

  @override
  String get settings_export_loading => 'Экспорт данных...';

  @override
  String get settings_export_success_message => 'Данные экспортированы!';

  @override
  String settings_export_failed_message(String error) {
    return 'Ошибка экспорта: $error';
  }

  @override
  String get settings_import_loading => 'Импорт данных...';

  @override
  String get settings_import_complete => 'Импорт завершен';

  @override
  String get settings_import_success_subtitle => 'Успешно импортировано:';

  @override
  String get settings_import_water_records => 'записей воды';

  @override
  String get settings_import_daily_goals => 'дневных целей';

  @override
  String get settings_import_duplicate_skipped => 'дубликатов пропущено';

  @override
  String settings_import_failed_message(String error) {
    return 'Ошибка импорта: $error';
  }

  @override
  String get settings_reminder_interval_title => 'Интервал напоминаний';

  @override
  String get settings_language_coming_soon => 'Скоро';

  @override
  String get settings_export_success => 'Данные экспортированы';

  @override
  String get settings_export_failed => 'Ошибка экспорта';

  @override
  String get settings_import_success => 'Данные импортированы';

  @override
  String get settings_import_failed => 'Ошибка импорта';

  @override
  String settings_import_stats(int imported, int skipped) {
    return 'Импортировано $imported записей, пропущено $skipped дубликатов';
  }

  @override
  String get statistics_title => 'Статистика';

  @override
  String get statistics_weekly => 'Неделя';

  @override
  String get statistics_monthly => 'Месяц';

  @override
  String get statistics_yearly => 'Год';

  @override
  String get statistics_average => 'Среднее';

  @override
  String get statistics_total => 'Всего';

  @override
  String get statistics_best_day => 'Лучший день';

  @override
  String get statistics_goal_achievement => 'Достижение цели';

  @override
  String get statistics_no_data => 'Нет данных за этот период';

  @override
  String get statistics_chart_label => 'Потребление воды';

  @override
  String get statistics_total_intake => 'Общее потребление';

  @override
  String get statistics_total_consumed => 'Всего выпито';

  @override
  String get statistics_daily_average => 'Среднее за день';

  @override
  String get statistics_goals_met => 'Целей достигнуто';

  @override
  String statistics_out_of(int count) {
    return 'из $count';
  }

  @override
  String get statistics_progress => 'Прогресс';

  @override
  String get statistics_on_track => 'На верном пути!';

  @override
  String get statistics_keep_going => 'Продолжайте!';

  @override
  String get statistics_daily_intake => 'Дневное потребление';

  @override
  String get statistics_below_goal => 'Ниже цели';

  @override
  String get statistics_goal_met_label => 'Цель достигнута';

  @override
  String get statistics_your_streak => 'Ваша серия';

  @override
  String get statistics_current => 'Текущая';

  @override
  String get statistics_best => 'Лучшая';

  @override
  String get statistics_completed => 'Завершено';

  @override
  String get statistics_next_goal => 'Следующая цель';

  @override
  String get statistics_days => 'дней';

  @override
  String get achievements_title => 'Достижения';

  @override
  String get achievements_unlocked => 'Разблокировано';

  @override
  String get achievements_locked => 'Заблокировано';

  @override
  String get achievements_progress => 'Прогресс';

  @override
  String get achievements_reward_points => 'Очки наград';

  @override
  String achievements_total_points(int points) {
    return 'Всего очков: $points';
  }

  @override
  String get achievement_first_drop => 'Первая капля';

  @override
  String get achievement_first_drop_desc => 'Запишите первое потребление воды';

  @override
  String get achievement_daily_goal_1 => 'Достиженец';

  @override
  String get achievement_daily_goal_1_desc => 'Достигните дневной цели';

  @override
  String get achievement_streak_3 => '3-дневная серия';

  @override
  String get achievement_streak_3_desc => 'Поддерживайте серию 3 дня';

  @override
  String get achievement_streak_7 => 'Недельный воин';

  @override
  String get achievement_streak_7_desc => 'Поддерживайте серию 7 дней';

  @override
  String get achievement_streak_30 => 'Мастер месяца';

  @override
  String get achievement_streak_30_desc => 'Поддерживайте серию 30 дней';

  @override
  String get achievement_total_10l => '10 литров';

  @override
  String get achievement_total_10l_desc => 'Выпейте 10 литров всего';

  @override
  String get achievement_total_100l => '100 литров';

  @override
  String get achievement_total_100l_desc => 'Выпейте 100 литров всего';

  @override
  String get achievement_consistency => 'Стабильная неделя';

  @override
  String get achievement_consistency_desc => 'Достигайте цели 7 дней подряд';

  @override
  String get reminders_title => 'Напоминания';

  @override
  String get reminders_active => 'Активные напоминания';

  @override
  String get reminders_pending => 'Ожидающие уведомления';

  @override
  String get reminders_interval_30 => 'Каждые 30 минут';

  @override
  String get reminders_interval_45 => 'Каждые 45 минут';

  @override
  String get reminders_interval_60 => 'Каждый час';

  @override
  String get reminders_interval_90 => 'Каждые 1.5 часа';

  @override
  String get reminders_interval_120 => 'Каждые 2 часа';

  @override
  String get reminders_interval_180 => 'Каждые 3 часа';

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
  String get notification_reminder_title => 'Время пить воду!';

  @override
  String get notification_reminder_body =>
      'Пейте воду! Поддерживайте гидратацию.';

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
  String get streak_current => 'Текущая серия';

  @override
  String streak_days(int days) {
    return '$days дней';
  }

  @override
  String get streak_keep_going => 'Продолжайте серию!';

  @override
  String get streak_personal_best => 'Личный рекорд';

  @override
  String get streak_best => 'Лучший!';

  @override
  String get streak_longest => 'Самая длинная';

  @override
  String get streak_next_milestone => 'Следующая цель';

  @override
  String get streak_start_today => 'Начните серию сегодня!';

  @override
  String get streak_complete_goal => 'Достигните дневной цели для серии';

  @override
  String get streak_start => 'Начните серию!';

  @override
  String get streak_error => 'Ошибка загрузки данных';

  @override
  String get streak_day_singular => 'день';

  @override
  String get streak_day_plural => 'дней';

  @override
  String get onboarding_title_1 => 'Отслеживайте воду';

  @override
  String get onboarding_desc_1 =>
      'Легко записывайте потребление воды одним нажатием';

  @override
  String get onboarding_title_2 => 'Умные напоминания';

  @override
  String get onboarding_desc_2 =>
      'Получайте напоминания пить воду в течение дня';

  @override
  String get onboarding_title_3 => 'Следите за прогрессом';

  @override
  String get onboarding_desc_3 =>
      'Просматривайте статистику и достигайте целей';

  @override
  String get onboarding_title_4 => 'Будьте здоровы';

  @override
  String get onboarding_desc_4 => 'Формируйте здоровые привычки';

  @override
  String get onboarding_get_started => 'Начать';

  @override
  String get drawer_home => 'Главная';

  @override
  String get drawer_statistics => 'Статистика';

  @override
  String get drawer_achievements => 'Достижения';

  @override
  String get drawer_profile => 'Профиль';

  @override
  String get drawer_reminders => 'Напоминания';

  @override
  String get drawer_settings => 'Настройки';

  @override
  String get drawer_help => 'Помощь';

  @override
  String get drawer_about => 'О приложении';

  @override
  String get drawer_logout => 'Выйти';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => 'Версия 1.0.0';

  @override
  String get about_description =>
      'Следите за гидратацией с Aqualert. Отслеживайте потребление воды и достигайте целей!';

  @override
  String get about_copyright => '© 2024 Aqualert. Все права защищены.';

  @override
  String get about_close => 'Закрыть';

  @override
  String get help_title => 'Помощь';

  @override
  String get help_subtitle => 'Получите помощь';

  @override
  String get help_faq => 'Часто задаваемые вопросы';

  @override
  String get help_contact => 'Связаться с нами';

  @override
  String get help_version => 'Версия';

  @override
  String get help_app_info => 'Информация о приложении';

  @override
  String get help_coming_soon => 'Помощь - Скоро!';

  @override
  String get help_faq_section => 'ЧЗВ';

  @override
  String get help_features_section => 'Функции';

  @override
  String get help_about_section => 'О приложении';

  @override
  String get faq_1_q => 'Как рассчитывается дневная норма воды?';

  @override
  String get faq_1_a =>
      'Дневная норма рассчитывается на основе веса, роста, возраста, пола и уровня активности. Вы также можете установить свою цель в настройках профиля.';

  @override
  String get faq_2_q => 'Как работают напоминания?';

  @override
  String get faq_2_a =>
      'Вы можете установить интервал (30-180 минут) и время начала/окончания. Приложение будет отправлять уведомления в этот период.';

  @override
  String get faq_3_q => 'Что такое серии и как они работают?';

  @override
  String get faq_3_a =>
      'Серии отслеживают дни подряд, когда вы достигали дневной цели. Пейте воду каждый день, чтобы увеличивать серию!';

  @override
  String get faq_4_q => 'Как изменить единицы измерения?';

  @override
  String get faq_4_a =>
      'Перейдите в Настройки → Единицы и выберите миллилитры (мл) или жидкие унции (fl oz). Все измерения обновятся автоматически.';

  @override
  String get faq_5_q => 'Можно ли экспортировать данные?';

  @override
  String get faq_5_a =>
      'Да! Перейдите в Настройки → Управление данными → Экспорт данных. Вы можете сохранить данные в JSON файл и импортировать позже.';

  @override
  String get faq_6_q => 'Как работают достижения?';

  @override
  String get faq_6_a =>
      'Выполняйте цели отслеживания воды, чтобы разблокировать достижения и получать очки. Следите за прогрессом на экране достижений.';

  @override
  String get feature_tracking_title => 'Отслеживание воды';

  @override
  String get feature_tracking_desc =>
      'Легко записывайте потребление воды кнопками быстрого добавления (250мл, 350мл, 500мл, 750мл) или введите свое количество.';

  @override
  String get feature_reminders_title => 'Умные напоминания';

  @override
  String get feature_reminders_desc =>
      'Настройте интервал напоминаний и активные часы. Никогда не забывайте пить воду.';

  @override
  String get feature_statistics_title => 'Статистика';

  @override
  String get feature_statistics_desc =>
      'Просматривайте тренды потребления воды с недельными, месячными и годовыми графиками.';

  @override
  String get feature_achievements_title => 'Достижения и серии';

  @override
  String get feature_achievements_desc =>
      'Зарабатывайте достижения и поддерживайте серии, достигая целей. Мотивация через геймификацию!';

  @override
  String get feature_profile_title => 'Профиль и цели';

  @override
  String get feature_profile_desc =>
      'Установите личную информацию, и приложение рассчитает оптимальную дневную норму воды.';

  @override
  String get help_contact_email => 'Связаться по Email';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => 'Оценить приложение';

  @override
  String get help_rate_desc => 'Нравится Aqualert? Оставьте отзыв!';

  @override
  String get help_build_number => 'Сборка';

  @override
  String get help_copyright => '© 2024 Aqualert. Все права защищены.';

  @override
  String get help_made_with => 'Сделано с ❤️ для вашего здоровья';

  @override
  String get error_generic => 'Что-то пошло не так. Попробуйте снова.';

  @override
  String get error_network => 'Ошибка сети. Проверьте подключение.';

  @override
  String get error_auth_failed => 'Ошибка авторизации. Попробуйте снова.';

  @override
  String get error_permission_denied => 'Доступ запрещен.';

  @override
  String get unit_ml => 'мл';

  @override
  String get unit_floz => 'fl oz';

  @override
  String get unit_kg => 'кг';

  @override
  String get unit_lb => 'lb';

  @override
  String get unit_cm => 'см';

  @override
  String get unit_ft => 'ft';

  @override
  String get unit_liter => 'л';

  @override
  String get time_morning => 'Утро';

  @override
  String get time_afternoon => 'День';

  @override
  String get time_evening => 'Вечер';

  @override
  String get time_night => 'Ночь';

  @override
  String get help_privacy_policy => 'Политика конфиденциальности';

  @override
  String get help_privacy_policy_desc =>
      'Просмотреть политику конфиденциальности';

  @override
  String get help_privacy_policy_error =>
      'Не удалось открыть политику конфиденциальности';

  @override
  String get settings_delete_account => 'Удалить аккаунт';

  @override
  String get settings_delete_account_subtitle =>
      'Навсегда удалить аккаунт и все данные';

  @override
  String get settings_delete_account_dialog_title => 'Удалить аккаунт?';

  @override
  String get settings_delete_account_dialog_message =>
      'Это действие нельзя отменить. Все ваши данные, включая историю потребления воды, серии и настройки, будут удалены навсегда.';

  @override
  String get settings_delete_account_confirm => 'Удалить мой аккаунт';

  @override
  String get settings_delete_account_cancel => 'Отмена';

  @override
  String get settings_delete_account_success => 'Аккаунт успешно удален';

  @override
  String get settings_delete_account_error => 'Не удалось удалить аккаунт';

  @override
  String get settings_delete_account_reauth_required =>
      'Пожалуйста, войдите снова, чтобы удалить аккаунт';
}
