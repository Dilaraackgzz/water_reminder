import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import '../../../../core/themes/app_theme.dart';

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Email verified successfully!',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );

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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Email verified successfully!',
                style: GoogleFonts.poppins(),
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );

          // Wait a bit before navigating
          await Future.delayed(const Duration(seconds: 1));
          if (mounted) {
            context.go('/home');
          }
        }
      } else {
        setState(() => _isManuallyChecking = false);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Email not verified yet. Please check your inbox.',
                style: GoogleFonts.poppins(),
              ),
              backgroundColor: Colors.orange,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    } catch (e) {
      setState(() => _isManuallyChecking = false);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to check verification status: $e',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<void> _resendVerificationEmail() async {
    if (!_canResendEmail) return;

    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Verification email sent! Please check your inbox.',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: AppTheme.primaryBlue,
            behavior: SnackBarBehavior.floating,
          ),
        );
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to send verification email: $e',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      if (mounted) {
        context.go('/login');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to sign out: $e',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.08),

                // Email Icon
                Container(
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

                const SizedBox(height: 32),

                // Title
                Text(
                  'Verify Your Email',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryBlue,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Subtitle
                Text(
                  'We sent a verification email to:',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 8),

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

                const SizedBox(height: 48),

                // Check Status Button
                SizedBox(
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
                      _isManuallyChecking ? 'Checking...' : 'I\'ve Verified',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Resend Email Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton.icon(
                    onPressed: _canResendEmail ? _resendVerificationEmail : null,
                    icon: const Icon(Icons.email_outlined),
                    label: Text(
                      _canResendEmail
                          ? 'Resend Email'
                          : 'Resend in ${_resendCountdown}s',
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
                            : Colors.grey.withAlpha(128),
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Help Text
                Text(
                  'Didn\'t receive the email? Check your spam folder.',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                // Sign Out Button
                TextButton(
                  onPressed: _signOut,
                  child: Text(
                    'Sign Out',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.red[400],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
