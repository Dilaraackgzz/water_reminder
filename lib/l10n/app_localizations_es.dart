// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => 'Mantente hidratado para una vida saludable';

  @override
  String get common_cancel => 'Cancelar';

  @override
  String get common_save => 'Guardar';

  @override
  String get common_delete => 'Eliminar';

  @override
  String get common_edit => 'Editar';

  @override
  String get common_add => 'Añadir';

  @override
  String get common_ok => 'Aceptar';

  @override
  String get common_yes => 'Sí';

  @override
  String get common_no => 'No';

  @override
  String get common_or => 'o';

  @override
  String get common_done => 'Listo';

  @override
  String get common_skip => 'Omitir';

  @override
  String get common_next => 'Siguiente';

  @override
  String get common_back => 'Atrás';

  @override
  String get common_continue => 'Continuar';

  @override
  String get common_loading => 'Cargando...';

  @override
  String get common_error => 'Error';

  @override
  String get common_success => 'Éxito';

  @override
  String get auth_login_title => 'Iniciar Sesión';

  @override
  String get auth_register_title => 'Registrarse';

  @override
  String get auth_email_label => 'Correo electrónico';

  @override
  String get auth_email_hint => 'ejemplo@email.com';

  @override
  String get auth_password_label => 'Contraseña';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => 'Nombre completo';

  @override
  String get auth_name_hint => 'Juan García';

  @override
  String get auth_forgot_password => '¿Olvidaste tu contraseña?';

  @override
  String get auth_dont_have_account => '¿No tienes cuenta? ';

  @override
  String get auth_already_have_account => '¿Ya tienes cuenta? ';

  @override
  String get auth_sign_in_button => 'Iniciar Sesión';

  @override
  String get auth_sign_up_button => 'Registrarse';

  @override
  String get auth_sign_in_google => 'Iniciar con Google';

  @override
  String get auth_sign_up_google => 'Registrarse con Google';

  @override
  String get auth_logout => 'Cerrar Sesión';

  @override
  String get auth_validation_email_required => 'El correo es requerido';

  @override
  String get auth_validation_email_invalid => 'Ingresa un correo válido';

  @override
  String get auth_validation_password_required => 'La contraseña es requerida';

  @override
  String get auth_validation_password_min_length =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get auth_validation_password_mismatch => 'Passwords don\'t match';

  @override
  String get auth_validation_name_required => 'El nombre es requerido';

  @override
  String get auth_validation_name_min_length =>
      'El nombre debe tener al menos 2 caracteres';

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
  String get auth_email_verification_title => 'Verifica tu Correo';

  @override
  String get auth_email_verification_sent =>
      'Enviamos un enlace de verificación a:';

  @override
  String get auth_email_verification_instruction =>
      'Revisa tu correo y haz clic en el enlace de verificación para continuar.';

  @override
  String get auth_email_verification_not_received => '¿No recibiste el correo?';

  @override
  String get auth_email_verification_resend =>
      'Reenviar Correo de Verificación';

  @override
  String get auth_email_verification_check => 'Ya verifiqué mi correo';

  @override
  String get auth_email_verification_success =>
      '¡Correo verificado exitosamente!';

  @override
  String get auth_email_verification_failed =>
      'Correo aún no verificado. Revisa tu bandeja de entrada.';

  @override
  String get auth_forgot_password_title => 'Restablecer Contraseña';

  @override
  String get auth_forgot_password_instruction =>
      'Ingresa tu correo y te enviaremos un enlace para restablecer tu contraseña.';

  @override
  String get auth_forgot_password_button => 'Enviar Enlace';

  @override
  String get auth_forgot_password_success =>
      '¡Correo de restablecimiento enviado! Revisa tu bandeja.';

  @override
  String get auth_back_to_login => 'Volver a Iniciar Sesión';

  @override
  String get home_title => 'Inicio';

  @override
  String get home_daily_goal => 'Meta Diaria';

  @override
  String get home_today => 'Hoy';

  @override
  String get home_todays_progress => 'Today\'s Progress';

  @override
  String get home_quick_add => 'Quick Add';

  @override
  String home_amount_to_go(String amount) {
    return '$amount to go!';
  }

  @override
  String get home_custom_amount => 'Cantidad Personalizada';

  @override
  String get home_amount_label => 'Cantidad';

  @override
  String get home_add_water_success => '¡Agua añadida exitosamente!';

  @override
  String get home_add_water_failed => 'Error al añadir agua';

  @override
  String get home_delete_water_confirm => '¿Eliminar este registro?';

  @override
  String get home_delete_water_success => 'Registro eliminado';

  @override
  String get home_no_records_today => 'Sin registros hoy';

  @override
  String get home_start_drinking => '¡Empieza a beber agua!';

  @override
  String get progress_current => 'Actual';

  @override
  String get progress_goal => 'Meta';

  @override
  String get progress_remaining => 'Restante';

  @override
  String get progress_completed => '¡Meta completada!';

  @override
  String progress_percentage(int percent) {
    return '$percent% de la meta diaria';
  }

  @override
  String get motivational_keep_going =>
      '¡Sigue así! ¡Lo estás haciendo genial!';

  @override
  String get motivational_almost_there => '¡Casi llegas! ¡Un poco más!';

  @override
  String get motivational_goal_reached => '¡Felicidades! ¡Alcanzaste tu meta!';

  @override
  String get motivational_good_start => '¡Buen comienzo! ¡Sigue así!';

  @override
  String get motivational_stay_hydrated =>
      '¡Mantente hidratado durante el día!';

  @override
  String get motivational_100_1 => '¡Felicidades! ¡Alcanzaste tu meta!';

  @override
  String get motivational_100_2 => '¡Increíble trabajo! ¡Mañana también!';

  @override
  String get motivational_100_3 => '¡Eres un campeón de la hidratación!';

  @override
  String get motivational_100_4 => '¡Perfecto! ¡Mantén esos buenos hábitos!';

  @override
  String get motivational_100_short => '¡Meta Alcanzada!';

  @override
  String get motivational_75_1 => '¡Casi llegas! ¡Un poco más!';

  @override
  String get motivational_75_2 => '¡Lo estás haciendo genial! ¡Sigue!';

  @override
  String get motivational_75_3 => '¡Muy cerca de tu meta!';

  @override
  String get motivational_75_4 => '¡Progreso fantástico! ¡No pares ahora!';

  @override
  String get motivational_75_short => '¡Casi llegas!';

  @override
  String get motivational_50_1 => '¡A mitad de camino! ¡Vas genial!';

  @override
  String get motivational_50_2 => '¡Buen trabajo! ¡Continúa!';

  @override
  String get motivational_50_3 => '¡Vas por buen camino!';

  @override
  String get motivational_50_4 => '¡Buen progreso! ¡Sé constante!';

  @override
  String get motivational_50_short => '¡A mitad!';

  @override
  String get motivational_25_1 => '¡Buen inicio! ¡Sigue bebiendo agua!';

  @override
  String get motivational_25_2 => '¡Comenzaste muy bien!';

  @override
  String get motivational_25_3 => '¡Lindo comienzo! ¡Mantente hidratado!';

  @override
  String get motivational_25_4 => '¡Sigue! ¡Cada sorbo cuenta!';

  @override
  String get motivational_25_short => '¡Buen inicio!';

  @override
  String get motivational_0_1 =>
      '¡Hora de hidratarse! ¡Tu cuerpo te lo agradecerá!';

  @override
  String get motivational_0_2 => '¡Comienza tu viaje de hidratación!';

  @override
  String get motivational_0_3 => '¡Empieza tu día con agua!';

  @override
  String get motivational_0_4 => '¡Tu salud importa! ¡Empieza a beber!';

  @override
  String get motivational_0_short => '¡Empecemos!';

  @override
  String get profile_title => 'Perfil';

  @override
  String get profile_edit => 'Editar Perfil';

  @override
  String get profile_personal_info => 'Información Personal';

  @override
  String get profile_body_metrics => 'Métricas Corporales';

  @override
  String get profile_activity_level => 'Nivel de Actividad';

  @override
  String get profile_name => 'Nombre';

  @override
  String get profile_email => 'Correo';

  @override
  String get profile_age => 'Edad';

  @override
  String get profile_gender => 'Género';

  @override
  String get profile_weight => 'Peso';

  @override
  String get profile_height => 'Altura';

  @override
  String get profile_bmi => 'IMC';

  @override
  String get profile_bmi_category => 'Categoría IMC';

  @override
  String get profile_daily_goal => 'Meta Diaria de Agua';

  @override
  String get profile_use_calculated_goal => 'Usar Meta Calculada';

  @override
  String get profile_custom_goal => 'Meta Personalizada';

  @override
  String get profile_save_success => 'Perfil actualizado exitosamente';

  @override
  String get profile_save_failed => 'Error al actualizar perfil';

  @override
  String get profile_user_default => 'Usuario';

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
  String get gender_male => 'Masculino';

  @override
  String get gender_female => 'Femenino';

  @override
  String get gender_other => 'Otro';

  @override
  String get activity_sedentary => 'Sedentario';

  @override
  String get activity_sedentary_desc => 'Poco o ningún ejercicio';

  @override
  String get activity_light => 'Ligeramente Activo';

  @override
  String get activity_light_desc => 'Ejercicio ligero 1-3 días/semana';

  @override
  String get activity_moderate => 'Moderadamente Activo';

  @override
  String get activity_moderate_desc => 'Ejercicio moderado 3-5 días/semana';

  @override
  String get activity_very_active => 'Muy Activo';

  @override
  String get activity_very_active_desc => 'Ejercicio intenso 6-7 días/semana';

  @override
  String get activity_extra_active => 'Extra Activo';

  @override
  String get activity_extra_active_desc =>
      'Ejercicio muy intenso y trabajo físico';

  @override
  String get bmi_underweight => 'Bajo Peso';

  @override
  String get bmi_normal => 'Peso Normal';

  @override
  String get bmi_overweight => 'Sobrepeso';

  @override
  String get bmi_obese => 'Obeso';

  @override
  String get settings_title => 'Ajustes';

  @override
  String get settings_notifications => 'Notificaciones';

  @override
  String get settings_reminders => 'Recordatorios';

  @override
  String get settings_theme => 'Tema';

  @override
  String get settings_units => 'Unidades';

  @override
  String get settings_language => 'Idioma';

  @override
  String get settings_profile => 'Ajustes de Perfil';

  @override
  String get settings_daily_goal => 'Ajustes de Meta Diaria';

  @override
  String get settings_data => 'Gestión de Datos';

  @override
  String get settings_export_data => 'Exportar Datos';

  @override
  String get settings_import_data => 'Importar Datos';

  @override
  String get settings_help => 'Ayuda y Soporte';

  @override
  String get settings_about => 'Acerca de';

  @override
  String get settings_enable_notifications => 'Activar Notificaciones';

  @override
  String get settings_reminder_interval => 'Intervalo de Recordatorio';

  @override
  String get settings_reminder_start_time => 'Hora de Inicio';

  @override
  String get settings_reminder_end_time => 'Hora de Fin';

  @override
  String get settings_test_notification => 'Probar Notificación';

  @override
  String get settings_theme_light => 'Claro';

  @override
  String get settings_theme_dark => 'Oscuro';

  @override
  String get settings_theme_system => 'Sistema';

  @override
  String get settings_unit_ml => 'Mililitros (ml)';

  @override
  String get settings_unit_floz => 'Onzas líquidas (fl oz)';

  @override
  String get settings_unit_metric => 'Sistema métrico';

  @override
  String get settings_unit_imperial => 'Sistema imperial';

  @override
  String get settings_subtitle => 'Personaliza tu experiencia';

  @override
  String get settings_reminders_active => 'Recordatorios de agua activos';

  @override
  String get settings_reminders_inactive => 'Activa los recordatorios';

  @override
  String get settings_minutes => 'minutos';

  @override
  String get settings_export_subtitle => 'Respalda tus datos de agua';

  @override
  String get settings_import_subtitle => 'Restaurar desde respaldo';

  @override
  String get settings_profile_subtitle => 'Actualiza tu información';

  @override
  String get settings_daily_goal_subtitle => 'Gestiona tu meta de hidratación';

  @override
  String get settings_theme_dialog_title => 'Tema';

  @override
  String get settings_theme_light_mode => 'Modo Claro';

  @override
  String get settings_theme_dark_mode => 'Modo Oscuro';

  @override
  String get settings_theme_system_mode => 'Sistema';

  @override
  String get settings_theme_light_subtitle => 'Usar tema claro';

  @override
  String get settings_theme_dark_subtitle => 'Usar tema oscuro';

  @override
  String get settings_theme_system_subtitle => 'Seguir tema del sistema';

  @override
  String get settings_language_dialog_title => 'Idioma';

  @override
  String get settings_system_language => 'System Language';

  @override
  String get settings_use_device_language => 'Use device language';

  @override
  String get settings_export_loading => 'Exportando datos...';

  @override
  String get settings_export_success_message =>
      '¡Datos exportados exitosamente!';

  @override
  String settings_export_failed_message(String error) {
    return 'Error al exportar: $error';
  }

  @override
  String get settings_import_loading => 'Importando datos...';

  @override
  String get settings_import_complete => 'Importación Completa';

  @override
  String get settings_import_success_subtitle => 'Importado exitosamente:';

  @override
  String get settings_import_water_records => 'registros de agua';

  @override
  String get settings_import_daily_goals => 'metas diarias';

  @override
  String get settings_import_duplicate_skipped =>
      'registros duplicados omitidos';

  @override
  String settings_import_failed_message(String error) {
    return 'Error al importar: $error';
  }

  @override
  String get settings_reminder_interval_title => 'Intervalo de Recordatorio';

  @override
  String get settings_language_coming_soon => 'Próximamente';

  @override
  String get settings_export_success => 'Datos exportados exitosamente';

  @override
  String get settings_export_failed => 'Error al exportar datos';

  @override
  String get settings_import_success => 'Datos importados exitosamente';

  @override
  String get settings_import_failed => 'Error al importar datos';

  @override
  String settings_import_stats(int imported, int skipped) {
    return 'Importados $imported registros, omitidos $skipped duplicados';
  }

  @override
  String get statistics_title => 'Estadísticas';

  @override
  String get statistics_weekly => 'Semanal';

  @override
  String get statistics_monthly => 'Mensual';

  @override
  String get statistics_yearly => 'Anual';

  @override
  String get statistics_average => 'Promedio';

  @override
  String get statistics_total => 'Total';

  @override
  String get statistics_best_day => 'Mejor Día';

  @override
  String get statistics_goal_achievement => 'Logro de Meta';

  @override
  String get statistics_no_data => 'Sin datos para este período';

  @override
  String get statistics_chart_label => 'Consumo de Agua';

  @override
  String get statistics_total_intake => 'Consumo Total';

  @override
  String get statistics_total_consumed => 'Total consumido';

  @override
  String get statistics_daily_average => 'Promedio diario';

  @override
  String get statistics_goals_met => 'Metas Cumplidas';

  @override
  String statistics_out_of(int count) {
    return 'de $count';
  }

  @override
  String get statistics_progress => 'Progreso';

  @override
  String get statistics_on_track => '¡En camino!';

  @override
  String get statistics_keep_going => '¡Sigue así!';

  @override
  String get statistics_daily_intake => 'Consumo Diario';

  @override
  String get statistics_below_goal => 'Bajo la meta';

  @override
  String get statistics_goal_met_label => 'Meta cumplida';

  @override
  String get statistics_your_streak => 'Tu Racha';

  @override
  String get statistics_current => 'Actual';

  @override
  String get statistics_best => 'Mejor';

  @override
  String get statistics_completed => 'Completados';

  @override
  String get statistics_next_goal => 'Próxima Meta';

  @override
  String get statistics_days => 'días';

  @override
  String get achievements_title => 'Logros';

  @override
  String get achievements_unlocked => 'Desbloqueado';

  @override
  String get achievements_locked => 'Bloqueado';

  @override
  String get achievements_progress => 'Progreso';

  @override
  String get achievements_reward_points => 'Puntos de Recompensa';

  @override
  String achievements_total_points(int points) {
    return 'Puntos Totales: $points';
  }

  @override
  String get achievement_first_drop => 'Primera Gota';

  @override
  String get achievement_first_drop_desc =>
      'Registra tu primer consumo de agua';

  @override
  String get achievement_daily_goal_1 => 'Logrador de Metas';

  @override
  String get achievement_daily_goal_1_desc => 'Alcanza tu meta diaria una vez';

  @override
  String get achievement_streak_3 => 'Racha de 3 Días';

  @override
  String get achievement_streak_3_desc => 'Mantén una racha de 3 días';

  @override
  String get achievement_streak_7 => 'Guerrero Semanal';

  @override
  String get achievement_streak_7_desc => 'Mantén una racha de 7 días';

  @override
  String get achievement_streak_30 => 'Maestro Mensual';

  @override
  String get achievement_streak_30_desc => 'Mantén una racha de 30 días';

  @override
  String get achievement_total_10l => '10 Litros';

  @override
  String get achievement_total_10l_desc => 'Bebe 10 litros en total';

  @override
  String get achievement_total_100l => '100 Litros';

  @override
  String get achievement_total_100l_desc => 'Bebe 100 litros en total';

  @override
  String get achievement_consistency => 'Semana Consistente';

  @override
  String get achievement_consistency_desc => 'Alcanza tu meta 7 días seguidos';

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
  String get reminders_title => 'Recordatorios';

  @override
  String get reminders_active => 'Recordatorios Activos';

  @override
  String get reminders_pending => 'Notificaciones Pendientes';

  @override
  String get reminders_interval_30 => 'Cada 30 minutos';

  @override
  String get reminders_interval_45 => 'Cada 45 minutos';

  @override
  String get reminders_interval_60 => 'Cada hora';

  @override
  String get reminders_interval_90 => 'Cada 1.5 horas';

  @override
  String get reminders_interval_120 => 'Cada 2 horas';

  @override
  String get reminders_interval_180 => 'Cada 3 horas';

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
  String get notification_reminder_title => '¡Hora de Beber Agua!';

  @override
  String get notification_reminder_body =>
      '¡Mantente hidratado! Bebe un poco de agua ahora.';

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
  String get streak_current => 'Racha Actual';

  @override
  String streak_days(int days) {
    return '$days días';
  }

  @override
  String get streak_keep_going => '¡Mantén la racha!';

  @override
  String get streak_personal_best => 'Mejor Personal';

  @override
  String get streak_best => '¡Mejor!';

  @override
  String get streak_longest => 'Más Larga';

  @override
  String get streak_next_milestone => 'Siguiente Meta';

  @override
  String get streak_start_today => '¡Comienza Tu Racha Hoy!';

  @override
  String get streak_complete_goal =>
      'Completa tu meta diaria para construir una racha';

  @override
  String get streak_start => '¡Inicia tu racha!';

  @override
  String get streak_error => 'Error al cargar datos de racha';

  @override
  String get streak_day_singular => 'día';

  @override
  String get streak_day_plural => 'días';

  @override
  String get onboarding_title_1 => 'Registra Tu Agua';

  @override
  String get onboarding_desc_1 =>
      'Registra fácilmente tu consumo diario con un toque';

  @override
  String get onboarding_title_2 => 'Recordatorios Inteligentes';

  @override
  String get onboarding_desc_2 =>
      'Recibe recordatorios oportunos para mantenerte hidratado';

  @override
  String get onboarding_title_3 => 'Monitorea Tu Progreso';

  @override
  String get onboarding_desc_3 =>
      'Ve tus estadísticas de hidratación y alcanza tus metas';

  @override
  String get onboarding_title_4 => 'Mantente Saludable';

  @override
  String get onboarding_desc_4 =>
      'Construye hábitos saludables y mejora tu bienestar';

  @override
  String get onboarding_get_started => 'Comenzar';

  @override
  String get drawer_home => 'Inicio';

  @override
  String get drawer_statistics => 'Estadísticas';

  @override
  String get drawer_achievements => 'Logros';

  @override
  String get drawer_profile => 'Perfil';

  @override
  String get drawer_reminders => 'Recordatorios';

  @override
  String get drawer_settings => 'Ajustes';

  @override
  String get drawer_help => 'Ayuda y Soporte';

  @override
  String get drawer_about => 'Acerca de';

  @override
  String get drawer_logout => 'Cerrar Sesión';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => 'Versión 1.0.0';

  @override
  String get about_description =>
      'Mantente hidratado y saludable con Aqualert. ¡Registra tu consumo diario de agua y alcanza tus metas de hidratación!';

  @override
  String get about_copyright =>
      '© 2024 Aqualert. Todos los derechos reservados.';

  @override
  String get about_close => 'Cerrar';

  @override
  String get help_title => 'Ayuda y Soporte';

  @override
  String get help_subtitle => 'Obtén ayuda y aprende más';

  @override
  String get help_faq => 'Preguntas Frecuentes';

  @override
  String get help_contact => 'Contáctanos';

  @override
  String get help_version => 'Versión';

  @override
  String get help_app_info => 'Información de la App';

  @override
  String get help_coming_soon => 'Ayuda y Soporte - ¡Próximamente!';

  @override
  String get help_faq_section => 'Preguntas Frecuentes';

  @override
  String get help_features_section => 'Guía de Funciones';

  @override
  String get help_about_section => 'Acerca de';

  @override
  String get faq_1_q => '¿Cómo se calcula mi meta diaria de agua?';

  @override
  String get faq_1_a =>
      'Tu meta diaria se calcula basándose en tu peso, altura, edad, género y nivel de actividad usando fórmulas científicas. También puedes establecer una meta personalizada en Ajustes de Perfil.';

  @override
  String get faq_2_q => '¿Cómo funcionan los recordatorios?';

  @override
  String get faq_2_a =>
      'Puedes configurar intervalos de recordatorio (30-180 minutos) y elegir horas de inicio/fin. La app te enviará notificaciones durante este período para ayudarte a mantenerte hidratado.';

  @override
  String get faq_3_q => '¿Qué son las rachas y cómo funcionan?';

  @override
  String get faq_3_a =>
      'Las rachas registran los días consecutivos que has alcanzado tu meta diaria. ¡Sigue bebiendo agua todos los días para mantener y aumentar tu racha!';

  @override
  String get faq_4_q => '¿Cómo puedo cambiar las unidades de medida?';

  @override
  String get faq_4_a =>
      'Ve a Ajustes → Unidades y cambia entre mililitros (ml) y onzas líquidas (fl oz). Todas las medidas se actualizarán automáticamente.';

  @override
  String get faq_5_q => '¿Puedo exportar mis datos de seguimiento?';

  @override
  String get faq_5_a =>
      '¡Sí! Ve a Ajustes → Gestión de Datos → Exportar Datos. Puedes compartir o guardar tus datos como archivo JSON e importarlos después.';

  @override
  String get faq_6_q => '¿Cómo funcionan los logros?';

  @override
  String get faq_6_a =>
      'Completa hitos de seguimiento de agua para desbloquear logros y ganar puntos de recompensa. Sigue tu progreso en la pantalla de Logros.';

  @override
  String get feature_tracking_title => 'Seguimiento de Agua';

  @override
  String get feature_tracking_desc =>
      'Registra fácilmente tu consumo diario con botones rápidos (250ml, 350ml, 500ml, 750ml) o ingresa una cantidad personalizada.';

  @override
  String get feature_reminders_title => 'Recordatorios Inteligentes';

  @override
  String get feature_reminders_desc =>
      'Configura intervalos de recordatorio personalizables y elige las horas activas. Nunca olvides beber agua durante el día.';

  @override
  String get feature_statistics_title => 'Estadísticas e Información';

  @override
  String get feature_statistics_desc =>
      'Ve tus tendencias de consumo de agua con gráficos semanales, mensuales y anuales. Sigue tu progreso a lo largo del tiempo.';

  @override
  String get feature_achievements_title => 'Logros y Rachas';

  @override
  String get feature_achievements_desc =>
      'Gana logros y mantén rachas diarias alcanzando tus metas de agua. ¡Mantente motivado con la gamificación!';

  @override
  String get feature_profile_title => 'Perfil y Metas';

  @override
  String get feature_profile_desc =>
      'Configura tu información personal y deja que la app calcule tu meta óptima diaria de agua basándose en tus métricas corporales.';

  @override
  String get help_contact_email => 'Contactar por Correo';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => 'Califica Nuestra App';

  @override
  String get help_rate_desc => '¿Te gusta Aqualert? ¡Déjanos una reseña!';

  @override
  String get help_build_number => 'Compilación';

  @override
  String get help_copyright =>
      '© 2024 Aqualert. Todos los derechos reservados.';

  @override
  String get help_made_with => 'Hecho con ❤️ para tu salud';

  @override
  String get error_generic => 'Algo salió mal. Por favor intenta de nuevo.';

  @override
  String get error_network => 'Error de red. Por favor verifica tu conexión.';

  @override
  String get error_auth_failed =>
      'Autenticación fallida. Por favor intenta de nuevo.';

  @override
  String get error_permission_denied => 'Permiso denegado.';

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
  String get time_morning => 'Mañana';

  @override
  String get time_afternoon => 'Tarde';

  @override
  String get time_evening => 'Atardecer';

  @override
  String get time_night => 'Noche';

  @override
  String get help_privacy_policy => 'Política de Privacidad';

  @override
  String get help_privacy_policy_desc => 'Ver nuestra política de privacidad';

  @override
  String get help_privacy_policy_error =>
      'No se pudo abrir la Política de Privacidad';

  @override
  String get settings_delete_account => 'Eliminar Cuenta';

  @override
  String get settings_delete_account_subtitle =>
      'Eliminar permanentemente tu cuenta y todos los datos';

  @override
  String get settings_delete_account_dialog_title => '¿Eliminar Cuenta?';

  @override
  String get settings_delete_account_dialog_message =>
      'Esta acción no se puede deshacer. Todos tus datos, incluyendo el historial de consumo de agua, rachas y configuraciones, se eliminarán permanentemente.';

  @override
  String get settings_delete_account_confirm => 'Eliminar Mi Cuenta';

  @override
  String get settings_delete_account_cancel => 'Cancelar';

  @override
  String get settings_delete_account_success => 'Cuenta eliminada exitosamente';

  @override
  String get settings_delete_account_error => 'Error al eliminar la cuenta';

  @override
  String get settings_delete_account_reauth_required =>
      'Por favor inicia sesión de nuevo para eliminar tu cuenta';

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
