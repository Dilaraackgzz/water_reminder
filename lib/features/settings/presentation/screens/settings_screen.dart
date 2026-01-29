import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../../../shared/services/reminder_service.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../../core/providers/language_provider.dart';
import '../../../../core/providers/unit_provider.dart';
import '../../../../core/services/unit_service.dart';
import '../../../../shared/providers/data_export_provider.dart';
import '../../../../l10n/app_localizations.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final reminderService = ref.watch(reminderServiceProvider);
    final isReminderEnabled = reminderService.isReminderEnabled();
    final themeMode = ref.watch(themeModeProvider);
    final waterUnit = ref.watch(waterUnitProvider);
    final locale = ref.watch(localeProvider);
    final currentLanguageName = ref.read(localeProvider.notifier).currentLanguageName;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

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
            // Notifications Section
            _SectionHeader(title: l10n.settings_notifications, isDark: isDark),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.notifications_active,
              title: l10n.settings_enable_notifications,
              subtitle: isReminderEnabled
                  ? l10n.settings_reminders_active
                  : l10n.settings_reminders_inactive,
              isDark: isDark,
              trailing: Switch(
                value: isReminderEnabled,
                onChanged: (value) async {
                  await reminderService.setReminderEnabled(value);
                  // Force rebuild
                  ref.invalidate(reminderServiceProvider);
                },
                activeColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.schedule,
              title: l10n.settings_reminder_interval,
              subtitle: '${reminderService.getReminderInterval()} ${l10n.settings_minutes}',
              isDark: isDark,
              onTap: () => _showIntervalDialog(context, ref, reminderService),
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.access_time,
              title: l10n.settings_reminder_start_time,
              subtitle: _formatTime(reminderService.getReminderStartTime()),
              isDark: isDark,
              onTap: () => _showTimePickerDialog(
                context,
                ref,
                reminderService,
                isStartTime: true,
              ),
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.bedtime,
              title: l10n.settings_reminder_end_time,
              subtitle: _formatTime(reminderService.getReminderEndTime()),
              isDark: isDark,
              onTap: () => _showTimePickerDialog(
                context,
                ref,
                reminderService,
                isStartTime: false,
              ),
            ),

            const SizedBox(height: 32),

            // App Settings Section
            _SectionHeader(title: l10n.settings_theme, isDark: isDark),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.palette,
              title: l10n.settings_theme,
              subtitle: _getThemeModeLabel(themeMode, l10n),
              isDark: isDark,
              trailing: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[600] : Colors.grey,
              ),
              onTap: () => _showThemeDialog(context, ref, themeMode),
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.straighten,
              title: l10n.settings_units,
              subtitle: waterUnit.displayName,
              isDark: isDark,
              trailing: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[600] : Colors.grey,
              ),
              onTap: () => _showUnitDialog(context, ref, waterUnit, l10n),
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.language,
              title: l10n.settings_language,
              subtitle: currentLanguageName,
              isDark: isDark,
              trailing: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[600] : Colors.grey,
              ),
              onTap: () => _showLanguageDialog(context, ref, locale),
            ),

            const SizedBox(height: 32),

            // Data Management Section
            _SectionHeader(title: l10n.settings_data, isDark: isDark),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.file_upload,
              title: l10n.settings_export_data,
              subtitle: l10n.settings_export_subtitle,
              isDark: isDark,
              trailing: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[600] : Colors.grey,
              ),
              onTap: () => _handleExportData(context, ref, l10n),
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.file_download,
              title: l10n.settings_import_data,
              subtitle: l10n.settings_import_subtitle,
              isDark: isDark,
              trailing: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[600] : Colors.grey,
              ),
              onTap: () => _handleImportData(context, ref, l10n),
            ),

            const SizedBox(height: 32),

            // Account Section
            _SectionHeader(title: l10n.settings_profile, isDark: isDark),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.person,
              title: l10n.settings_profile,
              subtitle: l10n.settings_profile_subtitle,
              isDark: isDark,
              trailing: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[600] : Colors.grey,
              ),
              onTap: () {
                context.push('/profile');
              },
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.water_drop,
              title: l10n.settings_daily_goal,
              subtitle: l10n.settings_daily_goal_subtitle,
              isDark: isDark,
              trailing: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[600] : Colors.grey,
              ),
              onTap: () {
                context.push('/profile');
              },
            ),
          ],
        ),
      ),
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

  Future<void> _showUnitDialog(
    BuildContext context,
    WidgetRef ref,
    WaterUnit currentUnit,
    AppLocalizations l10n,
  ) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        title: Text(
          l10n.settings_units,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<WaterUnit>(
              title: Text(
                l10n.settings_unit_ml,
                style: GoogleFonts.poppins(
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              subtitle: Text(
                l10n.settings_unit_metric,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: isDark ? Colors.grey[400] : Colors.grey,
                ),
              ),
              value: WaterUnit.milliliters,
              groupValue: currentUnit,
              onChanged: (value) async {
                if (value != null) {
                  await ref.read(waterUnitProvider.notifier).setWaterUnit(value);
                  if (dialogContext.mounted) Navigator.pop(dialogContext);
                }
              },
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            RadioListTile<WaterUnit>(
              title: Text(
                l10n.settings_unit_floz,
                style: GoogleFonts.poppins(
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              subtitle: Text(
                l10n.settings_unit_imperial,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: isDark ? Colors.grey[400] : Colors.grey,
                ),
              ),
              value: WaterUnit.fluidOunces,
              groupValue: currentUnit,
              onChanged: (value) async {
                if (value != null) {
                  await ref.read(waterUnitProvider.notifier).setWaterUnit(value);
                  if (dialogContext.mounted) Navigator.pop(dialogContext);
                }
              },
              activeColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  Future<void> _showThemeDialog(
    BuildContext context,
    WidgetRef ref,
    ThemeMode currentMode,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    await showDialog(
      context: context,
      builder: (dialogContext) => Consumer(
        builder: (_, ref, __) {
          final selectedMode = ref.watch(themeModeProvider);
          final isDark = Theme.of(dialogContext).brightness == Brightness.dark;

          return AlertDialog(
            backgroundColor: isDark ? Colors.grey[900] : Colors.white,
            title: Text(
              l10n.settings_theme_dialog_title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<ThemeMode>(
                  title: Text(
                    l10n.settings_theme_light_mode,
                    style: GoogleFonts.poppins(
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    l10n.settings_theme_light_subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: isDark ? Colors.grey[400] : Colors.grey,
                    ),
                  ),
                  value: ThemeMode.light,
                  groupValue: selectedMode,
                  onChanged: (value) async {
                    if (value != null) {
                      await ref.read(themeModeProvider.notifier).setThemeMode(value);
                      if (dialogContext.mounted) Navigator.pop(dialogContext);
                    }
                  },
                  activeColor: Theme.of(context).colorScheme.primary,
                ),
                RadioListTile<ThemeMode>(
                  title: Text(
                    l10n.settings_theme_dark_mode,
                    style: GoogleFonts.poppins(
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    l10n.settings_theme_dark_subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: isDark ? Colors.grey[400] : Colors.grey,
                    ),
                  ),
                  value: ThemeMode.dark,
                  groupValue: selectedMode,
                  onChanged: (value) async {
                    if (value != null) {
                      await ref.read(themeModeProvider.notifier).setThemeMode(value);
                      if (dialogContext.mounted) Navigator.pop(dialogContext);
                    }
                  },
                  activeColor: Theme.of(context).colorScheme.primary,
                ),
                RadioListTile<ThemeMode>(
                  title: Text(
                    l10n.settings_theme_system_mode,
                    style: GoogleFonts.poppins(
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    l10n.settings_theme_system_subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: isDark ? Colors.grey[400] : Colors.grey,
                    ),
                  ),
                  value: ThemeMode.system,
                  groupValue: selectedMode,
                  onChanged: (value) async {
                    if (value != null) {
                      await ref.read(themeModeProvider.notifier).setThemeMode(value);
                      if (dialogContext.mounted) Navigator.pop(dialogContext);
                    }
                  },
                  activeColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          );
        },
      ),
    );
  }

  Future<void> _showLanguageDialog(
    BuildContext context,
    WidgetRef ref,
    Locale currentLocale,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    await showDialog(
      context: context,
      builder: (dialogContext) => Consumer(
        builder: (_, ref, __) {
          final selectedLocale = ref.watch(localeProvider);
          final localeNotifier = ref.read(localeProvider.notifier);
          final isUsingSystemLocale = localeNotifier.isUsingSystemLocale;
          final isDark = Theme.of(dialogContext).brightness == Brightness.dark;

          // Available languages with native names
          final languages = [
            {'code': 'en', 'name': 'English', 'native': 'English'},
            {'code': 'tr', 'name': 'Türkçe', 'native': 'Turkish'},
            {'code': 'es', 'name': 'Español', 'native': 'Spanish'},
            {'code': 'fr', 'name': 'Français', 'native': 'French'},
            {'code': 'de', 'name': 'Deutsch', 'native': 'German'},
            {'code': 'it', 'name': 'Italiano', 'native': 'Italian'},
            {'code': 'pt', 'name': 'Português', 'native': 'Portuguese'},
          ];

          return AlertDialog(
            backgroundColor: isDark ? Colors.grey[900] : Colors.white,
            title: Text(
              l10n.settings_language_dialog_title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            content: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // System Language Option
                    RadioListTile<bool>(
                      title: Text(
                        'System Language',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        'Use device language',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: isDark ? Colors.grey[400] : Colors.grey,
                        ),
                      ),
                      value: true,
                      groupValue: isUsingSystemLocale,
                      onChanged: (value) async {
                        if (value == true) {
                          await ref.read(localeProvider.notifier).useSystemLocale();
                          if (dialogContext.mounted) Navigator.pop(dialogContext);
                        }
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),
                    Divider(
                      color: isDark ? Colors.grey[700] : Colors.grey[300],
                    ),
                    // Language list
                    ...languages.map((lang) => RadioListTile<String>(
                      title: Text(
                        lang['name']!,
                        style: GoogleFonts.poppins(
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        lang['native']!,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: isDark ? Colors.grey[400] : Colors.grey,
                        ),
                      ),
                      value: lang['code']!,
                      groupValue: isUsingSystemLocale ? null : selectedLocale.languageCode,
                      onChanged: (value) async {
                        if (value != null) {
                          await ref.read(localeProvider.notifier).changeLocale(Locale(value));
                          if (dialogContext.mounted) Navigator.pop(dialogContext);
                        }
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    )),
                  ],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          );
        },
      ),
    );
  }

  Future<void> _handleExportData(BuildContext context, WidgetRef ref, AppLocalizations l10n) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    try {
      // Show loading dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) => Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[900] : Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(color: Color(0xFF00BCD4)),
                const SizedBox(height: 16),
                Text(
                  l10n.settings_export_loading,
                  style: GoogleFonts.poppins(
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      final exportService = ref.read(dataExportServiceProvider);
      await exportService.shareExportedData();

      if (context.mounted) {
        Navigator.pop(context); // Close loading dialog
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
        Navigator.pop(context); // Close loading dialog
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

  Future<void> _handleImportData(BuildContext context, WidgetRef ref, AppLocalizations l10n) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    try {
      // Pick file
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result == null || result.files.single.path == null) {
        return;
      }

      // Show loading dialog
      if (context.mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) => Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[900] : Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(color: Color(0xFF00BCD4)),
                  const SizedBox(height: 16),
                  Text(
                    l10n.settings_import_loading,
                    style: GoogleFonts.poppins(
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }

      final exportService = ref.read(dataExportServiceProvider);
      final stats = await exportService.importFromFile(result.files.single.path!);

      if (context.mounted) {
        Navigator.pop(context); // Close loading dialog

        // Show success dialog with stats
        showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            backgroundColor: isDark ? Colors.grey[900] : Colors.white,
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
                  '• ${stats['importedRecords']} ${l10n.settings_import_water_records}',
                  style: GoogleFonts.poppins(
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
                Text(
                  '• ${stats['importedGoals']} ${l10n.settings_import_daily_goals}',
                  style: GoogleFonts.poppins(
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
                if (stats['skippedRecords']! > 0) ...[
                  const SizedBox(height: 8),
                  Text(
                    '• ${stats['skippedRecords']} ${l10n.settings_import_duplicate_skipped}',
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
                  // Refresh data
                  ref.invalidate(exportStatisticsProvider);
                },
                child: Text('OK', style: GoogleFonts.poppins(color: Theme.of(context).colorScheme.primary)),
              ),
            ],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context); // Close loading dialog
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

  Future<void> _showIntervalDialog(
    BuildContext context,
    WidgetRef ref,
    ReminderService service,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final intervals = [30, 45, 60, 90, 120, 180];
    final current = service.getReminderInterval();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        title: Text(
          l10n.settings_reminder_interval_title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: intervals.map((interval) {
            return RadioListTile<int>(
              title: Text(
                '$interval ${l10n.settings_minutes}',
                style: GoogleFonts.poppins(
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              value: interval,
              groupValue: current,
              onChanged: (value) async {
                if (value != null) {
                  await service.setReminderInterval(value);
                  ref.invalidate(reminderServiceProvider);
                  if (dialogContext.mounted) Navigator.pop(dialogContext);
                }
              },
              activeColor: Theme.of(context).colorScheme.primary,
            );
          }).toList(),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
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
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final bool isDark;

  const _SectionHeader({required this.title, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: isDark ? Colors.grey[400] : Colors.black54,
        letterSpacing: 0.5,
      ),
    );
  }
}

class _SettingCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isDark;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isDark,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isDark ? Colors.grey[850] : Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withAlpha(26),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: isDark ? Colors.white60 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
