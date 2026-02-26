import 'package:flutter/material.dart';

/// UI Constants for responsive sizing across the app
class UIConstants {
  UIConstants._();

  // Screen breakpoints
  static const double smallScreenHeight = 600;
  static const double mediumScreenHeight = 700;
  static const double largeScreenHeight = 800;

  static const double smallScreenWidth = 360;
  static const double mediumScreenWidth = 400;
  static const double largeScreenWidth = 600;

  // Animation durations
  static const Duration fastAnimation = Duration(milliseconds: 200);
  static const Duration normalAnimation = Duration(milliseconds: 300);
  static const Duration slowAnimation = Duration(milliseconds: 500);
  static const Duration pageTransition = Duration(milliseconds: 400);
  static const Duration progressAnimation = Duration(milliseconds: 800);
  static const Duration progressWaveAnimation = Duration(milliseconds: 1200);
  static const Duration waveLoopAnimation = Duration(seconds: 3);

  // Animation curves
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve bounceCurve = Curves.elasticOut;
  static const Curve smoothCurve = Curves.easeOutCubic;

  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  // Border radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusRound = 100.0;

  // Card padding
  static const double cardPaddingS = 12.0;
  static const double cardPaddingM = 16.0;
  static const double cardPaddingL = 20.0;

  // Chart
  static const double chartHeightSmall = 160.0;
  static const double chartHeightMedium = 200.0;
  static const double chartHeightLarge = 240.0;
  static const double chartBarWidth = 16.0;

  // Icon sizes
  static const double iconSizeS = 16.0;
  static const double iconSizeM = 20.0;
  static const double iconSizeL = 24.0;
  static const double iconSizeXL = 32.0;

  // Shadow
  static const double shadowBlurS = 4.0;
  static const double shadowBlurM = 8.0;
  static const double shadowBlurL = 12.0;
  static const double shadowOffsetY = 2.0;
}

/// Common shadow styles
class AppShadows {
  AppShadows._();

  static List<BoxShadow> cardShadow({bool isDark = false}) {
    return [
      BoxShadow(
        color: Colors.black.withAlpha(isDark ? 26 : 13),
        blurRadius: UIConstants.shadowBlurM,
        offset: const Offset(0, UIConstants.shadowOffsetY),
      ),
    ];
  }

  static List<BoxShadow> elevatedShadow({bool isDark = false}) {
    return [
      BoxShadow(
        color: Colors.black.withAlpha(isDark ? 38 : 20),
        blurRadius: UIConstants.shadowBlurL,
        offset: const Offset(0, 4),
      ),
    ];
  }
}

/// Responsive sizing helper for splash and onboarding screens
class ResponsiveSizing {
  final Size screenSize;
  final bool isSmallScreen;
  final bool isVerySmallScreen;
  final bool isLargeScreen;

  ResponsiveSizing(this.screenSize)
      : isVerySmallScreen = screenSize.height < UIConstants.smallScreenHeight,
        isSmallScreen = screenSize.height < UIConstants.mediumScreenHeight,
        isLargeScreen = screenSize.height >= UIConstants.largeScreenHeight;

  // Splash screen sizing
  double get splashAnimationSize => screenSize.width * 0.65;

  double get splashTitleSize => (screenSize.width * 0.12).clamp(40.0, 56.0);

  double get splashSubtitleSize => (screenSize.width * 0.04).clamp(14.0, 18.0);

  // Onboarding sizing
  double get onboardingIconContainerSize {
    if (isVerySmallScreen) return screenSize.width * 0.3;
    if (isSmallScreen) return screenSize.width * 0.35;
    return screenSize.width * 0.4;
  }

  double get onboardingIconSize => onboardingIconContainerSize * 0.5;

  double get onboardingTitleSize {
    if (isVerySmallScreen) return 22.0;
    if (isSmallScreen) return 26.0;
    return 32.0;
  }

  double get onboardingDescriptionSize {
    if (isVerySmallScreen) return 12.0;
    if (isSmallScreen) return 13.0;
    return 16.0;
  }

  double get onboardingSpacingAfterIcon {
    if (isVerySmallScreen) return 16.0;
    if (isSmallScreen) return 24.0;
    return 32.0;
  }

  double get onboardingSpacingAfterTitle {
    if (isVerySmallScreen) return 12.0;
    if (isSmallScreen) return 16.0;
    return 20.0;
  }

  int get onboardingDescriptionMaxLines {
    if (isVerySmallScreen) return 3;
    if (isSmallScreen) return 4;
    return 5;
  }

  // Shadow sizing
  double get shadowBlurRadius => isSmallScreen ? 20.0 : 30.0;
  double get shadowSpreadRadius => isSmallScreen ? 3.0 : 5.0;
}

/// Extension to easily get ResponsiveSizing from BuildContext
extension ResponsiveSizingExtension on BuildContext {
  ResponsiveSizing get responsiveSizing {
    return ResponsiveSizing(MediaQuery.of(this).size);
  }
}
