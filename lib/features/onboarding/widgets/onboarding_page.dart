import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../presentation/onboarding_screen.dart';
import '../../../core/themes/app_theme.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageData data;

  const OnboardingPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;
    final isVerySmallScreen = size.height < 600;

    // Responsive sizing
    final iconContainerSize = isVerySmallScreen ? size.width * 0.3 : (isSmallScreen ? size.width * 0.35 : size.width * 0.4);
    final iconSize = iconContainerSize * 0.5;
    final titleFontSize = isVerySmallScreen ? 22.0 : (isSmallScreen ? 26.0 : 32.0);
    final subtitleFontSize = isVerySmallScreen ? 12.0 : (isSmallScreen ? 13.0 : 16.0);
    final descriptionFontSize = isVerySmallScreen ? 12.0 : (isSmallScreen ? 13.0 : 16.0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),

          // Animated icon with solid color background
          Container(
            width: iconContainerSize,
            height: iconContainerSize,
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlue.withAlpha(77),
                  blurRadius: isSmallScreen ? 20 : 30,
                  spreadRadius: isSmallScreen ? 3 : 5,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              data.icon,
              size: iconSize,
              color: Colors.white,
            ),
          ),

          SizedBox(height: isVerySmallScreen ? 16 : (isSmallScreen ? 24 : 32)),

          // Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              data.subtitle,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: subtitleFontSize,
                fontWeight: FontWeight.w500,
                color: AppTheme.primaryBlue,
                letterSpacing: 1.2,
              ),
            ),
          ),

          SizedBox(height: isVerySmallScreen ? 6 : (isSmallScreen ? 8 : 12)),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              data.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: titleFontSize,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E1E1E),
                height: 1.15,
              ),
            ),
          ),

          SizedBox(height: isVerySmallScreen ? 12 : (isSmallScreen ? 16 : 20)),

          // Description
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                data.description,
                textAlign: TextAlign.center,
                maxLines: isVerySmallScreen ? 3 : (isSmallScreen ? 4 : 5),
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: descriptionFontSize,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF757575),
                  height: 1.4,
                ),
              ),
            ),
          ),

          const Spacer(flex: 3),
        ],
      ),
    );
  }
}