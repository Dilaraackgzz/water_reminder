import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/utils/snackbar_helper.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/auth_controller.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/social_auth_button.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    final l10n = AppLocalizations.of(context)!;
    if (_passwordController.text != _confirmPasswordController.text) {
      SnackBarHelper.showError(context, l10n.auth_validation_password_mismatch);
      return;
    }

    HapticFeedback.mediumImpact();
    setState(() => _isLoading = true);

    try {
      await ref.read(authControllerProvider.notifier).registerWithEmail(
            _emailController.text.trim(),
            _passwordController.text,
            _nameController.text.trim(),
          );

      if (mounted) {
        // Router will automatically redirect to /verify-email
        context.go('/verify-email');
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

  Future<void> _handleGoogleSignIn() async {
    HapticFeedback.mediumImpact();
    setState(() => _isLoading = true);

    try {
      await ref.read(authControllerProvider.notifier).signInWithGoogle();

      if (mounted) {
        context.go('/home');
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
    final dividerColor = isDark ? Colors.grey[700] : Colors.grey[300];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Semantics(
          label: l10n.auth_register_title,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: UIConstants.spacingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: size.height * 0.05),

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
                        l10n.auth_register_title,
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryBlue,
                        ),
                      ),
                    ],
                  ).animate().fadeIn().slideX(begin: -0.2, duration: 400.ms),

                  const SizedBox(height: UIConstants.spacingS),

                  Text(
                    l10n.appTagline,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: subtitleColor,
                    ),
                  ).animate().fadeIn(delay: 200.ms),

                  SizedBox(height: size.height * 0.04),

                // Registration Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthTextField(
                        controller: _nameController,
                        label: l10n.auth_name_label,
                        hint: '',
                        prefixIcon: Icons.person_outline,
                        keyboardType: TextInputType.name,
                        semanticLabel: l10n.auth_name_label,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.auth_validation_name_required;
                          }
                          if (value.length < 2) {
                            return l10n.auth_validation_name_min_length;
                          }
                          return null;
                        },
                      ).animate().fadeIn(delay: 300.ms).slideX(
                            begin: -0.2,
                            duration: 400.ms,
                          ),
                      const SizedBox(height: UIConstants.spacingM),
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
                      const SizedBox(height: UIConstants.spacingM),
                      AuthTextField(
                        controller: _passwordController,
                        label: l10n.auth_password_label,
                        hint: l10n.auth_password_hint,
                        prefixIcon: Icons.lock_outline,
                        obscureText: _obscurePassword,
                        semanticLabel: l10n.auth_password_label,
                        suffixIcon: Semantics(
                          button: true,
                          label: _obscurePassword ? 'Show password' : 'Hide password',
                          child: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.auth_validation_password_required;
                          }
                          if (value.length < 6) {
                            return l10n.auth_validation_password_min_length;
                          }
                          return null;
                        },
                      ).animate().fadeIn(delay: 500.ms).slideX(
                            begin: -0.2,
                            duration: 400.ms,
                          ),
                      const SizedBox(height: UIConstants.spacingM),
                      AuthTextField(
                        controller: _confirmPasswordController,
                        label: l10n.auth_confirm_password_label,
                        hint: l10n.auth_confirm_password_hint,
                        prefixIcon: Icons.lock_outline,
                        obscureText: _obscureConfirmPassword,
                        semanticLabel: l10n.auth_confirm_password_label,
                        suffixIcon: Semantics(
                          button: true,
                          label: _obscureConfirmPassword ? 'Show password' : 'Hide password',
                          child: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword = !_obscureConfirmPassword;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.auth_validation_password_required;
                          }
                          if (value != _passwordController.text) {
                            return l10n.auth_validation_password_mismatch;
                          }
                          return null;
                        },
                      ).animate().fadeIn(delay: 700.ms).slideX(
                            begin: -0.2,
                            duration: 400.ms,
                          ),
                      const SizedBox(height: UIConstants.spacingXL),
                      Semantics(
                        button: true,
                        label: l10n.auth_sign_up_button,
                        child: SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleRegister,
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
                                    l10n.auth_sign_up_button,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      ).animate().fadeIn(delay: 800.ms).scale(
                            begin: const Offset(0.8, 0.8),
                            duration: 400.ms,
                          ),
                    ],
                  ),
                ),

                const SizedBox(height: UIConstants.spacingXL),

                // Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: dividerColor)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: UIConstants.spacingM),
                      child: Text(
                        l10n.common_or,
                        style: GoogleFonts.poppins(
                          color: subtitleColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: dividerColor)),
                  ],
                ).animate().fadeIn(delay: 800.ms),

                const SizedBox(height: UIConstants.spacingL),

                // Social Registration
                SocialAuthButton(
                  onPressed: _isLoading ? null : _handleGoogleSignIn,
                  icon: 'assets/icons/google.png',
                  label: l10n.auth_sign_up_google,
                ).animate().fadeIn(delay: 900.ms).slideY(
                      begin: 0.2,
                      duration: 400.ms,
                    ),

                const SizedBox(height: UIConstants.spacingL),

                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.auth_already_have_account,
                      style: GoogleFonts.poppins(
                        color: subtitleColor,
                        fontSize: 14,
                      ),
                    ),
                    Semantics(
                      button: true,
                      label: l10n.auth_sign_in_button,
                      child: TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text(
                          l10n.auth_sign_in_button,
                          style: GoogleFonts.poppins(
                            color: AppTheme.primaryBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: 1000.ms),

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