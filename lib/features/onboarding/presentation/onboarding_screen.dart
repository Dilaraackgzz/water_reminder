import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/services/onboarding_service.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<OnboardingPageData> _getPages(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      OnboardingPageData(
        title: l10n.onboarding_title_1,
        description: l10n.onboarding_desc_1,
        icon: Icons.water_drop,
        gradient: [
          AppTheme.primaryBlue,
          AppTheme.primaryBlue,
        ],
      ),
      OnboardingPageData(
        title: l10n.onboarding_title_2,
        description: l10n.onboarding_desc_2,
        icon: Icons.notifications_active,
        gradient: [
          AppTheme.primaryBlue,
          AppTheme.primaryBlue,
        ],
      ),
      OnboardingPageData(
        title: l10n.onboarding_title_3,
        description: l10n.onboarding_desc_3,
        icon: Icons.insights,
        gradient: [
          AppTheme.primaryBlue,
          AppTheme.primaryBlue,
        ],
      ),
      OnboardingPageData(
        title: l10n.onboarding_title_4,
        description: l10n.onboarding_desc_4,
        icon: Icons.emoji_events,
        gradient: [
          AppTheme.primaryBlue,
          AppTheme.primaryBlue,
        ],
      ),
    ];
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Future<void> _nextPage() async {
    final pages = _getPages(context);
    if (_currentPage < pages.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // Mark onboarding as completed
      final onboardingService = ref.read(onboardingServiceProvider);
      await onboardingService.completeOnboarding();

      // Navigate to login
      if (mounted) {
        context.go('/login');
      }
    }
  }

  Future<void> _skip() async {
    // Mark onboarding as completed even when skipped
    final onboardingService = ref.read(onboardingServiceProvider);
    await onboardingService.completeOnboarding();

    // Navigate to login
    if (mounted) {
      context.go('/login');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final pages = _getPages(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: _skip,
                  child: Text(
                    l10n.common_skip,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                ),
              ),
            ),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(data: pages[index]);
                },
              ),
            ),

            // Page indicator
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => _buildDot(index),
                ),
              ),
            ),

            // Next/Get Started button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryBlue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    _currentPage == pages.length - 1
                        ? l10n.onboarding_get_started
                        : l10n.common_next,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    final isActive = index == _currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppTheme.primaryBlue : AppTheme.primaryBlue.withAlpha(77),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingPageData {
  final String title;
  final String description;
  final IconData icon;
  final List<Color> gradient;

  OnboardingPageData({
    required this.title,
    required this.description,
    required this.icon,
    required this.gradient,
  });
}