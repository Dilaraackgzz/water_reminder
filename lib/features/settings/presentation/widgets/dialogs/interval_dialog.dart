import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/providers/app_providers.dart';
import '../../../../../l10n/app_localizations.dart';
import '../settings_option_tile.dart';

class IntervalDialog extends ConsumerWidget {
  const IntervalDialog({super.key});

  static const List<int> _intervals = [30, 45, 60, 90, 120, 180];

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (dialogContext) => const IntervalDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final reminderService = ref.watch(reminderServiceProvider);
    final currentInterval = reminderService.getReminderInterval();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: isDark ? colorScheme.surfaceContainerHigh : Colors.white,
      title: Text(
        l10n.settings_reminder_interval_title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _intervals.map((interval) {
            return SettingsOptionTile(
              title: '$interval ${l10n.settings_minutes}',
              subtitle: '',
              isSelected: currentInterval == interval,
              isDark: isDark,
              primaryColor: primaryColor,
              onTap: () async {
                await reminderService.setReminderInterval(interval);
                ref.invalidate(reminderServiceProvider);
                if (context.mounted) Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
