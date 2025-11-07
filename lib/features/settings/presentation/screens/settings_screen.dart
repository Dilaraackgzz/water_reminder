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

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminderService = ref.watch(reminderServiceProvider);
    final isReminderEnabled = reminderService.isReminderEnabled();
    final themeMode = ref.watch(themeModeProvider);
    final waterUnit = ref.watch(waterUnitProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: isDark ? colorScheme.surface : Colors.grey[50],
      appBar: const ModernAppBar(
        title: 'Settings',
        subtitle: 'Customize your experience',
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Notifications Section
            _SectionHeader(title: 'Notifications', isDark: isDark),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.notifications_active,
              title: 'Enable Reminders',
              subtitle: isReminderEnabled
                  ? 'Water reminders are active'
                  : 'Turn on to get reminders',
              isDark: isDark,
              trailing: Switch(
                value: isReminderEnabled,
                onChanged: (value) async {
                  await reminderService.setReminderEnabled(value);
                  // Force rebuild
                  ref.invalidate(reminderServiceProvider);
                },
                activeColor: const Color(0xFF00BCD4),
              ),
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.schedule,
              title: 'Reminder Interval',
              subtitle: '${reminderService.getReminderInterval()} minutes',
              isDark: isDark,
              onTap: () => _showIntervalDialog(context, ref, reminderService),
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.access_time,
              title: 'Start Time',
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
              title: 'End Time',
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
            _SectionHeader(title: 'App Settings', isDark: isDark),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.palette,
              title: 'Theme',
              subtitle: _getThemeModeLabel(themeMode),
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
              title: 'Water Unit',
              subtitle: waterUnit.displayName,
              isDark: isDark,
              trailing: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[600] : Colors.grey,
              ),
              onTap: () => _showUnitDialog(context, ref, waterUnit),
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.language,
              title: 'Language',
              subtitle: 'English',
              isDark: isDark,
              trailing: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[600] : Colors.grey,
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Language settings - Coming Soon!',
                      style: GoogleFonts.poppins(),
                    ),
                    backgroundColor: const Color(0xFF00BCD4),
                  ),
                );
              },
            ),

            const SizedBox(height: 32),

            // Data Management Section
            _SectionHeader(title: 'Data Management', isDark: isDark),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.file_upload,
              title: 'Export Data',
              subtitle: 'Backup your water tracking data',
              isDark: isDark,
              trailing: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[600] : Colors.grey,
              ),
              onTap: () => _handleExportData(context, ref),
            ),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.file_download,
              title: 'Import Data',
              subtitle: 'Restore from backup file',
              isDark: isDark,
              trailing: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[600] : Colors.grey,
              ),
              onTap: () => _handleImportData(context, ref),
            ),

            const SizedBox(height: 32),

            // Account Section
            _SectionHeader(title: 'Account', isDark: isDark),
            const SizedBox(height: 12),
            _SettingCard(
              icon: Icons.person,
              title: 'Edit Profile',
              subtitle: 'Update your information',
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
              title: 'Daily Goal',
              subtitle: 'Manage your hydration goal',
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

  String _getThemeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light Mode';
      case ThemeMode.dark:
        return 'Dark Mode';
      case ThemeMode.system:
        return 'System Default';
    }
  }

  Future<void> _showUnitDialog(
    BuildContext context,
    WidgetRef ref,
    WaterUnit currentUnit,
  ) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        title: Text(
          'Water Unit',
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
                'Milliliters (ml)',
                style: GoogleFonts.poppins(
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              subtitle: Text(
                'Metric system',
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
              activeColor: const Color(0xFF00BCD4),
            ),
            RadioListTile<WaterUnit>(
              title: Text(
                'Fluid Ounces (fl oz)',
                style: GoogleFonts.poppins(
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              subtitle: Text(
                'Imperial system',
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
              activeColor: const Color(0xFF00BCD4),
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
    await showDialog(
      context: context,
      builder: (dialogContext) => Consumer(
        builder: (_, ref, __) {
          final selectedMode = ref.watch(themeModeProvider);
          final isDark = Theme.of(dialogContext).brightness == Brightness.dark;

          return AlertDialog(
            backgroundColor: isDark ? Colors.grey[900] : Colors.white,
            title: Text(
              'Theme',
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
                    'Light Mode',
                    style: GoogleFonts.poppins(
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    'Use light theme',
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
                  activeColor: const Color(0xFF00BCD4),
                ),
                RadioListTile<ThemeMode>(
                  title: Text(
                    'Dark Mode',
                    style: GoogleFonts.poppins(
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    'Use dark theme',
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
                  activeColor: const Color(0xFF00BCD4),
                ),
                RadioListTile<ThemeMode>(
                  title: Text(
                    'System Default',
                    style: GoogleFonts.poppins(
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    'Follow system theme',
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
                  activeColor: const Color(0xFF00BCD4),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          );
        },
      ),
    );
  }

  Future<void> _handleExportData(BuildContext context, WidgetRef ref) async {
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
                  'Exporting data...',
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
              'Data exported successfully!',
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
              'Export failed: $e',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _handleImportData(BuildContext context, WidgetRef ref) async {
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
                    'Importing data...',
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
              'Import Complete',
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
                  'Imported successfully:',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '• ${stats['importedRecords']} water records',
                  style: GoogleFonts.poppins(
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
                Text(
                  '• ${stats['importedGoals']} daily goals',
                  style: GoogleFonts.poppins(
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
                if (stats['skippedRecords']! > 0) ...[
                  const SizedBox(height: 8),
                  Text(
                    '• ${stats['skippedRecords']} duplicate records skipped',
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
                child: Text('OK', style: GoogleFonts.poppins(color: const Color(0xFF00BCD4))),
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
              'Import failed: $e',
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
    final intervals = [30, 45, 60, 90, 120, 180];
    final current = service.getReminderInterval();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        title: Text(
          'Reminder Interval',
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
                '$interval minutes',
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
              activeColor: const Color(0xFF00BCD4),
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
                  color: const Color(0xFF00BCD4).withAlpha(26),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF00BCD4), size: 22),
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
