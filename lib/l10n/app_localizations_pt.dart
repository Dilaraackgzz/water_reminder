// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => 'Mantenha-se hidratado para uma vida saudável';

  @override
  String get common_cancel => 'Cancelar';

  @override
  String get common_save => 'Salvar';

  @override
  String get common_delete => 'Excluir';

  @override
  String get common_edit => 'Editar';

  @override
  String get common_add => 'Adicionar';

  @override
  String get common_ok => 'OK';

  @override
  String get common_yes => 'Sim';

  @override
  String get common_no => 'Não';

  @override
  String get common_or => 'ou';

  @override
  String get common_done => 'Concluído';

  @override
  String get common_skip => 'Pular';

  @override
  String get common_next => 'Próximo';

  @override
  String get common_back => 'Voltar';

  @override
  String get common_continue => 'Continuar';

  @override
  String get common_loading => 'Carregando...';

  @override
  String get common_error => 'Erro';

  @override
  String get common_success => 'Sucesso';

  @override
  String get auth_login_title => 'Entrar';

  @override
  String get auth_register_title => 'Cadastrar';

  @override
  String get auth_email_label => 'E-mail';

  @override
  String get auth_email_hint => 'exemplo@email.com';

  @override
  String get auth_password_label => 'Senha';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => 'Nome completo';

  @override
  String get auth_name_hint => 'João Silva';

  @override
  String get auth_forgot_password => 'Esqueceu a senha?';

  @override
  String get auth_dont_have_account => 'Não tem conta? ';

  @override
  String get auth_already_have_account => 'Já tem conta? ';

  @override
  String get auth_sign_in_button => 'Entrar';

  @override
  String get auth_sign_up_button => 'Cadastrar';

  @override
  String get auth_sign_in_google => 'Entrar com Google';

  @override
  String get auth_sign_up_google => 'Cadastrar com Google';

  @override
  String get auth_logout => 'Sair';

  @override
  String get auth_validation_email_required => 'O e-mail é obrigatório';

  @override
  String get auth_validation_email_invalid => 'Digite um e-mail válido';

  @override
  String get auth_validation_password_required => 'A senha é obrigatória';

  @override
  String get auth_validation_password_min_length =>
      'A senha deve ter pelo menos 6 caracteres';

  @override
  String get auth_validation_name_required => 'O nome é obrigatório';

  @override
  String get auth_validation_name_min_length =>
      'O nome deve ter pelo menos 2 caracteres';

  @override
  String get auth_email_verification_title => 'Verifique seu e-mail';

  @override
  String get auth_email_verification_sent =>
      'Enviamos um link de verificação para:';

  @override
  String get auth_email_verification_instruction =>
      'Verifique seu e-mail e clique no link de verificação para continuar.';

  @override
  String get auth_email_verification_not_received => 'Não recebeu o e-mail?';

  @override
  String get auth_email_verification_resend => 'Reenviar e-mail de verificação';

  @override
  String get auth_email_verification_check => 'Já verifiquei meu e-mail';

  @override
  String get auth_email_verification_success =>
      'E-mail verificado com sucesso!';

  @override
  String get auth_email_verification_failed =>
      'E-mail ainda não verificado. Verifique sua caixa de entrada.';

  @override
  String get auth_forgot_password_title => 'Redefinir senha';

  @override
  String get auth_forgot_password_instruction =>
      'Digite seu e-mail e enviaremos um link para redefinir sua senha.';

  @override
  String get auth_forgot_password_button => 'Enviar link';

  @override
  String get auth_forgot_password_success =>
      'E-mail de redefinição enviado! Verifique sua caixa de entrada.';

  @override
  String get auth_back_to_login => 'Voltar para o login';

  @override
  String get home_title => 'Início';

  @override
  String get home_daily_goal => 'Meta Diária';

  @override
  String get home_today => 'Hoje';

  @override
  String get home_custom_amount => 'Quantidade personalizada';

  @override
  String get home_amount_label => 'Quantidade';

  @override
  String get home_add_water_success => 'Água adicionada com sucesso!';

  @override
  String get home_add_water_failed => 'Falha ao adicionar água';

  @override
  String get home_delete_water_confirm => 'Excluir este registro?';

  @override
  String get home_delete_water_success => 'Registro excluído';

  @override
  String get home_no_records_today => 'Sem registros hoje';

  @override
  String get home_start_drinking => 'Comece a beber água!';

  @override
  String get progress_current => 'Atual';

  @override
  String get progress_goal => 'Meta';

  @override
  String get progress_remaining => 'Restante';

  @override
  String get progress_completed => 'Meta concluída!';

  @override
  String progress_percentage(int percent) {
    return '$percent% da meta diária';
  }

  @override
  String get motivational_keep_going =>
      'Continue assim! Você está indo muito bem!';

  @override
  String get motivational_almost_there => 'Quase lá! Só mais um pouco!';

  @override
  String get motivational_goal_reached => 'Parabéns! Você atingiu sua meta!';

  @override
  String get motivational_good_start => 'Bom começo! Continue assim!';

  @override
  String get motivational_stay_hydrated =>
      'Mantenha-se hidratado durante o dia!';

  @override
  String get motivational_100_1 => 'Parabéns! Você atingiu sua meta!';

  @override
  String get motivational_100_2 =>
      'Trabalho incrível! Continue hidratado amanhã também!';

  @override
  String get motivational_100_3 => 'Você é um campeão da hidratação!';

  @override
  String get motivational_100_4 => 'Perfeito! Mantenha esses bons hábitos!';

  @override
  String get motivational_100_short => 'Meta Atingida!';

  @override
  String get motivational_75_1 => 'Quase lá! Só mais um pouco!';

  @override
  String get motivational_75_2 => 'Você está indo muito bem! Continue!';

  @override
  String get motivational_75_3 => 'Tão perto da sua meta!';

  @override
  String get motivational_75_4 => 'Progresso fantástico! Não pare agora!';

  @override
  String get motivational_75_short => 'Quase lá!';

  @override
  String get motivational_50_1 => 'Na metade! Você está ótimo!';

  @override
  String get motivational_50_2 => 'Ótimo trabalho! Continue!';

  @override
  String get motivational_50_3 => 'Você está no caminho certo!';

  @override
  String get motivational_50_4 => 'Bom progresso! Seja constante!';

  @override
  String get motivational_50_short => 'Na metade!';

  @override
  String get motivational_25_1 => 'Bom começo! Continue bebendo água!';

  @override
  String get motivational_25_2 => 'Você começou muito bem!';

  @override
  String get motivational_25_3 => 'Belo começo! Mantenha-se hidratado!';

  @override
  String get motivational_25_4 => 'Continue! Cada gole conta!';

  @override
  String get motivational_25_short => 'Bom começo!';

  @override
  String get motivational_0_1 =>
      'Hora de se hidratar! Seu corpo vai agradecer!';

  @override
  String get motivational_0_2 => 'Vamos começar sua jornada de hidratação!';

  @override
  String get motivational_0_3 => 'Comece seu dia com água!';

  @override
  String get motivational_0_4 => 'Sua saúde importa! Comece a beber!';

  @override
  String get motivational_0_short => 'Vamos começar!';

  @override
  String get profile_title => 'Perfil';

  @override
  String get profile_edit => 'Editar perfil';

  @override
  String get profile_personal_info => 'Informações pessoais';

  @override
  String get profile_body_metrics => 'Métricas corporais';

  @override
  String get profile_activity_level => 'Nível de atividade';

  @override
  String get profile_name => 'Nome';

  @override
  String get profile_email => 'E-mail';

  @override
  String get profile_age => 'Idade';

  @override
  String get profile_gender => 'Gênero';

  @override
  String get profile_weight => 'Peso';

  @override
  String get profile_height => 'Altura';

  @override
  String get profile_bmi => 'IMC';

  @override
  String get profile_bmi_category => 'Categoria IMC';

  @override
  String get profile_daily_goal => 'Meta diária de água';

  @override
  String get profile_use_calculated_goal => 'Usar meta calculada';

  @override
  String get profile_custom_goal => 'Meta personalizada';

  @override
  String get profile_save_success => 'Perfil atualizado com sucesso';

  @override
  String get profile_save_failed => 'Falha ao atualizar perfil';

  @override
  String get profile_user_default => 'Usuário';

  @override
  String get gender_male => 'Masculino';

  @override
  String get gender_female => 'Feminino';

  @override
  String get gender_other => 'Outro';

  @override
  String get activity_sedentary => 'Sedentário';

  @override
  String get activity_light => 'Levemente ativo';

  @override
  String get activity_moderate => 'Moderadamente ativo';

  @override
  String get activity_very_active => 'Muito ativo';

  @override
  String get activity_extra_active => 'Extra ativo';

  @override
  String get bmi_underweight => 'Abaixo do peso';

  @override
  String get bmi_normal => 'Peso normal';

  @override
  String get bmi_overweight => 'Sobrepeso';

  @override
  String get bmi_obese => 'Obeso';

  @override
  String get settings_title => 'Configurações';

  @override
  String get settings_notifications => 'Notificações';

  @override
  String get settings_reminders => 'Lembretes';

  @override
  String get settings_theme => 'Tema';

  @override
  String get settings_units => 'Unidades';

  @override
  String get settings_language => 'Idioma';

  @override
  String get settings_profile => 'Configurações do perfil';

  @override
  String get settings_daily_goal => 'Configurações da meta';

  @override
  String get settings_data => 'Gerenciamento de dados';

  @override
  String get settings_export_data => 'Exportar dados';

  @override
  String get settings_import_data => 'Importar dados';

  @override
  String get settings_help => 'Ajuda e suporte';

  @override
  String get settings_about => 'Sobre';

  @override
  String get settings_enable_notifications => 'Ativar notificações';

  @override
  String get settings_reminder_interval => 'Intervalo de lembrete';

  @override
  String get settings_reminder_start_time => 'Hora de início';

  @override
  String get settings_reminder_end_time => 'Hora de término';

  @override
  String get settings_test_notification => 'Testar notificação';

  @override
  String get settings_theme_light => 'Claro';

  @override
  String get settings_theme_dark => 'Escuro';

  @override
  String get settings_theme_system => 'Sistema';

  @override
  String get settings_unit_ml => 'Mililitros (ml)';

  @override
  String get settings_unit_floz => 'Onças líquidas (fl oz)';

  @override
  String get settings_unit_metric => 'Sistema métrico';

  @override
  String get settings_unit_imperial => 'Sistema imperial';

  @override
  String get settings_subtitle => 'Personalize sua experiência';

  @override
  String get settings_reminders_active => 'Lembretes de água ativos';

  @override
  String get settings_reminders_inactive => 'Ative os lembretes';

  @override
  String get settings_minutes => 'minutos';

  @override
  String get settings_export_subtitle => 'Faça backup dos seus dados de água';

  @override
  String get settings_import_subtitle => 'Restaurar do backup';

  @override
  String get settings_profile_subtitle => 'Atualize suas informações';

  @override
  String get settings_daily_goal_subtitle => 'Gerencie sua meta de hidratação';

  @override
  String get settings_theme_dialog_title => 'Tema';

  @override
  String get settings_theme_light_mode => 'Modo claro';

  @override
  String get settings_theme_dark_mode => 'Modo escuro';

  @override
  String get settings_theme_system_mode => 'Sistema';

  @override
  String get settings_theme_light_subtitle => 'Usar tema claro';

  @override
  String get settings_theme_dark_subtitle => 'Usar tema escuro';

  @override
  String get settings_theme_system_subtitle => 'Seguir tema do sistema';

  @override
  String get settings_language_dialog_title => 'Idioma';

  @override
  String get settings_export_loading => 'Exportando dados...';

  @override
  String get settings_export_success_message => 'Dados exportados com sucesso!';

  @override
  String settings_export_failed_message(String error) {
    return 'Falha na exportação: $error';
  }

  @override
  String get settings_import_loading => 'Importando dados...';

  @override
  String get settings_import_complete => 'Importação concluída';

  @override
  String get settings_import_success_subtitle => 'Importado com sucesso:';

  @override
  String get settings_import_water_records => 'registros de água';

  @override
  String get settings_import_daily_goals => 'metas diárias';

  @override
  String get settings_import_duplicate_skipped => 'duplicados ignorados';

  @override
  String settings_import_failed_message(String error) {
    return 'Falha na importação: $error';
  }

  @override
  String get settings_reminder_interval_title => 'Intervalo de lembrete';

  @override
  String get settings_language_coming_soon => 'Em breve';

  @override
  String get settings_export_success => 'Dados exportados com sucesso';

  @override
  String get settings_export_failed => 'Falha ao exportar dados';

  @override
  String get settings_import_success => 'Dados importados com sucesso';

  @override
  String get settings_import_failed => 'Falha ao importar dados';

  @override
  String settings_import_stats(int imported, int skipped) {
    return 'Importados $imported registros, ignorados $skipped duplicados';
  }

  @override
  String get statistics_title => 'Estatísticas';

  @override
  String get statistics_weekly => 'Semanal';

  @override
  String get statistics_monthly => 'Mensal';

  @override
  String get statistics_yearly => 'Anual';

  @override
  String get statistics_average => 'Média';

  @override
  String get statistics_total => 'Total';

  @override
  String get statistics_best_day => 'Melhor dia';

  @override
  String get statistics_goal_achievement => 'Conquista da meta';

  @override
  String get statistics_no_data => 'Sem dados para este período';

  @override
  String get statistics_chart_label => 'Consumo de água';

  @override
  String get achievements_title => 'Conquistas';

  @override
  String get achievements_unlocked => 'Desbloqueado';

  @override
  String get achievements_locked => 'Bloqueado';

  @override
  String get achievements_progress => 'Progresso';

  @override
  String get achievements_reward_points => 'Pontos de recompensa';

  @override
  String achievements_total_points(int points) {
    return 'Pontos totais: $points';
  }

  @override
  String get achievement_first_drop => 'Primeira gota';

  @override
  String get achievement_first_drop_desc =>
      'Registre seu primeiro consumo de água';

  @override
  String get achievement_daily_goal_1 => 'Conquistador de metas';

  @override
  String get achievement_daily_goal_1_desc => 'Atinja sua meta diária uma vez';

  @override
  String get achievement_streak_3 => 'Sequência de 3 dias';

  @override
  String get achievement_streak_3_desc => 'Mantenha uma sequência de 3 dias';

  @override
  String get achievement_streak_7 => 'Guerreiro da semana';

  @override
  String get achievement_streak_7_desc => 'Mantenha uma sequência de 7 dias';

  @override
  String get achievement_streak_30 => 'Mestre do mês';

  @override
  String get achievement_streak_30_desc => 'Mantenha uma sequência de 30 dias';

  @override
  String get achievement_total_10l => '10 Litros';

  @override
  String get achievement_total_10l_desc => 'Beba 10 litros no total';

  @override
  String get achievement_total_100l => '100 Litros';

  @override
  String get achievement_total_100l_desc => 'Beba 100 litros no total';

  @override
  String get achievement_consistency => 'Semana constante';

  @override
  String get achievement_consistency_desc =>
      'Atinja sua meta por 7 dias consecutivos';

  @override
  String get reminders_title => 'Lembretes';

  @override
  String get reminders_active => 'Lembretes ativos';

  @override
  String get reminders_pending => 'Notificações pendentes';

  @override
  String get reminders_interval_30 => 'A cada 30 minutos';

  @override
  String get reminders_interval_45 => 'A cada 45 minutos';

  @override
  String get reminders_interval_60 => 'A cada hora';

  @override
  String get reminders_interval_90 => 'A cada 1,5 horas';

  @override
  String get reminders_interval_120 => 'A cada 2 horas';

  @override
  String get reminders_interval_180 => 'A cada 3 horas';

  @override
  String get notification_reminder_title => 'Hora de beber água!';

  @override
  String get notification_reminder_body =>
      'Mantenha-se hidratado! Beba um pouco de água agora.';

  @override
  String get streak_current => 'Sequência atual';

  @override
  String streak_days(int days) {
    return '$days dias';
  }

  @override
  String get streak_keep_going => 'Mantenha a sequência!';

  @override
  String get streak_personal_best => 'Recorde pessoal';

  @override
  String get streak_best => 'Recorde!';

  @override
  String get streak_longest => 'Mais longa';

  @override
  String get streak_next_milestone => 'Próximo marco';

  @override
  String get streak_start_today => 'Comece sua sequência hoje!';

  @override
  String get streak_complete_goal =>
      'Complete sua meta diária para construir uma sequência';

  @override
  String get streak_start => 'Inicie sua sequência!';

  @override
  String get streak_error => 'Falha ao carregar dados da sequência';

  @override
  String get streak_day_singular => 'dia';

  @override
  String get streak_day_plural => 'dias';

  @override
  String get onboarding_title_1 => 'Registre sua água';

  @override
  String get onboarding_desc_1 =>
      'Registre facilmente seu consumo diário com um toque';

  @override
  String get onboarding_title_2 => 'Lembretes inteligentes';

  @override
  String get onboarding_desc_2 =>
      'Receba lembretes oportunos para se manter hidratado durante o dia';

  @override
  String get onboarding_title_3 => 'Monitore o progresso';

  @override
  String get onboarding_desc_3 =>
      'Veja suas estatísticas de hidratação e alcance suas metas';

  @override
  String get onboarding_title_4 => 'Mantenha-se saudável';

  @override
  String get onboarding_desc_4 =>
      'Construa hábitos saudáveis e melhore seu bem-estar';

  @override
  String get onboarding_get_started => 'Começar';

  @override
  String get drawer_home => 'Início';

  @override
  String get drawer_statistics => 'Estatísticas';

  @override
  String get drawer_achievements => 'Conquistas';

  @override
  String get drawer_profile => 'Perfil';

  @override
  String get drawer_reminders => 'Lembretes';

  @override
  String get drawer_settings => 'Configurações';

  @override
  String get drawer_help => 'Ajuda e suporte';

  @override
  String get drawer_about => 'Sobre';

  @override
  String get drawer_logout => 'Sair';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => 'Versão 1.0.0';

  @override
  String get about_description =>
      'Mantenha-se hidratado e saudável com o Aqualert. Registre seu consumo diário de água e alcance suas metas de hidratação!';

  @override
  String get about_copyright =>
      '© 2024 Aqualert. Todos os direitos reservados.';

  @override
  String get about_close => 'Fechar';

  @override
  String get help_title => 'Ajuda e suporte';

  @override
  String get help_subtitle => 'Obtenha ajuda e saiba mais';

  @override
  String get help_faq => 'Perguntas frequentes';

  @override
  String get help_contact => 'Entre em contato';

  @override
  String get help_version => 'Versão';

  @override
  String get help_app_info => 'Informações do app';

  @override
  String get help_coming_soon => 'Ajuda e suporte - Em breve!';

  @override
  String get help_faq_section => 'FAQ';

  @override
  String get help_features_section => 'Guia de recursos';

  @override
  String get help_about_section => 'Sobre';

  @override
  String get faq_1_q => 'Como minha meta diária de água é calculada?';

  @override
  String get faq_1_a =>
      'Sua meta diária é calculada com base em peso, altura, idade, gênero e nível de atividade usando fórmulas científicas. Você também pode definir uma meta personalizada nas configurações do perfil.';

  @override
  String get faq_2_q => 'Como funcionam os lembretes?';

  @override
  String get faq_2_a =>
      'Você pode definir intervalos de lembrete (30-180 minutos) e escolher horários de início/término. O app enviará notificações durante este período para ajudá-lo a se manter hidratado.';

  @override
  String get faq_3_q => 'O que são sequências e como funcionam?';

  @override
  String get faq_3_a =>
      'Sequências registram dias consecutivos em que você atingiu sua meta diária. Continue bebendo água todos os dias para manter e aumentar sua sequência!';

  @override
  String get faq_4_q => 'Como posso mudar as unidades de medida?';

  @override
  String get faq_4_a =>
      'Vá em Configurações → Unidades e alterne entre mililitros (ml) e onças líquidas (fl oz). Todas as medidas serão atualizadas automaticamente.';

  @override
  String get faq_5_q => 'Posso exportar meus dados de rastreamento?';

  @override
  String get faq_5_a =>
      'Sim! Vá em Configurações → Gerenciamento de dados → Exportar dados. Você pode compartilhar ou salvar seus dados como arquivo JSON e importá-los depois.';

  @override
  String get faq_6_q => 'Como funcionam as conquistas?';

  @override
  String get faq_6_a =>
      'Complete marcos de rastreamento de água para desbloquear conquistas e ganhar pontos de recompensa. Acompanhe seu progresso na tela de Conquistas.';

  @override
  String get feature_tracking_title => 'Rastreamento de água';

  @override
  String get feature_tracking_desc =>
      'Registre facilmente seu consumo diário com botões rápidos (250ml, 350ml, 500ml, 750ml) ou insira uma quantidade personalizada.';

  @override
  String get feature_reminders_title => 'Lembretes inteligentes';

  @override
  String get feature_reminders_desc =>
      'Defina intervalos de lembrete personalizáveis e escolha as horas ativas. Nunca esqueça de beber água durante o dia.';

  @override
  String get feature_statistics_title => 'Estatísticas e insights';

  @override
  String get feature_statistics_desc =>
      'Veja suas tendências de consumo de água com gráficos semanais, mensais e anuais. Acompanhe seu progresso ao longo do tempo.';

  @override
  String get feature_achievements_title => 'Conquistas e sequências';

  @override
  String get feature_achievements_desc =>
      'Ganhe conquistas e mantenha sequências diárias alcançando suas metas de água. Mantenha-se motivado com gamificação!';

  @override
  String get feature_profile_title => 'Perfil e metas';

  @override
  String get feature_profile_desc =>
      'Configure suas informações pessoais e deixe o app calcular sua meta diária ideal de água com base nas suas métricas corporais.';

  @override
  String get help_contact_email => 'Contatar por e-mail';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => 'Avalie nosso app';

  @override
  String get help_rate_desc => 'Gostando do Aqualert? Deixe uma avaliação!';

  @override
  String get help_build_number => 'Build';

  @override
  String get help_copyright => '© 2024 Aqualert. Todos os direitos reservados.';

  @override
  String get help_made_with => 'Feito com ❤️ para sua saúde';

  @override
  String get error_generic => 'Algo deu errado. Por favor, tente novamente.';

  @override
  String get error_network => 'Erro de rede. Por favor, verifique sua conexão.';

  @override
  String get error_auth_failed =>
      'Falha na autenticação. Por favor, tente novamente.';

  @override
  String get error_permission_denied => 'Permissão negada.';

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
  String get time_morning => 'Manhã';

  @override
  String get time_afternoon => 'Tarde';

  @override
  String get time_evening => 'Entardecer';

  @override
  String get time_night => 'Noite';

  @override
  String get help_privacy_policy => 'Política de privacidade';

  @override
  String get help_privacy_policy_desc => 'Ver nossa política de privacidade';

  @override
  String get help_privacy_policy_error =>
      'Não foi possível abrir a política de privacidade';
}
