import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/providers/premium_provider.dart';
import '../../domain/models/water_statistics.dart';
import '../providers/statistics_providers.dart';
import '../widgets/statistics_chart.dart';
import '../widgets/stats_summary_cards.dart';
import '../widgets/streak_stats_card.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedPeriod = ref.watch(selectedPeriodProvider);
    final statisticsAsync = ref.watch(currentStatisticsProvider);
    final isPremiumAsync = ref.watch(isPremiumProvider);
    final isPremium = isPremiumAsync.valueOrNull ?? false;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: isDark ? colorScheme.surface : Colors.grey[50],
      appBar: ModernAppBar(
        title: l10n.statistics_title,
        subtitle: isPremium ? _getSubtitle(selectedPeriod, l10n) : null,
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: isPremium
            ? RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(currentStatisticsProvider);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(UIConstants.cardPaddingL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _PeriodSelector(isDark: isDark, l10n: l10n),
                      const SizedBox(height: UIConstants.spacingL),
                      statisticsAsync.when(
                        data: (statistics) => Column(
                          children: [
                            StatsSummaryCards(statistics: statistics),
                            const SizedBox(height: UIConstants.spacingL),
                            const StreakStatsCard(),
                            const SizedBox(height: UIConstants.spacingL),
                            StatisticsChart(
                              statistics: statistics,
                              period: selectedPeriod,
                            ),
                            const SizedBox(height: UIConstants.spacingL),
                            _AchievementCard(
                              statistics: statistics,
                              isDark: isDark,
                              l10n: l10n,
                            ),
                          ],
                        ),
                        loading: () => Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.all(UIConstants.spacingXXL),
                            child: Text(l10n.common_loading),
                          ),
                        ),
                        error: (error, stack) => Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.all(UIConstants.spacingXXL),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: UIConstants.spacingXXL,
                                  color: Colors.red[300],
                                ),
                                const SizedBox(height: UIConstants.spacingM),
                                Text(
                                  l10n.common_error,
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(height: UIConstants.spacingS),
                                Text(
                                  error.toString(),
                                  style: textTheme.bodySmall?.copyWith(
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : _PremiumRequiredView(isDark: isDark),
      ),
    );
  }

  String _getSubtitle(StatisticsPeriod period, AppLocalizations l10n) {
    switch (period) {
      case StatisticsPeriod.week:
        return l10n.statistics_weekly;
      case StatisticsPeriod.month:
        return l10n.statistics_monthly;
      case StatisticsPeriod.year:
        return l10n.statistics_yearly;
    }
  }
}

class _PremiumRequiredView extends StatelessWidget {
  final bool isDark;

  const _PremiumRequiredView({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(UIConstants.spacingXXL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primary,
                    colorScheme.primary.withAlpha(180),
                  ],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withAlpha(60),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(
                Icons.bar_chart_rounded,
                color: Colors.white,
                size: 44,
              ),
            ),
            const SizedBox(height: UIConstants.spacingL),
            Text(
              'Premium Özellik',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : const Color(0xFF1E1E1E),
                  ),
            ),
            const SizedBox(height: UIConstants.spacingS),
            Text(
              'Haftalık, aylık ve yıllık su tüketimi istatistiklerine erişmek için Premium\'a geç.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isDark ? Colors.white60 : Colors.black54,
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: UIConstants.spacingXL),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton.icon(
                onPressed: () => context.push('/paywall'),
                icon: const Icon(Icons.workspace_premium_rounded, size: 18),
                label: const Text(
                  'Premium\'a Geç',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(UIConstants.radiusL),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PeriodSelector extends ConsumerWidget {
  final bool isDark;
  final AppLocalizations l10n;

  const _PeriodSelector({required this.isDark, required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPeriod = ref.watch(selectedPeriodProvider);

    return Container(
      padding: const EdgeInsets.all(UIConstants.spacingXS),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.grey[100],
        borderRadius: BorderRadius.circular(UIConstants.radiusM),
      ),
      child: Row(
        children: [
          Expanded(
            child: _PeriodButton(
              label: l10n.statistics_weekly,
              isSelected: selectedPeriod == StatisticsPeriod.week,
              isDark: isDark,
              onTap: () => ref.read(selectedPeriodProvider.notifier).state =
                  StatisticsPeriod.week,
            ),
          ),
          Expanded(
            child: _PeriodButton(
              label: l10n.statistics_monthly,
              isSelected: selectedPeriod == StatisticsPeriod.month,
              isDark: isDark,
              onTap: () => ref.read(selectedPeriodProvider.notifier).state =
                  StatisticsPeriod.month,
            ),
          ),
          Expanded(
            child: _PeriodButton(
              label: l10n.statistics_yearly,
              isSelected: selectedPeriod == StatisticsPeriod.year,
              isDark: isDark,
              onTap: () => ref.read(selectedPeriodProvider.notifier).state =
                  StatisticsPeriod.year,
            ),
          ),
        ],
      ),
    );
  }
}

class _PeriodButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  const _PeriodButton({
    required this.label,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: UIConstants.fastAnimation,
        padding: const EdgeInsets.symmetric(vertical: UIConstants.cardPaddingS),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(UIConstants.radiusS + 2),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: isSelected
                ? colorScheme.onPrimary
                : (isDark ? Colors.white60 : Colors.black54),
          ),
        ),
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final WaterStatistics statistics;
  final bool isDark;
  final AppLocalizations l10n;

  const _AchievementCard({
    required this.statistics,
    required this.isDark,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final bestDay = statistics.bestDay;
    final achievementPercent = statistics.achievementPercentage;

    final gradientColors = isDark
        ? (achievementPercent >= 80
            ? [
                Colors.green[900]!.withAlpha(128),
                Colors.green[800]!.withAlpha(128)
              ]
            : achievementPercent >= 50
                ? [const Color(0xFF004D5F), const Color(0xFF006978)]
                : [
                    Colors.orange[900]!.withAlpha(128),
                    Colors.orange[800]!.withAlpha(128)
                  ])
        : (achievementPercent >= 80
            ? [Colors.green[50]!, Colors.green[100]!]
            : achievementPercent >= 50
                ? [const Color(0xFFE0F7FA), const Color(0xFFB2EBF2)]
                : [Colors.orange[50]!, Colors.orange[100]!]);

    return Container(
      padding: const EdgeInsets.all(UIConstants.cardPaddingL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(UIConstants.radiusL),
        boxShadow: AppShadows.cardShadow(isDark: isDark),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                achievementPercent >= 80
                    ? Icons.emoji_events
                    : achievementPercent >= 50
                        ? Icons.trending_up
                        : Icons.info_outline,
                color: achievementPercent >= 80
                    ? Colors.amber
                    : achievementPercent >= 50
                        ? colorScheme.primary
                        : Colors.orange,
                size: UIConstants.iconSizeXL,
              ),
              const SizedBox(width: UIConstants.cardPaddingS),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.statistics_goal_achievement,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white60 : Colors.black54,
                      ),
                    ),
                    Text(
                      '${achievementPercent.toStringAsFixed(0)}%',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (bestDay != null) ...[
            const SizedBox(height: UIConstants.cardPaddingM),
            const Divider(),
            const SizedBox(height: UIConstants.cardPaddingS),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: UIConstants.iconSizeM,
                ),
                const SizedBox(width: UIConstants.spacingS),
                Text(
                  '${l10n.statistics_best_day}: ',
                  style: textTheme.bodySmall?.copyWith(
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
                Text(
                  DateFormat('MMM d').format(bestDay.date),
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const Spacer(),
                Text(
                  '${bestDay.totalIntake}${l10n.unit_ml}',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
