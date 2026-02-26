import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../domain/models/user_profile.dart';

/// Dialog for selecting gender
class ProfileGenderDialog extends StatelessWidget {
  final Gender currentGender;
  final Future<void> Function(Gender gender) onSelect;

  const ProfileGenderDialog({
    super.key,
    required this.currentGender,
    required this.onSelect,
  });

  /// Shows the dialog
  static Future<void> show({
    required BuildContext context,
    required Gender currentGender,
    required Future<void> Function(Gender gender) onSelect,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => ProfileGenderDialog(
        currentGender: currentGender,
        onSelect: onSelect,
      ),
    );
  }

  String _getGenderDisplayName(Gender gender, AppLocalizations l10n) {
    switch (gender) {
      case Gender.male:
        return l10n.gender_male;
      case Gender.female:
        return l10n.gender_female;
      case Gender.other:
        return l10n.gender_other;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      title: Text(
        l10n.profile_gender,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: Gender.values.map((gender) {
          return RadioListTile<Gender>(
            title: Text(
              _getGenderDisplayName(gender, l10n),
              style: GoogleFonts.poppins(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            value: gender,
            groupValue: currentGender,
            onChanged: (value) async {
              if (value != null) {
                await onSelect(value);
                if (context.mounted) Navigator.pop(context);
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
