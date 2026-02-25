import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/routing/app_router.dart';
import '../../../core/services/onboarding_service.dart';
import '../../../core/themes/app_theme.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigate();
    });
  }

  Future<void> _navigate() async {
    if (!mounted) return;

    final authState = ref.read(authStateProvider);
    final isOnboardingCompleted = ref.read(isOnboardingCompletedProvider);
    final isAuthenticated = authState.value != null;

    // If user is authenticated, skip animation and go directly to home
    if (isAuthenticated) {
      context.go('/home');
      return;
    }

    // If not authenticated but onboarding completed, skip animation and go to login
    if (isOnboardingCompleted) {
      context.go('/login');
      return;
    }

    // Only show animation for first-time users
    await Future.delayed(const Duration(milliseconds: 2500));

    if (!mounted) return;

    // First time user -> show onboarding
    context.go('/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final sizing = context.responsiveSizing;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.surfaceDark : Colors.white,
      body: Semantics(
        label: l10n.appName,
        child: SizedBox(
          width: sizing.screenSize.width,
          height: sizing.screenSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // Lottie Animation
              Semantics(
                excludeSemantics: true,
                child: Lottie.asset(
                  'assets/animations/splash.json',
                  width: sizing.splashAnimationSize,
                  height: sizing.splashAnimationSize,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: UIConstants.spacingXL),

              // App Name
              Text(
                l10n.appName,
                style: GoogleFonts.poppins(
                  fontSize: sizing.splashTitleSize,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryBlue,
                  letterSpacing: -0.5,
                  height: 1.2,
                ),
              ),

              SizedBox(height: UIConstants.spacingS),

              // Subtitle - Localized
              Text(
                l10n.appTagline,
                style: GoogleFonts.poppins(
                  fontSize: sizing.splashSubtitleSize,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.primaryBlue.withAlpha(179),
                  letterSpacing: 2.0,
                ),
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}