import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:water_reminder/features/home/domain/models/daily_goal.dart';
import '../providers/home_providers.dart';
import 'water_progress_ring.dart';
import 'circular_wave_progress.dart';
import '../../../../core/providers/unit_provider.dart';

class DailyProgressCard extends ConsumerWidget {
  const DailyProgressCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyGoalAsync = ref.watch(todaysDailyGoalProvider);
    final totalIntake = ref.watch(todaysTotalIntakeProvider);
    final unitNotifier = ref.watch(waterUnitProvider.notifier);

    // Show default goal while loading
    final goal = dailyGoalAsync.maybeWhen(
      data: (goal) => goal,
      orElse: () => DailyGoal(
        userId: '',
        targetAmount: 2000,
        date: DateTime.now(),
        currentAmount: 0,
      ),
    );

    final progress = goal.progressPercentage / 100;
    final remaining = goal.remainingAmount;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Dynamic sizing based on available space
        final cardWidth = constraints.maxWidth;
        final padding = (cardWidth * 0.05).clamp(16.0, 24.0);
        final ringSize = (cardWidth * 0.30).clamp(110.0, 150.0);
        final strokeWidth = (ringSize * 0.08).clamp(8.0, 12.0);
        final waveSize = (ringSize * 0.80).clamp(88.0, 120.0);
        final spacing = (cardWidth * 0.04).clamp(12.0, 24.0);

        // Font sizes
        final titleFontSize = (ringSize * 0.10).clamp(12.0, 14.0);
        final amountFontSize = (ringSize * 0.20).clamp(22.0, 30.0);
        final subFontSize = (ringSize * 0.08).clamp(10.0, 12.0);
        final badgeFontSize = (ringSize * 0.08).clamp(9.0, 11.0);

        return Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFE0F7FA), Color(0xFFB2EBF2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(13),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Progress Ring with Circular Wave (Compact)
              WaterProgressRing(
                progress: progress,
                size: ringSize,
                strokeWidth: strokeWidth,
                child: CircularWaveProgress(
                  progress: progress,
                  size: waveSize,
                  waveColor: const Color(0xFF00BCD4),
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(width: spacing),
              // Progress Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s Progress',
                      style: GoogleFonts.poppins(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: spacing * 0.2),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        unitNotifier.formatAmount(totalIntake),
                        style: GoogleFonts.poppins(
                          fontSize: amountFontSize,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF00BCD4),
                          height: 1.0,
                        ),
                      ),
                    ),
                    Text(
                      'of ${unitNotifier.formatAmount(goal.targetAmount)}',
                      style: GoogleFonts.poppins(
                        fontSize: subFontSize,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: spacing * 0.4),
                    if (remaining > 0) ...[
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: padding * 0.5,
                          vertical: spacing * 0.25,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00BCD4).withAlpha(51),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '${unitNotifier.formatAmount(remaining)} to go!',
                            style: GoogleFonts.poppins(
                              fontSize: badgeFontSize,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF00BCD4),
                            ),
                          ),
                        ),
                      ),
                    ] else ...[
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: padding * 0.5,
                          vertical: spacing * 0.25,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withAlpha(51),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: badgeFontSize + 2,
                            ),
                            SizedBox(width: spacing * 0.2),
                            Text(
                              'Completed!',
                              style: GoogleFonts.poppins(
                                fontSize: badgeFontSize,
                                fontWeight: FontWeight.w600,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}