import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/services/onboarding_service.dart';
import '../domain/models/onboarding_page_data.dart';
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
      ),
      OnboardingPageData(
        title: l10n.onboarding_title_2,
        description: l10n.onboarding_desc_2,
        icon: Icons.notifications_active,
      ),
      OnboardingPageData(
        title: l10n.onboarding_title_3,
        description: l10n.onboarding_desc_3,
        icon: Icons.insights,
      ),
      OnboardingPageData(
        title: l10n.onboarding_title_4,
        description: l10n.onboarding_desc_4,
        icon: Icons.emoji_events,
      ),
    ];
  }

  void _onPageChanged(int page) {
    // Haptic feedback on page change
    HapticFeedback.selectionClick();
    setState(() {
      _currentPage = page;
    });
  }

  Future<void> _nextPage() async {
    final pages = _getPages(context);
    if (_currentPage < pages.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: UIConstants.pageTransition,
        curve: UIConstants.defaultCurve,
      );
    } else {
      await _completeOnboarding();
    }
  }

  Future<void> _skip() async {
    await _completeOnboarding();
  }

  Future<void> _completeOnboarding() async {
    // Haptic feedback
    HapticFeedback.mediumImpact();

    // Mark onboarding as completed
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.surfaceDark : Colors.white,
      body: SafeArea(
        child: Semantics(
          label: 'Onboarding screen. Page ${_currentPage + 1} of ${pages.length}',
          child: Column(
            children: [
              // Skip button
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(UIConstants.spacingM),
                  child: Semantics(
                    button: true,
                    label: 'Skip onboarding',
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
              ),

              // PageView with animations
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      data: pages[index],
                      isActive: index == _currentPage,
                    );
                  },
                ),
              ),

              // Page indicator with accessibility
              Semantics(
                label: 'Page ${_currentPage + 1} of ${pages.length}',
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: UIConstants.spacingL,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) => _buildDot(index),
                    ),
                  ),
                ),
              ),

              // Next/Get Started button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UIConstants.spacingL,
                  vertical: UIConstants.spacingXL,
                ),
                child: Semantics(
                  button: true,
                  label: _currentPage == pages.length - 1
                      ? 'Get started button'
                      : 'Next page button',
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
                          borderRadius: BorderRadius.circular(
                            UIConstants.radiusL,
                          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    final isActive = index == _currentPage;
    return AnimatedContainer(
      duration: UIConstants.normalAnimation,
      margin: const EdgeInsets.symmetric(horizontal: UIConstants.spacingXS),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? AppTheme.primaryBlue
            : AppTheme.primaryBlue.withAlpha(77),
        borderRadius: BorderRadius.circular(UIConstants.spacingXS),
      ),
    );
  }
}
