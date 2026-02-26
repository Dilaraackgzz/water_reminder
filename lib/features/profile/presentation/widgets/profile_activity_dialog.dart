import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../domain/models/user_profile.dart';

/// Dialog for selecting activity level
class ProfileActivityDialog extends StatelessWidget {
  final ActivityLevel currentLevel;
  final Future<void> Function(ActivityLevel level) onSelect;

  const ProfileActivityDialog({
    super.key,
    required this.currentLevel,
    required this.onSelect,
  });

  /// Shows the dialog
  static Future<void> show({
    required BuildContext context,
    required ActivityLevel currentLevel,
    required Future<void> Function(ActivityLevel level) onSelect,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => ProfileActivityDialog(
        currentLevel: currentLevel,
        onSelect: onSelect,
      ),
    );
  }

  String _getActivityLevelName(ActivityLevel level, AppLocalizations l10n) {
    switch (level) {
      case ActivityLevel.sedentary:
        return l10n.activity_sedentary;
      case ActivityLevel.light:
        return l10n.activity_light;
      case ActivityLevel.moderate:
        return l10n.activity_moderate;
      case ActivityLevel.active:
        return l10n.activity_very_active;
      case ActivityLevel.veryActive:
        return l10n.activity_extra_active;
    }
  }

  String _getActivityLevelDescription(ActivityLevel level, AppLocalizations l10n) {
    switch (level) {
      case ActivityLevel.sedentary:
        return l10n.activity_sedentary_desc;
      case ActivityLevel.light:
        return l10n.activity_light_desc;
      case ActivityLevel.moderate:
        return l10n.activity_moderate_desc;
      case ActivityLevel.active:
        return l10n.activity_very_active_desc;
      case ActivityLevel.veryActive:
        return l10n.activity_extra_active_desc;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      title: Text(
        l10n.profile_activity_level,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: ActivityLevel.values.map((level) {
            return RadioListTile<ActivityLevel>(
              title: Text(
                _getActivityLevelName(level, l10n),
                style: GoogleFonts.poppins(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              subtitle: Text(
                _getActivityLevelDescription(level, l10n),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: colorScheme.outline,
                ),
              ),
              value: level,
              groupValue: currentLevel,
              onChanged: (value) async {
                if (value != null) {
                  await onSelect(value);
                  if (context.mounted) Navigator.pop(context);
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
