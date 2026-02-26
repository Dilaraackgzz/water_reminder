import 'package:flutter/material.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../domain/models/water_statistics.dart';

class StatsSummaryCards extends StatelessWidget {
  final WaterStatistics statistics;

  const StatsSummaryCards({super.key, required this.statistics});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.water_drop,
                iconColor: Theme.of(context).colorScheme.primary,
                title: l10n.statistics_total_intake,
                value: '${statistics.totalIntake}${l10n.unit_ml}',
                subtitle: l10n.statistics_total_consumed,
                isDark: isDark,
              ),
            ),
            const SizedBox(width: UIConstants.cardPaddingS),
            Expanded(
              child: _StatCard(
                icon: Icons.show_chart,
                iconColor: Colors.green,
                title: l10n.statistics_average,
                value: '${statistics.averageIntake.toInt()}${l10n.unit_ml}',
                subtitle: l10n.statistics_daily_average,
                isDark: isDark,
              ),
            ),
          ],
        ),
        const SizedBox(height: UIConstants.cardPaddingS),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.check_circle,
                iconColor: Colors.amber,
                title: l10n.statistics_goals_met,
                value: '${statistics.daysGoalAchieved}',
                subtitle: l10n.statistics_out_of(statistics.daysTracked),
                isDark: isDark,
              ),
            ),
            const SizedBox(width: UIConstants.cardPaddingS),
            Expanded(
              child: _StatCard(
                icon: Icons.trending_up,
                iconColor: Colors.purple,
                title: l10n.statistics_progress,
                value: '${statistics.achievementPercentage.toInt()}%',
                subtitle: statistics.isOnTrack
                    ? l10n.statistics_on_track
                    : l10n.statistics_keep_going,
                isDark: isDark,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final String subtitle;
  final bool isDark;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(UIConstants.cardPaddingM),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(UIConstants.radiusL),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
        boxShadow: AppShadows.cardShadow(isDark: isDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(UIConstants.spacingS),
            decoration: BoxDecoration(
              color: iconColor.withAlpha(isDark ? 51 : 26),
              borderRadius: BorderRadius.circular(UIConstants.radiusS),
            ),
            child: Icon(icon, color: iconColor, size: UIConstants.iconSizeM),
          ),
          const SizedBox(height: UIConstants.cardPaddingS),
          Text(
            title,
            style: textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white60 : Colors.black54,
            ),
          ),
          const SizedBox(height: UIConstants.spacingXS),
          Text(
            value,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : colorScheme.onSurface,
            ),
          ),
          Text(
            subtitle,
            style: textTheme.bodySmall?.copyWith(
              fontSize: 10,
              color: isDark ? Colors.white54 : Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
