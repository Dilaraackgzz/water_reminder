import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsLoadingDialog extends StatelessWidget {
  final String message;
  final Color? indicatorColor;

  const SettingsLoadingDialog({
    super.key,
    required this.message,
    this.indicatorColor,
  });

  static Future<void> show(
    BuildContext context, {
    required String message,
    Color? indicatorColor,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => SettingsLoadingDialog(
        message: message,
        indicatorColor: indicatorColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isDark ? colorScheme.surfaceContainerHigh : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: indicatorColor ?? colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: GoogleFonts.poppins(
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
