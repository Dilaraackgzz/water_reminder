// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Aqualert';

  @override
  String get appTagline => 'Restez hydraté pour une vie saine';

  @override
  String get common_cancel => 'Annuler';

  @override
  String get common_save => 'Enregistrer';

  @override
  String get common_delete => 'Supprimer';

  @override
  String get common_edit => 'Modifier';

  @override
  String get common_add => 'Ajouter';

  @override
  String get common_ok => 'OK';

  @override
  String get common_yes => 'Oui';

  @override
  String get common_no => 'Non';

  @override
  String get common_or => 'ou';

  @override
  String get common_done => 'Terminé';

  @override
  String get common_skip => 'Passer';

  @override
  String get common_next => 'Suivant';

  @override
  String get common_back => 'Retour';

  @override
  String get common_continue => 'Continuer';

  @override
  String get common_loading => 'Chargement...';

  @override
  String get common_error => 'Erreur';

  @override
  String get common_success => 'Succès';

  @override
  String get auth_login_title => 'Connexion';

  @override
  String get auth_register_title => 'Inscription';

  @override
  String get auth_email_label => 'E-mail';

  @override
  String get auth_email_hint => 'exemple@email.com';

  @override
  String get auth_password_label => 'Mot de passe';

  @override
  String get auth_password_hint => '••••••••';

  @override
  String get auth_name_label => 'Nom complet';

  @override
  String get auth_name_hint => 'Jean Dupont';

  @override
  String get auth_forgot_password => 'Mot de passe oublié ?';

  @override
  String get auth_dont_have_account => 'Pas de compte ? ';

  @override
  String get auth_already_have_account => 'Déjà un compte ? ';

  @override
  String get auth_sign_in_button => 'Se connecter';

  @override
  String get auth_sign_up_button => 'S\'inscrire';

  @override
  String get auth_sign_in_google => 'Connexion avec Google';

  @override
  String get auth_sign_up_google => 'Inscription avec Google';

  @override
  String get auth_logout => 'Déconnexion';

  @override
  String get auth_validation_email_required => 'L\'e-mail est requis';

  @override
  String get auth_validation_email_invalid =>
      'Veuillez entrer un e-mail valide';

  @override
  String get auth_validation_password_required => 'Le mot de passe est requis';

  @override
  String get auth_validation_password_min_length =>
      'Le mot de passe doit contenir au moins 6 caractères';

  @override
  String get auth_validation_name_required => 'Le nom est requis';

  @override
  String get auth_validation_name_min_length =>
      'Le nom doit contenir au moins 2 caractères';

  @override
  String get auth_email_verification_title => 'Vérifiez votre e-mail';

  @override
  String get auth_email_verification_sent =>
      'Nous avons envoyé un lien de vérification à :';

  @override
  String get auth_email_verification_instruction =>
      'Veuillez vérifier votre e-mail et cliquer sur le lien de vérification pour continuer.';

  @override
  String get auth_email_verification_not_received =>
      'Vous n\'avez pas reçu l\'e-mail ?';

  @override
  String get auth_email_verification_resend =>
      'Renvoyer l\'e-mail de vérification';

  @override
  String get auth_email_verification_check => 'J\'ai vérifié mon e-mail';

  @override
  String get auth_email_verification_success => 'E-mail vérifié avec succès !';

  @override
  String get auth_email_verification_failed =>
      'E-mail non encore vérifié. Veuillez vérifier votre boîte de réception.';

  @override
  String get auth_forgot_password_title => 'Réinitialiser le mot de passe';

  @override
  String get auth_forgot_password_instruction =>
      'Entrez votre adresse e-mail et nous vous enverrons un lien pour réinitialiser votre mot de passe.';

  @override
  String get auth_forgot_password_button => 'Envoyer le lien';

  @override
  String get auth_forgot_password_success =>
      'E-mail de réinitialisation envoyé ! Vérifiez votre boîte de réception.';

  @override
  String get auth_back_to_login => 'Retour à la connexion';

  @override
  String get home_title => 'Accueil';

  @override
  String get home_daily_goal => 'Objectif quotidien';

  @override
  String get home_today => 'Aujourd\'hui';

  @override
  String get home_custom_amount => 'Quantité personnalisée';

  @override
  String get home_amount_label => 'Quantité';

  @override
  String get home_add_water_success => 'Eau ajoutée avec succès !';

  @override
  String get home_add_water_failed => 'Échec de l\'ajout d\'eau';

  @override
  String get home_delete_water_confirm => 'Supprimer cet enregistrement ?';

  @override
  String get home_delete_water_success => 'Enregistrement supprimé';

  @override
  String get home_no_records_today => 'Aucun enregistrement aujourd\'hui';

  @override
  String get home_start_drinking => 'Commencez à boire de l\'eau !';

  @override
  String get progress_current => 'Actuel';

  @override
  String get progress_goal => 'Objectif';

  @override
  String get progress_remaining => 'Restant';

  @override
  String get progress_completed => 'Objectif atteint !';

  @override
  String progress_percentage(int percent) {
    return '$percent% de l\'objectif quotidien';
  }

  @override
  String get motivational_keep_going => 'Continuez ! Vous êtes formidable !';

  @override
  String get motivational_almost_there => 'Presque terminé ! Encore un peu !';

  @override
  String get motivational_goal_reached =>
      'Félicitations ! Vous avez atteint votre objectif !';

  @override
  String get motivational_good_start => 'Bon début ! Continuez !';

  @override
  String get motivational_stay_hydrated =>
      'Restez hydraté tout au long de la journée !';

  @override
  String get motivational_100_1 =>
      'Félicitations ! Vous avez atteint votre objectif !';

  @override
  String get motivational_100_2 =>
      'Travail incroyable ! Restez hydraté demain aussi !';

  @override
  String get motivational_100_3 => 'Vous êtes un champion de l\'hydratation !';

  @override
  String get motivational_100_4 => 'Parfait ! Continuez ces bonnes habitudes !';

  @override
  String get motivational_100_short => 'Objectif Atteint !';

  @override
  String get motivational_75_1 => 'Presque terminé ! Encore un peu !';

  @override
  String get motivational_75_2 => 'Vous êtes formidable ! Continuez !';

  @override
  String get motivational_75_3 => 'Si proche de votre objectif !';

  @override
  String get motivational_75_4 =>
      'Progrès fantastique ! N\'arrêtez pas maintenant !';

  @override
  String get motivational_75_short => 'Presque terminé !';

  @override
  String get motivational_50_1 => 'À mi-chemin ! Vous êtes super !';

  @override
  String get motivational_50_2 => 'Bon travail ! Continuez !';

  @override
  String get motivational_50_3 => 'Vous êtes sur la bonne voie !';

  @override
  String get motivational_50_4 => 'Bon progrès ! Restez constant !';

  @override
  String get motivational_50_short => 'À mi-chemin !';

  @override
  String get motivational_25_1 => 'Bon début ! Continuez à boire de l\'eau !';

  @override
  String get motivational_25_2 => 'Vous avez bien commencé !';

  @override
  String get motivational_25_3 => 'Joli début ! Restez hydraté !';

  @override
  String get motivational_25_4 => 'Continuez ! Chaque gorgée compte !';

  @override
  String get motivational_25_short => 'Bon début !';

  @override
  String get motivational_0_1 =>
      'C\'est l\'heure de s\'hydrater ! Votre corps vous remerciera !';

  @override
  String get motivational_0_2 => 'Commençons votre voyage d\'hydratation !';

  @override
  String get motivational_0_3 => 'Commencez votre journée avec de l\'eau !';

  @override
  String get motivational_0_4 => 'Votre santé compte ! Commencez à boire !';

  @override
  String get motivational_0_short => 'Commençons !';

  @override
  String get profile_title => 'Profil';

  @override
  String get profile_edit => 'Modifier le profil';

  @override
  String get profile_personal_info => 'Informations personnelles';

  @override
  String get profile_body_metrics => 'Métriques corporelles';

  @override
  String get profile_activity_level => 'Niveau d\'activité';

  @override
  String get profile_name => 'Nom';

  @override
  String get profile_email => 'E-mail';

  @override
  String get profile_age => 'Âge';

  @override
  String get profile_gender => 'Genre';

  @override
  String get profile_weight => 'Poids';

  @override
  String get profile_height => 'Taille';

  @override
  String get profile_bmi => 'IMC';

  @override
  String get profile_bmi_category => 'Catégorie IMC';

  @override
  String get profile_daily_goal => 'Objectif quotidien d\'eau';

  @override
  String get profile_use_calculated_goal => 'Utiliser l\'objectif calculé';

  @override
  String get profile_custom_goal => 'Objectif personnalisé';

  @override
  String get profile_save_success => 'Profil mis à jour avec succès';

  @override
  String get profile_save_failed => 'Échec de la mise à jour du profil';

  @override
  String get profile_user_default => 'Utilisateur';

  @override
  String get gender_male => 'Homme';

  @override
  String get gender_female => 'Femme';

  @override
  String get gender_other => 'Autre';

  @override
  String get activity_sedentary => 'Sédentaire';

  @override
  String get activity_light => 'Légèrement actif';

  @override
  String get activity_moderate => 'Modérément actif';

  @override
  String get activity_very_active => 'Très actif';

  @override
  String get activity_extra_active => 'Extra actif';

  @override
  String get bmi_underweight => 'Insuffisance pondérale';

  @override
  String get bmi_normal => 'Poids normal';

  @override
  String get bmi_overweight => 'Surpoids';

  @override
  String get bmi_obese => 'Obèse';

  @override
  String get settings_title => 'Paramètres';

  @override
  String get settings_notifications => 'Notifications';

  @override
  String get settings_reminders => 'Rappels';

  @override
  String get settings_theme => 'Thème';

  @override
  String get settings_units => 'Unités';

  @override
  String get settings_language => 'Langue';

  @override
  String get settings_profile => 'Paramètres du profil';

  @override
  String get settings_daily_goal => 'Paramètres de l\'objectif';

  @override
  String get settings_data => 'Gestion des données';

  @override
  String get settings_export_data => 'Exporter les données';

  @override
  String get settings_import_data => 'Importer les données';

  @override
  String get settings_help => 'Aide et support';

  @override
  String get settings_about => 'À propos';

  @override
  String get settings_enable_notifications => 'Activer les notifications';

  @override
  String get settings_reminder_interval => 'Intervalle de rappel';

  @override
  String get settings_reminder_start_time => 'Heure de début';

  @override
  String get settings_reminder_end_time => 'Heure de fin';

  @override
  String get settings_test_notification => 'Tester la notification';

  @override
  String get settings_theme_light => 'Clair';

  @override
  String get settings_theme_dark => 'Sombre';

  @override
  String get settings_theme_system => 'Système';

  @override
  String get settings_unit_ml => 'Millilitres (ml)';

  @override
  String get settings_unit_floz => 'Onces liquides (fl oz)';

  @override
  String get settings_unit_metric => 'Système métrique';

  @override
  String get settings_unit_imperial => 'Système impérial';

  @override
  String get settings_subtitle => 'Personnalisez votre expérience';

  @override
  String get settings_reminders_active => 'Rappels d\'eau actifs';

  @override
  String get settings_reminders_inactive => 'Activez les rappels';

  @override
  String get settings_minutes => 'minutes';

  @override
  String get settings_export_subtitle => 'Sauvegardez vos données d\'eau';

  @override
  String get settings_import_subtitle => 'Restaurer depuis une sauvegarde';

  @override
  String get settings_profile_subtitle => 'Mettez à jour vos informations';

  @override
  String get settings_daily_goal_subtitle =>
      'Gérez votre objectif d\'hydratation';

  @override
  String get settings_theme_dialog_title => 'Thème';

  @override
  String get settings_theme_light_mode => 'Mode clair';

  @override
  String get settings_theme_dark_mode => 'Mode sombre';

  @override
  String get settings_theme_system_mode => 'Système';

  @override
  String get settings_theme_light_subtitle => 'Utiliser le thème clair';

  @override
  String get settings_theme_dark_subtitle => 'Utiliser le thème sombre';

  @override
  String get settings_theme_system_subtitle => 'Suivre le thème du système';

  @override
  String get settings_language_dialog_title => 'Langue';

  @override
  String get settings_export_loading => 'Exportation des données...';

  @override
  String get settings_export_success_message =>
      'Données exportées avec succès !';

  @override
  String settings_export_failed_message(String error) {
    return 'Échec de l\'exportation : $error';
  }

  @override
  String get settings_import_loading => 'Importation des données...';

  @override
  String get settings_import_complete => 'Importation terminée';

  @override
  String get settings_import_success_subtitle => 'Importé avec succès :';

  @override
  String get settings_import_water_records => 'enregistrements d\'eau';

  @override
  String get settings_import_daily_goals => 'objectifs quotidiens';

  @override
  String get settings_import_duplicate_skipped => 'doublons ignorés';

  @override
  String settings_import_failed_message(String error) {
    return 'Échec de l\'importation : $error';
  }

  @override
  String get settings_reminder_interval_title => 'Intervalle de rappel';

  @override
  String get settings_language_coming_soon => 'Bientôt disponible';

  @override
  String get settings_export_success => 'Données exportées avec succès';

  @override
  String get settings_export_failed => 'Échec de l\'exportation des données';

  @override
  String get settings_import_success => 'Données importées avec succès';

  @override
  String get settings_import_failed => 'Échec de l\'importation des données';

  @override
  String settings_import_stats(int imported, int skipped) {
    return '$imported enregistrements importés, $skipped doublons ignorés';
  }

  @override
  String get statistics_title => 'Statistiques';

  @override
  String get statistics_weekly => 'Hebdomadaire';

  @override
  String get statistics_monthly => 'Mensuel';

  @override
  String get statistics_yearly => 'Annuel';

  @override
  String get statistics_average => 'Moyenne';

  @override
  String get statistics_total => 'Total';

  @override
  String get statistics_best_day => 'Meilleur jour';

  @override
  String get statistics_goal_achievement => 'Réalisation de l\'objectif';

  @override
  String get statistics_no_data => 'Aucune donnée pour cette période';

  @override
  String get statistics_chart_label => 'Consommation d\'eau';

  @override
  String get achievements_title => 'Succès';

  @override
  String get achievements_unlocked => 'Débloqué';

  @override
  String get achievements_locked => 'Verrouillé';

  @override
  String get achievements_progress => 'Progrès';

  @override
  String get achievements_reward_points => 'Points de récompense';

  @override
  String achievements_total_points(int points) {
    return 'Points totaux : $points';
  }

  @override
  String get achievement_first_drop => 'Première goutte';

  @override
  String get achievement_first_drop_desc =>
      'Enregistrez votre première consommation d\'eau';

  @override
  String get achievement_daily_goal_1 => 'Objectif atteint';

  @override
  String get achievement_daily_goal_1_desc =>
      'Atteignez votre objectif quotidien une fois';

  @override
  String get achievement_streak_3 => 'Série de 3 jours';

  @override
  String get achievement_streak_3_desc => 'Maintenez une série de 3 jours';

  @override
  String get achievement_streak_7 => 'Guerrier de la semaine';

  @override
  String get achievement_streak_7_desc => 'Maintenez une série de 7 jours';

  @override
  String get achievement_streak_30 => 'Maître du mois';

  @override
  String get achievement_streak_30_desc => 'Maintenez une série de 30 jours';

  @override
  String get achievement_total_10l => '10 Litres';

  @override
  String get achievement_total_10l_desc => 'Buvez 10 litres au total';

  @override
  String get achievement_total_100l => '100 Litres';

  @override
  String get achievement_total_100l_desc => 'Buvez 100 litres au total';

  @override
  String get achievement_consistency => 'Semaine constante';

  @override
  String get achievement_consistency_desc =>
      'Atteignez votre objectif 7 jours consécutifs';

  @override
  String get reminders_title => 'Rappels';

  @override
  String get reminders_active => 'Rappels actifs';

  @override
  String get reminders_pending => 'Notifications en attente';

  @override
  String get reminders_interval_30 => 'Toutes les 30 minutes';

  @override
  String get reminders_interval_45 => 'Toutes les 45 minutes';

  @override
  String get reminders_interval_60 => 'Toutes les heures';

  @override
  String get reminders_interval_90 => 'Toutes les 1h30';

  @override
  String get reminders_interval_120 => 'Toutes les 2 heures';

  @override
  String get reminders_interval_180 => 'Toutes les 3 heures';

  @override
  String get notification_reminder_title => 'C\'est l\'heure de boire !';

  @override
  String get notification_reminder_body =>
      'Restez hydraté ! Buvez un peu d\'eau maintenant.';

  @override
  String get streak_current => 'Série actuelle';

  @override
  String streak_days(int days) {
    return '$days jours';
  }

  @override
  String get streak_keep_going => 'Continuez la série !';

  @override
  String get streak_personal_best => 'Record personnel';

  @override
  String get streak_best => 'Record !';

  @override
  String get streak_longest => 'La plus longue';

  @override
  String get streak_next_milestone => 'Prochaine étape';

  @override
  String get streak_start_today => 'Commencez votre série aujourd\'hui !';

  @override
  String get streak_complete_goal =>
      'Complétez votre objectif quotidien pour construire une série';

  @override
  String get streak_start => 'Démarrez votre série !';

  @override
  String get streak_error => 'Échec du chargement des données de série';

  @override
  String get streak_day_singular => 'jour';

  @override
  String get streak_day_plural => 'jours';

  @override
  String get onboarding_title_1 => 'Suivez votre eau';

  @override
  String get onboarding_desc_1 =>
      'Enregistrez facilement votre consommation quotidienne d\'un simple toucher';

  @override
  String get onboarding_title_2 => 'Rappels intelligents';

  @override
  String get onboarding_desc_2 =>
      'Recevez des rappels opportuns pour rester hydraté toute la journée';

  @override
  String get onboarding_title_3 => 'Suivez vos progrès';

  @override
  String get onboarding_desc_3 =>
      'Visualisez vos statistiques d\'hydratation et atteignez vos objectifs';

  @override
  String get onboarding_title_4 => 'Restez en bonne santé';

  @override
  String get onboarding_desc_4 =>
      'Développez de bonnes habitudes et améliorez votre bien-être';

  @override
  String get onboarding_get_started => 'Commencer';

  @override
  String get drawer_home => 'Accueil';

  @override
  String get drawer_statistics => 'Statistiques';

  @override
  String get drawer_achievements => 'Succès';

  @override
  String get drawer_profile => 'Profil';

  @override
  String get drawer_reminders => 'Rappels';

  @override
  String get drawer_settings => 'Paramètres';

  @override
  String get drawer_help => 'Aide et support';

  @override
  String get drawer_about => 'À propos';

  @override
  String get drawer_logout => 'Déconnexion';

  @override
  String get about_title => 'Aqualert';

  @override
  String get about_version => 'Version 1.0.0';

  @override
  String get about_description =>
      'Restez hydraté et en bonne santé avec Aqualert. Suivez votre consommation d\'eau quotidienne et atteignez vos objectifs d\'hydratation !';

  @override
  String get about_copyright => '© 2024 Aqualert. Tous droits réservés.';

  @override
  String get about_close => 'Fermer';

  @override
  String get help_title => 'Aide et support';

  @override
  String get help_subtitle => 'Obtenez de l\'aide et apprenez-en plus';

  @override
  String get help_faq => 'Questions fréquentes';

  @override
  String get help_contact => 'Contactez-nous';

  @override
  String get help_version => 'Version';

  @override
  String get help_app_info => 'Informations sur l\'app';

  @override
  String get help_coming_soon => 'Aide et support - Bientôt disponible !';

  @override
  String get help_faq_section => 'FAQ';

  @override
  String get help_features_section => 'Guide des fonctionnalités';

  @override
  String get help_about_section => 'À propos';

  @override
  String get faq_1_q =>
      'Comment mon objectif quotidien d\'eau est-il calculé ?';

  @override
  String get faq_1_a =>
      'Votre objectif quotidien est calculé en fonction de votre poids, taille, âge, genre et niveau d\'activité à l\'aide de formules scientifiques. Vous pouvez également définir un objectif personnalisé dans les paramètres du profil.';

  @override
  String get faq_2_q => 'Comment fonctionnent les rappels ?';

  @override
  String get faq_2_a =>
      'Vous pouvez définir des intervalles de rappel (30-180 minutes) et choisir les heures de début/fin. L\'app vous enverra des notifications pendant cette période pour vous aider à rester hydraté.';

  @override
  String get faq_3_q => 'Que sont les séries et comment fonctionnent-elles ?';

  @override
  String get faq_3_a =>
      'Les séries suivent les jours consécutifs où vous avez atteint votre objectif quotidien. Continuez à boire de l\'eau chaque jour pour maintenir et augmenter votre série !';

  @override
  String get faq_4_q => 'Comment puis-je changer les unités de mesure ?';

  @override
  String get faq_4_a =>
      'Allez dans Paramètres → Unités et basculez entre millilitres (ml) et onces liquides (fl oz). Toutes les mesures se mettront à jour automatiquement.';

  @override
  String get faq_5_q => 'Puis-je exporter mes données de suivi ?';

  @override
  String get faq_5_a =>
      'Oui ! Allez dans Paramètres → Gestion des données → Exporter les données. Vous pouvez partager ou sauvegarder vos données en fichier JSON et les importer plus tard.';

  @override
  String get faq_6_q => 'Comment fonctionnent les succès ?';

  @override
  String get faq_6_a =>
      'Complétez des étapes de suivi d\'eau pour débloquer des succès et gagner des points de récompense. Suivez votre progrès dans l\'écran Succès.';

  @override
  String get feature_tracking_title => 'Suivi de l\'eau';

  @override
  String get feature_tracking_desc =>
      'Enregistrez facilement votre consommation quotidienne avec des boutons rapides (250ml, 350ml, 500ml, 750ml) ou entrez une quantité personnalisée.';

  @override
  String get feature_reminders_title => 'Rappels intelligents';

  @override
  String get feature_reminders_desc =>
      'Définissez des intervalles de rappel personnalisables et choisissez les heures actives. N\'oubliez jamais de boire de l\'eau pendant la journée.';

  @override
  String get feature_statistics_title => 'Statistiques et aperçus';

  @override
  String get feature_statistics_desc =>
      'Visualisez vos tendances de consommation d\'eau avec des graphiques hebdomadaires, mensuels et annuels. Suivez votre progrès au fil du temps.';

  @override
  String get feature_achievements_title => 'Succès et séries';

  @override
  String get feature_achievements_desc =>
      'Gagnez des succès et maintenez des séries quotidiennes en atteignant vos objectifs d\'eau. Restez motivé avec la gamification !';

  @override
  String get feature_profile_title => 'Profil et objectifs';

  @override
  String get feature_profile_desc =>
      'Configurez vos informations personnelles et laissez l\'app calculer votre objectif quotidien optimal d\'eau basé sur vos métriques corporelles.';

  @override
  String get help_contact_email => 'Contacter par e-mail';

  @override
  String get help_contact_email_address => 'dilaraacikgoz.dev@gmail.com';

  @override
  String get help_rate_app => 'Notez notre app';

  @override
  String get help_rate_desc => 'Vous aimez Aqualert ? Laissez-nous un avis !';

  @override
  String get help_build_number => 'Build';

  @override
  String get help_copyright => '© 2024 Aqualert. Tous droits réservés.';

  @override
  String get help_made_with => 'Fait avec ❤️ pour votre santé';

  @override
  String get error_generic => 'Une erreur s\'est produite. Veuillez réessayer.';

  @override
  String get error_network =>
      'Erreur réseau. Veuillez vérifier votre connexion.';

  @override
  String get error_auth_failed =>
      'Échec de l\'authentification. Veuillez réessayer.';

  @override
  String get error_permission_denied => 'Permission refusée.';

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
  String get time_morning => 'Matin';

  @override
  String get time_afternoon => 'Après-midi';

  @override
  String get time_evening => 'Soir';

  @override
  String get time_night => 'Nuit';

  @override
  String get help_privacy_policy => 'Politique de confidentialité';

  @override
  String get help_privacy_policy_desc =>
      'Voir notre politique de confidentialité';

  @override
  String get help_privacy_policy_error =>
      'Impossible d\'ouvrir la politique de confidentialité';
}
