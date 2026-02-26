import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';

/// A reusable text field dialog for editing profile fields
class ProfileEditDialog extends StatelessWidget {
  final String title;
  final String labelText;
  final String initialValue;
  final TextInputType keyboardType;
  final Future<void> Function(String value) onSave;

  const ProfileEditDialog({
    super.key,
    required this.title,
    required this.labelText,
    required this.initialValue,
    this.keyboardType = TextInputType.text,
    required this.onSave,
  });

  /// Shows the dialog and returns true if saved successfully
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String labelText,
    required String initialValue,
    TextInputType keyboardType = TextInputType.text,
    required Future<void> Function(String value) onSave,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ProfileEditDialog(
        title: title,
        labelText: labelText,
        initialValue: initialValue,
        keyboardType: keyboardType,
        onSave: onSave,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final controller = TextEditingController(text: initialValue);

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      content: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(color: colorScheme.onSurface),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
          border: const OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.common_cancel, style: GoogleFonts.poppins()),
        ),
        TextButton(
          onPressed: () async {
            await onSave(controller.text);
            if (context.mounted) Navigator.pop(context, true);
          },
          child: Text(
            l10n.common_save,
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
