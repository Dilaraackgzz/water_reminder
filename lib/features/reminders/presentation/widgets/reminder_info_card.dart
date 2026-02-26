import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../l10n/app_localizations.dart';

class ReminderInfoCard extends StatelessWidget {
  final bool isDark;
  final AppLocalizations l10n;

  const ReminderInfoCard({
    super.key,
    required this.isDark,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark
            ? colorScheme.primaryContainer.withAlpha(50)
            : colorScheme.primaryContainer.withAlpha(100),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? colorScheme.primary.withAlpha(60)
              : colorScheme.primary.withAlpha(40),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: colorScheme.primary,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              l10n.reminders_info_message,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: isDark ? colorScheme.onSurface.withAlpha(200) : colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
