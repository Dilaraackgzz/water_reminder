import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../core/providers/premium_provider.dart';
import '../../../../core/services/premium_service.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../../../shared/services/reminder_service.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../../core/providers/language_provider.dart';
import '../../../../core/providers/unit_provider.dart';
import '../../../../shared/providers/data_export_provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/section_header.dart';
import '../widgets/setting_card.dart';
import '../widgets/delete_account_card.dart';
import '../widgets/settings_loading_dialog.dart';
import '../widgets/dialogs/theme_dialog.dart';
import '../widgets/dialogs/unit_dialog.dart';
import '../widgets/dialogs/language_dialog.dart';
import '../widgets/dialogs/interval_dialog.dart';
import '../widgets/dialogs/delete_account_dialog.dart';
import '../../../profile/presentation/providers/profile_providers.dart';
import '../../../profile/presentation/widgets/profile_goal_dialog.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final reminderService = ref.watch(reminderServiceProvider);
    final isReminderEnabled = reminderService.isReminderEnabled();
    final themeMode = ref.watch(themeModeProvider);
    final waterUnit = ref.watch(waterUnitProvider);
    final currentLanguageName = ref.read(localeProvider.notifier).currentLanguageName;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    final isPremiumAsync = ref.watch(isPremiumProvider);
    final isPremium = isPremiumAsync.valueOrNull ?? false;

    return Scaffold(
      backgroundColor: isDark ? colorScheme.surface : Colors.grey[50],
      appBar: ModernAppBar(
        title: l10n.settings_title,
        subtitle: l10n.settings_subtitle,
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Premium Section
            _buildPremiumSection(context, ref, l10n, isDark, isPremium),

            const SizedBox(height: 32),

            // Notifications Section
            _buildNotificationsSection(
              context,
              ref,
              l10n,
              isDark,
              reminderService,
              isReminderEnabled,
            ),

            const SizedBox(height: 32),

            // App Settings Section
            _buildAppSettingsSection(
              context,
              l10n,
              isDark,
              themeMode,
              waterUnit,
              currentLanguageName,
            ),

            const SizedBox(height: 32),

            // Data Management Section
            _buildDataSection(context, ref, l10n, isDark, isPremium),

            const SizedBox(height: 32),

            // Account Section
            _buildAccountSection(context, ref, l10n, isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumSection(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    bool isDark,
    bool isPremium,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: l10n.settings_premium_section, isDark: isDark),
        const SizedBox(height: 12),
        if (isPremium)
          SettingCard(
            icon: Icons.verified_rounded,
            title: l10n.settings_premium_active,
            subtitle: 'Tüm premium özellikler aktif',
            isDark: isDark,
            iconColor: colorScheme.primary,
          )
        else
          SettingCard(
            icon: Icons.star_rounded,
            title: l10n.settings_premium_upgrade,
            subtitle: l10n.settings_premium_upgrade_subtitle,
            isDark: isDark,
            showChevron: true,
            iconColor: Colors.amber[700],
            onTap: () => context.push('/paywall'),
          ),
        const SizedBox(height: 12),
        SettingCard(
          icon: Icons.restore_rounded,
          title: l10n.settings_premium_restore,
          subtitle: l10n.settings_premium_restore_subtitle,
          isDark: isDark,
          showChevron: true,
          onTap: () => _handleRestorePurchase(context, ref),
        ),
      ],
    );
  }

  Widget _buildNotificationsSection(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    bool isDark,
    ReminderService reminderService,
    bool isReminderEnabled,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: l10n.settings_notifications, isDark: isDark),
        const SizedBox(height: 12),
        SettingCard(
          icon: Icons.notifications_active,
          title: l10n.settings_enable_notifications,
          subtitle: isReminderEnabled
              ? l10n.settings_reminders_active
              : l10n.settings_reminders_inactive,
          isDark: isDark,
          trailing: Switch(
            value: isReminderEnabled,
            onChanged: (value) async {
              HapticFeedback.lightImpact();
              await reminderService.setReminderEnabled(value);
              ref.invalidate(reminderServiceProvider);
            },
            activeTrackColor: Theme.of(context).colorScheme.primary.withAlpha(128),
            thumbColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return Theme.of(context).colorScheme.primary;
              }
              return null;
            }),
          ),
        ),
        const SizedBox(height: 12),
        SettingCard(
          icon: Icons.schedule,
          title: l10n.settings_reminder_interval,
          subtitle: '${reminderService.getReminderInterval()} ${l10n.settings_minutes}',
          isDark: isDark,
          showChevron: true,
          onTap: () => IntervalDialog.show(context),
        ),
        const SizedBox(height: 12),
        SettingCard(
          icon: Icons.access_time,
          title: l10n.settings_reminder_start_time,
          subtitle: _formatTime(reminderService.getReminderStartTime()),
          isDark: isDark,
          showChevron: true,
          onTap: () => _showTimePickerDialog(
            context,
            ref,
            reminderService,
            isStartTime: true,
          ),
        ),
        const SizedBox(height: 12),
        SettingCard(
          icon: Icons.bedtime,
          title: l10n.settings_reminder_end_time,
          subtitle: _formatTime(reminderService.getReminderEndTime()),
          isDark: isDark,
          showChevron: true,
          onTap: () => _showTimePickerDialog(
            context,
            ref,
            reminderService,
            isStartTime: false,
          ),
        ),
      ],
    );
  }

  Widget _buildAppSettingsSection(
    BuildContext context,
    AppLocalizations l10n,
    bool isDark,
    ThemeMode themeMode,
    dynamic waterUnit,
    String currentLanguageName,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: l10n.settings_theme, isDark: isDark),
        const SizedBox(height: 12),
        SettingCard(
          icon: Icons.palette,
          title: l10n.settings_theme,
          subtitle: _getThemeModeLabel(themeMode, l10n),
          isDark: isDark,
          showChevron: true,
          onTap: () => ThemeDialog.show(context),
        ),
        const SizedBox(height: 12),
        SettingCard(
          icon: Icons.straighten,
          title: l10n.settings_units,
          subtitle: waterUnit.displayName,
          isDark: isDark,
          showChevron: true,
          onTap: () => UnitDialog.show(context),
        ),
        const SizedBox(height: 12),
        SettingCard(
          icon: Icons.language,
          title: l10n.settings_language,
          subtitle: currentLanguageName,
          isDark: isDark,
          showChevron: true,
          onTap: () => LanguageDialog.show(context),
        ),
      ],
    );
  }

  Widget _buildDataSection(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    bool isDark,
    bool isPremium,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: l10n.settings_data, isDark: isDark),
        const SizedBox(height: 12),
        SettingCard(
          icon: Icons.file_upload,
          title: l10n.settings_export_data,
          subtitle: isPremium
              ? l10n.settings_export_subtitle
              : '${l10n.settings_export_subtitle} (Premium)',
          isDark: isDark,
          showChevron: true,
          onTap: isPremium
              ? () => _handleExportData(context, ref, l10n)
              : () => context.push('/paywall'),
        ),
        const SizedBox(height: 12),
        SettingCard(
          icon: Icons.file_download,
          title: l10n.settings_import_data,
          subtitle: l10n.settings_import_subtitle,
          isDark: isDark,
          showChevron: true,
          onTap: () => _handleImportData(context, ref, l10n),
        ),
      ],
    );
  }

  Widget _buildAccountSection(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: l10n.settings_profile, isDark: isDark),
        const SizedBox(height: 12),
        SettingCard(
          icon: Icons.person,
          title: l10n.settings_profile,
          subtitle: l10n.settings_profile_subtitle,
          isDark: isDark,
          showChevron: true,
          onTap: () => context.push('/profile'),
        ),
        const SizedBox(height: 12),
        SettingCard(
          icon: Icons.water_drop,
          title: l10n.settings_daily_goal,
          subtitle: l10n.settings_daily_goal_subtitle,
          isDark: isDark,
          showChevron: true,
          onTap: () => _showDailyGoalDialog(context, ref, l10n),
        ),
        const SizedBox(height: 12),
        DeleteAccountCard(
          icon: Icons.delete_forever,
          title: l10n.settings_delete_account,
          subtitle: l10n.settings_delete_account_subtitle,
          isDark: isDark,
          onTap: () => _showDeleteAccountDialog(context, ref),
        ),
      ],
    );
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String _getThemeModeLabel(ThemeMode mode, AppLocalizations l10n) {
    switch (mode) {
      case ThemeMode.light:
        return l10n.settings_theme_light;
      case ThemeMode.dark:
        return l10n.settings_theme_dark;
      case ThemeMode.system:
        return l10n.settings_theme_system;
    }
  }

  Future<void> _showTimePickerDialog(
    BuildContext context,
    WidgetRef ref,
    ReminderService service, {
    required bool isStartTime,
  }) async {
    final initialTime = isStartTime
        ? service.getReminderStartTime()
        : service.getReminderEndTime();

    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (picked != null) {
      if (isStartTime) {
        await service.setReminderStartTime(picked);
      } else {
        await service.setReminderEndTime(picked);
      }
      ref.invalidate(reminderServiceProvider);
    }
  }

  Future<void> _handleExportData(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) async {
    try {
      SettingsLoadingDialog.show(context, message: l10n.settings_export_loading);

      final exportService = ref.read(dataExportServiceProvider);
      await exportService.shareExportedData();

      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.settings_export_success_message,
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${l10n.settings_export_failed}: $e',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _handleImportData(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
        withData: true,
      );

      if (result == null || result.files.isEmpty) return;

      final file = result.files.single;

      if (file.extension?.toLowerCase() != 'json') {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                l10n.settings_import_failed,
                style: GoogleFonts.poppins(),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }

      if (file.path == null) return;

      if (context.mounted) {
        SettingsLoadingDialog.show(context, message: l10n.settings_import_loading);
      }

      final exportService = ref.read(dataExportServiceProvider);
      final stats = await exportService.importFromFile(file.path!);

      if (context.mounted) {
        Navigator.pop(context);

        showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            backgroundColor: isDark ? colorScheme.surfaceContainerHigh : Colors.white,
            title: Text(
              l10n.settings_import_complete,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.settings_import_success_subtitle,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '${stats['importedRecords']} ${l10n.settings_import_water_records}',
                  style: GoogleFonts.poppins(
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
                Text(
                  '${stats['importedGoals']} ${l10n.settings_import_daily_goals}',
                  style: GoogleFonts.poppins(
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
                if (stats['skippedRecords']! > 0) ...[
                  const SizedBox(height: 8),
                  Text(
                    '${stats['skippedRecords']} ${l10n.settings_import_duplicate_skipped}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                  ref.invalidate(exportStatisticsProvider);
                },
                child: Text(
                  'OK',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${l10n.settings_import_failed}: $e',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _showDailyGoalDialog(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) async {
    final profileAsync = ref.read(userProfileProvider);
    final profile = profileAsync.valueOrNull;

    if (profile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.profile_save_failed,
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final profileController = ref.read(profileControllerProvider);
    final calculatedGoal = await profileController.calculateDailyGoal(
      weight: profile.weight,
      activityLevel: profile.activityLevel,
    );

    if (!context.mounted) return;

    await ProfileGoalDialog.show(
      context: context,
      currentGoal: profile.dailyGoal,
      calculatedGoal: calculatedGoal,
      onSave: (goal) async {
        return await profileController.updateDailyGoal(
          profile.userId,
          goal,
          isCustom: true,
        );
      },
    );
  }

  Future<void> _handleRestorePurchase(BuildContext context, WidgetRef ref) async {
    HapticFeedback.lightImpact();

    final result = await ref.read(premiumNotifierProvider.notifier).restore();

    if (!context.mounted) return;

    switch (result) {
      case PurchaseResult.success:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Satın alım geri yüklendi!', style: GoogleFonts.poppins()),
            backgroundColor: Colors.green[700],
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      case PurchaseResult.notFound:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Önceki satın alım bulunamadı.', style: GoogleFonts.poppins()),
            backgroundColor: Colors.orange[700],
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      case PurchaseResult.failed:
      case PurchaseResult.cancelled:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Geri yükleme başarısız.', style: GoogleFonts.poppins()),
            backgroundColor: Colors.red[700],
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
    }
  }

  Future<void> _showDeleteAccountDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await DeleteAccountDialog.show(context);

    if (confirmed == true && context.mounted) {
      await DeleteAccountDialog.performDeletion(context, ref);
    }
  }
}
