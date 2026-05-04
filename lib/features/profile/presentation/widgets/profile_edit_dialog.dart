import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';

/// A reusable text field dialog for editing profile fields
class ProfileEditDialog extends StatefulWidget {
  final String title;
  final String labelText;
  final String initialValue;
  final TextInputType keyboardType;
  final Future<bool> Function(String value) onSave;
  final String? Function(String value, AppLocalizations l10n)? validator;

  const ProfileEditDialog({
    super.key,
    required this.title,
    required this.labelText,
    required this.initialValue,
    this.keyboardType = TextInputType.text,
    required this.onSave,
    this.validator,
  });

  /// Shows the dialog and returns true if saved successfully
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String labelText,
    required String initialValue,
    TextInputType keyboardType = TextInputType.text,
    required Future<bool> Function(String value) onSave,
    String? Function(String value, AppLocalizations l10n)? validator,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ProfileEditDialog(
        title: title,
        labelText: labelText,
        initialValue: initialValue,
        keyboardType: keyboardType,
        onSave: onSave,
        validator: validator,
      ),
    );
  }

  @override
  State<ProfileEditDialog> createState() => _ProfileEditDialogState();
}

class _ProfileEditDialogState extends State<ProfileEditDialog> {
  late final TextEditingController _controller;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      title: Text(
        widget.title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      content: TextField(
        controller: _controller,
        keyboardType: widget.keyboardType,
        style: TextStyle(color: colorScheme.onSurface),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
          border: const OutlineInputBorder(),
          errorText: _errorText,
        ),
        onChanged: (_) {
          if (_errorText != null) {
            setState(() => _errorText = null);
          }
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.common_cancel, style: GoogleFonts.poppins()),
        ),
        TextButton(
          onPressed: () async {
            if (widget.validator != null) {
              final error = widget.validator!(_controller.text, l10n);
              if (error != null) {
                setState(() => _errorText = error);
                return;
              }
            }
            final success = await widget.onSave(_controller.text);
            if (context.mounted) {
              Navigator.pop(context, success);
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
