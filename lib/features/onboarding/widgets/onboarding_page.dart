import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../domain/models/onboarding_page_data.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/themes/app_theme.dart';

class OnboardingPage extends StatefulWidget {
  final OnboardingPageData data;
  final bool isActive;

  const OnboardingPage({
    super.key,
    required this.data,
    this.isActive = true,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: UIConstants.slowAnimation,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: UIConstants.smoothCurve,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: UIConstants.defaultCurve,
      ),
    );

    if (widget.isActive) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(OnboardingPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      _animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizing = context.responsiveSizing;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Theme-aware colors
    final titleColor = isDark ? Colors.white : const Color(0xFF1E1E1E);
    final descriptionColor = isDark ? Colors.white70 : const Color(0xFF757575);

    return Semantics(
      label: '${widget.data.title}. ${widget.data.description}',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: UIConstants.spacingL),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                // Icon or Lottie animation
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: _buildIconOrLottie(sizing),
                  ),
                ),

                SizedBox(height: sizing.onboardingSpacingAfterIcon),

                // Title
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: UIConstants.spacingM,
                    ),
                    child: Text(
                      widget.data.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: sizing.onboardingTitleSize,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                        height: 1.15,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: sizing.onboardingSpacingAfterTitle),

                // Description
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: UIConstants.spacingL,
                      ),
                      child: Text(
                        widget.data.description,
                        textAlign: TextAlign.center,
                        maxLines: sizing.onboardingDescriptionMaxLines,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: sizing.onboardingDescriptionSize,
                          fontWeight: FontWeight.w400,
                          color: descriptionColor,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                ),

                const Spacer(flex: 3),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildIconOrLottie(ResponsiveSizing sizing) {
    // If Lottie asset is provided, use it
    if (widget.data.lottieAsset != null) {
      return SizedBox(
        width: sizing.onboardingIconContainerSize,
        height: sizing.onboardingIconContainerSize,
        child: Lottie.asset(
          widget.data.lottieAsset!,
          fit: BoxFit.contain,
        ),
      );
    }

    // Otherwise use icon with container
    return Container(
      width: sizing.onboardingIconContainerSize,
      height: sizing.onboardingIconContainerSize,
      decoration: BoxDecoration(
        color: AppTheme.primaryBlue,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withAlpha(77),
            blurRadius: sizing.shadowBlurRadius,
            spreadRadius: sizing.shadowSpreadRadius,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Icon(
        widget.data.icon,
        size: sizing.onboardingIconSize,
        color: Colors.white,
        semanticLabel: widget.data.title,
      ),
    );
  }
}
