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

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleEmailSignIn() async {
    if (!_formKey.currentState!.validate()) return;

    HapticFeedback.mediumImpact();
    setState(() => _isLoading = true);

    try {
      await ref.read(authControllerProvider.notifier).signInWithEmail(
            _emailController.text.trim(),
            _passwordController.text,
          );

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
    final sizing = context.responsiveSizing;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Theme-aware colors
    final backgroundColor = isDark ? AppTheme.surfaceDark : Colors.white;
    final subtitleColor = isDark ? Colors.grey[400] : Colors.grey[600];
    final dividerColor = isDark ? Colors.grey[700] : Colors.grey[300];

    // Responsive sizing
    final logoSize = sizing.isSmallScreen ? 70.0 : 90.0;
    final iconSize = sizing.isSmallScreen ? 35.0 : 45.0;
    final titleFontSize = sizing.isSmallScreen ? 26.0 : 30.0;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Semantics(
          label: l10n.auth_login_title,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: UIConstants.spacingL),
            child: Column(
              children: [
                // Logo & Title
                Flexible(
                  flex: sizing.isSmallScreen ? 2 : 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Semantics(
                        image: true,
                        label: l10n.appName,
                        child: Container(
                          width: logoSize,
                          height: logoSize,
                          decoration: BoxDecoration(
                            color: AppTheme.primaryBlue,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.primaryBlue.withAlpha(77),
                                blurRadius: 16,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.water_drop_rounded,
                            size: iconSize,
                            color: Colors.white,
                          ),
                        ),
                      )
                          .animate()
                          .scale(duration: 600.ms, curve: Curves.easeOutBack)
                          .fadeIn(),
                      SizedBox(height: sizing.isSmallScreen ? 12 : 16),
                      Text(
                        l10n.appName,
                        style: GoogleFonts.poppins(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryBlue,
                        ),
                      ).animate().fadeIn(delay: 200.ms).slideY(
                            begin: -0.2,
                            duration: 400.ms,
                          ),
                      if (!sizing.isSmallScreen) ...[
                        const SizedBox(height: 6),
                        Text(
                          l10n.appTagline,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: subtitleColor,
                          ),
                          textAlign: TextAlign.center,
                        ).animate().fadeIn(delay: 400.ms),
                      ],
                    ],
                  ),
                ),

                // Login Form
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      ).animate().fadeIn(delay: 600.ms).slideX(
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
                      ).animate().fadeIn(delay: 700.ms).slideX(
                            begin: -0.2,
                            duration: 400.ms,
                          ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Semantics(
                          button: true,
                          label: l10n.auth_forgot_password,
                          child: TextButton(
                            onPressed: () => context.push('/forgot-password'),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: UIConstants.spacingS,
                                vertical: UIConstants.spacingXS,
                              ),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              l10n.auth_forgot_password,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.primaryBlue,
                              ),
                            ),
                          ),
                        ),
                      ).animate().fadeIn(delay: 800.ms),
                      SizedBox(height: sizing.isSmallScreen ? 12 : 16),
                      Semantics(
                        button: true,
                        label: l10n.auth_sign_in_button,
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleEmailSignIn,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryBlue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  UIConstants.radiusL,
                                ),
                              ),
                              elevation: 0,
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    height: 22,
                                    width: 22,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    l10n.auth_sign_in_button,
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      ).animate().fadeIn(delay: 900.ms).scale(
                            begin: const Offset(0.8, 0.8),
                            duration: 400.ms,
                          ),
                    ],
                  ),
                ),

                SizedBox(height: sizing.isSmallScreen ? 16 : 24),

                // Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: dividerColor)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: UIConstants.spacingM,
                      ),
                      child: Text(
                        l10n.common_or,
                        style: GoogleFonts.poppins(
                          color: subtitleColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: dividerColor)),
                  ],
                ).animate().fadeIn(delay: 1000.ms),

                SizedBox(height: sizing.isSmallScreen ? 16 : 20),

                // Social Login
                SocialAuthButton(
                  onPressed: _isLoading ? null : _handleGoogleSignIn,
                  icon: 'assets/icons/google.png',
                  label: l10n.auth_sign_in_google,
                ).animate().fadeIn(delay: 1100.ms).slideY(
                      begin: 0.2,
                      duration: 400.ms,
                    ),

                // Sign Up Link
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          l10n.auth_dont_have_account,
                          style: GoogleFonts.poppins(
                            color: subtitleColor,
                            fontSize: 13,
                          ),
                        ),
                        Semantics(
                          button: true,
                          label: l10n.auth_sign_up_button,
                          child: TextButton(
                            onPressed: () => context.push('/register'),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: UIConstants.spacingXS,
                              ),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              l10n.auth_sign_up_button,
                              style: GoogleFonts.poppins(
                                color: AppTheme.primaryBlue,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 1200.ms),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
