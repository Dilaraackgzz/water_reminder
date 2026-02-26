import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../l10n/app_localizations.dart';

class ReminderStatusCard extends StatelessWidget {
  final bool isEnabled;
  final bool isDark;
  final AppLocalizations l10n;
  final Function(bool) onToggle;

  const ReminderStatusCard({
    super.key,
    required this.isEnabled,
    required this.isDark,
    required this.l10n,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final gradientColors = isDark
        ? (isEnabled
            ? [colorScheme.primaryContainer.withAlpha(100), colorScheme.primaryContainer.withAlpha(80)]
            : [Colors.grey[800]!, Colors.grey[900]!])
        : (isEnabled
            ? [colorScheme.primaryContainer.withAlpha(180), colorScheme.primaryContainer.withAlpha(140)]
            : [Colors.grey[100]!, Colors.grey[200]!]);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(isDark ? 26 : 13),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isEnabled
                  ? Theme.of(context).colorScheme.primary.withAlpha(51)
                  : Colors.grey.withAlpha(51),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isEnabled ? Icons.notifications_active : Icons.notifications_off,
              color: isEnabled ? Theme.of(context).colorScheme.primary : Colors.grey,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isEnabled ? l10n.reminders_active : l10n.reminders_title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isEnabled
                      ? l10n.notification_reminder_body
                      : l10n.settings_enable_notifications,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Semantics(
            label: isEnabled ? 'Disable reminders' : 'Enable reminders',
            child: Switch(
              value: isEnabled,
              onChanged: onToggle,
              activeThumbColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
