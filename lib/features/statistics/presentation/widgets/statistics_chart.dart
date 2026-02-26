import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_reminder/l10n/app_localizations.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../domain/models/water_statistics.dart';

class StatisticsChart extends StatelessWidget {
  final WaterStatistics statistics;

  const StatisticsChart({super.key, required this.statistics});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive chart height
    final chartHeight = screenHeight < UIConstants.smallScreenHeight
        ? UIConstants.chartHeightSmall
        : screenHeight < UIConstants.largeScreenHeight
            ? UIConstants.chartHeightMedium
            : UIConstants.chartHeightLarge;

    // Boş liste kontrolü
    if (statistics.dailySummaries.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(UIConstants.cardPaddingL),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[850] : Colors.white,
          borderRadius: BorderRadius.circular(UIConstants.radiusL),
          border: Border.all(
            color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
          ),
        ),
        child: Center(
          child: Text(
            l10n.statistics_no_data,
            style: textTheme.bodyMedium?.copyWith(
              color: isDark ? Colors.white60 : Colors.black54,
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(UIConstants.cardPaddingL),
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
          Row(
            children: [
              Icon(
                Icons.bar_chart,
                color: colorScheme.primary,
                size: UIConstants.iconSizeL,
              ),
              const SizedBox(width: UIConstants.spacingS),
              Text(
                l10n.statistics_daily_intake,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: UIConstants.spacingL),
          SizedBox(
            height: chartHeight,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: _calculateMaxY(),
                minY: 0,
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => Colors.black87,
                    tooltipPadding: const EdgeInsets.all(UIConstants.spacingS),
                    tooltipMargin: UIConstants.spacingS,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final date = statistics.dailySummaries[groupIndex].date;
                      final amount = rod.toY.toInt();
                      return BarTooltipItem(
                        '${DateFormat('MMM d').format(date)}\n$amount ${l10n.unit_ml}',
                        textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ) ??
                            const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}',
                          style: textTheme.bodySmall?.copyWith(
                            fontSize: 10,
                            color: isDark ? Colors.white60 : Colors.black54,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() >= statistics.dailySummaries.length) {
                          return const SizedBox.shrink();
                        }
                        final date =
                            statistics.dailySummaries[value.toInt()].date;
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: UIConstants.spacingS),
                          child: Text(
                            DateFormat('E').format(date).substring(0, 1),
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 10,
                              color: isDark ? Colors.white60 : Colors.black54,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: _calculateMaxY() / 4,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                      strokeWidth: 1,
                    );
                  },
                ),
                borderData: FlBorderData(show: false),
                barGroups: _createBarGroups(context),
              ),
            ),
          ),
          const SizedBox(height: UIConstants.cardPaddingM),
          _buildLegend(context, l10n),
        ],
      ),
    );
  }

  double _calculateMaxY() {
    if (statistics.dailySummaries.isEmpty) return 2000;

    final maxIntake = statistics.dailySummaries
        .map((e) => e.totalIntake)
        .reduce((a, b) => a > b ? a : b);
    final target = statistics.targetAmount;
    final max = maxIntake > target ? maxIntake : target;
    return (max * 1.2).ceilToDouble();
  }

  List<BarChartGroupData> _createBarGroups(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return statistics.dailySummaries.asMap().entries.map((entry) {
      final index = entry.key;
      final summary = entry.value;
      final isGoalMet = summary.totalIntake >= summary.targetAmount;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: summary.totalIntake.toDouble(),
            color: isGoalMet ? Colors.green : colorScheme.primary,
            width: UIConstants.chartBarWidth,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(4),
            ),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildLegend(BuildContext context, AppLocalizations l10n) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LegendItem(
          color: colorScheme.primary,
          label: l10n.statistics_below_goal,
          isDark: isDark,
        ),
        const SizedBox(width: UIConstants.cardPaddingM),
        _LegendItem(
          color: Colors.green,
          label: l10n.statistics_goal_met_label,
          isDark: isDark,
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final bool isDark;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: UIConstants.cardPaddingS,
          height: UIConstants.cardPaddingS,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            fontSize: 11,
            color: isDark ? Colors.white60 : Colors.black54,
          ),
        ),
      ],
    );
  }
}
