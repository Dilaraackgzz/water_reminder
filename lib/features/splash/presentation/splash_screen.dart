import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
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
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
    );

    // Schedule navigation after the first frame to avoid setState during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimation();
    });
  }

  Future<void> _startAnimation() async {
    if (!mounted) return;

    // Get auth state and onboarding status immediately
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
    await Future.delayed(const Duration(milliseconds: 3000));

    if (!mounted) return;

    // First time user -> show onboarding
    context.go('/onboarding');
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white, // White background to match lottie
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),

            // Lottie Animation - Centered and Bigger
            Lottie.asset(
              'assets/animations/splash.json',
              width: 300,
              height: 300,
              fit: BoxFit.contain,
              controller: _animationController,
              onLoaded: (composition) {
                _animationController.duration = composition.duration;
                _animationController.forward();
              },
            ),

            const SizedBox(height: 40),

            // App Name below animation - beautiful font
            Text(
              'Aqualert',
              style: GoogleFonts.poppins(
                fontSize: 56,
                fontWeight: FontWeight.w700,
                color: AppTheme.primaryBlue,
                letterSpacing: -0.5,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 8),

            // Subtitle
            Text(
              'Stay Hydrated',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppTheme.primaryBlue.withAlpha(179),
                letterSpacing: 2.0,
              ),
            ),

            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}