import 'package:flutter/material.dart';

/// Model for onboarding page content
class OnboardingPageData {
  final String title;
  final String description;
  final IconData icon;
  final String? lottieAsset;

  const OnboardingPageData({
    required this.title,
    required this.description,
    required this.icon,
    this.lottieAsset,
  });
}
