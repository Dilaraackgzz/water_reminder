import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/providers/theme_provider.dart';
import '../../../../../l10n/app_localizations.dart';
import '../settings_option_tile.dart';

class ThemeDialog extends ConsumerWidget {
  const ThemeDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (dialogContext) => const ThemeDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedMode = ref.watch(themeModeProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: isDark ? colorScheme.surfaceContainerHigh : Colors.white,
      title: Text(
        l10n.settings_theme_dialog_title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingsOptionTile(
            title: l10n.settings_theme_light_mode,
            subtitle: l10n.settings_theme_light_subtitle,
            isSelected: selectedMode == ThemeMode.light,
            isDark: isDark,
            primaryColor: primaryColor,
            onTap: () async {
              await ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.light);
              if (context.mounted) Navigator.pop(context);
            },
          ),
          SettingsOptionTile(
            title: l10n.settings_theme_dark_mode,
            subtitle: l10n.settings_theme_dark_subtitle,
            isSelected: selectedMode == ThemeMode.dark,
            isDark: isDark,
            primaryColor: primaryColor,
            onTap: () async {
              await ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.dark);
              if (context.mounted) Navigator.pop(context);
            },
          ),
          SettingsOptionTile(
            title: l10n.settings_theme_system_mode,
            subtitle: l10n.settings_theme_system_subtitle,
            isSelected: selectedMode == ThemeMode.system,
            isDark: isDark,
            primaryColor: primaryColor,
            onTap: () async {
              await ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.system);
              if (context.mounted) Navigator.pop(context);
            },
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
