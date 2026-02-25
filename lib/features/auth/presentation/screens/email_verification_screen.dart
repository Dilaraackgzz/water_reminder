import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/utils/snackbar_helper.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  ConsumerState<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  bool _isEmailVerified = false;
  bool _isManuallyChecking = false;
  bool _canResendEmail = true;
  Timer? _timer;
  Timer? _resendTimer;
  int _resendCountdown = 0;

  @override
  void initState() {
    super.initState();
    _isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;

    if (!_isEmailVerified) {
      // Check email verification status every 3 seconds (silently)
      _timer = Timer.periodic(const Duration(seconds: 3), (_) => _checkEmailVerifiedSilently());
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _resendTimer?.cancel();
    super.dispose();
  }

  /// Silent check for automatic verification (no loading state)
  Future<void> _checkEmailVerifiedSilently() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.reload();

      final isVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;

      if (isVerified && mounted) {
        setState(() => _isEmailVerified = true);
        _timer?.cancel();

        // Navigate to home after successful verification
        final l10n = AppLocalizations.of(context);
        if (l10n != null) {
          SnackBarHelper.showSuccess(context, l10n.auth_email_verification_success);
        }

        // Wait a bit before navigating
        await Future.delayed(const Duration(seconds: 1));
        if (mounted) {
          context.go('/home');
        }
      }
    } catch (e) {
      // Silent failure for automatic checks
    }
  }

  /// Manual check triggered by button (with loading state)
  Future<void> _checkEmailVerifiedManually() async {
    if (_isManuallyChecking) return;

    HapticFeedback.mediumImpact();
    setState(() => _isManuallyChecking = true);

    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.reload();

      final isVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;

      if (isVerified) {
        setState(() {
          _isEmailVerified = true;
          _isManuallyChecking = false;
        });
        _timer?.cancel();

        // Navigate to home after successful verification
        if (mounted) {
          final l10n = AppLocalizations.of(context);
          if (l10n != null) {
            SnackBarHelper.showSuccess(context, l10n.auth_email_verification_success);
          }

          // Wait a bit before navigating
          await Future.delayed(const Duration(seconds: 1));
          if (mounted) {
            context.go('/home');
          }
        }
      } else {
        setState(() => _isManuallyChecking = false);

        if (mounted) {
          final l10n = AppLocalizations.of(context);
          if (l10n != null) {
            SnackBarHelper.showWarning(context, l10n.auth_email_verification_failed);
          }
        }
      }
    } catch (e) {
      setState(() => _isManuallyChecking = false);

      if (mounted) {
        final l10n = AppLocalizations.of(context);
        if (l10n != null) {
          SnackBarHelper.showError(context, l10n.auth_verification_check_failed);
        }
      }
    }
  }

  Future<void> _resendVerificationEmail() async {
    if (!_canResendEmail) return;

    HapticFeedback.mediumImpact();

    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();

      if (mounted) {
        final l10n = AppLocalizations.of(context);
        if (l10n != null) {
          SnackBarHelper.showInfo(context, l10n.auth_email_verification_resend);
        }
      }

      // Start countdown for resend button (60 seconds)
      setState(() {
        _canResendEmail = false;
        _resendCountdown = 60;
      });

      _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _resendCountdown--;
          if (_resendCountdown == 0) {
            _canResendEmail = true;
            timer.cancel();
          }
        });
      });
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        if (l10n != null) {
          SnackBarHelper.showError(context, l10n.auth_verification_send_failed);
        }
      }
    }
  }

  Future<void> _signOut() async {
    HapticFeedback.mediumImpact();

    try {
      await FirebaseAuth.instance.signOut();
      if (mounted) {
        context.go('/login');
      }
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        if (l10n != null) {
          SnackBarHelper.showError(context, l10n.auth_signout_failed);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Theme-aware colors
    final backgroundColor = isDark ? AppTheme.surfaceDark : Colors.white;
    final subtitleColor = isDark ? Colors.grey[400] : Colors.grey[600];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Semantics(
          label: l10n.auth_email_verification_title,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: UIConstants.spacingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.08),

                  // Email Icon
                  Semantics(
                    image: true,
                    label: l10n.auth_email_verification_title,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryBlue.withAlpha(26),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.mark_email_unread_outlined,
                        size: 64,
                        color: AppTheme.primaryBlue,
                      ),
                    ),
                  ),

                  const SizedBox(height: UIConstants.spacingXL),

                  // Title
                  Text(
                    l10n.auth_email_verification_title,
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: UIConstants.spacingM),

                  // Subtitle
                  Text(
                    l10n.auth_email_verification_sent,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: subtitleColor,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: UIConstants.spacingS),

                  // Email Address
                  Text(
                    user?.email ?? '',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: UIConstants.spacingXXL),

                  // Check Status Button
                  Semantics(
                    button: true,
                    label: l10n.auth_email_verification_check,
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: _isManuallyChecking ? null : _checkEmailVerifiedManually,
                        icon: !_isManuallyChecking
                            ? const Icon(Icons.refresh)
                            : const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                        label: Text(
                          _isManuallyChecking ? l10n.common_loading : l10n.auth_email_verification_check,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryBlue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(UIConstants.radiusL),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: UIConstants.spacingM),

                  // Resend Email Button
                  Semantics(
                    button: true,
                    label: l10n.auth_email_verification_resend,
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton.icon(
                        onPressed: _canResendEmail ? _resendVerificationEmail : null,
                        icon: const Icon(Icons.email_outlined),
                        label: Text(
                          _canResendEmail
                              ? l10n.auth_email_verification_resend
                              : l10n.auth_resend_countdown(_resendCountdown),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.primaryBlue,
                          side: BorderSide(
                            color: _canResendEmail
                                ? AppTheme.primaryBlue
                                : (isDark ? Colors.grey[700]! : Colors.grey.withAlpha(128)),
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(UIConstants.radiusL),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: UIConstants.spacingL),

                  // Help Text
                  Text(
                    l10n.auth_email_verification_not_received,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: subtitleColor,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: UIConstants.spacingXL),

                  // Sign Out Button
                  Semantics(
                    button: true,
                    label: l10n.auth_logout,
                    child: TextButton(
                      onPressed: _signOut,
                      child: Text(
                        l10n.auth_logout,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppTheme.errorRed,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

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
