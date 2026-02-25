import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/utils/snackbar_helper.dart';
import '../providers/auth_controller.dart';
import '../widgets/auth_text_field.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleResetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    HapticFeedback.mediumImpact();
    setState(() => _isLoading = true);

    try {
      await ref
          .read(authControllerProvider.notifier)
          .resetPassword(_emailController.text.trim());

      if (mounted) {
        setState(() => _emailSent = true);
      }
    } catch (e) {
      if (mounted) {
        SnackBarHelper.showError(
          context,
          e.toString().replaceAll('Exception: ', ''),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Theme-aware colors
    final backgroundColor = isDark ? AppTheme.surfaceDark : Colors.white;
    final subtitleColor = isDark ? Colors.grey[400] : Colors.grey[600];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Semantics(
          label: l10n.auth_forgot_password_title,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: UIConstants.spacingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: size.height * 0.08),

                  // Back Button & Title
                  Row(
                    children: [
                      Semantics(
                        button: true,
                        label: l10n.common_back,
                        child: IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.arrow_back_ios),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      const SizedBox(width: UIConstants.spacingS),
                      Text(
                        l10n.auth_forgot_password_title,
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryBlue,
                        ),
                      ),
                    ],
                  ).animate().fadeIn().slideX(begin: -0.2, duration: 400.ms),

                  const SizedBox(height: UIConstants.spacingM),

                  if (!_emailSent) ...[
                    Text(
                      l10n.auth_forgot_password_instruction,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: subtitleColor,
                      ),
                    ).animate().fadeIn(delay: 200.ms),
                    const SizedBox(height: UIConstants.spacingXL + 8),
                    Semantics(
                      image: true,
                      label: l10n.auth_forgot_password_title,
                      child: Icon(
                        Icons.lock_reset_outlined,
                        size: 80,
                        color: AppTheme.primaryBlue.withAlpha(179),
                      ),
                    )
                        .animate()
                        .scale(duration: 600.ms, curve: Curves.easeOutBack)
                        .fadeIn(),
                    const SizedBox(height: UIConstants.spacingXL + 8),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AuthTextField(
                            controller: _emailController,
                            label: l10n.auth_email_label,
                            hint: l10n.auth_email_hint,
                            prefixIcon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            semanticLabel: l10n.auth_email_label,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return l10n.auth_validation_email_required;
                              }
                              if (!value.contains('@')) {
                                return l10n.auth_validation_email_invalid;
                              }
                              return null;
                            },
                          ).animate().fadeIn(delay: 400.ms).slideX(
                                begin: -0.2,
                                duration: 400.ms,
                              ),
                          const SizedBox(height: UIConstants.spacingXL),
                          Semantics(
                            button: true,
                            label: l10n.auth_forgot_password_button,
                            child: SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: _isLoading ? null : _handleResetPassword,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.primaryBlue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(UIConstants.radiusL),
                                  ),
                                  elevation: 0,
                                ),
                                child: _isLoading
                                    ? const SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        l10n.auth_forgot_password_button,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                            ),
                          ).animate().fadeIn(delay: 600.ms).scale(
                                begin: const Offset(0.8, 0.8),
                                duration: 400.ms,
                              ),
                        ],
                      ),
                    ),
                    ] else ...[
                    // Success State
                    Semantics(
                      image: true,
                      label: l10n.auth_forgot_password_success,
                      child: Icon(
                        Icons.mark_email_read_outlined,
                        size: 100,
                        color: AppTheme.successGreen,
                      ),
                    )
                        .animate()
                        .scale(duration: 600.ms, curve: Curves.easeOutBack)
                        .fadeIn(),
                    const SizedBox(height: UIConstants.spacingL),
                    Text(
                      l10n.auth_forgot_password_success,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryBlue,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(delay: 200.ms),
                    const SizedBox(height: UIConstants.spacingM),
                    Text(
                      l10n.auth_email_verification_instruction,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: subtitleColor,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(delay: 400.ms),
                    const SizedBox(height: UIConstants.spacingXL),
                    Semantics(
                      button: true,
                      label: l10n.auth_back_to_login,
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () => context.pop(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryBlue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(UIConstants.radiusL),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            l10n.auth_back_to_login,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ).animate().fadeIn(delay: 600.ms),
                  ],

                  const SizedBox(height: UIConstants.spacingL),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}