import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/providers/unit_provider.dart';
import '../../../../../core/services/unit_service.dart';
import '../../../../../l10n/app_localizations.dart';
import '../settings_option_tile.dart';

class UnitDialog extends ConsumerWidget {
  const UnitDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (dialogContext) => const UnitDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedUnit = ref.watch(waterUnitProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: isDark ? colorScheme.surfaceContainerHigh : Colors.white,
      title: Text(
        l10n.settings_units,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingsOptionTile(
            title: l10n.settings_unit_ml,
            subtitle: l10n.settings_unit_metric,
            isSelected: selectedUnit == WaterUnit.milliliters,
            isDark: isDark,
            primaryColor: primaryColor,
            onTap: () async {
              await ref.read(waterUnitProvider.notifier).setWaterUnit(WaterUnit.milliliters);
              if (context.mounted) Navigator.pop(context);
            },
          ),
          SettingsOptionTile(
            title: l10n.settings_unit_floz,
            subtitle: l10n.settings_unit_imperial,
            isSelected: selectedUnit == WaterUnit.fluidOunces,
            isDark: isDark,
            primaryColor: primaryColor,
            onTap: () async {
              await ref.read(waterUnitProvider.notifier).setWaterUnit(WaterUnit.fluidOunces);
              if (context.mounted) Navigator.pop(context);
            },
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
