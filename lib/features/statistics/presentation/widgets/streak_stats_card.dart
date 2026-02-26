import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../home/domain/models/user_streak.dart';
import '../../../home/presentation/providers/streak_providers.dart';

/// Widget displaying streak statistics
class StreakStatsCard extends ConsumerWidget {
  const StreakStatsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streakAsync = ref.watch(userStreakProvider);

    return streakAsync.when(
      data: (streak) {
        if (streak == null) {
          return const SizedBox.shrink();
        }
        return _StreakStatsContent(streak: streak);
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class _StreakStatsContent extends StatelessWidget {
  final UserStreak streak;

  const _StreakStatsContent({required this.streak});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    final gradientColors = isDark
        ? (streak.currentStreak >= 7
            ? [
                Colors.amber.shade900.withAlpha(180),
                Colors.amber.shade800.withAlpha(180)
              ]
            : [
                colorScheme.primaryContainer.withAlpha(180),
                colorScheme.primaryContainer.withAlpha(140),
              ])
        : (streak.currentStreak >= 7
            ? [Colors.amber.shade100, Colors.amber.shade200]
            : [
                colorScheme.primaryContainer.withAlpha(180),
                colorScheme.primaryContainer.withAlpha(140),
              ]);

    return Container(
      padding: const EdgeInsets.all(UIConstants.cardPaddingL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(UIConstants.radiusXL),
        boxShadow: AppShadows.cardShadow(isDark: isDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Text(
                streak.streakEmoji,
                style: const TextStyle(fontSize: UIConstants.iconSizeXL),
              ),
              const SizedBox(width: UIConstants.cardPaddingS),
              Text(
                l10n.statistics_your_streak,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),

          const SizedBox(height: UIConstants.cardPaddingL),

          // Stats Grid
          Row(
            children: [
              Expanded(
                child: _StatBox(
                  icon: Icons.local_fire_department,
                  label: l10n.statistics_current,
                  value: '${streak.currentStreak}',
                  unit: l10n.statistics_days,
                  isHighlighted: streak.currentStreak > 0,
                  isDark: isDark,
                ),
              ),
              const SizedBox(width: UIConstants.cardPaddingS),
              Expanded(
                child: _StatBox(
                  icon: Icons.emoji_events,
                  label: l10n.statistics_best,
                  value: '${streak.longestStreak}',
                  unit: l10n.statistics_days,
                  isHighlighted: streak.isPersonalBest,
                  isDark: isDark,
                ),
              ),
            ],
          ),

          const SizedBox(height: UIConstants.cardPaddingS),

          Row(
            children: [
              Expanded(
                child: _StatBox(
                  icon: Icons.calendar_today,
                  label: l10n.statistics_completed,
                  value: '${streak.completedDates.length}',
                  unit: l10n.statistics_days,
                  isHighlighted: false,
                  isDark: isDark,
                ),
              ),
              const SizedBox(width: UIConstants.cardPaddingS),
              Expanded(
                child: _StatBox(
                  icon: Icons.trending_up,
                  label: l10n.statistics_next_goal,
                  value: '${streak.daysToNextMilestone}',
                  unit: l10n.statistics_days,
                  isHighlighted: false,
                  isDark: isDark,
                ),
              ),
            ],
          ),

          // Milestone indicator
          if (streak.isStreakMilestone()) ...[
            const SizedBox(height: UIConstants.cardPaddingM),
            Container(
              padding: const EdgeInsets.all(UIConstants.cardPaddingS),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(UIConstants.radiusM),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.celebration,
                    color: Colors.white,
                    size: UIConstants.iconSizeM,
                  ),
                  const SizedBox(width: UIConstants.spacingS),
                  Flexible(
                    child: Text(
                      streak.getMilestoneText(),
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String unit;
  final bool isHighlighted;
  final bool isDark;

  const _StatBox({
    required this.icon,
    required this.label,
    required this.value,
    required this.unit,
    required this.isHighlighted,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(UIConstants.cardPaddingM),
      decoration: BoxDecoration(
        color: isDark
            ? (isHighlighted
                ? Colors.grey[800]!.withAlpha(230)
                : Colors.grey[850]!.withAlpha(200))
            : (isHighlighted
                ? Colors.white.withAlpha(230)
                : Colors.white.withAlpha(179)),
        borderRadius: BorderRadius.circular(UIConstants.radiusL),
        border: isHighlighted ? Border.all(color: Colors.amber, width: 2) : null,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: UIConstants.iconSizeL,
            color: isHighlighted ? Colors.amber[700] : colorScheme.primary,
          ),
          const SizedBox(height: UIConstants.spacingS),
          Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              fontSize: 11,
              color: isDark ? Colors.white60 : Colors.black54,
            ),
          ),
          const SizedBox(height: UIConstants.spacingXS),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87,
                  height: 1.0,
                ),
              ),
              const SizedBox(width: UIConstants.spacingXS),
              Text(
                unit,
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 11,
                  color: isDark ? Colors.white60 : Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
