import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/providers/theme_provider.dart';
import '../../../../../core/providers/premium_provider.dart';
import '../../../../../core/themes/app_theme.dart';
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

  static const _premiumVariants = [
    (PremiumThemeVariant.ocean, 'Ocean Blue'),
    (PremiumThemeVariant.sunset, 'Sunset Orange'),
    (PremiumThemeVariant.forest, 'Forest Green'),
    (PremiumThemeVariant.midnight, 'Midnight Purple'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedMode = ref.watch(themeModeProvider);
    final selectedVariant = ref.watch(premiumThemeVariantProvider);
    final isPremiumAsync = ref.watch(isPremiumProvider);
    final isPremium = isPremiumAsync.valueOrNull ?? false;
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
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 12),
            Divider(color: colorScheme.outline.withAlpha(60)),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Premium Renkler',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                ),
                const SizedBox(width: 6),
                if (!isPremium)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Premium',
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            // Standard (free) variant
            _ColorSwatchTile(
              label: 'Varsayılan (Teal)',
              color: AppTheme.waterAccent,
              isSelected: selectedVariant == PremiumThemeVariant.standard,
              isLocked: false,
              isDark: isDark,
              onTap: () async {
                await ref
                    .read(premiumThemeVariantProvider.notifier)
                    .setVariant(PremiumThemeVariant.standard);
                if (context.mounted) Navigator.pop(context);
              },
            ),
            ..._premiumVariants.map((entry) {
              final variant = entry.$1;
              final label = entry.$2;
              final color = AppTheme.seedColorFor(variant);
              return _ColorSwatchTile(
                label: label,
                color: color,
                isSelected: selectedVariant == variant,
                isLocked: !isPremium,
                isDark: isDark,
                onTap: () async {
                  if (!isPremium) {
                    Navigator.pop(context);
                    context.push('/paywall');
                    return;
                  }
                  await ref
                      .read(premiumThemeVariantProvider.notifier)
                      .setVariant(variant);
                  if (context.mounted) Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}

class _ColorSwatchTile extends StatelessWidget {
  final String label;
  final Color color;
  final bool isSelected;
  final bool isLocked;
  final bool isDark;
  final VoidCallback onTap;

  const _ColorSwatchTile({
    required this.label,
    required this.color,
    required this.isSelected,
    required this.isLocked,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color.withAlpha(30) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(color: color, width: 2)
              : Border.all(color: Colors.transparent),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark ? Colors.white24 : Colors.black12,
                  width: 1,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ),
            if (isLocked)
              Icon(Icons.lock_outline, size: 16, color: colorScheme.outline)
            else if (isSelected)
              Icon(Icons.check_circle_rounded, size: 18, color: color),
          ],
        ),
      ),
    );
  }
}
