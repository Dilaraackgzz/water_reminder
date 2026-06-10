import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../../../l10n/app_localizations.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: isDark ? colorScheme.surface : Colors.grey[50],
      appBar: ModernAppBar(
        title: l10n.help_privacy_policy,
        subtitle: l10n.help_privacy_policy_desc,
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                context,
                isDark: isDark,
                title: l10n.privacy_last_updated,
                content: l10n.privacy_intro_content,
                isIntro: true,
              ),
              _buildSection(
                context,
                isDark: isDark,
                title: l10n.privacy_collect_title,
                content: l10n.privacy_collect_content,
              ),
              _buildSection(
                context,
                isDark: isDark,
                title: l10n.privacy_use_title,
                content: l10n.privacy_use_content,
              ),
              _buildSection(
                context,
                isDark: isDark,
                title: l10n.privacy_storage_title,
                content: l10n.privacy_storage_content,
              ),
              _buildSection(
                context,
                isDark: isDark,
                title: l10n.privacy_third_party_title,
                content: l10n.privacy_third_party_content,
              ),
              _buildSection(
                context,
                isDark: isDark,
                title: l10n.privacy_rights_title,
                content: l10n.privacy_rights_content,
              ),
              _buildSection(
                context,
                isDark: isDark,
                title: l10n.privacy_children_title,
                content: l10n.privacy_children_content,
              ),
              _buildSection(
                context,
                isDark: isDark,
                title: l10n.privacy_gdpr_title,
                content: l10n.privacy_gdpr_content,
              ),
              _buildSection(
                context,
                isDark: isDark,
                title: l10n.privacy_kvkk_title,
                content: l10n.privacy_kvkk_content,
              ),
              _buildSection(
                context,
                isDark: isDark,
                title: l10n.privacy_contact_title,
                content: l10n.privacy_contact_content,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required bool isDark,
    required String title,
    required String content,
    bool isIntro = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: isIntro ? 13 : 15,
              fontWeight: isIntro ? FontWeight.w500 : FontWeight.w600,
              color: isIntro
                  ? (isDark ? Colors.white60 : Colors.black54)
                  : (isDark ? Colors.white : Colors.black87),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.poppins(
              fontSize: 14,
              height: 1.6,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
