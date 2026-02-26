import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/themes/app_theme.dart';
import '../../domain/models/user_streak.dart';
import '../providers/streak_providers.dart';

/// Widget displaying user's current streak and achievements
class StreakCard extends ConsumerWidget {
  final bool isCompact;

  const StreakCard({super.key, this.isCompact = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final streakAsync = ref.watch(userStreakProvider);

    return streakAsync.when(
      data: (streak) {
        if (streak == null) {
          return isCompact ? _CompactEmptyStreakCard(l10n: l10n) : _EmptyStreakCard(l10n: l10n);
        }
        return isCompact
            ? _CompactStreakContent(streak: streak, l10n: l10n)
            : _StreakContent(streak: streak, l10n: l10n);
      },
      loading: () => _LoadingStreakCard(isCompact: isCompact),
      error: (error, stack) => _ErrorStreakCard(isCompact: isCompact, l10n: l10n),
    );
  }
}

class _StreakContent extends StatelessWidget {
  final UserStreak streak;
  final AppLocalizations l10n;

  const _StreakContent({required this.streak, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Theme-aware colors
    final textColor = isDark ? Colors.white : Colors.black87;
    final subtitleColor = isDark ? Colors.grey[400] : Colors.grey[600];

    return Semantics(
      label: '${l10n.streak_current}: ${streak.currentStreak} ${streak.currentStreak == 1 ? l10n.streak_day_singular : l10n.streak_day_plural}',
      child: Container(
        padding: const EdgeInsets.all(UIConstants.spacingL),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: streak.currentStreak >= 7
                ? [AppTheme.streakGold.withAlpha(77), AppTheme.streakGold.withAlpha(128)]
                : [
                    colorScheme.primaryContainer.withAlpha(180),
                    colorScheme.primaryContainer.withAlpha(140),
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(UIConstants.radiusXL),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with emoji and title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      streak.streakEmoji,
                      style: const TextStyle(fontSize: 28),
                    ),
                    const SizedBox(width: UIConstants.spacingM),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.streak_current,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: subtitleColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '${streak.currentStreak}',
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                                height: 1.0,
                              ),
                            ),
                            const SizedBox(width: UIConstants.spacingXS),
                            Text(
                              streak.currentStreak == 1 ? l10n.streak_day_singular : l10n.streak_day_plural,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: subtitleColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // Personal best badge
                if (streak.isPersonalBest && streak.currentStreak > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: UIConstants.spacingS + 2,
                      vertical: UIConstants.spacingXS + 1,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.streakGold,
                      borderRadius: BorderRadius.circular(UIConstants.radiusM),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.emoji_events,
                          size: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(width: UIConstants.spacingXS),
                        Text(
                          l10n.streak_personal_best,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),

            const SizedBox(height: UIConstants.spacingM),

            // Motivational message
            Text(
              streak.streakMessage,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),

            const SizedBox(height: UIConstants.spacingM),

            // Stats row
            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    icon: Icons.military_tech,
                    label: l10n.streak_longest,
                    value: '${streak.longestStreak} ${streak.longestStreak == 1 ? l10n.streak_day_singular : l10n.streak_day_plural}',
                  ),
                ),
                const SizedBox(width: UIConstants.spacingM),
                Expanded(
                  child: _StatItem(
                    icon: Icons.trending_up,
                    label: l10n.streak_next_milestone,
                    value: '${streak.daysToNextMilestone} ${streak.daysToNextMilestone == 1 ? l10n.streak_day_singular : l10n.streak_day_plural}',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subtitleColor = isDark ? Colors.grey[400] : Colors.grey[600];
    final bgColor = isDark ? Colors.black.withAlpha(51) : Colors.white.withAlpha(179);

    return Container(
      padding: const EdgeInsets.all(UIConstants.spacingM),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(UIConstants.radiusM),
      ),
      child: Column(
        children: [
          Icon(icon, size: 18, color: subtitleColor),
          const SizedBox(height: UIConstants.spacingXS),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: subtitleColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyStreakCard extends StatelessWidget {
  final AppLocalizations l10n;

  const _EmptyStreakCard({required this.l10n});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subtitleColor = isDark ? Colors.grey[400] : Colors.grey[600];

    return Semantics(
      label: l10n.streak_start_today,
      child: Container(
        padding: const EdgeInsets.all(UIConstants.spacingL),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorScheme.primaryContainer.withAlpha(180),
              colorScheme.primaryContainer.withAlpha(140),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(UIConstants.radiusXL),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            const Text(
              '💧',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: UIConstants.spacingM),
            Text(
              l10n.streak_start_today,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: UIConstants.spacingS),
            Text(
              l10n.streak_complete_goal,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: subtitleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CompactStreakContent extends StatelessWidget {
  final UserStreak streak;
  final AppLocalizations l10n;

  const _CompactStreakContent({required this.streak, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subtitleColor = isDark ? Colors.grey[400] : Colors.grey[600];

    return Semantics(
      label: '${l10n.streak_current}: ${streak.currentStreak} ${streak.currentStreak == 1 ? l10n.streak_day_singular : l10n.streak_day_plural}',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: UIConstants.spacingL,
          horizontal: UIConstants.spacingM,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: streak.currentStreak >= 7
                ? [AppTheme.streakGold.withAlpha(77), AppTheme.streakGold.withAlpha(128)]
                : [
                    colorScheme.primaryContainer.withAlpha(180),
                    colorScheme.primaryContainer.withAlpha(140),
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(UIConstants.radiusL),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              streak.streakEmoji,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(width: UIConstants.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        '${streak.currentStreak}',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(width: UIConstants.spacingS - 2),
                      Text(
                        streak.currentStreak == 1 ? l10n.streak_day_singular : l10n.streak_day_plural,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: subtitleColor,
                        ),
                      ),
                      if (streak.isPersonalBest && streak.currentStreak > 0) ...[
                        const SizedBox(width: UIConstants.spacingS),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: UIConstants.spacingS,
                            vertical: UIConstants.spacingXS,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.streakGold,
                            borderRadius: BorderRadius.circular(UIConstants.radiusS),
                          ),
                          child: Text(
                            l10n.streak_best,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: UIConstants.spacingXS),
                  Text(
                    l10n.streak_current,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: subtitleColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CompactEmptyStreakCard extends StatelessWidget {
  final AppLocalizations l10n;

  const _CompactEmptyStreakCard({required this.l10n});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subtitleColor = isDark ? Colors.grey[400] : Colors.grey[600];

    return Semantics(
      label: l10n.streak_start,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: UIConstants.spacingL,
          horizontal: UIConstants.spacingM,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorScheme.primaryContainer.withAlpha(180),
              colorScheme.primaryContainer.withAlpha(140),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(UIConstants.radiusL),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const Text(
              '💧',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(width: UIConstants.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        '0',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(width: UIConstants.spacingS - 2),
                      Text(
                        l10n.streak_day_plural,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: subtitleColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: UIConstants.spacingXS),
                  Text(
                    l10n.streak_start,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: subtitleColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingStreakCard extends StatelessWidget {
  final bool isCompact;

  const _LoadingStreakCard({this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppTheme.surfaceDark : Colors.grey[100];

    return Container(
      padding: EdgeInsets.all(isCompact ? UIConstants.spacingM : UIConstants.spacingL),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(
          isCompact ? UIConstants.radiusM : UIConstants.radiusXL,
        ),
      ),
      child: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
          strokeWidth: isCompact ? 2 : 4,
        ),
      ),
    );
  }
}

class _ErrorStreakCard extends StatelessWidget {
  final bool isCompact;
  final AppLocalizations l10n;

  const _ErrorStreakCard({this.isCompact = false, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppTheme.errorRed.withAlpha(51) : Colors.red[50];
    final textColor = isDark ? Colors.red[300] : Colors.red[900];
    final iconColor = isDark ? Colors.red[400] : Colors.red[700];

    return Container(
      padding: EdgeInsets.all(isCompact ? UIConstants.spacingM : UIConstants.spacingL),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(
          isCompact ? UIConstants.radiusM : UIConstants.radiusXL,
        ),
      ),
      child: isCompact
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, color: iconColor, size: 20),
                const SizedBox(height: UIConstants.spacingXS),
                Text(
                  l10n.common_error,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: textColor,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Icon(Icons.error_outline, color: iconColor),
                const SizedBox(width: UIConstants.spacingM),
                Expanded(
                  child: Text(
                    l10n.streak_error,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
