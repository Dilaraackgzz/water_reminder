import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

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

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    // Wait for lottie animation to complete
    await Future.delayed(const Duration(milliseconds: 3000));

    // Navigate to onboarding or home based on app state
    if (mounted) {
      context.go('/onboarding');
    }
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
                color: const Color(0xFF00BCD4), // Cyan color to match animation
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
                color: const Color(0xFF00BCD4).withAlpha(179), // 0.7 * 255 = 179
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