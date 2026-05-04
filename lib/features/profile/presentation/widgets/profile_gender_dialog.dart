import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../domain/models/user_profile.dart';

/// Dialog for selecting gender
class ProfileGenderDialog extends StatefulWidget {
  final Gender currentGender;
  final Future<bool> Function(Gender gender) onSelect;

  const ProfileGenderDialog({
    super.key,
    required this.currentGender,
    required this.onSelect,
  });

  /// Shows the dialog
  static Future<void> show({
    required BuildContext context,
    required Gender currentGender,
    required Future<bool> Function(Gender gender) onSelect,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => ProfileGenderDialog(
        currentGender: currentGender,
        onSelect: onSelect,
      ),
    );
  }

  @override
  State<ProfileGenderDialog> createState() => _ProfileGenderDialogState();
}

class _ProfileGenderDialogState extends State<ProfileGenderDialog> {
  late Gender _selectedGender;

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.currentGender;
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

  Future<void> _handleSave() async {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    final success = await widget.onSelect(_selectedGender);
    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success ? l10n.profile_save_success : l10n.profile_save_failed,
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: success ? colorScheme.primary : colorScheme.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
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
            groupValue: _selectedGender,
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedGender = value);
              }
            },
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.common_cancel, style: GoogleFonts.poppins()),
        ),
        TextButton(
          onPressed: _handleSave,
          child: Text(
            l10n.common_save,
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
