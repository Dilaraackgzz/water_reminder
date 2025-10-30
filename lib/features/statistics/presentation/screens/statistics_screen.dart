import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../domain/models/water_statistics.dart';
import '../providers/statistics_providers.dart';
import '../widgets/statistics_chart.dart';
import '../widgets/stats_summary_cards.dart';
import '../../../../shared/widgets/modern_app_bar.dart';
import '../../../../shared/widgets/app_drawer.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPeriod = ref.watch(selectedPeriodProvider);
    final statisticsAsync = ref.watch(currentStatisticsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ModernAppBar(
        title: 'Statistics',
        subtitle: _getSubtitle(selectedPeriod),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(currentStatisticsProvider);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Period Selector
                _PeriodSelector(),

                const SizedBox(height: 24),

                // Statistics Content
                statisticsAsync.when(
                  data: (statistics) => Column(
                    children: [
                      // Summary Cards
                      StatsSummaryCards(statistics: statistics),

                      const SizedBox(height: 24),

                      // Chart
                      StatisticsChart(statistics: statistics),

                      const SizedBox(height: 24),

                      // Achievement Info
                      _AchievementCard(statistics: statistics),
                    ],
                  ),
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  error: (error, stack) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 48,
                            color: Colors.red[300],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Failed to load statistics',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            error.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
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
        ),
      ),
    );
  }

  String _getSubtitle(StatisticsPeriod period) {
    switch (period) {
      case StatisticsPeriod.week:
        return 'Weekly Overview';
      case StatisticsPeriod.month:
        return 'Monthly Overview';
      case StatisticsPeriod.year:
        return 'Yearly Overview';
    }
  }
}

class _PeriodSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPeriod = ref.watch(selectedPeriodProvider);

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: _PeriodButton(
              label: 'Week',
              isSelected: selectedPeriod == StatisticsPeriod.week,
              onTap: () {
                ref.read(selectedPeriodProvider.notifier).state =
                    StatisticsPeriod.week;
              },
            ),
          ),
          Expanded(
            child: _PeriodButton(
              label: 'Month',
              isSelected: selectedPeriod == StatisticsPeriod.month,
              onTap: () {
                ref.read(selectedPeriodProvider.notifier).state =
                    StatisticsPeriod.month;
              },
            ),
          ),
          Expanded(
            child: _PeriodButton(
              label: 'Year',
              isSelected: selectedPeriod == StatisticsPeriod.year,
              onTap: () {
                ref.read(selectedPeriodProvider.notifier).state =
                    StatisticsPeriod.year;
              },
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
  final VoidCallback onTap;

  const _PeriodButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00BCD4) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.black54,
          ),
        ),
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final WaterStatistics statistics;

  const _AchievementCard({required this.statistics});

  @override
  Widget build(BuildContext context) {
    final bestDay = statistics.bestDay;
    final achievementPercent = statistics.achievementPercentage;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: achievementPercent >= 80
              ? [Colors.green[50]!, Colors.green[100]!]
              : achievementPercent >= 50
                  ? [const Color(0xFFE0F7FA), const Color(0xFFB2EBF2)]
                  : [Colors.orange[50]!, Colors.orange[100]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
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
                        ? const Color(0xFF00BCD4)
                        : Colors.orange,
                size: 32,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Achievement Rate',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      '${achievementPercent.toStringAsFixed(0)}%',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (bestDay != null) ...[
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Best Day: ',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  DateFormat('MMM d').format(bestDay.date),
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Text(
                  '${bestDay.totalIntake}ml',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF00BCD4),
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
