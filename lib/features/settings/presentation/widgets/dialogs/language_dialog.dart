import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/providers/language_provider.dart';
import '../../../../../core/services/language_service.dart';
import '../../../../../l10n/app_localizations.dart';
import '../settings_option_tile.dart';

class LanguageDialog extends ConsumerWidget {
  const LanguageDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (dialogContext) => const LanguageDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedLocale = ref.watch(localeProvider);
    final localeNotifier = ref.read(localeProvider.notifier);
    final isUsingSystemLocale = localeNotifier.isUsingSystemLocale;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: isDark ? colorScheme.surfaceContainerHigh : Colors.white,
      title: Text(
        l10n.settings_language_dialog_title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // System Language Option
                SettingsOptionTile(
                  title: l10n.settings_system_language,
                  subtitle: l10n.settings_use_device_language,
                  isSelected: isUsingSystemLocale,
                  isDark: isDark,
                  primaryColor: primaryColor,
                  onTap: () async {
                    await ref.read(localeProvider.notifier).useSystemLocale();
                    if (context.mounted) Navigator.pop(context);
                  },
                ),
                Divider(
                  color: isDark ? Colors.grey[700] : Colors.grey[300],
                ),
                // Language list from LanguageService
                ...LanguageService.supportedLanguageCodes.map((code) => SettingsOptionTile(
                      title: LanguageService.getLanguageName(code),
                      subtitle: LanguageService.getNativeLanguageName(code),
                      isSelected: !isUsingSystemLocale &&
                          selectedLocale.languageCode == code,
                      isDark: isDark,
                      primaryColor: primaryColor,
                      onTap: () async {
                        await ref
                            .read(localeProvider.notifier)
                            .changeLocale(Locale(code));
                        if (context.mounted) Navigator.pop(context);
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
