import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/services/reminder_service.dart';

class ScheduleInfoCard extends StatelessWidget {
  final ReminderService reminderService;
  final bool isDark;
  final AppLocalizations l10n;

  const ScheduleInfoCard({
    super.key,
    required this.reminderService,
    required this.isDark,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final startTime = reminderService.getReminderStartTime();
    final endTime = reminderService.getReminderEndTime();
    final interval = reminderService.getReminderInterval();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.schedule, color: Theme.of(context).colorScheme.primary, size: 24),
              const SizedBox(width: 12),
              Text(
                l10n.reminders_schedule_info,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _InfoRow(
            label: l10n.settings_reminder_start_time,
            value:
                '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}',
            isDark: isDark,
          ),
          const SizedBox(height: 8),
          _InfoRow(
            label: l10n.settings_reminder_end_time,
            value:
                '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}',
            isDark: isDark,
          ),
          const SizedBox(height: 8),
          _InfoRow(
            label: l10n.settings_reminder_interval,
            value: '$interval ${l10n.settings_minutes}',
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isDark;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: isDark ? Colors.white60 : Colors.black54,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
