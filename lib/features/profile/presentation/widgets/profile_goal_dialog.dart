import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../core/constants/ui_constants.dart';

/// Dialog for editing daily water goal
class ProfileGoalDialog extends StatelessWidget {
  final int currentGoal;
  final int calculatedGoal;
  final Future<void> Function(int goal) onSave;

  const ProfileGoalDialog({
    super.key,
    required this.currentGoal,
    required this.calculatedGoal,
    required this.onSave,
  });

  /// Shows the dialog
  static Future<bool?> show({
    required BuildContext context,
    required int currentGoal,
    required int calculatedGoal,
    required Future<void> Function(int goal) onSave,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ProfileGoalDialog(
        currentGoal: currentGoal,
        calculatedGoal: calculatedGoal,
        onSave: onSave,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final controller = TextEditingController(text: currentGoal.toString());

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      title: Text(
        l10n.profile_daily_goal,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: TextStyle(color: colorScheme.onSurface),
            decoration: InputDecoration(
              labelText: '${l10n.profile_daily_goal} (${l10n.unit_ml})',
              labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: UIConstants.spacingS),
          Text(
            '$calculatedGoal ${l10n.unit_ml}',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: colorScheme.outline,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.common_cancel, style: GoogleFonts.poppins()),
        ),
        TextButton(
          onPressed: () async {
            final goal = int.tryParse(controller.text) ?? currentGoal;
            await onSave(goal);
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
