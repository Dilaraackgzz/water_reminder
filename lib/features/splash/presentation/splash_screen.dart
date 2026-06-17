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

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _lottieController;

  @override
  void initState() {
    super.initState();
    _lottieController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  void _onAnimationLoaded(LottieComposition composition) {
    _lottieController
      ..duration = composition.duration
      ..forward().whenComplete(_navigateAfterAnimation);
  }

  Future<void> _navigateAfterAnimation() async {
    if (!mounted) return;

    // Auth state henüz hazır değilse (Firebase yavaş başladıysa) bekle
    final authStateAsync = ref.read(authStateProvider);
    final user = authStateAsync.hasValue
        ? authStateAsync.value
        : await ref
            .read(authStateProvider.future)
            .timeout(const Duration(seconds: 5), onTimeout: () => null);

    if (!mounted) return;

    final isOnboardingCompleted = ref.read(isOnboardingCompletedProvider);
    final isAuthenticated = user != null;
    final isEmailVerified = user?.emailVerified ?? false;

    if (isAuthenticated && isEmailVerified) {
      context.go('/home');
    } else if (isAuthenticated && !isEmailVerified) {
      context.go('/verify-email');
    } else if (isOnboardingCompleted) {
      context.go('/login');
    } else {
      context.go('/onboarding');
    }
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
                  controller: _lottieController,
                  width: sizing.splashAnimationSize,
                  height: sizing.splashAnimationSize,
                  fit: BoxFit.contain,
                  onLoaded: _onAnimationLoaded,
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